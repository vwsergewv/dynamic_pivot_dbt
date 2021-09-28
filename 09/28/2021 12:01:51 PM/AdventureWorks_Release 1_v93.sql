-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

DROP VIEW IF EXISTS "DimProduct_V";

DROP VIEW IF EXISTS "dim_product_cat_subcat_v2";


DROP SCHEMA IF EXISTS "adventureworksdw_edw";


DROP SCHEMA IF EXISTS "edw";

CREATE OR REPLACE SCHEMA IF NOT EXISTS "adventureworksdw_edw";

CREATE OR REPLACE SCHEMA IF NOT EXISTS "edw";

CREATE FILE FORMAT IF NOT EXISTS "fileFormat_adventureworksdw_edw_fileformat_431"
 TYPE = JSON;


-- ************************************** "table_598"
CREATE TABLE IF NOT EXISTS "table_598"
(

);


-- ************************************** "table_524"
CREATE TABLE IF NOT EXISTS "table_524"
(
 "parent_pk" varchar(50) NOT NULL,
 CONSTRAINT "PK_table_524" PRIMARY KEY ( "parent_pk" )
);


-- ************************************** "newtbl"
CREATE TABLE IF NOT EXISTS "newtbl"
(
 "salesterritoryalternatekey" number(38,0),
 "salesterritoryregion"       varchar(50) NOT NULL,
 "salesterritorycountry"      varchar(50) NOT NULL,
 "taxamt"                     number(38,0)
);


-- ************************************** "new_table"
CREATE TABLE IF NOT EXISTS "new_table"
(
 "englishproductcategoryname"    varchar(50) NOT NULL,
 "productsubcategorykey"         number(37,0) NOT NULL,
 "englishproductsubcategoryname" varchar(50) NOT NULL
);


-- ************************************** "edw"."factsurveyresponse"
CREATE TABLE IF NOT EXISTS "edw"."factsurveyresponse"
(
 "surveyresponsekey"             number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "datekey"                       number(38,0) NOT NULL,
 "customerkey"                   number(38,0) NOT NULL,
 "productcategorykey"            number(38,0) NOT NULL,
 "englishproductcategoryname"    varchar(50) NOT NULL,
 "productsubcategorykey"         number(38,0) NOT NULL,
 "englishproductsubcategoryname" varchar(50) NOT NULL
);


-- ************************************** "edw"."factcurr"
CREATE TABLE IF NOT EXISTS "edw"."factcurr"
(
 "datekey"      number(38,0) NOT NULL,
 "col_580"       NOT NULL,
 "averagerate"  float NOT NULL,
 "endofdayrate" float NOT NULL,
 CONSTRAINT "PK_factcurrencyrate_copy" PRIMARY KEY ( "datekey", "col_580" )
);


-- ************************************** "edw"."dimscenario"
CREATE TABLE IF NOT EXISTS "edw"."dimscenario"
(
 "scenariokey"  number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Scenario Identifier',
 "scenarioname" varchar(50) COMMENT 'Name of the Scenario',
 "createdby"    varchar(50) NOT NULL COMMENT 'Who Created this Scenario',
 "createddate"  timestamp_ntz(9) NOT NULL COMMENT 'Scenario Creation Date',
 "updateddate"  timestamp_ntz(9) NOT NULL,
 "updatedby"    varchar(50) NOT NULL,
 CONSTRAINT "PK_dimscenario" PRIMARY KEY ( "scenariokey" )
)
COMMENT = 'Dimension Scenario';


-- ************************************** "edw"."dimreseller"
CREATE TABLE IF NOT EXISTS "edw"."dimreseller"
(
 "resellerkey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "reselleralternatekey" varchar(15),
 "phone"                varchar(25),
 "businesstype"         varchar(20) NOT NULL,
 "resellername"         varchar(50) NOT NULL,
 "numberemployees"      number(38,0),
 "orderfrequency"       varchar(1),
 "ordermonth"           number(38,0),
 "firstorderyear"       number(38,0),
 "lastorderyear"        number(38,0),
 "productline"          varchar(50),
 "addressline_1"        varchar(60),
 "addressline_2"        varchar(60),
 "annualsales"          number(38,0),
 "bankname"             varchar(50),
 "minpaymenttype"       number(38,0),
 "minpaymentamount"     number(38,0),
 "annualrevenue"        number(38,0),
 "yearopened"           number(38,0),
 CONSTRAINT "PK_dimreseller" PRIMARY KEY ( "resellerkey" )
)
COMMENT = 'reselling clients';


