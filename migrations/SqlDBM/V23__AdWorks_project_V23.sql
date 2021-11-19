-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

CREATE FILE FORMAT FileFormatAdventureworksdwEdwFileformat431
 TYPE = JSON;


-- ************************************** Edw.DimCurrency
CREATE TABLE Edw.DimCurrency
(
 CurrencyKey          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Currency Identifier',
 CurrencyAlternateKey varchar(3) NOT NULL COMMENT 'Alternate Currency Identifier',
 CurrencyName         varchar(50) NOT NULL COMMENT 'Name of the Currency',
 CONSTRAINT PkDimCurrency PRIMARY KEY ( CurrencyKey )
)
COMMENT = 'Dimension for Currency Data';


