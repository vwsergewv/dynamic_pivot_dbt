-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

-- ************************************** "Dim_Date"
CREATE TABLE IF NOT EXISTS "Dim_Date"
(
 "Datekey"              number(38,0) NOT NULL COMMENT 'test comment sg',
 "Fulldatealternatekey" date NOT NULL,
 "Daynumberofweek"      number(38,0) NOT NULL,
 "Englishdaynameofweek" varchar(10) NOT NULL,
 "Spanishdaynameofweek" varchar(10) NOT NULL,
 "Frenchdaynameofweek"  varchar(10) NOT NULL,
 "Daynumberofmonth"     number(38,0) NOT NULL,
 "Daynumberofyear"      number(38,0) NOT NULL,
 "Weeknumberofyear"     number(38,0) NOT NULL,
 "Englishmonthname"     varchar(10) NOT NULL,
 "Spanishmonthname"     varchar(10) NOT NULL,
 "Frenchmonthname"      varchar(10) NOT NULL,
 "Monthnumberofyear"    number(38,0) NOT NULL,
 "Calendarquarter"      number(38,0) NOT NULL,
 "Calendaryear"         number(38,0) NOT NULL,
 "Calendarsemester"     number(38,0) NOT NULL,
 "Fiscalquarter"        number(38,0) NOT NULL,
 "Fiscalyear"           number(38,0) NOT NULL,
 "Fiscalsemester"       number(38,0) NOT NULL,
 CONSTRAINT "PK_Dimdate" PRIMARY KEY ( "Datekey" )
)
COMMENT = 'Dimension for Date time';


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


