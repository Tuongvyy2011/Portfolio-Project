## I. Portfolio 1 : Automating Crypto Website API Pull Using Python 
In this Portfolio, I pulled API from CoinMarketCap website to get the latest information about cryptocurrency prices, performed data cleaning, and conducted EDA data exploration using Python.

CoinMarketCap website I used: https://coinmarketcap.com/

### 1. Pulling API from CoinMarketCap website
Then, I created a loop to get the latest 15 cryptocurrencies from CoinMarketCap, normalized the data, added a timestamp column, and then appended it to a CSV file and saved it to a specified file on the computer. This loop aims to automate periodic data collection from CoinMarketCap.

### 2. Data Cleaning
After pulling the API and saving to CSV, I used Pandas to reformat the float display format.

### 3. EDA Data Exploration 
- Used group by and aggregation functions to calculate the average percentage change in coin prices over recent time periods.
- Used seaborn and Matplotlib to visualize charts and track price increases/decreases of coins over recent time periods.
- Or track the price of a specific coin over time when pulling API from CoinMarketCap website.

<img width="884" alt="Screenshot 2025-07-05 at 22 36 01" src="https://github.com/user-attachments/assets/c89eb897-20b8-4a8c-bfdc-8b6848a3a927" />


## II. Portfolio 2 : COVID-19 Global Data Analysis & Dashboard (2020–2021)
Hello, I have a Portfolio about CoronaVirus data from 2020-2021. In this Portfolio, I have completed a full project including data cleaning, EDA data exploration in SQL, and data visualization in Tableau.

Dataset Link: https://ourworldindata.org/explorers/covid?tab=table&time=2020-03-01..latest&country=IND~USA~GBR~CAN~DEU~FRA&pickerSort=asc&pickerMetric=location&hideControls=false&Metric=Excess+mortality+%28estimates%29&Interval=7-day+rolling+average&Relative+to+population=true

Or I accessed Our World in Data's data on github: https://github.com/owid/covid-19-data/tree/master/public/data

### Data Cleaning and EDA Data Exploration in SQL
First, I divided the data into 2 different CSV files, including CovidDeaths file and CovidVaccinations table. Then, I performed queries in MySQL according to:

1. Countries
- Death rate/infection cases
- Death rate/infection cases in Vietnam (Likelihood of death if you contract covid in your country)
- Percentage of population infected with covid
- Countries with the highest infection rates per population
- Countries with the highest death counts

2. Continents
- Continents with the highest death counts

3. Global: Not divided by continent or country
- Total new cases, total new deaths, and global death rate by day

4. Vaccination numbers
- Total number of people vaccinated by country
- Rolling total of people vaccinated by country
- Percentage of population in each country vaccinated by rolling total

5. Other components
- Are there any differences between countries with high Human Development Index and countries with low Human Development Index?
- What is the relationship between the rate of fully vaccinated people and the new death rate?
  

### Data Visualization using Tableau
After cleaning and analyzing the EDA process, I created 4 different visualization charts in Tableau about:

- Chart 1 - Text Table: Comparison table of Total cases, Total deaths, and Death percentage worldwide
- Chart 2 - Bar chart: Chart showing which continent has the highest death count
- Chart 3 - Maps: Percentage of population infected per country
- Chart 4 - Line: Prediction of percentage increase in infected population across countries
- Chart 5 - Bar chart: Total deaths compared to HDI index of country groups

<img width="1389" alt="Screenshot 2025-07-01 at 01 00 03" src="https://github.com/user-attachments/assets/7b211d3d-9e77-4b02-98ba-a166b696746b" />

Final Tableau Dashboard:
https://public.tableau.com/app/profile/vy.vu6590/viz/TableauVisualizationCoranaVirus2020-2021/Dashboard1

## III. Portfolio 3 : Data Cleaning Nashville_housing in SQL
In this project, we used the "Nashville Housing Data for Data Cleaning" dataset to practice and apply data cleaning techniques using SQL, thereby improving data quality and reliability.

The dataset used is "Nashville Housing Data for Data Cleaning" publicly shared by AlexTheAnalyst.
- Access from GitHub: https://github.com/AlexTheAnalyst/PortfolioProjects/blob/main/Nashville%20Housing%20Data%20for%20Data%20Cleaning%20(reuploaded).xlsx
- Original source from Kaggle: https://www.kaggle.com/datasets/tmthyjames/nashville-housing-data

After downloading the raw dataset, the next step is to apply SQL – using JOIN, CTE (Common Table Expressions), Window Functions and aggregate functions – to:
- Handle missing values (null) appropriately
- Detect and remove duplicate data
- Split and standardize address components to support regional analysis
- Create analysis-friendly data tables, connecting transaction information and real estate characteristics


## IV. Portfolio 4 : Correlation Movie Industry in Python
I used the Movie Revenue and Film Industry dataset (1986–2016) with the purpose of analyzing revenue and finding factors that influence movie success. This project is divided into 2 main parts, including the data cleaning process and finding correlations in the dataset.

Data I used: https://www.kaggle.com/datasets/danielgrijalvas/movies

### 1. Data Cleaning
First, I cleaned the data by examining missing data, changing formats, removing duplicates, and creating a new 'year' column that correctly reflects the movie release date.

### 2. Finding correlations between data
- I found correlations using different methods such as 'pearson', 'spearman' – Rank correlation, 'kendall' – Pairwise rank correlation
- I converted text columns to unique numerical identifiers for each column to include in the correlation matrix using loops in Python, converting categorical labels to corresponding numerical codes (integers).
- I visualized the correlations using heatmap, scatter, and regplot charts to examine the correlation between movie revenue and other factors that influence movie success.










































