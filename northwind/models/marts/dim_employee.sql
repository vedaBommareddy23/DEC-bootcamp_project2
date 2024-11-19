select
    {{dbt_utils.generate_surrogate_key(['e.employee_id'])}} as employee_key,
    e.full_name,
    e.hire_date,
    e.city,
    et.territory_id,
    r.region_id
from {{ref('employees')}} as e
inner join {{ ref('employee_territories')}} as et
    on e.employee_id = et.employee_id
inner join {{ ref('territories')}} as t
    on t.territory_id = et.territory_id
inner join {{ref('region')}} as r
    on r.region_id = t.region_id