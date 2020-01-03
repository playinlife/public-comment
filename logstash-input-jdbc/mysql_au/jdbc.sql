select 
    a.id,a.name,a.tags,concat(a.latitude,',',a.longitude) as location,
    a.remark_score,a.price_per_man,a.category_id,b.name as category_name,
    a.seller_id,c.remark_score as seller_remark_score,
    c.disabled_flag as seller_disabled_flag 
from 
    shop a 
    inner join category b on a.category_id = b.id 
    inner join seller c on c.id = a.seller_id
where
    a.updated_at > :sql_last_value
    and b.updated_at > :sql_last_value
    and c.updated_at > :sql_last_value
