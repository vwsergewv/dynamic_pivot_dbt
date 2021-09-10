-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

ALTER TABLE "edw"."dimaccount"
    ALTER COLUMN "accounttype" COMMENT 'classification of account by finance';

ALTER TABLE "edw"."factinternetsales"
    DROP COLUMN "salesordernumber";

CREATE TABLE "table_598"
(

);

CREATE TABLE "table_593"
(
 "datekey" number(38,0) NOT NULL,
 "col_580"  NOT NULL,
 CONSTRAINT "FK_594" FOREIGN KEY ( "datekey", "col_580" ) REFERENCES "table_578" ( "datekey", "col_580" )
);