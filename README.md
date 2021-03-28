Dynamic pivots in SQL with dbt
--

See https://medium.com/ 

analysis:
--- 
```sql
-- provide column to pivot in pivot_column variable:         
{%- set columns_to_show = "species, super_power"  -%}
{%- set pivot_column = "date_trunc(quarter, month)" -%}
{%- set aggregate_column = "views" -%}
{%- set my_table = "DBT_SERGE.HERO_DTL_VIEWS" -%} 

{%- set my_query -%}
SELECT distinct {{pivot_column}}  FROM {{my_table}} ;
{%- endset -%}

{%- set results = run_query(my_query) -%} 

{%- if execute -%}
{%- set items = results.columns[0].values() -%}
{%- endif %}

SELECT {{columns_to_show}} ,
{%- for i in items %}
sum("{{i}}_views") AS "{{i}}_views"
{%- if not loop.last %} , {% endif -%}
{%- endfor %}
FROM (
        SELECT  {{columns_to_show}},  
        {%- for i in items %}
        CASE WHEN {{pivot_column}} = '{{i}}'  THEN {{aggregate_column}} ELSE 0 END AS "{{i}}_views"
        {%- if not loop.last %} , {% endif -%}
        {%- endfor %}
        FROM {{my_table}}   )
GROUP BY  {{columns_to_show}} 
```

define macro:
---
```sql
{% macro dynamic_pivot (columns_to_show, pivot_column, aggregate_column, my_table) %}


{%- set my_query -%}
SELECT distinct {{pivot_column}}  FROM {{my_table}} ;
{%- endset -%}

{%- set results = run_query(my_query) -%} 

{%- if execute -%}
{#- Return the first column -#}
{%- set items = results.columns[0].values() -%}
{%- else -%}
{%- set items = [] -%}
{%- endif %}



SELECT {{columns_to_show}} ,
{%- for i in items %}
sum("{{i}}_views") AS "{{i}}_views"
{%- if not loop.last %} , {% endif -%}
{%- endfor %}
FROM (
        SELECT  {{columns_to_show}},  
        {%- for i in items %}
        CASE WHEN {{pivot_column}} = '{{i}}'  THEN {{aggregate_column}} ELSE 0 END AS "{{i}}_views"
        {%- if not loop.last %} , {% endif -%}
        {%- endfor %}
        FROM {{my_table}}   )
GROUP BY  {{columns_to_show}} 
{% endmacro %}
```

use macro:
---
{{ dynamic_pivot ("name", "date_trunc(quarter, month)", "views", "DBT_SERGE.HERO_DTL_VIEWS") }}
```sql

```

Sample data hero_dtl_views:
---
```sql
create or replace table hero_dtl_views AS
select $1 name, $2::date month, $3 species, $4 super_power , $5 VIEWS
from ( VALUES
('Spider-Man', '2020-04-01', 'Mutant', 'TRUE', 210457),
('Spider-Man', '2020-08-01', 'Mutant', 'TRUE', 180055),
('Spider-Man', '2020-12-01', 'Mutant', 'TRUE', 229166),
('Spider-Man', '2020-01-01', 'Mutant', 'TRUE', 150171),
('Spider-Man', '2020-07-01', 'Mutant', 'TRUE', 164904),
('Spider-Man', '2020-10-01', 'Mutant', 'TRUE', 205147),
('Spider-Man', '2020-05-01', 'Mutant', 'TRUE', 191329),
('Spider-Man', '2020-06-01', 'Mutant', 'TRUE', 172506),
('Spider-Man', '2020-09-01', 'Mutant', 'TRUE', 175904),
('Spider-Man', '2020-11-01', 'Mutant', 'TRUE', 236432),
('Spider-Man', '2020-03-01', 'Mutant', 'TRUE', 157379),
('Spider-Man', '2020-02-01', 'Mutant', 'TRUE', 134859),
('Wonder Woman', '2020-10-01', 'Demigoddess', 'TRUE', 98388),
('Wonder Woman', '2020-11-01', 'Demigoddess', 'TRUE', 113600),
('Wonder Woman', '2020-06-01', 'Demigoddess', 'TRUE', 115926),
('Wonder Woman', '2020-02-01', 'Demigoddess', 'TRUE', 90333),
('Wonder Woman', '2020-12-01', 'Demigoddess', 'TRUE', 406326),
('Wonder Woman', '2020-07-01', 'Demigoddess', 'TRUE', 99840),
('Wonder Woman', '2020-08-01', 'Demigoddess', 'TRUE', 121413),
('Wonder Woman', '2020-05-01', 'Demigoddess', 'TRUE', 125235),
('Wonder Woman', '2020-04-01', 'Demigoddess', 'TRUE', 110816),
('Wonder Woman', '2020-03-01', 'Demigoddess', 'TRUE', 101583),
('Wonder Woman', '2020-09-01', 'Demigoddess', 'TRUE', 101168),
('Wonder Woman', '2020-01-01', 'Demigoddess', 'TRUE', 110806),
('Iron Man', '2020-11-01', 'Human', 'FALSE', 87757),
('Iron Man', '2020-08-01', 'Human', 'FALSE', 95862),
('Iron Man', '2020-04-01', 'Human', 'FALSE', 121403),
('Iron Man', '2020-03-01', 'Human', 'FALSE', 86143),
('Iron Man', '2020-06-01', 'Human', 'FALSE', 83922),
('Iron Man', '2020-02-01', 'Human', 'FALSE', 69272),
('Iron Man', '2020-07-01', 'Human', 'FALSE', 83316),
('Iron Man', '2020-10-01', 'Human', 'FALSE', 90943),
('Iron Man', '2020-12-01', 'Human', 'FALSE', 93141),
('Iron Man', '2020-09-01', 'Human', 'FALSE', 100696),
('Iron Man', '2020-01-01', 'Human', 'FALSE', 95296),
('Iron Man', '2020-05-01', 'Human', 'FALSE', 116757),
('Wolverine', '2020-08-01', 'Mutant', 'TRUE', 82151),
('Wolverine', '2020-07-01', 'Mutant', 'TRUE', 81343),
('Wolverine', '2020-09-01', 'Mutant', 'TRUE', 76360),
('Wolverine', '2020-01-01', 'Mutant', 'TRUE', 69570),
('Wolverine', '2020-02-01', 'Mutant', 'TRUE', 64213),
('Wolverine', '2020-11-01', 'Mutant', 'TRUE', 79048),
('Wolverine', '2020-12-01', 'Mutant', 'TRUE', 68448),
('Wolverine', '2020-03-01', 'Mutant', 'TRUE', 83920),
('Wolverine', '2020-06-01', 'Mutant', 'TRUE', 78275),
('Wolverine', '2020-05-01', 'Mutant', 'TRUE', 92548),
('Wolverine', '2020-04-01', 'Mutant', 'TRUE', 96679),
('Wolverine', '2020-10-01', 'Mutant', 'TRUE', 81325)
);
```

