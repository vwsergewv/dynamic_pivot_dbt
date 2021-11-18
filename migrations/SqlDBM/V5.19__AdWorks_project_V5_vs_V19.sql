-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

ALTER TABLE "Edw"."DimAccount"
    ALTER COLUMN "AccountCodeAlternateKey" COMMENT 'some info on alternate key';

ALTER TABLE "Edw"."DimAccount"
    ALTER COLUMN "AccountType" COMMENT 'Checking or savings';

ALTER TABLE "Edw"."DimCustomer"
    ALTER COLUMN "NameStyle" COMMENT 'First or last name';

ALTER TABLE "Edw"."DimDepartmentGroup"
    ALTER COLUMN "DepartmentGroupKey" COMMENT 'Org hierarchy from salesforce';

ALTER TABLE "Edw"."DimOrganization"
    ALTER COLUMN "OrganizationKey" COMMENT 'org key from HR , format xyz_nnnnn';

ALTER TABLE "Edw"."FactInternetSales"
    ALTER COLUMN "UnitPriceDiscountPct" DROP NOT NULL;

ALTER TABLE "Edw"."FactInternetSales"
    ADD COLUMN "NewCol" integer NOT NULL;

ALTER TABLE "Edw"."FactInternetSales"
    ADD COLUMN "NewPk" varchar NOT NULL;

ALTER TABLE "Edw"."FactInternetSales"
    ADD COLUMN "NewPk" integer NOT NULL;

ALTER TABLE "Edw"."FactInternetSales"
    ADD COLUMN "NewPk1" varchar NOT NULL;

ALTER TABLE "Edw"."FactInternetSales"
    ADD CONSTRAINT "PK_543" PRIMARY KEY ("NewCol");

CREATE TABLE "Test"
(
 "EtlId"       date NOT NULL, 
 "EtlFilename" varchar NOT NULL COMMENT 'source file or table from where the target is loaded' 
);

CREATE TABLE "Table719"
(
 "NewTablePk"  varchar NOT NULL,
 "EtlId"       date NOT NULL, 
 "EtlFilename" varchar NOT NULL COMMENT 'source file or table from where the target is loaded', 
 CONSTRAINT "PK_730" PRIMARY KEY ( "NewTablePk" )
);

CREATE TABLE "Table654"
(
 "EtlId"       date NOT NULL, 
 "EtlFilename" varchar NOT NULL COMMENT 'source file or table from where the target is loaded' 
);

CREATE TABLE "Table640"
(
 "NewPk" integer NOT NULL,
 CONSTRAINT "PK_643" PRIMARY KEY ( "NewPk" )
);

CREATE TABLE "Table548"
(
 "NewPk" varchar NOT NULL,
 CONSTRAINT "PK_551" PRIMARY KEY ( "NewPk" )
);

CREATE TABLE "NewTable"
(

);

CREATE TABLE "NewDimEmp"
(

);

CREATE TABLE "Edw"."FactInternetSalesCopy11"
(
 "ProductKey"            number(38,0) NOT NULL,
 "OrderDateKey"          number(38,0) NOT NULL,
 "DueDateKey"            number(38,0) NOT NULL,
 "ShipDateKey"           number(38,0) NOT NULL,
 "CustomerKey"           number(38,0) NOT NULL,
 "PromotionKey"          number(38,0) NOT NULL,
 "CurrencyKey"           number(38,0) NOT NULL,
 "SalesTerritoryKey"     number(38,0) NOT NULL,
 "SalesOrderNumber"      varchar(20) NOT NULL,
 "SalesOrderLineNumber"  number(38,0) NOT NULL,
 "RevisionNumber"        number(38,0) NOT NULL,
 "OrderQuantity"         number(38,0) NOT NULL,
 "UnitPrice"             number(38,0) NOT NULL,
 "ExtendedAmount"        number(38,0) NOT NULL,
 "UnitPriceDiscountPct"  float,
 "DiscountAmount"        float NOT NULL,
 "ProductStandardCost"   number(38,0) NOT NULL,
 "TotalProductCost"      number(38,0) NOT NULL,
 "SalesAmount"           number(38,0) NOT NULL,
 "TaxAmt"                number(38,0) NOT NULL,
 "Freight"               number(38,0) NOT NULL,
 "CarrierTrackingNumber" varchar(25),
 "CustomerPoNumber"      varchar(25),
 "NewPk"                 varchar NOT NULL,
 "NewCol"                integer NOT NULL,
 CONSTRAINT "PK_543" PRIMARY KEY ( "NewCol" )
)
COMMENT = 'Fact table to hold Currency Data';

