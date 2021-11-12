-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

-- ************************************** "Edw"."Dimcurrency"
CREATE TABLE IF NOT EXISTS "Edw"."Dimcurrency"
(
 "Currencykey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Currency Identifier',
 "Currencyalternatekey" varchar(3) NOT NULL COMMENT 'Alternate Currency Identifier',
 "Currencyname"         varchar(50) NOT NULL COMMENT 'Name of the Currency',
 CONSTRAINT "PK_Dimcurrency" PRIMARY KEY ( "Currencykey" )
)
COMMENT = 'Dimension for Currency Data';


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


