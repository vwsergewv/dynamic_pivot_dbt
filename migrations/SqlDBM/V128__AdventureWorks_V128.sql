-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

-- ************************************** "Table_808"
CREATE TABLE IF NOT EXISTS "Table_808"
(
 "Par_Pk" varchar(50) NOT NULL,
 CONSTRAINT "PK_811" PRIMARY KEY ( "Par_Pk" )
);


-- ************************************** "Table_666"
CREATE TABLE IF NOT EXISTS "Table_666"
(

);


-- ************************************** "Table_598"
CREATE TABLE IF NOT EXISTS "Table_598"
(

);


-- ************************************** "Table_524"
CREATE TABLE IF NOT EXISTS "Table_524"
(
 "Parent_Pk" varchar(50) NOT NULL,
 CONSTRAINT "PK_Table_524" PRIMARY KEY ( "Parent_Pk" )
);


-- ************************************** "Store_Copy_1"
CREATE TABLE IF NOT EXISTS "Store_Copy_1"
(
 "Fk_Employee"  NOT NULL,
 "New_Col"      NOT NULL
)
COMMENT = 'store dim';


-- ************************************** "Store"
CREATE TABLE IF NOT EXISTS "Store"
(
 "Fk_Employee"  NOT NULL,
 "New_Col"      NOT NULL
)
COMMENT = 'store dim';


-- ************************************** "Newtbl"
CREATE TABLE IF NOT EXISTS "Newtbl"
(
 "Salesterritoryalternatekey" number(38,0),
 "Salesterritoryregion"       varchar(50) NOT NULL,
 "Salesterritorycountry"      varchar(50) NOT NULL,
 "Taxamt"                     number(38,0)
);


-- ************************************** "New_Table"
CREATE TABLE IF NOT EXISTS "New_Table"
(
 "Englishproductcategoryname"    varchar(50) NOT NULL,
 "Productsubcategorykey"         number(37,0) NOT NULL,
 "Englishproductsubcategoryname" varchar(50) NOT NULL
)
COMMENT = 'tdb';


-- ************************************** "Edw"."Factsurveyresponse"
CREATE TABLE IF NOT EXISTS "Edw"."Factsurveyresponse"
(
 "Surveyresponsekey"             number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "Datekey"                       number(38,0) NOT NULL,
 "Customerkey"                   number(38,0) NOT NULL,
 "Productcategorykey"            number(38,0) NOT NULL,
 "Englishproductcategoryname"    varchar(50) NOT NULL,
 "Productsubcategorykey"         number(38,0) NOT NULL,
 "Englishproductsubcategoryname" varchar(50) NOT NULL
);


-- ************************************** "Edw"."Factcurr"
CREATE TABLE IF NOT EXISTS "Edw"."Factcurr"
(
 "Datekey"      number(38,0) NOT NULL,
 "Col_580"       NOT NULL,
 "Averagerate"  float NOT NULL,
 "Endofdayrate" float NOT NULL,
 CONSTRAINT "PK_Factcurrencyrate_Copy" PRIMARY KEY ( "Datekey", "Col_580" )
);


-- ************************************** "Edw"."Dimscenario"
CREATE TABLE IF NOT EXISTS "Edw"."Dimscenario"
(
 "Scenariokey"  number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Scenario Identifier',
 "Scenarioname" varchar(50) COMMENT 'Name of the Scenario',
 "Createdby"    varchar(50) NOT NULL COMMENT 'Who Created this Scenario',
 "Createddate"  timestamp_ntz(9) NOT NULL COMMENT 'Scenario Creation Date',
 "Updateddate"  timestamp_ntz(9) NOT NULL,
 "Updatedby"    varchar(50) NOT NULL,
 CONSTRAINT "PK_Dimscenario" PRIMARY KEY ( "Scenariokey" )
)
COMMENT = 'Dimension Scenario';


