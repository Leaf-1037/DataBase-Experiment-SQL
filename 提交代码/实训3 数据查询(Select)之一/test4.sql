-- 4) 查询办理了储蓄卡的客户名称、手机号、银行卡号。 查询结果结果依客户编号排序。
--    请用一条SQL语句实现该查询：

select client.c_name,client.c_phone,bank_card.b_number
from client,bank_card
where b_type='储蓄卡' and c_id=b_c_id
order by c_id



/*  end  of  your code  */