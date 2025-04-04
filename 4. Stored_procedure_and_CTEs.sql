-- Join tables, merchandise_item, merchandise_item_supplier, supplier and then apply a CTE to get columns item_id, merchandise_name, and supplier_name. 

with cte_1(item_id,merchandise_name,supplier_name) as (select mi.merchandise_item_id, mi.description, s.supplier_name
from merchandise_item mi join
merchandise_item_supplier ms on ms.merchandise_item_id  = mi.merchandise_item_id
join supplier s on s.supplier_id = ms.supplier_id
)
select * from cte_1;

-- use the above CTE to generate a stored procedure that take item_id as it's input and generates the supplier name. 
delimiter $$
create procedure supplier_name_of_select_merchandise(in request_input_id char(15),
out related_supplier char(15))
begin
with cte_1(item_id,merchandise_name,supplier_name) as (select mi.merchandise_item_id, mi.description, s.supplier_name
from merchandise_item mi join
merchandise_item_supplier ms on ms.merchandise_item_id  = mi.merchandise_item_id
join supplier s on s.supplier_id = ms.supplier_id
)
select supplier_name into related_supplier from cte_1
where item_id = request_input_id ;
end $$

delimiter ;



