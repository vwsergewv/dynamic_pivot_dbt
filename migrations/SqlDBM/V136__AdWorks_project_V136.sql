-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

CREATE FILE FORMAT IF NOT EXISTS "AdventureworksdwEdwFileformat431"
 TYPE = JSON;

CREATE FILE FORMAT IF NOT EXISTS "AdventureworksdwEdwFileformat431"
 TYPE = JSON;

CREATE FILE FORMAT IF NOT EXISTS "AdventureworksdwEdwFileformat431"
 TYPE = JSON;

CREATE FILE FORMAT IF NOT EXISTS "FileFormatAdventureworksdwEdwFileformat431"
 TYPE = JSON;

-- ************************************** "DimEmployee"
CREATE TABLE IF NOT EXISTS "DimEmployee"
(
 "EmpId"       integer NOT NULL DEFAULT 5,
 "EtlId"       date NOT NULL, -- From template: "table_w_etl_fields" 
 "EtlFilename" varchar(50) NOT NULL COMMENT 'source file or table from where the target is loaded', -- From template: "table_w_etl_fields" 
 CONSTRAINT "PK_DimEmployee_EmpId_1600" PRIMARY KEY ( "EmpId" )
);

-- ************************************** "Edw"."DimAccount"
CREATE TABLE IF NOT EXISTS "Edw"."DimAccount"
(
 "AccountKey"                    number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Unique Identifier of the Account data',
 "ParentAccountKey"              number(38,0) COMMENT 'Identifier of parent Account',
 "AccountCodeAlternateKey"       number(38,0) COMMENT 'some info on alternate key',
 "ParentAccountCodeAlternateKey" number(38,0) COMMENT 'Client team maintains this, see Bob',
 "AccountDescription"            varchar(50),
 "AccountType"                   varchar(50) COMMENT 'Checking or savings',
 "Operator"                      varchar(50) COMMENT 'Bank or online assistant',
 "CustomMembers"                 varchar(300),
 "ValueType"                     varchar(50),
 "CustomMemberOptions"           varchar(200),
 CONSTRAINT "PK_DimAccount_AccountKey_PkDimAccount" PRIMARY KEY ( "AccountKey" )
)
COMMENT = 'Holds all Account information';

-- ************************************** "DIM_PRODUCT_CAT_SUBCAT_V2"
CREATE VIEW IF NOT EXISTS EDW."DIM_PRODUCT_CAT_SUBCAT_V2" 

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

