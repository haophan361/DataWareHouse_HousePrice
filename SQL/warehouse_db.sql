CREATE DATABASE RealEstateDW;
GO

USE RealEstateDW;
GO

CREATE TABLE Dim_MSSubClass (
    MSSubClass_ID INT PRIMARY KEY,
    MSSubClass NVARCHAR(50)
);

GO

CREATE TABLE Dim_MSZoning (
    MSZoning_ID NVARCHAR(10) PRIMARY KEY,
    MSZoning NVARCHAR(50)
);

GO

CREATE TABLE Dim_LandContour (
    LandContour_ID NVARCHAR(10) PRIMARY KEY,
    LandContour NVARCHAR(100)
);

GO

CREATE TABLE Dim_Neighborhood (
    Neighborhood_ID NVARCHAR(50) PRIMARY KEY,
    Neighborhood NVARCHAR(100)
);

GO

CREATE TABLE Dim_Condition (
    Condition_ID NVARCHAR(20) PRIMARY KEY,
    Condition NVARCHAR(100)
);

GO

CREATE TABLE Dim_HouseStyle (
    HouseStyle_ID NVARCHAR(50) PRIMARY KEY,
    HouseStyle NVARCHAR(100)
);

GO

CREATE TABLE Dim_BsmtFinType (
    BsmtFinType_ID NVARCHAR(10) PRIMARY KEY,
    BsmtFinType NVARCHAR(100)
);

GO

CREATE TABLE Dim_Electrical (
    Electrical_ID NVARCHAR(20) PRIMARY KEY,
    Electrical NVARCHAR(100)
);

GO

CREATE TABLE Dim_Date (
    DateKey INT IDENTITY(1,1) PRIMARY KEY,
    ID INT,
    Month INT,
    Year INT,
    Quarter INT
);

GO

CREATE TABLE Dim_Property (
    PropertyId INT IDENTITY(1,1) PRIMARY KEY,
    ID INT,
    MSSubClass INT,
    HouseStyle NVARCHAR(50),
    Foundation NVARCHAR(50),
    BldgType NVARCHAR(50),
    YearBuilt INT,
    YearRemodAdd INT,
    OverallQual INT,
    OverallCond INT,
    TotRmsAbvGrd INT,
    BedroomAbvGr INT,
    KitchenAbvGr INT,
    KitchenQual INT,
    Fireplaces INT,
    FirePlaceQu INT,
    Heating NVARCHAR(50),
    HeatingQC INT,
    Electrical NVARCHAR(20),
    CentralAir NVARCHAR(1),
    PoolArea INT,
    Functional NVARCHAR(10),
    FullBath INT,
    HalfBath INT,
	CONSTRAINT FK_Dim_Property_Electrical FOREIGN KEY (Electrical) REFERENCES Dim_Electrical(Electrical_ID),
    CONSTRAINT FK_Dim_Property_MSSubClass FOREIGN KEY (MSSubClass) REFERENCES Dim_MSSubClass(MSSubClass_ID),
    CONSTRAINT FK_Dim_Property_HouseStyle FOREIGN KEY (HouseStyle) REFERENCES Dim_HouseStyle(HouseStyle_ID)
);

GO

CREATE TABLE Dim_Lot (
    LotId INT IDENTITY(1,1) PRIMARY KEY,
    ID INT,
    LotFrontage FLOAT,
    LotArea INT,
    LotShape NVARCHAR(10),
    LandContour NVARCHAR(10),
    Utilities NVARCHAR(20),
    LotConfig NVARCHAR(20),
    LandSlope NVARCHAR(10),
    CONSTRAINT FK_Dim_Lot_LandContour FOREIGN KEY (LandContour) REFERENCES Dim_LandContour(LandContour_ID)
);

GO

