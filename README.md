![Alt text](https://github.com/Chetu6474/Walmart_Business_Insights_with_SQL/blob/main/walmart-logo-blue-background-61j75hptlo79b8yz.jpg)
# Walmart Business Insights with SQL
### 👉 [Explore the Interactive Dashboard](https://public.tableau.com/views/Dashboard_1_17396515533140/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
![Alt text]([[https://github.com/Chetu6474/Walmart_Business_Insights_with_SQL/blob/main/png.png?raw=true]])
## 📖 Project Overview

This project focuses on solving real-world Walmart business challenges by analyzing sales data. The project involves downloading the dataset using the Kaggle API, cleaning and preparing the data with Python and pandas, and utilizing PostgreSQL for storage and querying. Through SQL, we solve around 20 business problems that provide valuable insights into Walmart’s operations, sales, and performance.

## 📌 Project Pipeline

![Alt text](https://github.com/Chetu6474/Walmart_Business_Insights_with_SQL/blob/main/png.png?raw=true)

### 🛠 Project Steps

1. **📜 Set Up the Environment**  
   - **Tools Used**: Visual Studio Code (VS Code), Python, PostgreSQL  
   - **Goal**: Organize the project in VS Code, ensuring all necessary libraries and tools are ready for the development process.

2. **📜 Set Up Kaggle API**  
   - **API Setup**: Download the Kaggle API token from your Kaggle profile and place the `kaggle.json` file in your `.kaggle` folder.
   - **Download Data:**: Use the Kaggle API command to download the Walmart sales dataset.
   
3. **📜 Download Walmart Sales Data**  
   - **Data Source**: Download the dataset directly from Kaggle.  
   - **Dataset Link**: [Walmart Sales Dataset](https://www.kaggle.com/datasets)  
   - **Storage**: Save the data in the `data/` folder for easy reference and access.

4. **📜 Install Required Libraries and Load Data**  
   - **Libraries**: Install necessary Python libraries using:  
     ```bash
     pip install pandas numpy sqlalchemy psycopg2
     ```  
   - **Loading Data**: Import the dataset into a Pandas DataFrame for preliminary analysis.

5. **📜 Explore the Data**  
   - **Goal**: Conduct an initial data exploration to understand data distribution, check column names, types, and identify potential issues.  
   - **Analysis**: Use functions like `.info()`, `.describe()`, and `.head()` to get a quick overview of the data structure and statistics.

6. **📜 Data Cleaning**  
   - **Remove Duplicates**: Identify and remove duplicate entries to avoid skewed results.  
   - **Handle Missing Values**: Drop rows or columns with missing values if they are insignificant; fill values where essential.  
   - **Fix Data Types**: Ensure all columns have consistent data types (e.g., dates as datetime, prices as float).  
   - **Currency Formatting**: Use `.replace()` to handle and format currency values for analysis.  
   - **Validation**: Check for any remaining inconsistencies and verify the cleaned data.

7. **📜 Feature Engineering**  
   - **Create New Columns**: Calculate the Total Amount for each transaction by multiplying `unit_price` by `quantity` and adding this as a new column.  
   - **Enhance Dataset**: Adding this calculated field will streamline further SQL analysis and aggregation tasks.

8. **📜 Load Data into PostgreSQL**  
   - **Set Up Connections**: Use Python's SQLAlchemy to connect to PostgreSQL.  
   - **Table Creation**: Set up tables in PostgreSQL using Python SQLAlchemy to automate table creation and data insertion.  
   - **Verification**: Run initial SQL queries to confirm that the data has been loaded accurately.

9. **📜 SQL Analysis: Complex Queries and Business Problem Solving**  
   - **Business Problem-Solving**: Solve 20 real-time Walmart business problems using SQL, including:  
     - Revenue trends across branches and categories.  
     - Identifying best-selling product categories.  
     - Sales performance by time, city, and payment method.  
     - Analyzing peak sales periods and customer buying patterns.  
     - Profit margin analysis by branch and category.  
   - **Documentation**: Keep clear notes of each query's objective, approach, and results.

10. **📜 Project Publishing and Documentation**  
    - **Documentation**: Maintain well-structured documentation of the entire process in Markdown or a Jupyter Notebook.  
    - **Project Publishing**: Publish the completed project on GitHub or any other version control platform, including:  
      - The `README.md` file (this document).  
      - Jupyter Notebooks (if applicable).  
      - SQL query scripts.  
      - Data files (if possible) or steps to access them.
     
## 📊 Project Structure

```plaintext
Walmart-Sales-Data-Analysis/
│
├── data/                   # Folder containing the Walmart sales data
│
├── sql_queries/            # SQL query scripts used for business problem-solving
│
├── notebooks/               # Jupyter Notebooks for Python analysis
│
├── README.md               # Project documentation
│
└── requirements.txt        # Python dependencies for project setup
│
└── main.py                 # Main script for loading, cleaning, and processing data
```

