-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

ALTER TABLE "Table544Copy11"
    DROP CONSTRAINT "FkFactInternetSalesCopy11Table544Copy11547";

ALTER TABLE "Edw"."FactInternetSalesCopy11"
    DROP CONSTRAINT "PK_Pk543";

ALTER TABLE "Edw"."DimEmployee"
    ALTER COLUMN "EmailAddress" COMMENT 'company email';

ALTER TABLE "Edw"."DimReseller"
    ALTER COLUMN "NumberEmployees" COMMENT 'total emps in reseller location';

ALTER TABLE "Edw"."FactCurrencyRate"
    ADD COLUMN "NewCol" integer NOT NULL;

-- Attention! Cannot change column data type.

ALTER TABLE "Edw"."FactInternetSales"
    ALTER COLUMN "NewPk" SET DATA TYPE integer;

-- Attention! Cannot change column data type.

ALTER TABLE "Edw"."FactInternetSales"
    ALTER COLUMN "NewPk" SET DATA TYPE varchar;

ALTER TABLE "Table544Copy11"
    DROP COLUMN "NewCol";

ALTER TABLE "Edw1"."NewTbl"
    ADD COLUMN "NewCol" integer NOT NULL;

ALTER TABLE "Edw"."FactInternetSalesCopy11"
    ADD CONSTRAINT "PK_1448" PRIMARY KEY ("NewCol");

CREATE TABLE "Table1464"
(
 "EtlId"       date NOT NULL,
 "EtlFilename" varchar NOT NULL COMMENT 'source file or table from where the target is loaded'
);

CREATE TABLE "Edw1"."NewTblCopy1"
(
 "EtlId"       date NOT NULL, 
 "EtlFilename" varchar NOT NULL COMMENT 'source file or table from where the target is loaded' 
);