-- ************************************** "Edw"."Dimreseller"
CREATE TABLE IF NOT EXISTS "Edw"."Dimreseller"
(
 "Resellerkey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "Reselleralternatekey" varchar(15),
 "Phone"                varchar(25),
 "Businesstype"         varchar(20) NOT NULL,
 "Resellername"         varchar(50) NOT NULL,
 "Numberemployees"      number(38,0),
 "Orderfrequency"       varchar(1),
 "Ordermonth"           number(38,0),
 "Firstorderyear"       number(38,0),
 "Lastorderyear"        number(38,0),
 "Productline"          varchar(50),
 "Addressline_1"        varchar(60),
 "Addressline_2"        varchar(60),
 "Annualsales"          number(38,0),
 "Bankname"             varchar(50),
 "Minpaymenttype"       number(38,0),
 "Minpaymentamount"     number(38,0),
 "Annualrevenue"        number(38,0),
 "Yearopened"           number(38,0),
 CONSTRAINT "PK_Dimreseller" PRIMARY KEY ( "Resellerkey" )
)
COMMENT = 'reselling clients';


-- ************************************** "Edw"."Dimproductcategory"
CREATE TABLE IF NOT EXISTS "Edw"."Dimproductcategory"
(
 "Productcategorykey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "Productcategoryalternatekey" number(38,0),
 "Englishproductcategoryname"  varchar(51) NOT NULL,
 "Spanishproductcategoryname"  varchar(60) NOT NULL,
 "Frenchproductcategoryname"   varchar(50) NOT NULL,
 "New_Column"                  number(38,2) NOT NULL,
 CONSTRAINT "PK_Dimproductcategory" PRIMARY KEY ( "Productcategorykey" )
)
COMMENT = 'Product Category';


-- ************************************** "Edw"."Dimgeography"
CREATE TABLE IF NOT EXISTS "Edw"."Dimgeography"
(
 "Geographykey"             number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "City"                     varchar(30),
 "Stateprovincecode"        varchar(3),
 "Stateprovincename"        varchar(50),
 "Countryregioncode"        varchar(3),
 "Englishcountryregionname" varchar(50),
 "Spanishcountryregionname" varchar(50),
 "Frenchcountryregionname"  varchar(50),
 "Postalcode"               varchar(15),
 "Salesterritorykey"        number(38,0),
 "Ipaddresslocator"         varchar(15),
 CONSTRAINT "PK_Dimgeography" PRIMARY KEY ( "Geographykey" )
);


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
 "Operator"                      varchar(50),
 "Custommembers"                 varchar(300),
 "Valuetype"                     varchar(50),
 "Custommemberoptions"           varchar(200),
 CONSTRAINT "PK_Dimaccount" PRIMARY KEY ( "Accountkey" )
)
COMMENT = 'Holds all Account information';


-- ************************************** "Dim_Store"
CREATE TABLE IF NOT EXISTS "Dim_Store"
(
 "Store_Id"  integer NOT NULL,
 "Emp_Age_1" integer NOT NULL,
 "Emp_Age"   integer NOT NULL,
 CONSTRAINT "PK_685" PRIMARY KEY ( "Store_Id" )
)
COMMENT = 'store';


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


-- ************************************** "Dim_Currency"
CREATE TABLE IF NOT EXISTS "Dim_Currency"
(

)
COMMENT = 'fc rates from sap finance';


-- ************************************** "Csv_File_From_Tom"
CREATE TABLE IF NOT EXISTS "Csv_File_From_Tom"
(

);


-- ************************************** "Table_838"
CREATE TABLE IF NOT EXISTS "Table_838"
(
 "Store_Id" integer NOT NULL,
 CONSTRAINT "PK_847" PRIMARY KEY ( "Store_Id" ),
 CONSTRAINT "FK_839" FOREIGN KEY ( "Store_Id" ) REFERENCES "Dim_Store" ( "Store_Id" )
);


-- ************************************** "Table_765"
CREATE TABLE IF NOT EXISTS "Table_765"
(
 "My_Pk"  integer NOT NULL,
 "Par_Pk" varchar(50) NOT NULL,
 CONSTRAINT "PK_817" PRIMARY KEY ( "My_Pk", "Par_Pk" ),
 CONSTRAINT "FK_809" FOREIGN KEY ( "Par_Pk" ) REFERENCES "Table_808" ( "Par_Pk" )
);


-- ************************************** "Table_578"
CREATE TABLE IF NOT EXISTS "Table_578"
(
 "Datekey" number(38,0) NOT NULL,
 "Col_580"  NOT NULL,
 CONSTRAINT "PK_Table_578" PRIMARY KEY ( "Datekey", "Col_580" ),
 CONSTRAINT "FK_581" FOREIGN KEY ( "Datekey", "Col_580" ) REFERENCES "Edw"."Factcurr" ( "Datekey", "Col_580" )
);


