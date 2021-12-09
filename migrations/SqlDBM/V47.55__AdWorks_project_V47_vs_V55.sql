-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

DROP VIEW ResellerSalesAnalysis_v;

create view ResellerSalesAnalysis_v as (
with emp_store as (
select * from DimEmployee
    inner join DimStore on 
    DimEmployee.StoreId = DimStore.StoreId
)
, Sales_dtl as (
select * from FactResellerSales 
inner join emp_store on
FactResellerSales.EmployeeKey = emp_store.EmployeeKey
)
, final as (
select 
SaleSkey,
SizeCategory as StoreSizeCategory,
Title as EmployeeTitle,
SalesOrderNumber,
CarrierTrackingNumber,
SalesOrderLineNumber,
RevisionNumber,
OrderQuantity,
UnitPrice,
ExtendedAmount,
UnitPriceDiscountPct,
DiscountAmount,
ProductStandardCost,
TotalProductCost,
SalesAmount,
CustomerPoNumber
from Sales_dtl
)
select * from final
);

ALTER TABLE Edw.FactInternetSales
    DROP CONSTRAINT FkDimProductFactInternetSalesFkFactInternetSales427;

ALTER TABLE Edw.FactResellerSales
    DROP CONSTRAINT FkDimProductFactResellerSalesFkFactResellerSales445;

ALTER TABLE Edw1.NewTbl
    DROP CONSTRAINT Fk1025;

DROP TABLE Edw.DimProduct1_1;

DROP TABLE DimProduct1_2;

DROP TABLE DimProduct1_2;

DROP TABLE AdventureworksdwEdw.DimOrg;

ALTER TABLE Edw.FactCurrencyRate
    ADD COLUMN NewCol integer NOT NULL;

-- Attention! Cannot change column data type.

ALTER TABLE Edw.FactInternetSales
    ALTER COLUMN NewPk SET DATA TYPE integer;

-- Attention! Cannot change column data type.

ALTER TABLE Edw.FactInternetSales
    ALTER COLUMN NewPk SET DATA TYPE varchar;

ALTER TABLE Edw1.NewTbl
    DROP COLUMN Col1;

CREATE TABLE Edw.DimProduct
(
 ProductKey            number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 ProductAlternateKey   varchar(25),
 ProductSubcategoryKey number(38,0),
 WeightUnitMeasureCode varchar(3),
 SizeUnitMeasureCode   varchar(3),
 EnglishProductName    varchar(50) NOT NULL,
 SpanishProductName    varchar(50),
 FrenchProductName     varchar(50),
 StandardCost          number(38,0),
 FinishedGoodsFlag     number(38,0) NOT NULL,
 Color                 varchar(15) NOT NULL,
 SafetyStockLevel      number(38,0),
 ReorderPoint          number(38,0),
 ListPrice             number(38,0),
 Size                  varchar(50),
 SizeRange             varchar(50),
 Weight                float,
 DaysToManufacture     number(38,0),
 ProductLine           varchar(2),
 DealerPrice           number(38,0),
 Class                 varchar(2),
 Style                 varchar(2),
 ModelName             varchar(50),
 EnglishDescription    varchar(400),
 FrenchDescription     varchar(400),
 ChineseDescription    varchar(400),
 ArabicDescription     varchar(400),
 HebrewDescription     varchar(400),
 ThaiDescription       varchar(400),
 GermanDescription     varchar(400),
 JapaneseDescription   varchar(400),
 TurkishDescription    varchar(400),
 Status                varchar(7),
 CONSTRAINT PK_PkDimProduct PRIMARY KEY ( ProductKey ),
 CONSTRAINT FkDimProduct407 FOREIGN KEY ( ProductSubcategoryKey ) REFERENCES Edw.DimProductSubcategory ( ProductSubcategoryKey )
);

ALTER TABLE Edw.FactInternetSales
    ADD CONSTRAINT FkDimProductFactInternetSalesFkFactInternetSales427 FOREIGN KEY (ProductKey) REFERENCES Edw.DimProduct (ProductKey);

ALTER TABLE Edw.FactResellerSales
    ADD CONSTRAINT FkDimProductFactResellerSalesFkFactResellerSales445 FOREIGN KEY (ProductKey) REFERENCES Edw.DimProduct (ProductKey);