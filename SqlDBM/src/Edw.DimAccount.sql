-- ************************** SqlDBM: Snowflake *************************
-- *** Generated by SqlDBM: AdWorks project, v458 by serge@sqldbm.com ***


-- ************************************** Edw.DimAccount
CREATE OR REPLACE TABLE Edw.DimAccount
(
 AccountKey                    number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Unique Identifier of the Account data',
 ParentAccountKey              number(38,0) COMMENT 'Identifier of parent Account',
 AccountCodeAlternateKey       number(38,0) COMMENT 'from legacy system',
 ParentAccountCodeAlternateKey number(38,0),
 AccountDescription            varchar(50) COMMENT 'new comment',
 AccountType                   varchar(50),
 Operator                      varchar(50),
 CustomMembers                 varchar(300),
 ValueType                     varchar(50),
 CustomMemberOptions           varchar(200),
 AccountAdmin                  varchar(50),
 CONSTRAINT PK_DimAccount_AccountKey_PkDimAccount PRIMARY KEY ( AccountKey )
)
COMMENT = 'Holds all Account information';