-- ************************************** "Table_571"
CREATE TABLE IF NOT EXISTS "Table_571"
(
 "Endofdayrate_1" float NOT NULL,
 "New_Pk"          NOT NULL,
 "Endofdayrate"   float NOT NULL,
 "Averagerate"    float NOT NULL,
 "Datekey"        number(38,0) NOT NULL,
 "Col_580"         NOT NULL,
 CONSTRAINT "PK_Table_571" PRIMARY KEY ( "Endofdayrate_1", "New_Pk" ),
 CONSTRAINT "FK_586" FOREIGN KEY ( "Datekey", "Col_580" ) REFERENCES "Edw"."Factcurr" ( "Datekey", "Col_580" )
);


-- ************************************** "Edw"."Newfactcurrencyrate"
CREATE TABLE IF NOT EXISTS "Edw"."Newfactcurrencyrate"
(
 "Averagerate"  float,
 "Currencyid"   varchar(3),
 "Currencydate" date,
 "Endofdayrate" float,
 "Currencykey"  number(38,0),
 "Datekey"      number(38,0),
 CONSTRAINT "FK_Newfactcurrencyrate_469" FOREIGN KEY ( "Currencykey" ) REFERENCES "Edw"."Dimcurrency" ( "Currencykey" )
)
COMMENT = 'new fx table for curr conversion';


-- ************************************** "Edw"."Factsalesquota"
CREATE TABLE IF NOT EXISTS "Edw"."Factsalesquota"
(
 "Salesquotakey"    number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "Employeekey"      number(38,0) NOT NULL,
 "Datekey"          number(38,0) NOT NULL,
 "Calendaryear"     number(38,0) NOT NULL,
 "Calendarquarter"  number(38,0) NOT NULL,
 "Salesamountquota" number(38,0) NOT NULL,
 CONSTRAINT "FK_Factsalesquota_463" FOREIGN KEY ( "Datekey" ) REFERENCES "Dim_Date" ( "Datekey" )
);


-- ************************************** "Edw"."Factproductinventory"
CREATE TABLE IF NOT EXISTS "Edw"."Factproductinventory"
(
 "Productkey"   number(38,0) NOT NULL,
 "Datekey"      number(38,0) NOT NULL,
 "Movementdate" date NOT NULL,
 "Unitcost"     number(38,0) NOT NULL,
 "Unitsin"      number(38,0) NOT NULL,
 "Unitsout"     number(38,0) NOT NULL,
 "Unitsbalance" number(38,0) NOT NULL,
 CONSTRAINT "FK_Factproductinventory_443" FOREIGN KEY ( "Datekey" ) REFERENCES "Dim_Date" ( "Datekey" )
);


-- ************************************** "Edw"."Factcurrencyrate"
CREATE TABLE IF NOT EXISTS "Edw"."Factcurrencyrate"
(
 "Currencykey"  number(38,0) NOT NULL,
 "Datekey"      number(38,0) NOT NULL,
 "Averagerate"  float NOT NULL,
 "Endofdayrate" float NOT NULL,
 CONSTRAINT "FK_Factcurrencyrate_413" FOREIGN KEY ( "Currencykey" ) REFERENCES "Edw"."Dimcurrency" ( "Currencykey" )
);


-- ************************************** "Edw"."Dimproductsubcategory"
CREATE TABLE IF NOT EXISTS "Edw"."Dimproductsubcategory"
(
 "Productsubcategorykey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "Productsubcategoryalternatekey" number(38,0),
 "Englishproductsubcategoryname"  varchar(60) NOT NULL DEFAULT Standard,
 "Spanishproductsubcategoryname"  varchar(50) NOT NULL,
 "Frenchproductsubcategoryname"   varchar(50) NOT NULL,
 "Productcategorykey"             number(38,0) NOT NULL,
 CONSTRAINT "PK_Dimproductsubcategory" PRIMARY KEY ( "Productsubcategorykey", "Productcategorykey" ),
 CONSTRAINT "FK_Dimproductsubcategory_409" FOREIGN KEY ( "Productcategorykey" ) REFERENCES "Edw"."Dimproductcategory" ( "Productcategorykey" )
)
COMMENT = 'Product Subcategory';


