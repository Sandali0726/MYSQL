update products 
set properties = '
{
	"dimensions": [1, 2, 3],
    "weight": 10,
    "manufacturer": { "name": "sony" }
}'
where product_id = 1;


select *
from products;

update products 
set properties = json_object(
		'weight',10,
        'dimensions', json_array(1, 2, 3),
		'manufacturer',json_object('name','sony')
)
where product_id = 1;

select product_id, json_extract(properties,'$.weight') as weight
from products
where product_id = 1;

select product_id, properties -> '$.weight'
select product_id, properties -> '$.dimensions'
select product_id, properties -> '$.dimensions[0]'
select product_id, properties -> '$.manufacturer.name'
select product_id, properties ->> '$.manufacturer.name'
from products
where product_id = 1;

select product_id, properties ->> '$.manufacturer.name'
from products
where properties ->> '$.manufacturer.name' = 'sony';

update products 
set properties = json_set(
		properties,
        '$.weight',20,
        '$.age', 22
)
where product_id = 1;

select product_id, properties
from products
where properties ->> '$.manufacturer.name' = 'sony';

update products 
set properties = json_remove(
		properties,
        '$.age'
)
where product_id = 1;