CREATE TABLE "Edw"."FactInternetSalesCopy1"
(
 "ProductKey"            number(38,0) NOT NULL,
 "OrderDateKey"          number(38,0) NOT NULL,
 "DueDateKey"            number(38,0) NOT NULL,
 "ShipDateKey"           number(38,0) NOT NULL,
 "CustomerKey"           number(38,0) NOT NULL,
 "PromotionKey"          number(38,0) NOT NULL,
 "CurrencyKey"           number(38,0) NOT NULL,
 "SalesTerritoryKey"     number(38,0) NOT NULL,
 "SalesOrderNumber"      varchar(20) NOT NULL,
 "SalesOrderLineNumber"  number(38,0) NOT NULL,
 "RevisionNumber"        number(38,0) NOT NULL,
 "OrderQuantity"         number(38,0) NOT NULL,
 "UnitPrice"             number(38,0) NOT NULL,
 "ExtendedAmount"        number(38,0) NOT NULL,
 "UnitPriceDiscountPct"  float,
 "DiscountAmount"        float NOT NULL,
 "ProductStandardCost"   number(38,0) NOT NULL,
 "TotalProductCost"      number(38,0) NOT NULL,
 "SalesAmount"           number(38,0) NOT NULL,
 "TaxAmt"                number(38,0) NOT NULL,
 "Freight"               number(38,0) NOT NULL,
 "CarrierTrackingNumber" varchar(25),
 "CustomerPoNumber"      varchar(25),
 "NewPk"                 varchar NOT NULL,
 "NewCol"                integer NOT NULL,
 CONSTRAINT "PK_543" PRIMARY KEY ( "NewCol" )
)
COMMENT = 'Fact table to hold Currency Data';

CREATE TABLE "DimStore"
(

);

CREATE TABLE "Table544Copy11"
(
 "NewCol"                integer NOT NULL,
 "UnitPrice1"            number(38,0) NOT NULL,
 "ExtendedAmount1"       number(38,0) NOT NULL,
 "UnitPriceDiscountPct1" float,
 "SalesOrderNumber"      varchar(20) NOT NULL,
 "NewCol123"             date NOT NULL,
 CONSTRAINT "FK_545Copy11" FOREIGN KEY ( "NewCol" ) REFERENCES "Edw"."FactInternetSalesCopy11" ( "NewCol" )
);

CREATE TABLE "Table544Copy1"
(
 "NewCol"               integer NOT NULL,
 "SalesOrderNumber"     varchar(20) NOT NULL,
 "UnitPrice"            number(38,0) NOT NULL,
 "ExtendedAmount"       number(38,0) NOT NULL,
 "UnitPriceDiscountPct" float,
 CONSTRAINT "FK_545Copy1" FOREIGN KEY ( "NewCol" ) REFERENCES "Edw"."FactInternetSalesCopy1" ( "NewCol" )
);