CREATE TABLE Dim_Location (
    LocationId INT IDENTITY(1,1) PRIMARY KEY,
    ID INT,
    MSZoning NVARCHAR(10),
    Neighborhood NVARCHAR(50),
    Condition1 NVARCHAR(20),
    Condition2 NVARCHAR(20),
    CONSTRAINT FK_Dim_Location_MSZoning FOREIGN KEY (MSZoning) REFERENCES Dim_MSZoning(MSZoning_ID),
    CONSTRAINT FK_Dim_Location_Neighborhood FOREIGN KEY (Neighborhood) REFERENCES Dim_Neighborhood(Neighborhood_ID),
    CONSTRAINT FK_Dim_Location_Condition1 FOREIGN KEY (Condition1) REFERENCES Dim_Condition(Condition_ID),
    CONSTRAINT FK_Dim_Location_Condition2 FOREIGN KEY (Condition2) REFERENCES Dim_Condition(Condition_ID)
);

GO

CREATE TABLE Dim_Exterior (
    ExteriorId INT IDENTITY(1,1) PRIMARY KEY,
    ID INT,
    RoofStyle NVARCHAR(20),
    RoofMatl NVARCHAR(20),
    Exterior1st NVARCHAR(20),
    Exterior2nd NVARCHAR(20),
    MasVnrType NVARCHAR(20),
    MasVnrArea FLOAT,
    ExterQual INT,
    ExterCond INT
);

GO

CREATE TABLE Dim_Garage (
    GarageId INT IDENTITY(1,1) PRIMARY KEY,
    ID INT,
    GarageType NVARCHAR(20),
    GarageFinish NVARCHAR(20),
    GarageYrBlt INT,
    GarageQual INT,
    GarageCond INT
);

GO

CREATE TABLE Dim_Basement (
    BasementId INT IDENTITY(1,1) PRIMARY KEY,
    ID INT,
    BsmtQual INT,
    BsmtCond INT,
    BsmtExposure NVARCHAR(10),
    BsmtFinType1 NVARCHAR(10),
    BsmtFinType2 NVARCHAR(10),
    CONSTRAINT FK_Dim_Basement_BsmtFinType1 FOREIGN KEY (BsmtFinType1) REFERENCES Dim_BsmtFinType(BsmtFinType_ID),
    CONSTRAINT FK_Dim_Basement_BsmtFinType2 FOREIGN KEY (BsmtFinType2) REFERENCES Dim_BsmtFinType(BsmtFinType_ID)
);

GO

CREATE TABLE Dim_SaleCondition (
    SaleConditionId INT IDENTITY(1,1) PRIMARY KEY,
    ID INT,
    SaleType NVARCHAR(20),
    SaleCondition NVARCHAR(20)
);

GO

-- Fact_Sale
CREATE TABLE Fact_Sale (
    Id INT PRIMARY KEY,
    DateKey INT,
    PropertyId INT,
    LotId INT,
    LocationId INT,
    ExteriorId INT,
    BasementId INT,
    GarageId INT,
    SaleConditionId INT,
    SalePrice FLOAT,
    CONSTRAINT FK_Fact_Sale__DateKey__Dim_Date FOREIGN KEY (DateKey) REFERENCES Dim_Date(DateKey),
    CONSTRAINT FK_Fact_Sale__PropertyId__Dim_Property FOREIGN KEY (PropertyId) REFERENCES Dim_Property(PropertyId),
    CONSTRAINT FK_Fact_Sale__LotId__Dim_Lot FOREIGN KEY (LotId) REFERENCES Dim_Lot(LotId),
    CONSTRAINT FK_Fact_Sale__LocationId__Dim_Location FOREIGN KEY (LocationId) REFERENCES Dim_Location(LocationId),
    CONSTRAINT FK_Fact_Sale__ExteriorId__Dim_Exterior FOREIGN KEY (ExteriorId) REFERENCES Dim_Exterior(ExteriorId),
    CONSTRAINT FK_Fact_Sale__BasementId__Dim_Basement FOREIGN KEY (BasementId) REFERENCES Dim_Basement(BasementId),
    CONSTRAINT FK_Fact_Sale__GarageId__Dim_Garage FOREIGN KEY (GarageId) REFERENCES Dim_Garage(GarageId),
    CONSTRAINT FK_Fact_Sale__SaleConditionId__Dim_SaleCondition FOREIGN KEY (SaleConditionId) REFERENCES Dim_SaleCondition(SaleConditionId)
);