-- ************************************** "edw"."dimpromotion"
CREATE TABLE IF NOT EXISTS "edw"."dimpromotion"
(
 "promotionkey"             number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "promotionalternatekey"    number(38,0),
 "englishpromotionname"     varchar(255),
 "spanishpromotionname"     varchar(255),
 "frenchpromotionname"      varchar(255),
 "discountpct"              float,
 "englishpromotiontype"     varchar(50),
 "spanishpromotiontype"     varchar(50),
 "frenchpromotiontype"      varchar(50),
 "englishpromotioncategory" varchar(50),
 "spanishpromotioncategory" varchar(50),
 "frenchpromotioncategory"  varchar(50),
 "minqty"                   number(38,0),
 "maxqty"                   number(38,0),
 CONSTRAINT "PK_dimpromotion" PRIMARY KEY ( "promotionkey" )
);


-- ************************************** "edw"."dimproductcategory"
CREATE TABLE IF NOT EXISTS "edw"."dimproductcategory"
(
 "productcategorykey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "productcategoryalternatekey" number(38,0),
 "englishproductcategoryname"  varchar(51) NOT NULL,
 "spanishproductcategoryname"  varchar(60) NOT NULL,
 "frenchproductcategoryname"   varchar(50) NOT NULL,
 "new_column"                  number(38,2) NOT NULL,
 CONSTRAINT "PK_dimproductcategory" PRIMARY KEY ( "productcategorykey" )
)
COMMENT = 'Product Category';


-- ************************************** "edw"."dimgeography"
CREATE TABLE IF NOT EXISTS "edw"."dimgeography"
(
 "geographykey"             number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "city"                     varchar(30),
 "stateprovincecode"        varchar(3),
 "stateprovincename"        varchar(50),
 "countryregioncode"        varchar(3),
 "englishcountryregionname" varchar(50),
 "spanishcountryregionname" varchar(50),
 "frenchcountryregionname"  varchar(50),
 "postalcode"               varchar(15),
 "salesterritorykey"        number(38,0),
 "ipaddresslocator"         varchar(15),
 CONSTRAINT "PK_dimgeography" PRIMARY KEY ( "geographykey" )
);


-- ************************************** "edw"."dimemployee"
CREATE TABLE IF NOT EXISTS "edw"."dimemployee"
(
 "employeekey"                          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "employeenationalidalternatekey"       varchar(15),
 "parentemployeenationalidalternatekey" varchar(15),
 "firstname"                            varchar(50) NOT NULL,
 "lastname"                             varchar(50) NOT NULL,
 "middlename"                           varchar(50),
 "namestyle"                            number(38,0) NOT NULL,
 "title"                                varchar(50),
 "hiredate"                             date,
 "birthdate"                            date,
 "loginid"                              varchar(256),
 "emailaddress"                         varchar(50),
 "phone"                                varchar(25),
 "maritalstatus"                        varchar(1),
 "emergencycontactname"                 varchar(50),
 "emergencycontactphone"                varchar(25),
 "salariedflag"                         number(38,0),
 "gender"                               varchar(1),
 "payfrequency"                         number(38,0),
 "baserate"                             number(38,0),
 "vacationhours"                        number(38,0),
 "sickleavehours"                       number(38,0),
 "currentflag"                          number(38,0) NOT NULL,
 "salespersonflag"                      number(38,0) NOT NULL,
 "departmentname"                       varchar(50),
 "startdate"                            date,
 "enddate"                              date,
 "status"                               varchar(50),
 CONSTRAINT "PK_dimemployee" PRIMARY KEY ( "employeekey" )
)
COMMENT = 'This table holds all Employee Information';


