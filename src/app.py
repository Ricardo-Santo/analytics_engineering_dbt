import streamlit as st
import pandas as pd
import altair as alt
import os


from wordcloud import WordCloud
import matplotlib.pyplot as plt

# Load data
@st.cache_data
def load_data():
    csv_path = os.path.join(os.path.dirname(__file__), "..", "data", "fct_most_rented_category_by_period_by_store.csv")
    df = pd.read_csv(csv_path, parse_dates=["month"])
    return df

df = load_data()

def load_wordcloud_data():
    csv_path = os.path.join(os.path.dirname(__file__), "..", "data", "fct_most_rented_film_by_period_by_store.csv")
    return pd.read_csv(csv_path)

def load_performance_data():
    path = os.path.join(os.path.dirname(__file__), "..", "data", "fct_rental_performance_by_store.csv")
    df = pd.read_csv(path, parse_dates=["month"])
    return df

def load_revenue_data():
    path = os.path.join(os.path.dirname(__file__), "..", "data", "fct_revenue_performance_by_store.csv")
    df = pd.read_csv(path, parse_dates=["month"])
    return df

st.subheader("DVD Rental company KPI's")

film_df = load_wordcloud_data()

# Chart selection
chart_option = st.radio(
    "📊 Choose a visualization",
    [
        "Bar Chart (by Category)",
        "Word Cloud (by Film)",
        "Rental Performance by Store",
        "Revenue Performance by Store"
    ]
)


if chart_option == "Bar Chart (by Category)":
    # Sidebar filter
    store_id = st.sidebar.selectbox("Select Store ID", sorted(df["store_id"].unique()))
    filtered_df = df[df["store_id"] == store_id]

    # Show filtered data
    st.subheader(f"📊 Rental Data for Store {store_id}")
    st.dataframe(filtered_df)

    # Bar chart data
    category_summary = (
        filtered_df.groupby("category_name", as_index=False)["rental_count"]
        .sum()
        .sort_values(by="rental_count", ascending=False)
    )

    # Bar chart
    st.subheader("🎬 Total Rentals per Category")
    bar_chart = (
        alt.Chart(category_summary)
        .mark_bar()
        .encode(
            x=alt.X("category_name:N", sort="-y", title="Category"),
            y=alt.Y("rental_count:Q", title="Total Rentals"),
            tooltip=["category_name", "rental_count"]
        )
        .properties(width=700, height=400)
    )
    st.altair_chart(bar_chart, use_container_width=True)

elif chart_option == "Word Cloud (by Film)":
    # Load film data
    film_df = load_wordcloud_data()
    film_freq = dict(zip(film_df["title"], film_df["number_of_rentals"]))

    # Word Cloud
    st.subheader("🎞️ Most Rented Films Word Cloud")
    wc = WordCloud(
        width=800,
        height=400,
        background_color="white",
        colormap="plasma"
    ).generate_from_frequencies(film_freq)

    fig, ax = plt.subplots(figsize=(10, 5))
    ax.imshow(wc, interpolation='bilinear')
    ax.axis("off")
    st.pyplot(fig)

elif chart_option == "Rental Performance by Store":
    st.subheader("📈 Total Rentals per Month by Store")

    perf_df = load_performance_data()
    perf_df["month"] = pd.to_datetime(perf_df["month"])

    # Altair bar chart
    perf_chart = (
        alt.Chart(perf_df)
        .mark_bar(size=40) 
        .encode(
            x=alt.X("month:T", sort="ascending"),
            y=alt.Y("total_rentals:Q", title="Total Rentals"),
            color=alt.Color("store_id:N", title="Store"),
            tooltip=["store_id", "month", "total_rentals"]
        ).configure_scale(
    bandPaddingInner=0.1  # Reduce spacing between grouped bars
)
        
    )

    st.altair_chart(perf_chart, use_container_width=True)

elif chart_option == "Revenue Performance by Store":
    st.subheader("💰 Revenue Performance Over Time by Store")

    rev_df = load_revenue_data()

    # Line chart
    revenue_chart = (
        alt.Chart(rev_df)
        .mark_line(point=True)
        .encode(
            x=alt.X("month:T", title="Month"),
            y=alt.Y("total_revenue:Q", title="Total Revenue"),
            color=alt.Color("store_id:N", title="Store"),
            tooltip=["store_id", "month", "total_revenue"]
        )
        .properties(width=800, height=400)
    )

    st.altair_chart(revenue_chart, use_container_width=True)

    # Total revenue summary
    st.markdown("### 🧾 Total Revenue Summary")
    total_revenue_summary = (
        rev_df.groupby("store_id")["total_revenue"].sum().reset_index()
    )
    st.dataframe(total_revenue_summary.rename(columns={"total_revenue": "Total Revenue"}))
