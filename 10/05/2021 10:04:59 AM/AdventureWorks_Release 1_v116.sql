-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

-- ************************************** "Dim_Store"
CREATE TABLE IF NOT EXISTS "Dim_Store"
(
 "Store_Id" integer NOT NULL,
 CONSTRAINT "PK_685" PRIMARY KEY ( "Store_Id" )
)
COMMENT = 'store';


