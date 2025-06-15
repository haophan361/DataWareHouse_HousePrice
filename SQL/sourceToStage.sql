CREATE DATABASE stage_RealEstate;
GO

USE stage_RealEstate;
GO

CREATE TABLE TableMSSubClass (
    MSSubClass_ID INT,
    MSSubClass NVARCHAR(50)
);

GO

CREATE TABLE TableMSZoning (
    MSZoning_ID nvarchar(10),
    MSZoning nvarchar(50)
);

GO

CREATE TABLE TableLandContour (
    LandContour_ID nvarchar(10),
    LandContour nvarchar(100)
);

GO

CREATE TABLE TableNeighborhood (
    Neighborhood_ID nvarchar(20),
    Neighborhood nvarchar(100)
);

GO

CREATE TABLE TableCondition (
    Condition_ID nvarchar(10),
    Condition nvarchar(100)
);

GO

CREATE TABLE TableHouseStyle (
    HouseStyle_ID nvarchar(10),
    HouseStyle nvarchar(100)
);

GO

CREATE TABLE TableBsmtFinType (
    BsmtFinType_ID nvarchar(10),
    BsmtFinType nvarchar(100)
);

GO

CREATE TABLE TableElectrical (
    Electrical_ID nvarchar(10),
    Electrical nvarchar(100)
);

GO

CREATE TABLE TableDate (
    ID INT,
    Month INT,
    Year INT,
    Quarter INT
);

 GO

 CREATE TABLE TableProperty (
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
    HalfBath INT
);

GO

CREATE TABLE TableLot (
    ID INT ,
    LotFrontage FLOAT,
    LotArea INT,
    LotShape NVARCHAR(10),
    LandContour NVARCHAR(10),
    Utilities NVARCHAR(20),
    LotConfig NVARCHAR(20),
    LandSlope NVARCHAR(10)
);

GO

CREATE TABLE TalbeExterior (
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

CREATE TABLE TableLocation (
    ID INT,
    MSZoning NVARCHAR(10),
    Neighborhood NVARCHAR(50),
    Condition1 NVARCHAR(20),
    Condition2 NVARCHAR(20)
);

GO

CREATE TABLE TableGarage (
    ID INT,
    GarageType NVARCHAR(20),
    GarageFinish NVARCHAR(20),
    GarageYrBlt INT,
    GarageQual INT,
    GarageCond INT
);

GO

CREATE TABLE TableBasement (
    ID INT,
    BsmtQual INT,
    BsmtCond INT,
    BsmtExposure NVARCHAR(10),
    BsmtFinType1 NVARCHAR(10),
    BsmtFinType2 NVARCHAR(10)
);

GO

CREATE TABLE TableSaleCondition (
    ID INT,
    SaleType NVARCHAR(20),
    SaleCondition NVARCHAR(20)
);

GO

CREATE TABLE stageSale(
	ID INT,
	SalePrice FLOAT
);

CREATE TABLE stageGarage (
    ID INT,
    GarageArea FLOAT,
    GarageQual INT,
    GarageCond INT,
	GarageCars INT
);

CREATE TABLE stageBasement (
    ID INT,
    TotalBsmtSF FLOAT,
    BsmtFinSF1 FLOAT,
    BsmtFinSF2 FLOAT,
    BsmtUnfSF FLOAT
);

CREATE TABLE stageRoomArea (
    ID INT,
    FullBath INT,
	HalfBath INT,
	BedroomAbvGr INT,
	KitchenAbvGr INT,
	TotRmsAbvGrd INT,
	Fireplaces INT
);

CREATE TABLE stageFloorArea (
    ID INT,
	LotArea FLOAT,
    FirstFlrSF FLOAT,
    SecondFlrSF FLOAT,
    LowQualFinSF FLOAT,
    WoodDeckSF FLOAT,
	GrLivArea FLOAT
);