-- ************************************** "edw"."dimdepartmentgroup"
CREATE TABLE IF NOT EXISTS "edw"."dimdepartmentgroup"
(
 "departmentgroupkey"       number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "parentdepartmentgroupkey" number(38,0),
 "departmentgroupname"      varchar(50),
 CONSTRAINT "PK_dimdepartmentgroup" PRIMARY KEY ( "departmentgroupkey" )
)
COMMENT = 'Dimension for Department groups';


-- ************************************** "edw"."dimdate"
CREATE TABLE IF NOT EXISTS "edw"."dimdate"
(
 "datekey"              number(38,0) NOT NULL COMMENT 'test comment sg',
 "fulldatealternatekey" date NOT NULL,
 "daynumberofweek"      number(38,0) NOT NULL,
 "englishdaynameofweek" varchar(10) NOT NULL,
 "spanishdaynameofweek" varchar(10) NOT NULL,
 "frenchdaynameofweek"  varchar(10) NOT NULL,
 "daynumberofmonth"     number(38,0) NOT NULL,
 "daynumberofyear"      number(38,0) NOT NULL,
 "weeknumberofyear"     number(38,0) NOT NULL,
 "englishmonthname"     varchar(10) NOT NULL,
 "spanishmonthname"     varchar(10) NOT NULL,
 "frenchmonthname"      varchar(10) NOT NULL,
 "monthnumberofyear"    number(38,0) NOT NULL,
 "calendarquarter"      number(38,0) NOT NULL,
 "calendaryear"         number(38,0) NOT NULL,
 "calendarsemester"     number(38,0) NOT NULL,
 "fiscalquarter"        number(38,0) NOT NULL,
 "fiscalyear"           number(38,0) NOT NULL,
 "fiscalsemester"       number(38,0) NOT NULL,
 CONSTRAINT "PK_dimdate" PRIMARY KEY ( "datekey" )
)
COMMENT = 'Dimension for Date time';


-- ************************************** "edw"."dimcurrency"
CREATE TABLE IF NOT EXISTS "edw"."dimcurrency"
(
 "currencykey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Currency Identifier',
 "currencyalternatekey" varchar(3) NOT NULL COMMENT 'Alternate Currency Identifier',
 "currencyname"         varchar(50) NOT NULL COMMENT 'Name of the Currency',
 CONSTRAINT "PK_dimcurrency" PRIMARY KEY ( "currencykey" )
)
COMMENT = 'Dimension for Currency Data';


-- ************************************** "edw"."dimaccount"
CREATE TABLE IF NOT EXISTS "edw"."dimaccount"
(
 "accountkey"                    number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Unique Identifier of the Account data',
 "parentaccountkey"              number(38,0) COMMENT 'Identifier of parent Account',
 "accountcodealternatekey"       number(38,0) COMMENT 'salesforce account atlr',
 "parentaccountcodealternatekey" number(38,0) COMMENT 'parent key',
 "accountdescription"            varchar(50) COMMENT 'acct desc',
 "accounttype"                   varchar(50) COMMENT 'classification of account by finance',
 "operator"                      varchar(50),
 "custommembers"                 varchar(300),
 "valuetype"                     varchar(50),
 "custommemberoptions"           varchar(200),
 CONSTRAINT "PK_dimaccount" PRIMARY KEY ( "accountkey" )
)
COMMENT = 'Holds all Account information';


-- ************************************** "dim_currency"
CREATE TABLE IF NOT EXISTS "dim_currency"
(

)
COMMENT = 'fc rates from sap finance';


-- ************************************** "csv_file_from_tom"
CREATE TABLE IF NOT EXISTS "csv_file_from_tom"
(

);


-- ************************************** "table_578"
CREATE TABLE IF NOT EXISTS "table_578"
(
 "datekey" number(38,0) NOT NULL,
 "col_580"  NOT NULL,
 CONSTRAINT "PK_table_578" PRIMARY KEY ( "datekey", "col_580" ),
 CONSTRAINT "FK_581" FOREIGN KEY ( "datekey", "col_580" ) REFERENCES "edw"."factcurr" ( "datekey", "col_580" )
);


