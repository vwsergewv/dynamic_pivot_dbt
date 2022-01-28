-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

ALTER TABLE IF EXISTS "Table1654"
    DROP CONSTRAINT "Fk1659";

ALTER TABLE IF EXISTS "Table1716"
    DROP CONSTRAINT "Fk1721";

ALTER TABLE IF EXISTS "DimEmployee"
    DROP CONSTRAINT "PK_DimEmployee_EmpId_1715";

DROP TABLE IF EXISTS "Table1564";

DROP TABLE IF EXISTS "Table1558";

DROP TABLE IF EXISTS "TableBadName";

DROP TABLE IF EXISTS "Table1604";

DROP TABLE IF EXISTS "Table1555";

DROP TABLE IF EXISTS "Table1550";

DROP TABLE IF EXISTS "Table1547";

DROP TABLE IF EXISTS "Table1464";

DROP TABLE IF EXISTS "Edw1"."NewTblCopy1Copy1";

DROP FILE FORMAT IF EXISTS "FileFormatAdventureworksdwEdwFileformat431";

CREATE SCHEMA IF NOT EXISTS "Hotelbnb";

ALTER TABLE IF EXISTS "Edw"."DimDepartmentGroup"
    ALTER COLUMN "ParentDepartmentGroupKey" SET NOT NULL;

ALTER TABLE IF EXISTS "Edw"."DimDepartmentGroup"
    ALTER COLUMN "DepartmentGroupName" SET NOT NULL;

ALTER TABLE IF EXISTS "Edw"."DimEmployee"
    ALTER COLUMN "CurrentFlag" COMMENT 'is this emp active';

ALTER TABLE IF EXISTS "Edw"."DimOrganization"
    ALTER COLUMN "ParentOrganizationKey" COMMENT 'parent org';

ALTER TABLE IF EXISTS "Edw"."DimProduct"
    ADD COLUMN "NewCol" varchar(50) NOT NULL;

ALTER TABLE IF EXISTS "Edw"."DimProductSubcategory"
    ALTER COLUMN "ProductSubcategoryKey" COMMENT 'key of subcat';

ALTER TABLE IF EXISTS "Edw"."DimPromotion"
    ADD COLUMN "NewCol" varchar(50) NOT NULL;

-- Attention! Cannot change column data type.

ALTER TABLE IF EXISTS "Edw"."FactInternetSales"
    ALTER COLUMN "NewPk" SET DATA TYPE integer;

-- Attention! Cannot change column data type.

ALTER TABLE IF EXISTS "Edw"."FactInternetSales"
    ALTER COLUMN "NewPk" SET DATA TYPE varchar;

ALTER TABLE IF EXISTS "Edw"."FactInternetSales"
    ADD COLUMN "NewCol_1" bigint NOT NULL;

ALTER TABLE IF EXISTS "Edw"."FactInternetSales"
    ADD COLUMN "Col1747" bigint NOT NULL;

ALTER TABLE IF EXISTS "Edw"."FactProductInventory"
    ALTER COLUMN "DateKey" COMMENT 'data hash md5';

ALTER TABLE IF EXISTS "Test"
    ALTER COLUMN "EtlId" COMMENT 'hello';

ALTER TABLE IF EXISTS "DimStore"
    ADD COLUMN "NewCol" varchar(50) NOT NULL;

ALTER TABLE IF EXISTS "DimStore"
    ADD COLUMN "C"  NOT NULL;

ALTER TABLE IF EXISTS "Table719"
    ALTER COLUMN "EtlId" COMMENT 'hello';

ALTER TABLE IF EXISTS "Edw1"."NewTbl"
    ALTER COLUMN "EtlId" COMMENT 'hello';

ALTER TABLE IF EXISTS "Edw1"."NewTbl"
    ADD COLUMN "Lowercase"  NOT NULL;

ALTER TABLE IF EXISTS "Edw1"."NewTblCopy1"
    ALTER COLUMN "EtlId" COMMENT 'hello';

ALTER TABLE IF EXISTS "DimStore"
    DROP COLUMN "EtlId";

ALTER TABLE IF EXISTS "DimStore"
    DROP COLUMN "EtlFilename";

ALTER TABLE IF EXISTS "DimStore"
    ADD COLUMN "StoreId" integer NOT NULL;

ALTER TABLE IF EXISTS "DimStore"
    ADD COLUMN "Address" string NOT NULL;

ALTER TABLE IF EXISTS "DimStore"
    ADD COLUMN "SizeCategory" varchar(1) NOT NULL;

ALTER TABLE IF EXISTS "DimStore"
    ADD COLUMN "ParentPk" varchar(50) NOT NULL;