CREATE TABLE "Edw"."FactInternetSalesCopy11Copy1"
(
 "ProductKey"            number(38,0) NOT NULL,
 "OrderDateKey"          number(38,0) NOT NULL,
 "DueDateKey"            number(38,0) NOT NULL,
 "ShipDateKey"           number(38,0) NOT NULL,
 "CustomerKey"           number(38,0) NOT NULL,
 "PromotionKey"          number(38,0) NOT NULL,
 "CurrencyKey"           number(38,0) NOT NULL,
 "SalesTerritoryKey"     number(38,0) NOT NULL,
 "SalesOrderNumber"      varchar(20) NOT NULL,
 "SalesOrderLineNumber"  number(38,0) NOT NULL,
 "RevisionNumber"        number(38,0) NOT NULL,
 "OrderQuantity"         number(38,0) NOT NULL,
 "UnitPrice"             number(38,0) NOT NULL,
 "ExtendedAmount"        number(38,0) NOT NULL,
 "UnitPriceDiscountPct"  float,
 "DiscountAmount"        float NOT NULL,
 "ProductStandardCost"   number(38,0) NOT NULL,
 "TotalProductCost"      number(38,0) NOT NULL,
 "SalesAmount"           number(38,0) NOT NULL,
 "TaxAmt"                number(38,0) NOT NULL,
 "Freight"               number(38,0) NOT NULL,
 "CarrierTrackingNumber" varchar(25),
 "CustomerPoNumber"      varchar(25),
 "NewPk"                 varchar NOT NULL,
 "NewTablePk"            varchar NOT NULL,
 "NewCol"                integer NOT NULL,
 CONSTRAINT "PK_543" PRIMARY KEY ( "NewCol" ),
 CONSTRAINT "FK_722" FOREIGN KEY ( "NewTablePk" ) REFERENCES "Table719" ( "NewTablePk" )
)
COMMENT = 'Fact table to hold Currency Data';

CREATE TABLE "Table723"
(
 "EtlId"       date NOT NULL, 
 "EtlFilename" varchar NOT NULL COMMENT 'source file or table from where the target is loaded', 
 "NewCol"      integer NOT NULL,
 CONSTRAINT "FK_726" FOREIGN KEY ( "NewCol" ) REFERENCES "Edw"."FactInternetSalesCopy11Copy1" ( "NewCol" )
);

CREATE TABLE "Table544Copy11Copy1"
(
 "NewCol"                integer NOT NULL,
 "SalesOrderNumber"      varchar(20) NOT NULL,
 "UnitPrice"             number(38,0) NOT NULL,
 "UnitPrice1"            number(38,0) NOT NULL,
 "ExtendedAmount1"       number(38,0) NOT NULL,
 "UnitPriceDiscountPct1" float,
 "ExtendedAmount"        number(38,0) NOT NULL,
 "UnitPriceDiscountPct"  float,
 "NewCol123"             date NOT NULL,
 CONSTRAINT "FK_545Copy11Copy1" FOREIGN KEY ( "NewCol" ) REFERENCES "Edw"."FactInternetSalesCopy11Copy1" ( "NewCol" )
);

CREATE TABLE "Table646"
(
 "SalesOrderLineNumber" number(38,0) NOT NULL,
 "RevisionNumber"       number(38,0) NOT NULL,
 "OrderQuantity"        number(38,0) NOT NULL,
 "NewCol"               integer NOT NULL,
 CONSTRAINT "PK_653" PRIMARY KEY ( "NewCol" ),
 CONSTRAINT "FK_647" FOREIGN KEY ( "NewCol" ) REFERENCES "Edw"."FactInternetSales" ( "NewCol" )
);

ALTER TABLE "Edw"."FactInternetSales"
    ADD CONSTRAINT "fkTable548_FactInternetSales_Fk552FactInternetSales552" FOREIGN KEY ("NewPk") REFERENCES "Table548" ("NewPk");

ALTER TABLE "Edw"."FactInternetSales"
    ADD CONSTRAINT "fkTable640_FactInternetSales_Fk644FactInternetSales644" FOREIGN KEY ("NewPk") REFERENCES "Table640" ("NewPk");