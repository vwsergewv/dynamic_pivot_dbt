-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

-- ************************************** "Edw"."Dimcurrency"
CREATE TABLE IF NOT EXISTS "Edw"."Dimcurrency"
(
 "Currencykey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Currency Identifier',
 "Currencyalternatekey" varchar(3) NOT NULL COMMENT 'Alternate Currency Identifier',
 "Currencyname"         varchar(50) NOT NULL COMMENT 'Name of the Currency',
 CONSTRAINT "PK_Dimcurrency" PRIMARY KEY ( "Currencykey" )
)
COMMENT = 'Dimension for Currency Data';


-- ************************************** "Edw"."Dimaccount"
CREATE TABLE IF NOT EXISTS "Edw"."Dimaccount"
(
 "Accountkey"                    number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Unique Identifier of the Account data',
 "Parentaccountkey"              number(38,0) COMMENT 'Identifier of parent Account',
 "Accountcodealternatekey"       number(38,0) COMMENT 'salesforce account atlr',
 "Parentaccountcodealternatekey" number(38,0) COMMENT 'parent key',
 "Accountdescription"            varchar(50) COMMENT 'acct desc',
 "Accounttype"                   varchar(50) COMMENT 'classification of account by finance',
 "Operator"                      varchar(50) COMMENT 'call center operator',
 "Custommembers"                 varchar(300),
 "Valuetype"                     varchar(50),
 "Custommemberoptions"           varchar(200),
 CONSTRAINT "PK_Dimaccount" PRIMARY KEY ( "Accountkey" )
)
COMMENT = 'Holds all Account information';


-- ************************************** "Dim_Product"
CREATE TABLE IF NOT EXISTS "Dim_Product"
(
 "Productkey"            number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'unique product id',
 "Productalternatekey"   varchar(25),
 "Weightunitmeasurecode" varchar(3),
 "Sizeunitmeasurecode"   varchar(3),
 "Englishproductname"    varchar(50) NOT NULL,
 "Spanishproductname"    varchar(50),
 "Frenchproductname"     varchar(50),
 "Standardcost"          number(38,0),
 "Finishedgoodsflag"     number(38,0) NOT NULL,
 "Color"                 varchar(15) NOT NULL,
 "Safetystocklevel"      number(38,0),
 "Reorderpoint"          number(38,0),
 "Listprice"             number(38,0),
 "Size"                  varchar(50),
 "Sizerange"             varchar(50),
 "Weight"                float,
 "Daystomanufacture"     number(38,0),
 "Productline"           varchar(2),
 "Dealerprice"           number(38,0),
 "Class"                 varchar(2),
 "Style"                 varchar(2),
 "Modelname"             varchar(50),
 "Englishdescription"    varchar(400),
 "Frenchdescription"     varchar(400),
 "Chinesedescription"    varchar(400),
 "Arabicdescription"     varchar(400),
 "Hebrewdescription"     varchar(400),
 "Thaidescription"       varchar(400),
 "Germandescription"     varchar(400),
 "Japanesedescription"   varchar(400),
 "Turkishdescription"    varchar(400),
 "Status"                varchar(7),
 "Productsubcategorykey" number(38,0) NOT NULL,
 "Productcategorykey"    number(38,0) NOT NULL,
 "New_Lower_Col"          NOT NULL,
 CONSTRAINT "PK_Dimproduct" PRIMARY KEY ( "Productkey" ),
 CONSTRAINT "FK_Dimproduct_407" FOREIGN KEY ( "Productsubcategorykey", "Productcategorykey", "New_Lower_Col" ) REFERENCES "Edw"."Dimproductsubcategory" ( "Productsubcategorykey", "Productcategorykey", "New_Pk" )
)
COMMENT = 'Product Master Data';