-- ************************************** "table_571"
CREATE TABLE IF NOT EXISTS "table_571"
(
 "endofdayrate_1" float NOT NULL,
 "new_pk"          NOT NULL,
 "endofdayrate"   float NOT NULL,
 "averagerate"    float NOT NULL,
 "datekey"        number(38,0) NOT NULL,
 "col_580"         NOT NULL,
 CONSTRAINT "PK_table_571" PRIMARY KEY ( "endofdayrate_1", "new_pk" ),
 CONSTRAINT "FK_586" FOREIGN KEY ( "datekey", "col_580" ) REFERENCES "edw"."factcurr" ( "datekey", "col_580" )
);


-- ************************************** "edw"."newfactcurrencyrate"
CREATE TABLE IF NOT EXISTS "edw"."newfactcurrencyrate"
(
 "averagerate"  float,
 "currencyid"   varchar(3),
 "currencydate" date,
 "endofdayrate" float,
 "currencykey"  number(38,0),
 "datekey"      number(38,0),
 CONSTRAINT "FK_newfactcurrencyrate_469" FOREIGN KEY ( "currencykey" ) REFERENCES "edw"."dimcurrency" ( "currencykey" )
)
COMMENT = 'new fx table for curr conversion';


-- ************************************** "edw"."factsalesquota"
CREATE TABLE IF NOT EXISTS "edw"."factsalesquota"
(
 "salesquotakey"    number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "employeekey"      number(38,0) NOT NULL,
 "datekey"          number(38,0) NOT NULL,
 "calendaryear"     number(38,0) NOT NULL,
 "calendarquarter"  number(38,0) NOT NULL,
 "salesamountquota" number(38,0) NOT NULL,
 CONSTRAINT "FK_factsalesquota_463" FOREIGN KEY ( "datekey" ) REFERENCES "edw"."dimdate" ( "datekey" )
);


-- ************************************** "edw"."factproductinventory"
CREATE TABLE IF NOT EXISTS "edw"."factproductinventory"
(
 "productkey"   number(38,0) NOT NULL,
 "datekey"      number(38,0) NOT NULL,
 "movementdate" date NOT NULL,
 "unitcost"     number(38,0) NOT NULL,
 "unitsin"      number(38,0) NOT NULL,
 "unitsout"     number(38,0) NOT NULL,
 "unitsbalance" number(38,0) NOT NULL,
 CONSTRAINT "FK_factproductinventory_443" FOREIGN KEY ( "datekey" ) REFERENCES "edw"."dimdate" ( "datekey" )
);


-- ************************************** "edw"."factcurrencyrate"
CREATE TABLE IF NOT EXISTS "edw"."factcurrencyrate"
(
 "currencykey"  number(38,0) NOT NULL,
 "datekey"      number(38,0) NOT NULL,
 "averagerate"  float NOT NULL,
 "endofdayrate" float NOT NULL,
 CONSTRAINT "FK_factcurrencyrate_413" FOREIGN KEY ( "currencykey" ) REFERENCES "edw"."dimcurrency" ( "currencykey" )
);


-- ************************************** "edw"."dimproductsubcategory"
CREATE TABLE IF NOT EXISTS "edw"."dimproductsubcategory"
(
 "productsubcategorykey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "productsubcategoryalternatekey" number(38,0),
 "englishproductsubcategoryname"  varchar(60) NOT NULL DEFAULT Standard,
 "spanishproductsubcategoryname"  varchar(50) NOT NULL,
 "frenchproductsubcategoryname"   varchar(50) NOT NULL,
 "productcategorykey"             number(38,0) NOT NULL,
 CONSTRAINT "PK_dimproductsubcategory" PRIMARY KEY ( "productsubcategorykey", "productcategorykey" ),
 CONSTRAINT "FK_dimproductsubcategory_409" FOREIGN KEY ( "productcategorykey" ) REFERENCES "edw"."dimproductcategory" ( "productcategorykey" )
)
COMMENT = 'Product Subcategory';


-- ************************************** "edw"."dimorganization"
CREATE TABLE IF NOT EXISTS "edw"."dimorganization"
(
 "organizationkey"       number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "parentorganizationkey" number(38,0) NOT NULL COMMENT 'org key from master hierarchy',
 "parent_pk"             varchar(50) NOT NULL,
 "percentageofownership" varchar(16),
 "organizationname"      varchar(50),
 "currencykey"           number(38,0),
 CONSTRAINT "PK_dimorganization" PRIMARY KEY ( "organizationkey", "parentorganizationkey", "parent_pk" ),
 CONSTRAINT "FK_524" FOREIGN KEY ( "parent_pk" ) REFERENCES "table_524" ( "parent_pk" )
)
COMMENT = 'Dimension for Organizational Data';


