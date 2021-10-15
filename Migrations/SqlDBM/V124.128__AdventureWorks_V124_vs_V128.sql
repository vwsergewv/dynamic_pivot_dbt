-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

ALTER TABLE "Dim_Customer"
    ALTER COLUMN "Birthdate" COMMENT 'happy birthday!';

ALTER TABLE "Dim_Customer"
    ALTER COLUMN "Maritalstatus" COMMENT 'S or M';

ALTER TABLE "Edw"."Factfinance"
    ADD COLUMN "new_col2"  NOT NULL;