-- ************************************** "Edw"."Dimorganization"
CREATE TABLE IF NOT EXISTS "Edw"."Dimorganization"
(
 "Organizationkey"       number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "Parentorganizationkey" number(38,0) NOT NULL COMMENT 'org key from master hierarchy',
 "Parent_Pk"             varchar(50) NOT NULL,
 "Percentageofownership" varchar(16),
 "Organizationname"      varchar(50),
 "Currencykey"           number(38,0),
 CONSTRAINT "PK_Dimorganization" PRIMARY KEY ( "Organizationkey", "Parentorganizationkey", "Parent_Pk" ),
 CONSTRAINT "FK_524" FOREIGN KEY ( "Parent_Pk" ) REFERENCES "Table_524" ( "Parent_Pk" )
)
COMMENT = 'Dimension for Organizational Data';


-- ************************************** "Edw"."Dimdepartmentgroup"
CREATE TABLE IF NOT EXISTS "Edw"."Dimdepartmentgroup"
(
 "Parentdepartmentgroupkey" number(38,0),
 "Accountkey"               number(38,0) NOT NULL COMMENT 'Unique Identifier of the Account data',
 "Departmentgroupname"      varchar(50),
 "Departmentgroupkey"       number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 CONSTRAINT "PK_Dimdepartmentgroup" PRIMARY KEY ( "Departmentgroupkey" ),
 CONSTRAINT "FK_673" FOREIGN KEY ( "Accountkey" ) REFERENCES "Edw"."Dimaccount" ( "Accountkey" )
)
COMMENT = 'Dimension for Department groups';


-- ************************************** "Edw"."Dimcurr"
CREATE TABLE IF NOT EXISTS "Edw"."Dimcurr"
(
 "Currencykey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Currency Identifier',
 "Currencyalternatekey" varchar(3) NOT NULL COMMENT 'Alternate Currency Identifier',
 "Currencyname"         varchar(50) NOT NULL COMMENT 'Name of the Currency',
 CONSTRAINT "PK_Dimcurrency_Copy" PRIMARY KEY ( "Currencykey" )
)
COMMENT = 'Dimension for Currency Data';


-- ************************************** "Edw"."Dim_Promotion"
CREATE TABLE IF NOT EXISTS "Edw"."Dim_Promotion"
(
 "Promotionalternatekey"    number(38,0) COMMENT 'hash of promo full pk',
 "Englishpromotionname"     varchar(255) COMMENT 'promo name',
 "Spanishpromotionname"     varchar(255),
 "Frenchpromotionname"      varchar(255),
 "Discountpct"              float COMMENT 'percentage discount applied',
 "Englishpromotiontype"     varchar(50) COMMENT 'checked with sales team',
 "Spanishpromotiontype"     varchar(50),
 "Frenchpromotiontype"      varchar(50),
 "Englishpromotioncategory" varchar(50),
 "Spanishpromotioncategory" varchar(50),
 "Frenchpromotioncategory"  varchar(50),
 "Minqty"                   number(38,0) COMMENT 'min quantity applicable if gt 1',
 "Maxqty"                   number(38,0) COMMENT 'max quantity applicable',
 "Store_Id"                 integer NOT NULL COMMENT 'store id where the promo ran',
 "Datekey"                  number(38,0) NOT NULL COMMENT 'date when the promo ran',
 "Promotionkey"             number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 CONSTRAINT "PK_845" PRIMARY KEY ( "Promotionkey" ),
 CONSTRAINT "FK_693" FOREIGN KEY ( "Store_Id" ) REFERENCES "Dim_Store" ( "Store_Id" ),
 CONSTRAINT "FK_698" FOREIGN KEY ( "Datekey" ) REFERENCES "Dim_Date" ( "Datekey" )
)
COMMENT = 'promo for store';