-- ************************************** "edw"."dimcustomer"
CREATE TABLE IF NOT EXISTS "edw"."dimcustomer"
(
 "customerkey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Customer Identifier',
 "geographykey"         number(38,0) COMMENT 'Geographic informatio',
 "customeralternatekey" varchar(15) NOT NULL COMMENT 'Alternate Key',
 "title"                varchar(8) COMMENT 'Title of the Customer',
 "firstname"            varchar(50) COMMENT 'multi comment',
 "middlename"           varchar(50),
 "lastname"             varchar(50) COMMENT 'salesforce asdfasdf',
 "namestyle"            varchar(5) COMMENT 'short or long name',
 "birthdate"            date,
 "maritalstatus"        varchar(1),
 "suffix"               varchar(10),
 "gender"               varchar(1),
 "emailaddress"         varchar(50),
 "yearlyincome"         number(38,0),
 "totalchildren"        number(38,0),
 "numberchildrenathome" number(38,0),
 "englisheducation"     varchar(40),
 "spanisheducation"     varchar(40),
 "frencheducation"      varchar(40),
 "englishoccupation"    varchar(100),
 "spanishoccupation"    varchar(100),
 "frenchoccupation"     varchar(100),
 "houseownerflag"       varchar(1),
 "numbercarsowned"      number(38,0),
 "addressline"          varchar(120),
 "addressline_2"        varchar(120),
 "phone"                varchar(20),
 "datefirstpurchase"    date,
 "commutedistance"      varchar(15),
 CONSTRAINT "PK_dimcustomer" PRIMARY KEY ( "customerkey" ),
 CONSTRAINT "FK_dimcustomer_401" FOREIGN KEY ( "geographykey" ) REFERENCES "edw"."dimgeography" ( "geographykey" )
)
COMMENT = 'Dimension for Customer Data';


-- ************************************** "edw"."dimcurr"
CREATE TABLE IF NOT EXISTS "edw"."dimcurr"
(
 "currencykey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Currency Identifier',
 "currencyalternatekey" varchar(3) NOT NULL COMMENT 'Alternate Currency Identifier',
 "currencyname"         varchar(50) NOT NULL COMMENT 'Name of the Currency',
 CONSTRAINT "PK_dimcurrency_copy" PRIMARY KEY ( "currencykey" )
)
COMMENT = 'Dimension for Currency Data';


-- ************************************** "table_593"
CREATE TABLE IF NOT EXISTS "table_593"
(
 "datekey" number(38,0) NOT NULL,
 "col_580"  NOT NULL,
 CONSTRAINT "FK_594" FOREIGN KEY ( "datekey", "col_580" ) REFERENCES "table_578" ( "datekey", "col_580" )
);


-- ************************************** "table_517"
CREATE TABLE IF NOT EXISTS "table_517"
(
 "organizationkey"       number(38,0) NOT NULL,
 "parentorganizationkey" number(38,0) NOT NULL,
 "parent_pk"             varchar(50) NOT NULL,
 "countryregioncode"     varchar(3),
 CONSTRAINT "PK_table_517" PRIMARY KEY ( "organizationkey", "parentorganizationkey", "parent_pk" ),
 CONSTRAINT "FK_517" FOREIGN KEY ( "organizationkey", "parentorganizationkey", "parent_pk" ) REFERENCES "edw"."dimorganization" ( "organizationkey", "parentorganizationkey", "parent_pk" )
);