-- Fact_Garage
CREATE TABLE Fact_Garage (
    GarageFactId INT IDENTITY(1,1) PRIMARY KEY,
    GarageId INT,
    PropertyId INT,
    LocationId INT,
    DateKey INT,
    GarageCars INT,
    GarageArea FLOAT,
    GarageQual INT,
    GarageCond INT,
    CONSTRAINT FK_Fact_Garage__GarageId__Dim_Garage FOREIGN KEY (GarageId) REFERENCES Dim_Garage(GarageId),
    CONSTRAINT FK_Fact_Garage__PropertyId__Dim_Property FOREIGN KEY (PropertyId) REFERENCES Dim_Property(PropertyId),
    CONSTRAINT FK_Fact_Garage__DateKey__Dim_Date FOREIGN KEY (DateKey) REFERENCES Dim_Date(DateKey),
    CONSTRAINT FK_Fact_Garage__LocationId__Dim_Location FOREIGN KEY (LocationId) REFERENCES Dim_Location(LocationId)
);


-- Fact_Basement
CREATE TABLE Fact_Basement (
    BasementFactId INT IDENTITY(1,1) PRIMARY KEY,
    BasementId INT,
    DateKey INT,
    LocationId INT,
    PropertyId INT,
    TotalBsmtSF FLOAT,
    BsmtFinSF1 FLOAT,
    BsmtFinSF2 FLOAT,
    BsmtUnfSF FLOAT,
    CONSTRAINT FK_Fact_Basement__BasementId__Dim_Basement FOREIGN KEY (BasementId) REFERENCES Dim_Basement(BasementId),
    CONSTRAINT FK_Fact_Basement__DateKey__Dim_Date FOREIGN KEY (DateKey) REFERENCES Dim_Date(DateKey),
    CONSTRAINT FK_Fact_Basement__LocationId__Dim_Location FOREIGN KEY (LocationId) REFERENCES Dim_Location(LocationId),
    CONSTRAINT FK_Fact_Basement__PropertyId__Dim_Property FOREIGN KEY (PropertyId) REFERENCES Dim_Property(PropertyId)
);


-- Fact_RoomArea
CREATE TABLE Fact_RoomArea (
    RoomAreaId INT IDENTITY(1,1) PRIMARY KEY,
    PropertyId INT,
    LocationId INT,
    DateKey INT,
    HalfBath INT,
	FullBath INT,
    BedroomAbvGr INT,
    KitchenAbvGr INT,
    TotRmsAbvGrd INT,
    Fireplaces INT,
    CONSTRAINT FK_Fact_RoomArea__PropertyId__Dim_Property FOREIGN KEY (PropertyId) REFERENCES Dim_Property(PropertyId),
    CONSTRAINT FK_Fact_RoomArea__LocationId__Dim_Location FOREIGN KEY (LocationId) REFERENCES Dim_Location(LocationId),
    CONSTRAINT FK_Fact_RoomArea__DateKey__Dim_Date FOREIGN KEY (DateKey) REFERENCES Dim_Date(DateKey)
);


-- Fact_FloorArea
CREATE TABLE Fact_FloorArea (
    FloorAreaId INT IDENTITY(1,1) PRIMARY KEY,
    PropertyId INT,
    LocationId INT,
    DateKey INT,
    LotArea FLOAT,
    FirstFlrSF FLOAT,
    SecondFlrSF FLOAT,
    LowQualFinSF FLOAT,
    WoodDeckSF FLOAT,
    GrLivArea FLOAT,
    CONSTRAINT FK_Fact_FloorArea__PropertyId__Dim_Property FOREIGN KEY (PropertyId) REFERENCES Dim_Property(PropertyId),
    CONSTRAINT FK_Fact_FloorArea__LocationId__Dim_Location FOREIGN KEY (LocationId) REFERENCES Dim_Location(LocationId),
    CONSTRAINT FK_Fact_FloorArea__DateKey__Dim_Date FOREIGN KEY (DateKey) REFERENCES Dim_Date(DateKey)
);