-- ************************************** "Edw"."Dim_Employee"
CREATE TABLE IF NOT EXISTS "Edw"."Dim_Employee"
(
 "Store_Id"                             integer NOT NULL,
 "Employeenationalidalternatekey"       varchar(15),
 "Parentemployeenationalidalternatekey" varchar(15) COMMENT 'I know what this is',
 "Firstname"                            varchar(50) NOT NULL COMMENT 'First name of employee',
 "Lastname"                             varchar(50) NOT NULL,
 "Middlename"                           varchar(50),
 "Namestyle"                            number(38,0) NOT NULL,
 "Title"                                varchar(50),
 "Hiredate"                             date,
 "Birthdate"                            date,
 "Loginid"                              varchar(256),
 "Emailaddress"                         varchar(50),
 "Phone"                                varchar(25),
 "Maritalstatus"                        varchar(1),
 "Emergencycontactname"                 varchar(50),
 "Emergencycontactphone"                varchar(25),
 "Salariedflag"                         number(38,0),
 "Gender"                               varchar(1),
 "Payfrequency"                         number(38,0),
 "Baserate"                             number(38,0),
 "Vacationhours"                        number(38,0),
 "Sickleavehours"                       number(38,0),
 "Currentflag"                          number(38,0) NOT NULL COMMENT 'is latest version',
 "Salespersonflag"                      number(38,0) NOT NULL,
 "Departmentname"                       varchar(50),
 "Startdate"                            date,
 "Enddate"                              date,
 "Status"                               varchar(50),
 "Employeekey"                          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 CONSTRAINT "PK_844" PRIMARY KEY ( "Employeekey" ),
 CONSTRAINT "FK_689" FOREIGN KEY ( "Store_Id" ) REFERENCES "Dim_Store" ( "Store_Id" )
)
COMMENT = 'This table holds all Employee Information';


-- ************************************** "Dim_Customer"
CREATE TABLE IF NOT EXISTS "Dim_Customer"
(
 "Customerkey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Customer Identifier',
 "Geographykey"         number(38,0) COMMENT 'Geographic informatio',
 "Customeralternatekey" varchar(15) NOT NULL COMMENT 'Alternate Key',
 "Title"                varchar(8) COMMENT 'Title of the Customer',
 "Firstname"            varchar(50) COMMENT 'multi comment',
 "Middlename"           varchar(50),
 "Lastname"             varchar(50) COMMENT 'salesforce asdfasdf',
 "Namestyle"            varchar(5) COMMENT 'short or long name',
 "Birthdate"            date COMMENT 'happy birthday!',
 "Maritalstatus"        varchar(1) COMMENT 'S or M',
 "Suffix"               varchar(10),
 "Gender"               varchar(1),
 "Emailaddress"         varchar(50),
 "Yearlyincome"         number(38,0),
 "Totalchildren"        number(38,0),
 "Numberchildrenathome" number(38,0),
 "Englisheducation"     varchar(40),
 "Spanisheducation"     varchar(40),
 "Frencheducation"      varchar(40),
 "Englishoccupation"    varchar(100),
 "Spanishoccupation"    varchar(100),
 "Frenchoccupation"     varchar(100),
 "Houseownerflag"       varchar(1),
 "Numbercarsowned"      number(38,0),
 "Addressline"          varchar(120),
 "Addressline_2"        varchar(120),
 "Phone"                varchar(20),
 "Datefirstpurchase"    date,
 "Commutedistance"      varchar(15),
 CONSTRAINT "PK_Dimcustomer" PRIMARY KEY ( "Customerkey" ),
 CONSTRAINT "FK_Dimcustomer_401" FOREIGN KEY ( "Geographykey" ) REFERENCES "Edw"."Dimgeography" ( "Geographykey" )
)
COMMENT = 'Dimension for Customer Data';


-- ************************************** "Table_593"
CREATE TABLE IF NOT EXISTS "Table_593"
(
 "Datekey" number(38,0) NOT NULL,
 "Col_580"  NOT NULL,
 CONSTRAINT "FK_594" FOREIGN KEY ( "Datekey", "Col_580" ) REFERENCES "Table_578" ( "Datekey", "Col_580" )
);