ALTER TABLE IF EXISTS "DimStore"
    ADD COLUMN "NewCol" varchar(50) NOT NULL;

ALTER TABLE IF EXISTS "DimStore"
    ADD COLUMN "C"  NOT NULL;

ALTER TABLE IF EXISTS "DimEmployee"
    ALTER COLUMN "EtlId" COMMENT 'hello';

ALTER TABLE IF EXISTS "Table1654"
    ALTER COLUMN "EtlId" COMMENT 'hello';

ALTER TABLE IF EXISTS "Table1654"
    DROP COLUMN "IntPk";

ALTER TABLE IF EXISTS "Table1660"
    ALTER COLUMN "EtlId" COMMENT 'hello';

ALTER TABLE IF EXISTS "Table1678"
    ALTER COLUMN "EtlId" COMMENT 'hello';

ALTER TABLE IF EXISTS "Table1699"
    ALTER COLUMN "EtlId" COMMENT 'hello';

ALTER TABLE IF EXISTS "DimEmployee"
    ALTER COLUMN "EtlId" COMMENT 'hello';

-- Attention! Table "DimEmployee" - column "EmpId": default constraint cannot be changed. Snowflake doesn't support this syntax.

-- Attention! Cannot change column data type.

ALTER TABLE IF EXISTS "DimEmployee"
    ALTER COLUMN "EmpId" SET DATA TYPE integer;

ALTER TABLE IF EXISTS "Table1716"
    ALTER COLUMN "EtlId" COMMENT 'hello';

ALTER TABLE IF EXISTS "Table1716"
    DROP COLUMN "EmpId";

ALTER TABLE IF EXISTS "Table1558Copy1"
    ALTER COLUMN "EtlId" COMMENT 'hello';

ALTER TABLE IF EXISTS "Edw"."DimDepartmentGroup"
    ADD CONSTRAINT "Ak1745" UNIQUE ("DepartmentGroupName", "ParentDepartmentGroupKey");

ALTER TABLE IF EXISTS "DimStore"
    ADD CONSTRAINT "PK_DimStore_StoreId_Pk853" PRIMARY KEY ("StoreId");

ALTER TABLE IF EXISTS "DimEmployee"
    ADD CONSTRAINT "PK_DimEmployee_EmpId_1600" PRIMARY KEY ("EmpId");

CREATE TABLE IF NOT EXISTS "Table1791"
(
 "EtlId"       date NOT NULL COMMENT 'hello', 
 "EtlFilename" varchar(50) NOT NULL COMMENT 'source file or table from where the target is loaded' 
);

CREATE TABLE IF NOT EXISTS "Table1765"
(
 "EtlId"       date NOT NULL,
 "EtlFilename" varchar(50) NOT NULL COMMENT 'source file or table from where the target is loaded'
);

CREATE TABLE IF NOT EXISTS "NewTable2"
(
 "EtlId"       date NOT NULL COMMENT 'hello', 
 "EtlFilename" varchar(50) NOT NULL COMMENT 'source file or table from where the target is loaded' 
);

CREATE TABLE IF NOT EXISTS "NewTable"
(
 "NewTablePk"  varchar(50) NOT NULL,
 "EtlId"       date NOT NULL COMMENT 'hello', 
 "EtlFilename" varchar(50) NOT NULL COMMENT 'source file or table from where the target is loaded', 
 CONSTRAINT "PK_NewTable_NewTablePk_1759" PRIMARY KEY ( "NewTablePk" )
);

CREATE TABLE IF NOT EXISTS "Hotelbnb"."Hotels"
(
 "CityCode" varchar(3),
 "HotelId"  number(38,0)
);

CREATE TABLE IF NOT EXISTS "Hotelbnb"."Bookings"
(
 "BookingId"    varchar(12),
 "HotelId"      number(38,0),
 "Rn"           number(38,0) COMMENT 'room nights',
 "CreationDate" varchar(10)
);

CREATE TABLE IF NOT EXISTS "Edw"."ChildDemo"
(
 "ScenarioKey" number(38,0) NOT NULL COMMENT 'Scenario Identifier',
 "CreatedBy"   varchar(50) NOT NULL,
 "CreatedDate" timestamp_ntz(9) NOT NULL,
 "UpdatedDate" timestamp_ntz(9) NOT NULL,
 "UpdatedBy"   varchar(50) NOT NULL,
 CONSTRAINT "PK_ChildDemo_ScenarioKey_Pk664" PRIMARY KEY ( "ScenarioKey" ),
 CONSTRAINT "Fk661" FOREIGN KEY ( "ScenarioKey" ) REFERENCES "Edw"."DimScenario" ( "ScenarioKey" )
);