-- ************************************** "edw"."factfinance"
CREATE TABLE IF NOT EXISTS "edw"."factfinance"
(
 "financekey"            number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "datekey"               number(38,0) NOT NULL,
 "organizationkey"       number(38,0) NOT NULL,
 "departmentgroupkey"    number(38,0) NOT NULL,
 "scenariokey"           number(38,0) NOT NULL,
 "accountkey"            number(38,0) NOT NULL,
 "amount"                float NOT NULL,
 "parentorganizationkey" number(38,0) NOT NULL,
 "parent_pk"             varchar(50) NOT NULL,
 CONSTRAINT "FK_factfinance_419" FOREIGN KEY ( "organizationkey", "parentorganizationkey", "parent_pk" ) REFERENCES "edw"."dimorganization" ( "organizationkey", "parentorganizationkey", "parent_pk" ),
 CONSTRAINT "FK_factfinance_421" FOREIGN KEY ( "departmentgroupkey" ) REFERENCES "edw"."dimdepartmentgroup" ( "departmentgroupkey" )
)
COMMENT = 'Facts for Finance';


-- ************************************** "edw"."factcurrhist"
CREATE TABLE IF NOT EXISTS "edw"."factcurrhist"
(
 "currencykey"  number(38,0),
 "datekey_1"    number(38,0) NOT NULL,
 "averagerate"  float,
 "currencyid"   varchar(3),
 "currencydate" date,
 "endofdayrate" float,
 "currencyname" varchar(50) NOT NULL COMMENT 'Name of the Currency',
 "datekey"      number(38,0),
 "col_580"       NOT NULL,
 CONSTRAINT "AK_487" UNIQUE ( "averagerate", "currencydate", "currencyid" ),
 CONSTRAINT "FK_450" FOREIGN KEY ( "datekey_1", "col_580" ) REFERENCES "edw"."factcurr" ( "datekey", "col_580" ),
 CONSTRAINT "FK_newfactcurrencyrate_469_copy" FOREIGN KEY ( "currencykey" ) REFERENCES "edw"."dimcurr" ( "currencykey" )
);


-- ************************************** "edw"."dimproduct"
CREATE TABLE IF NOT EXISTS "edw"."dimproduct"
(
 "productkey"            number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'unique product id',
 "productalternatekey"   varchar(25),
 "productsubcategorykey" number(38,0) NOT NULL,
 "weightunitmeasurecode" varchar(3),
 "sizeunitmeasurecode"   varchar(3),
 "englishproductname"    varchar(50) NOT NULL,
 "spanishproductname"    varchar(50),
 "frenchproductname"     varchar(50),
 "standardcost"          number(38,0),
 "finishedgoodsflag"     number(38,0) NOT NULL,
 "color"                 varchar(15) NOT NULL,
 "safetystocklevel"      number(38,0),
 "reorderpoint"          number(38,0),
 "listprice"             number(38,0),
 "size"                  varchar(50),
 "sizerange"             varchar(50),
 "weight"                float,
 "daystomanufacture"     number(38,0),
 "productline"           varchar(2),
 "dealerprice"           number(38,0),
 "class"                 varchar(2),
 "style"                 varchar(2),
 "modelname"             varchar(50),
 "englishdescription"    varchar(400),
 "frenchdescription"     varchar(400),
 "chinesedescription"    varchar(400),
 "arabicdescription"     varchar(400),
 "hebrewdescription"     varchar(400),
 "thaidescription"       varchar(400),
 "germandescription"     varchar(400),
 "japanesedescription"   varchar(400),
 "turkishdescription"    varchar(400),
 "status"                varchar(7),
 "productcategorykey"    number(38,0) NOT NULL,
 CONSTRAINT "PK_dimproduct" PRIMARY KEY ( "productkey", "productsubcategorykey", "productcategorykey" ),
 CONSTRAINT "FK_dimproduct_407" FOREIGN KEY ( "productsubcategorykey", "productcategorykey" ) REFERENCES "edw"."dimproductsubcategory" ( "productsubcategorykey", "productcategorykey" )
)
COMMENT = 'Product Master Data';


