-- 14) 查询每份保险金额第4高保险产品的编号和保险金额。
--     在数字序列8000,8000,7000,7000,6000中，
--     两个8000均为第1高，两个7000均为第2高,6000为第3高。
-- 请用一条SQL语句实现该查询：


select i_id,i_amount
from insurance
where i_amount in (
    select tabl.i_amount as i_amount
    from (select tabl_1.i_amount as i_amount from
            (select distinct i_amount from insurance) as tabl_1
            join (select distinct i_amount from insurance) as tabl_2
            on tabl_1.i_amount<=tabl_2.i_amount
        ) as tabl
    group by tabl.i_amount
    having count(*)=4
);





/*  end  of  your code  */ 