-- ************************************** "Table_517"
CREATE TABLE IF NOT EXISTS "Table_517"
(
 "Organizationkey"       number(38,0) NOT NULL,
 "Parentorganizationkey" number(38,0) NOT NULL,
 "Parent_Pk"             varchar(50) NOT NULL,
 "Countryregioncode"     varchar(3),
 CONSTRAINT "PK_Table_517" PRIMARY KEY ( "Organizationkey", "Parentorganizationkey", "Parent_Pk" ),
 CONSTRAINT "FK_517" FOREIGN KEY ( "Organizationkey", "Parentorganizationkey", "Parent_Pk" ) REFERENCES "Edw"."Dimorganization" ( "Organizationkey", "Parentorganizationkey", "Parent_Pk" )
);


-- ************************************** "Edw"."Factfinance"
CREATE TABLE IF NOT EXISTS "Edw"."Factfinance"
(
 "Financekey"            number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "Datekey"               number(38,0) NOT NULL,
 "Organizationkey"       number(38,0) NOT NULL,
 "Departmentgroupkey"    number(38,0) NOT NULL,
 "Scenariokey"           number(38,0) NOT NULL,
 "Accountkey"            number(38,0) NOT NULL,
 "Amount"                float NOT NULL,
 "Parentorganizationkey" number(38,0) NOT NULL,
 "Parent_Pk"             varchar(50) NOT NULL,
 "New_Col"               varchar(80) NOT NULL,
 "new_col2"               NOT NULL,
 CONSTRAINT "FK_Factfinance_419" FOREIGN KEY ( "Organizationkey", "Parentorganizationkey", "Parent_Pk" ) REFERENCES "Edw"."Dimorganization" ( "Organizationkey", "Parentorganizationkey", "Parent_Pk" ),
 CONSTRAINT "FK_Factfinance_421" FOREIGN KEY ( "Departmentgroupkey" ) REFERENCES "Edw"."Dimdepartmentgroup" ( "Departmentgroupkey" )
)
COMMENT = 'Facts for Finance';


-- ************************************** "Edw"."Factcurrhist"
CREATE TABLE IF NOT EXISTS "Edw"."Factcurrhist"
(
 "Currencykey"  number(38,0),
 "Datekey_1"    number(38,0) NOT NULL,
 "Averagerate"  float COMMENT 'this is avg rate by date',
 "Currencyid"   varchar(3),
 "Currencydate" date COMMENT 'some comment',
 "Endofdayrate" float,
 "Currencyname" varchar(50) NOT NULL COMMENT 'Name of the Currency',
 "Datekey"      number(38,0),
 "Col_580"       NOT NULL,
 CONSTRAINT "AK_487" UNIQUE ( "Averagerate", "Currencydate", "Currencyid" ),
 CONSTRAINT "FK_450" FOREIGN KEY ( "Datekey_1", "Col_580" ) REFERENCES "Edw"."Factcurr" ( "Datekey", "Col_580" ),
 CONSTRAINT "FK_Newfactcurrencyrate_469_Copy" FOREIGN KEY ( "Currencykey" ) REFERENCES "Edw"."Dimcurr" ( "Currencykey" )
);


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
 CONSTRAINT "PK_Dimproduct" PRIMARY KEY ( "Productkey" ),
 CONSTRAINT "FK_Dimproduct_407" FOREIGN KEY ( "Productsubcategorykey", "Productcategorykey" ) REFERENCES "Edw"."Dimproductsubcategory" ( "Productsubcategorykey", "Productcategorykey" )
)
COMMENT = 'Product Master Data';


-- ************************************** "Fct_Retail_Sales"
CREATE TABLE IF NOT EXISTS "Fct_Retail_Sales"
(
 "Customerkey"  number(38,0) NOT NULL COMMENT 'Customer Identifier',
 "Productkey"   number(38,0) NOT NULL COMMENT 'unique product id',
 "Employeekey"  number(38,0) NOT NULL,
 "Store_Id"     integer NOT NULL,
 "Promotionkey" number(38,0) NOT NULL,
 "Datekey"      number(38,0) NOT NULL COMMENT 'test comment sg',
 "Emp_Age_1"    integer NOT NULL,
 CONSTRAINT "PK_849" PRIMARY KEY ( "Customerkey", "Productkey", "Employeekey", "Store_Id", "Promotionkey", "Datekey", "Emp_Age_1" ),
 CONSTRAINT "FK_711" FOREIGN KEY ( "Customerkey" ) REFERENCES "Dim_Customer" ( "Customerkey" ),
 CONSTRAINT "FK_714" FOREIGN KEY ( "Datekey" ) REFERENCES "Dim_Date" ( "Datekey" ),
 CONSTRAINT "FK_717" FOREIGN KEY ( "Promotionkey" ) REFERENCES "Edw"."Dim_Promotion" ( "Promotionkey" ),
 CONSTRAINT "FK_720" FOREIGN KEY ( "Store_Id", "Emp_Age_1" ) REFERENCES "Dim_Store" ( "Store_Id", "Emp_Age_1" ),
 CONSTRAINT "FK_723" FOREIGN KEY ( "Employeekey" ) REFERENCES "Edw"."Dim_Employee" ( "Employeekey" ),
 CONSTRAINT "FK_726" FOREIGN KEY ( "Productkey" ) REFERENCES "Dim_Product" ( "Productkey" )
);


