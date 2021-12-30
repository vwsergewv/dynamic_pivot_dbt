-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

CREATE FILE FORMAT FileFormatAdventureworksdwEdwFileformat431
 TYPE = JSON;


-- ************************************** Edw.DimPromotion
CREATE TABLE Edw.DimPromotion
(
 PromotionKey             number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 PromotionAlternateKey    number(38,0),
 EnglishPromotionName     varchar(255),
 SpanishPromotionName     varchar(255),
 FrenchPromotionName      varchar(255),
 DiscountPct              float,
 EnglishPromotionType     varchar(50),
 SpanishPromotionType     varchar(50),
 FrenchPromotionType      varchar(50),
 EnglishPromotionCategory varchar(50),
 SpanishPromotionCategory varchar(50),
 FrenchPromotionCategory  varchar(50),
 MinQty                   number(38,0),
 MaxQty                   number(38,0),
 CONSTRAINT PK_PkDimPromotion PRIMARY KEY ( PromotionKey )
);


-- ************************************** EDW.DIM_PRODUCT_CAT_SUBCAT_V
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
