-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

DROP VIEW View745;

DROP VIEW Edw.DIM_PRODUCT_CAT_SUBCAT_V;

Create View View745

  Comment = 'No Comment Provided'

AS
(
  select * from "Edw"."DIM_PRODUCT_CAT_SUBCAT_V"
);

Create or Replace View ADVENTUREWORKSDW.EDW.DIM_PRODUCT_CAT_SUBCAT_V 

  comment = 'Product details with cat and subcat english names. For fwd/rev engineering' 

AS
(
WITH cat_subcat as (
SELECT cat.* , sub."ProductSubcategoryKey" as "SubProductSubcategoryKey", sub."EnglishProductSubcategoryName"  FROM "DimProductCategory" cat
inner join  "DimProductSubcategory" sub
on  cat."ProductCategoryKey" = sub."ProductCategoryKey"
) 
  select prod.* ,
  ProductCategoryKey,         
ProductCategoryAlternateKey,
EnglishProductCategoryName ,
EnglishProductSubcategoryName
  from "Edw"."DimProduct" prod
  left join cat_subcat 
  on prod."ProductSubcategoryKey" = cat_subcat."SubProductSubcategoryKey"
);

ALTER TABLE Table544Copy11
    DROP CONSTRAINT FkFactInternetSalesCopy11Table544Copy11547;

ALTER TABLE Edw.FactInternetSalesCopy11
    DROP CONSTRAINT PK_Pk543;

ALTER TABLE Edw.DimEmployee
    ALTER COLUMN EmailAddress COMMENT 'company email';

ALTER TABLE Edw.DimEmployee
    ALTER COLUMN Gender COMMENT 'm f or x';

ALTER TABLE Edw.DimProduct
    ALTER COLUMN ListPrice COMMENT 'prince on website';

ALTER TABLE Edw.DimProduct
    ALTER COLUMN DealerPrice COMMENT 'customer price';

ALTER TABLE Edw.DimReseller
    ALTER COLUMN NumberEmployees COMMENT 'total emps in reseller location';

ALTER TABLE Edw.FactCurrencyRate
    ADD COLUMN NewCol integer NOT NULL;

-- Attention! Cannot change column data type.

ALTER TABLE Edw.FactInternetSales
    ALTER COLUMN NewPk SET DATA TYPE integer;

-- Attention! Cannot change column data type.

ALTER TABLE Edw.FactInternetSales
    ALTER COLUMN NewPk SET DATA TYPE varchar;

ALTER TABLE Table544Copy11
    DROP COLUMN NewCol;

-- Attention! Reducing the length of a text/string column is not supported.

ALTER TABLE Test
    ALTER COLUMN EtlFilename SET DATA TYPE varchar(50);

-- Attention! Reducing the length of a text/string column is not supported.

ALTER TABLE Table654
    ALTER COLUMN EtlFilename SET DATA TYPE varchar(50);

-- Attention! Reducing the length of a text/string column is not supported.

ALTER TABLE Table719
    ALTER COLUMN EtlFilename SET DATA TYPE varchar(50);

-- Attention! Reducing the length of a text/string column is not supported.

ALTER TABLE Table940
    ALTER COLUMN EtlFilename SET DATA TYPE varchar(50);

-- Attention! Reducing the length of a text/string column is not supported.

ALTER TABLE Table946
    ALTER COLUMN EtlFilename SET DATA TYPE varchar(50);

-- Attention! Reducing the length of a text/string column is not supported.

ALTER TABLE Edw1.NewTbl
    ALTER COLUMN EtlFilename SET DATA TYPE varchar(50);

ALTER TABLE Edw1.NewTbl
    ADD COLUMN NewCol integer NOT NULL;

Create Function Function1476()
Returns 
Language 

  Comment = 'No Comment Provided'

AS
--test
;

ALTER TABLE Edw.FactInternetSalesCopy11
    ADD CONSTRAINT PK_1448 PRIMARY KEY (NewCol);

CREATE TABLE Table1506
(
 EtlId       date NOT NULL, 
 EtlFilename varchar(50) NOT NULL COMMENT 'source file or table from where the target is loaded' 
);

CREATE TABLE Table1464
(
 EtlId       date NOT NULL,
 EtlFilename varchar NOT NULL COMMENT 'source file or table from where the target is loaded'
);

CREATE TABLE Edw1.NewTblCopy1Copy1
(
 EtlId       date NOT NULL,
 EtlFilename varchar(50) NOT NULL COMMENT 'source file or table from where the target is loaded'
);

CREATE TABLE Edw1.NewTblCopy1
(
 EtlId       date NOT NULL, 
 EtlFilename varchar(50) NOT NULL COMMENT 'source file or table from where the target is loaded' 
);

ALTER TABLE Edw.FactInternetSalesCopy1
    CLUSTER BY ( ProductKey );