-- ************************************** "edw"."factresellersales"
CREATE TABLE IF NOT EXISTS "edw"."factresellersales"
(
 "productkey"            number(38,0) NOT NULL,
 "orderdatekey"          number(38,0) NOT NULL,
 "duedatekey"            number(38,0) NOT NULL,
 "shipdatekey"           number(38,0) NOT NULL,
 "resellerkey"           number(38,0) NOT NULL,
 "employeekey"           number(38,0) NOT NULL,
 "promotionkey"          number(38,0) NOT NULL,
 "currencykey"           number(38,0) NOT NULL,
 "salesordernumber"      varchar(20),
 "salesorderlinenumber"  number(38,0) NOT NULL,
 "revisionnumber"        number(38,0),
 "orderquantity"         number(38,0),
 "unitprice"             number(38,0),
 "extendedamount"        number(38,0),
 "unitpricediscountpct"  float,
 "discountamount"        float,
 "productstandardcost"   number(38,0),
 "totalproductcost"      number(38,0),
 "salesamount"           number(38,0),
 "taxamt"                number(38,0),
 "freight"               number(38,0),
 "carriertrackingnumber" varchar(25),
 "customerponumber"      varchar(25),
 "productsubcategorykey" number(38,0) NOT NULL,
 "productcategorykey"    number(38,0) NOT NULL,
 CONSTRAINT "FK_factresellersales_445" FOREIGN KEY ( "productkey", "productsubcategorykey", "productcategorykey" ) REFERENCES "edw"."dimproduct" ( "productkey", "productsubcategorykey", "productcategorykey" ),
 CONSTRAINT "FK_factresellersales_447" FOREIGN KEY ( "resellerkey" ) REFERENCES "edw"."dimreseller" ( "resellerkey" ),
 CONSTRAINT "FK_factresellersales_449" FOREIGN KEY ( "employeekey" ) REFERENCES "edw"."dimemployee" ( "employeekey" ),
 CONSTRAINT "FK_factresellersales_451" FOREIGN KEY ( "promotionkey" ) REFERENCES "edw"."dimpromotion" ( "promotionkey" ),
 CONSTRAINT "FK_factresellersales_453" FOREIGN KEY ( "currencykey" ) REFERENCES "edw"."dimcurrency" ( "currencykey" ),
 CONSTRAINT "FK_factresellersales_457" FOREIGN KEY ( "orderdatekey" ) REFERENCES "edw"."dimdate" ( "datekey" ),
 CONSTRAINT "FK_factresellersales_459" FOREIGN KEY ( "duedatekey" ) REFERENCES "edw"."dimdate" ( "datekey" ),
 CONSTRAINT "FK_factresellersales_461" FOREIGN KEY ( "shipdatekey" ) REFERENCES "edw"."dimdate" ( "datekey" )
)
COMMENT = 'Fact data of Reseller Sales';


-- ************************************** "edw"."dimsalesterritory_clone"
CREATE TABLE IF NOT EXISTS "edw"."dimsalesterritory_clone"
(
 "salesterritorykey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "salesterritoryalternatekey" number(38,0),
 "salesterritoryregion"       varchar(50) NOT NULL,
 "salesterritorycountry"      varchar(50) NOT NULL,
 "productstandardcost"        number(38,0),
 "taxamt"                     number(38,0),
 "salesterritorygroup"        varchar(50),
 "upper_col"                  varchar(49) NOT NULL,
 CONSTRAINT "PK_dimsalesterritory_clone" PRIMARY KEY ( "salesterritorykey" )
)
COMMENT = 'Sales Territory data';


-- ************************************** "edw"."dimsalesterritory"
CREATE TABLE IF NOT EXISTS "edw"."dimsalesterritory"
(
 "salesterritorykey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "salesterritoryalternatekey" number(38,0),
 "salesterritoryregion"       varchar(50) NOT NULL,
 "salesterritorycountry"      varchar(50) NOT NULL,
 "salesterritorygroup"        varchar(50),
 "upper_col"                  varchar(49) NOT NULL,
 CONSTRAINT "PK_dimsalesterritory" PRIMARY KEY ( "salesterritorykey" )
)
COMMENT = 'Sales Territory data';


-- ************************************** "table_504"
CREATE TRANSIENT TABLE IF NOT EXISTS "table_504"
(
 "salesterritorykey" number(38,0) NOT NULL,
 CONSTRAINT "PK_table_504" PRIMARY KEY ( "salesterritorykey" ),
 CONSTRAINT "FK_504" FOREIGN KEY ( "salesterritorykey" ) REFERENCES "edw"."dimsalesterritory" ( "salesterritorykey" )
);


