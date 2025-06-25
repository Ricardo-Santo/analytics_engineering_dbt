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

st.subheader("DVD Rental company KPI's")

film_df = load_wordcloud_data()

# Chart selection
chart_option = st.radio("📊 Choose a visualization", ["Bar Chart (by Category)", "Word Cloud (by Film)"])

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
