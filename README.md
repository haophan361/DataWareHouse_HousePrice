# 🏠 Ames Housing Data Warehouse Project

This project implements a **Data Warehouse solution** for the [Ames Housing Dataset](https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques).  
The dataset describes the sale of individual residential properties in **Ames, Iowa** from 2006 to 2010.

---

## 📦 Dataset Overview

- **Observations:** 2,930  
- **Variables:**  
  - 23 Nominal  
  - 23 Ordinal  
  - 14 Discrete  
  - 20 Continuous  

### Files Included:
- `train.csv`  
- `test.csv`  
- `sample_submission.csv`: contains `SalePrice` predictions for `test.csv`  
- `data_description.txt`: full description of dataset attributes  

📄 Original Paper:  
**"Ames, Iowa: Alternative to the Boston Housing Data as an End of Semester Regression Project"**  
📎 [Download PDF](https://jse.amstat.org/v19n3/decock.pdf)

---

## 🛠 Tools & Architecture

### 1. **SQL** - Create Table in SQL File using SQL Server 
  
  -SQL/sourceToStage.sql  
    
  -SQL/warehouse_db.sql  
  
### 2. **SSIS** – ETL Pipeline  
Used to extract data from `.csv` files and load it into a **Data Warehouse in SQL Server**.

#### Source → Stage:

![Source to Stage 1](https://github.com/haophan361/DataWareHouse_HousePrice/blob/main/asset/Picture1.png)

<br/>

![Source to Stage 2](https://github.com/haophan361/DataWareHouse_HousePrice/blob/main/asset/Picture2.png)

<br/>

![Source to Stage 3](https://github.com/haophan361/DataWareHouse_HousePrice/blob/main/asset/Picture3.png)

<br/>

#### Stage → Data Warehouse:

![Stage to DWH 1](https://github.com/haophan361/DataWareHouse_HousePrice/blob/main/asset/Picture4.png)

<br/>

![Stage to DWH 2](https://github.com/haophan361/DataWareHouse_HousePrice/blob/main/asset/Picture5.png)

<br/>

![Stage to DWH 3](https://github.com/haophan361/DataWareHouse_HousePrice/blob/main/asset/Picture6.png)

<br/>

---

### 3. **SSAS** – SQL Server Analysis Services  
The Data Warehouse was deployed to SSAS to support **MDX queries** and multidimensional analysis.

#### Fact Tables:

**Fact_Sale**  
<br/>
![Fact Sale](https://github.com/haophan361/DataWareHouse_HousePrice/blob/main/asset/Picture7.png)

<br/>

**Fact_Room_Area**  
<br/>
![Fact Room Area](https://github.com/haophan361/DataWareHouse_HousePrice/blob/main/asset/Picture8.png)

<br/>

**Fact_Floor_Area**  
<br/>
![Fact Floor Area](https://github.com/haophan361/DataWareHouse_HousePrice/blob/main/asset/Picture9.png)

<br/>

---

### 4. **Power BI** – Data Visualization  
A simple Power BI dashboard was built to visualize and interact with the housing data.

#### Power BI Reports:

![Power BI 1](https://github.com/haophan361/DataWareHouse_HousePrice/blob/main/asset/Picture10.png)

<br/>

![Power BI 2](https://github.com/haophan361/DataWareHouse_HousePrice/blob/main/asset/Picture11.png)

<br/>

![Power BI 3](https://github.com/haophan361/DataWareHouse_HousePrice/blob/main/asset/Picture12.png)

<br/>
