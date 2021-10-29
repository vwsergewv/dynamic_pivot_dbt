-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

ALTER TABLE "Edw"."Dimreseller"
    DROP CONSTRAINT "PK_Dimreseller";

ALTER SCHEMA "Edw"
    SET COMMENT = 'schema for enterprise DW';

DROP SCHEMA "Adventureworksdw_Edw";

ALTER TABLE "Edw"."Dimaccount"
    ALTER COLUMN "Operator" COMMENT 'call center operator';

ALTER TABLE "Edw"."Dimreseller"
    ADD COLUMN "New_Pk"  NOT NULL;

ALTER TABLE "Fct_Retail_Sales"
    ADD COLUMN "Col_866"  NOT NULL;

ALTER TABLE "Edw"."Dimreseller"
    ADD CONSTRAINT "PK_878" PRIMARY KEY ("Resellerkey");

CREATE TABLE "Table_872"
(
 "New_Pk"  NOT NULL,
 CONSTRAINT "PK_875" PRIMARY KEY ( "New_Pk" )
);

CREATE TABLE "Table_868_Copy_1"
(
 "Resellerkey"   number(38,0) NOT NULL,
 "Addressline_1" varchar(60),
 "Addressline_2" varchar(60),
 "New_Col"       varchar(50) NOT NULL
);

CREATE TABLE "Dim_Store_2"
(

);

CREATE TABLE "Dim_Employee_1"
(

)
COMMENT = 'this will be emp dim';

CREATE TABLE "Table_868"
(
 "Resellerkey"   number(38,0) NOT NULL,
 "Addressline_1" varchar(60),
 "Addressline_2" varchar(60),
 CONSTRAINT "FK_869" FOREIGN KEY ( "Resellerkey" ) REFERENCES "Edw"."Dimreseller" ( "Resellerkey" )
);

ALTER TABLE "Edw"."Dimreseller"
    ADD CONSTRAINT "fkIdx_876" FOREIGN KEY ("New_Pk") REFERENCES "Table_872" ("New_Pk");