-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

CREATE FILE FORMAT fileFormat_AdventureworksdwEdwFileformat431
 TYPE = JSON;


-- ************************************** Edw.DimAccount
CREATE TABLE Edw.DimAccount
(
 AccountKey                    number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Unique Identifier of the Account data',
 ParentAccountKey              number(38,0) COMMENT 'Identifier of parent Account',
 AccountCodeAlternateKey       number(38,0) COMMENT 'some info on alternate key',
 ParentAccountCodeAlternateKey number(38,0),
 AccountDescription            varchar(50),
 AccountType                   varchar(50) COMMENT 'Checking or savings',
 Operator                      varchar(50),
 CustomMembers                 varchar(300),
 ValueType                     varchar(50),
 CustomMemberOptions           varchar(200),
 CONSTRAINT PK_DimAccount PRIMARY KEY ( AccountKey )
)
COMMENT = 'Holds all Account information';


-- ************************************** Edw.DIM_PRODUCT_CAT_SUBCAT_V
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
  from "DimProduct" prod
  left join cat_subcat 
  on prod."ProductSubcategoryKey" = cat_subcat."SubProductSubcategoryKey"
);