-- ************************************** "edw"."factinternetsales"
CREATE TABLE IF NOT EXISTS "edw"."factinternetsales"
(
 "productkey"            number(38,0) NOT NULL,
 "orderdatekey"          number(38,0) NOT NULL,
 "duedatekey"            number(38,0) NOT NULL,
 "shipdatekey"           number(38,0) NOT NULL,
 "customerkey"           number(38,0) NOT NULL,
 "promotionkey"          number(38,0) NOT NULL,
 "currencykey"           number(38,0) NOT NULL,
 "salesterritorykey"     number(38,0) NOT NULL,
 "salesorderlinenumber"  number(38,0) NOT NULL,
 "revisionnumber"        number(38,0) NOT NULL,
 "orderquantity"         number(38,0) NOT NULL,
 "unitprice"             number(38,0) NOT NULL,
 "extendedamount"        number(38,0) NOT NULL,
 "unitpricediscountpct"  float NOT NULL,
 "discountamount"        float NOT NULL,
 "productstandardcost"   number(38,0) NOT NULL,
 "totalproductcost"      number(38,0) NOT NULL,
 "salesamount"           number(38,0) NOT NULL,
 "taxamt"                number(38,0) NOT NULL,
 "freight"               number(38,0) NOT NULL,
 "carriertrackingnumber" varchar(25),
 "customerponumber"      varchar(25),
 "productsubcategorykey" number(38,0) NOT NULL,
 "productcategorykey"    number(38,0) NOT NULL,
 "new_int_col"           integer NOT NULL,
 CONSTRAINT "FK_factinternetsales_427" FOREIGN KEY ( "productkey", "productsubcategorykey", "productcategorykey" ) REFERENCES "edw"."dimproduct" ( "productkey", "productsubcategorykey", "productcategorykey" ),
 CONSTRAINT "FK_factinternetsales_429" FOREIGN KEY ( "customerkey" ) REFERENCES "edw"."dimcustomer" ( "customerkey" ),
 CONSTRAINT "FK_factinternetsales_431" FOREIGN KEY ( "promotionkey" ) REFERENCES "edw"."dimpromotion" ( "promotionkey" ),
 CONSTRAINT "FK_factinternetsales_433" FOREIGN KEY ( "currencykey" ) REFERENCES "edw"."dimcurrency" ( "currencykey" ),
 CONSTRAINT "FK_factinternetsales_435" FOREIGN KEY ( "salesterritorykey" ) REFERENCES "edw"."dimsalesterritory" ( "salesterritorykey" ),
 CONSTRAINT "FK_factinternetsales_437" FOREIGN KEY ( "orderdatekey" ) REFERENCES "edw"."dimdate" ( "datekey" ),
 CONSTRAINT "FK_factinternetsales_439" FOREIGN KEY ( "duedatekey" ) REFERENCES "edw"."dimdate" ( "datekey" ),
 CONSTRAINT "FK_factinternetsales_441" FOREIGN KEY ( "shipdatekey" ) REFERENCES "edw"."dimdate" ( "datekey" )
)
COMMENT = 'Fact table to hold Currency Data';


-- ************************************** "DimProduct_V"
Create View DimProduct_V

  Comment = 'Product view'

AS
(
Select * FROM  EDW.DimProduct  
);

-- ************************************** "dim_product_cat_subcat_v2"
Create View dim_product_cat_subcat_v2

  Comment = 'view to test fwd/rev engineering'

AS
(
WITH cat_subcat as (
SELECT  cat."EnglishProductCategoryName" , sub."ProductSubcategoryKey", sub."EnglishProductSubcategoryName"  FROM  "AdventureWorksDW"."DEV"."DimProductSubcategory" sub
left join  "AdventureWorksDW"."DEV"."DimProductCategory" cat
on sub."ProductCategoryKey" = cat."ProductCategoryKey"
)
  select prod.*, cat_subcat."EnglishProductCategoryName", cat_subcat."EnglishProductSubcategoryName" from "AdventureWorksDW"."DEV"."DimProduct" prod
  left join cat_subcat 
  on prod."ProductSubcategoryKey" = cat_subcat."ProductSubcategoryKey"
);

