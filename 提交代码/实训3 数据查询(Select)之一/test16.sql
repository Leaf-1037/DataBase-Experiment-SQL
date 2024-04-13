-- 16) 查询持有相同基金组合的客户对，如编号为A的客户持有的基金，编号为B的客户也持有，反过来，编号为B的客户持有的基金，编号为A的客户也持有，则(A,B)即为持有相同基金组合的二元组，请列出这样的客户对。为避免过多的重复，如果(1,2)为满足条件的元组，则不必显示(2,1)，即只显示编号小者在前的那一对，这一组客户编号分别命名为c_id1,c_id2。

-- 请用一条SQL语句实现该查询：

select C.c_id as c_id1, D.c_id as c_id2
from client as C join client as D on C.c_id < D.c_id
where  not exists(
    select 1
    from property as tabl_1
    where not exists(
        select 1
        from property as tabl_2
        where  tabl_2.pro_c_id = D.c_id and tabl_1.pro_pif_id = tabl_2.pro_pif_id and tabl_2.pro_type=3
    ) and tabl_1.pro_c_id = C.c_id and tabl_1.pro_type=3 
) and not exists(
    select 1
    from property as tabl_1
    where not exists(
        select 1
        from property as tabl_2
        where  tabl_2.pro_c_id = C.c_id and tabl_1.pro_pif_id = tabl_2.pro_pif_id and tabl_2.pro_type=3
    ) and tabl_1.pro_c_id = D.c_id and tabl_1.pro_type=3 
) and exists(
    select 1
    from property 
    where C.c_id = pro_c_id and pro_type = 3
);




/*  end  of  your code  */