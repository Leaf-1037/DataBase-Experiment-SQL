-- 9) 查询购买了货币型(f_type='货币型')基金的用户的名称、电话号、邮箱。
--   请用一条SQL语句实现该查询：

select c_name,c_phone,c_mail
from client
where exists(
    select 1 
    from property, fund
    where pro_c_id=c_id and pro_type=3 and pro_pif_id=f_id and f_type='货币型'
)
order by c_id;





/*  end  of  your code  */