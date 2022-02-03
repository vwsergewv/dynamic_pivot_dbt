-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

CREATE VIEW IF NOT EXISTS ADVENTUREWORKSDW.EDW."DIM_PRODUCT_CAT_SUBCAT_V" 

  comment = 'Product details with cat and subcat english names. For fwd/rev engineering' 

AS
(
WITH cat_subcat as (
SELECT cat.* , sub."ProductSubcategoryKey" as "SubProductSubcategoryKey", sub."EnglishProductSubcategoryName"  FROM "DimProductCategory" cat
inner join  "DimProductSubcategory" sub
on  cat."ProductCategoryKey" = sub."ProductCategoryKey"
) 
  select 
 "ProductKey"           
, "ProductAlternateKey"  
, "ProductSubcategoryKey"
, "WeightUnitMeasureCode"
, "SizeUnitMeasureCode"  
, "EnglishProductName"   
, "StandardCost"         
, "FinishedGoodsFlag"    
, "Color"                
, "SafetyStockLevel"     
, "ReorderPoint"         
, "ListPrice"            
, "Size"                 
 ,"SizeRange"            
 ,"Weight"               
 ,"DaysToManufacture"    
 ,"ProductLine"          
 ,"DealerPrice"          
 ,"Class"                
 ,"Style"                
 ,"ModelName"            
 ,"EnglishDescription"   
 ,"Status"                   
,"ProductCategoryKey"         
,"ProductCategoryAlternateKey"
,"EnglishProductCategoryName" 
,"EnglishProductSubcategoryName"
 from "DimProduct" prod
  left join cat_subcat 
  on prod."ProductSubcategoryKey" = cat_subcat."SubProductSubcategoryKey"
);

CREATE FILE FORMAT IF NOT EXISTS "ADVENTUREWORKSDW.EDW.FILEFORMAT_431"
    TYPE = JSON;

DROP FILE FORMAT IF EXISTS "ADVENTUREWORKSDW_BETA.EDW.FILEFORMAT_431";

CREATE SCHEMA IF NOT EXISTS "ADVENTUREWORKSDW.EDW";

DROP SCHEMA IF EXISTS "ADVENTUREWORKSDW_BETA.EDW";

ALTER TABLE IF EXISTS "EDW"."DimOrganization"
    SET COMMENT = 'Dimension for Organizational Data';

ALTER TABLE IF EXISTS "EDW"."DimScenario"
    ADD COLUMN "TestCol" varchar(50) NOT NULL;

ALTER TABLE IF EXISTS "EDW"."FactFinance"
    SET COMMENT = 'Facts for Finance';

CREATE TABLE IF NOT EXISTS "EDW"."FactProductInventory"
(
 "ProductKey"   number(38,0) NOT NULL,
 "DateKey"      number(38,0) NOT NULL,
 "MovementDate" date NOT NULL,
 "UnitCost"     number(38,0) NOT NULL,
 "UnitsIn"      number(38,0) NOT NULL,
 "UnitsOut"     number(38,0) NOT NULL,
 "UnitsBalance" number(38,0) NOT NULL,
 CONSTRAINT "FK_FactProductInventory_443" FOREIGN KEY ( "DateKey" ) REFERENCES "EDW"."DimDate" ( "DateKey" )
);