-- ************************************** "Edw"."Factresellersales"
CREATE TABLE IF NOT EXISTS "Edw"."Factresellersales"
(
 "Productkey"            number(38,0) NOT NULL,
 "Orderdatekey"          number(38,0) NOT NULL,
 "Duedatekey"            number(38,0) NOT NULL,
 "Shipdatekey"           number(38,0) NOT NULL,
 "Resellerkey"           number(38,0) NOT NULL,
 "Employeekey"           number(38,0) NOT NULL,
 "Promotionkey"          number(38,0) NOT NULL,
 "Currencykey"           number(38,0) NOT NULL,
 "Salesordernumber"      varchar(20),
 "Salesorderlinenumber"  number(38,0) NOT NULL,
 "Revisionnumber"        number(38,0),
 "Orderquantity"         number(38,0),
 "Unitprice"             number(38,0),
 "Extendedamount"        number(38,0),
 "Unitpricediscountpct"  float,
 "Discountamount"        float,
 "Productstandardcost"   number(38,0),
 "Totalproductcost"      number(38,0),
 "Salesamount"           number(38,0),
 "Taxamt"                number(38,0),
 "Freight"               number(38,0),
 "Carriertrackingnumber" varchar(25),
 "Customerponumber"      varchar(25),
 CONSTRAINT "FK_Factresellersales_445" FOREIGN KEY ( "Productkey" ) REFERENCES "Dim_Product" ( "Productkey" ),
 CONSTRAINT "FK_Factresellersales_447" FOREIGN KEY ( "Resellerkey" ) REFERENCES "Edw"."Dimreseller" ( "Resellerkey" ),
 CONSTRAINT "FK_Factresellersales_449" FOREIGN KEY ( "Employeekey" ) REFERENCES "Edw"."Dim_Employee" ( "Employeekey" ),
 CONSTRAINT "FK_Factresellersales_451" FOREIGN KEY ( "Promotionkey" ) REFERENCES "Edw"."Dim_Promotion" ( "Promotionkey" ),
 CONSTRAINT "FK_Factresellersales_453" FOREIGN KEY ( "Currencykey" ) REFERENCES "Edw"."Dimcurrency" ( "Currencykey" ),
 CONSTRAINT "FK_Factresellersales_457" FOREIGN KEY ( "Orderdatekey" ) REFERENCES "Dim_Date" ( "Datekey" ),
 CONSTRAINT "FK_Factresellersales_459" FOREIGN KEY ( "Duedatekey" ) REFERENCES "Dim_Date" ( "Datekey" ),
 CONSTRAINT "FK_Factresellersales_461" FOREIGN KEY ( "Shipdatekey" ) REFERENCES "Dim_Date" ( "Datekey" )
)
COMMENT = 'Fact data of Reseller Sales';


-- ************************************** "Edw"."Dimsalesterritory_Clone"
CREATE TABLE IF NOT EXISTS "Edw"."Dimsalesterritory_Clone"
(
 "Salesterritorykey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "Salesterritoryalternatekey" number(38,0),
 "Salesterritoryregion"       varchar(50) NOT NULL,
 "Salesterritorycountry"      varchar(50) NOT NULL,
 "Productstandardcost"        number(38,0),
 "Taxamt"                     number(38,0),
 "Salesterritorygroup"        varchar(50),
 "Upper_Col"                  varchar(49) NOT NULL,
 CONSTRAINT "PK_Dimsalesterritory_Clone" PRIMARY KEY ( "Salesterritorykey" )
)
COMMENT = 'Sales Territory data';


