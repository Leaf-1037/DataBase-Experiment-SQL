-- 13) 综合客户表(client)、资产表(property)、理财产品表(finances_product)、
--     保险表(insurance)、基金表(fund)和投资资产表(property)，
--     列出所有客户的编号、名称和总资产，总资产命名为total_property。
--     总资产为储蓄卡余额，投资总额，投资总收益的和，再扣除信用卡透支的金额
--     (信用卡余额即为透支金额)。客户总资产包括被冻结的资产。
--    请用一条SQL语句实现该查询：

select c_id,c_name,ifnull(sum(total_sum),0) as total_property
from (
    (select c_id, c_name, c_id_card,ifnull(sum(pro_quantity*p_amount),0) as total_sum
    from client left join property on c_id=pro_c_id
        join finances_product on pro_pif_id=p_id
    where pro_type=1
    group by c_id)

    union

    (select c_id, c_name, c_id_card,ifnull(sum(pro_quantity*i_amount),0) as total_sum
    from client left join property on c_id=pro_c_id
        join insurance on pro_pif_id=i_id
    where pro_type=2
    group by c_id)

    union

    (select c_id, c_name, c_id_card, ifnull(sum(pro_quantity*f_amount),0) as total_sum
    from client left join property on c_id=pro_c_id
        join fund on pro_pif_id=f_id
    where pro_type=3
    group by c_id)

    union 

    (select c_id,c_name,c_id_card,0 as total_sum
    from client
    )

    union 

    (select c_id,c_name,c_id_card,sum(b_balance) as total_sum
    from client join bank_card on c_id=b_c_id
    where b_type='储蓄卡'
    group by c_id)

    union

    (select c_id,c_name,c_id_card,sum(-b_balance) as total_sum
    from client join bank_card on c_id=b_c_id
    where b_type='信用卡'
    group by c_id)

    union

    (select c_id,c_name,c_id_card,sum(pro_income) as total_sum
    from client join property on c_id=pro_c_id
    group by c_id)
) as tabl
group by c_id,c_name,c_id_card
order by c_id;






/*  end  of  your code  */ 