-- ************************************** "Edw"."Dimsalesterritory"
CREATE TABLE IF NOT EXISTS "Edw"."Dimsalesterritory"
(
 "Salesterritorykey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "Salesterritoryalternatekey" number(38,0),
 "Salesterritoryregion"       varchar(50) NOT NULL,
 "Salesterritorycountry"      varchar(50) NOT NULL,
 "Salesterritorygroup"        varchar(50),
 "Upper_Col"                  varchar(49) NOT NULL,
 CONSTRAINT "PK_Dimsalesterritory" PRIMARY KEY ( "Salesterritorykey" )
)
COMMENT = 'Sales Territory data';


-- ************************************** "Table_504"
CREATE TRANSIENT TABLE IF NOT EXISTS "Table_504"
(
 "Salesterritorykey" number(38,0) NOT NULL,
 CONSTRAINT "PK_Table_504" PRIMARY KEY ( "Salesterritorykey" ),
 CONSTRAINT "FK_504" FOREIGN KEY ( "Salesterritorykey" ) REFERENCES "Edw"."Dimsalesterritory" ( "Salesterritorykey" )
);


-- ************************************** "Edw"."Factinternetsales"
CREATE TABLE IF NOT EXISTS "Edw"."Factinternetsales"
(
 "Productkey"            number(38,0) NOT NULL,
 "Orderdatekey"          number(38,0) NOT NULL,
 "Duedatekey"            number(38,0) NOT NULL,
 "Shipdatekey"           number(38,0) NOT NULL,
 "Customerkey"           number(38,0) NOT NULL,
 "Promotionkey"          number(38,0) NOT NULL,
 "Currencykey"           number(38,0) NOT NULL,
 "Salesterritorykey"     number(38,0) NOT NULL,
 "Salesorderlinenumber"  number(38,0) NOT NULL,
 "Revisionnumber"        number(38,0) NOT NULL,
 "Orderquantity"         number(38,0) NOT NULL,
 "Unitprice"             number(38,0) NOT NULL,
 "Extendedamount"        number(38,0) NOT NULL,
 "Unitpricediscountpct"  float NOT NULL,
 "Discountamount"        float NOT NULL,
 "Productstandardcost"   number(38,0) NOT NULL,
 "Totalproductcost"      number(38,0) NOT NULL,
 "Salesamount"           number(38,0) NOT NULL,
 "Taxamt"                number(38,0) NOT NULL,
 "Freight"               number(38,0) NOT NULL,
 "Carriertrackingnumber" varchar(25),
 "Customerponumber"      varchar(25),
 "New_Int_Col"           integer NOT NULL,
 CONSTRAINT "FK_Factinternetsales_427" FOREIGN KEY ( "Productkey" ) REFERENCES "Dim_Product" ( "Productkey" ),
 CONSTRAINT "FK_Factinternetsales_429" FOREIGN KEY ( "Customerkey" ) REFERENCES "Dim_Customer" ( "Customerkey" ),
 CONSTRAINT "FK_Factinternetsales_431" FOREIGN KEY ( "Promotionkey" ) REFERENCES "Edw"."Dim_Promotion" ( "Promotionkey" ),
 CONSTRAINT "FK_Factinternetsales_433" FOREIGN KEY ( "Currencykey" ) REFERENCES "Edw"."Dimcurrency" ( "Currencykey" ),
 CONSTRAINT "FK_Factinternetsales_435" FOREIGN KEY ( "Salesterritorykey" ) REFERENCES "Edw"."Dimsalesterritory" ( "Salesterritorykey" ),
 CONSTRAINT "FK_Factinternetsales_437" FOREIGN KEY ( "Orderdatekey" ) REFERENCES "Dim_Date" ( "Datekey" ),
 CONSTRAINT "FK_Factinternetsales_439" FOREIGN KEY ( "Duedatekey" ) REFERENCES "Dim_Date" ( "Datekey" ),
 CONSTRAINT "FK_Factinternetsales_441" FOREIGN KEY ( "Shipdatekey" ) REFERENCES "Dim_Date" ( "Datekey" )
)
COMMENT = 'Fact table to hold Currency Data';


