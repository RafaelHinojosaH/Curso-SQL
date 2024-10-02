/*
Select based on ITEM_PRICE
You want to find the details of items based on the ITEM_PRICE.
Write a MySQL query to display MAN_COM_CODE and maximum ITEM_PRICE of the items whose maximum ITEM_PRICE is more than 3000.

Schema
ITEMS,

CREATE TEMPORARY TABLE ` ITEMS ` (
  ` ITEM_ID ` int NOT NULL,
  ` ITEM_NAME ` varchar(50) DEFAULT NULL,
  ` ITEM_PRICE ` int DEFAULT NULL,
  ` MAN_COM_CODE ` int DEFAULT NULL,
  PRIMARY KEY (` ITEM_ID `)
) ENGINE = InnoDB DEFAULT CHARSET = latin1

Table structure
ITEMS
Name	Type	Description
ITEM_ID	int	Column denoting ITEM_ID representing item id
ITEM_NAME	varchar(50)	Column denoting ITEM_NAME representing name of the item
ITEM_PRICE	int	Column denoting ITEM_PRICE representing price of the item
MAN_COM_CODE	int	Column denoting MAN_COM_CODE representing manufacturing company code of various items

Sample testcase 1
Input
ITEMS
ITEM_ID	ITEM_NAME	ITEM_PRICE	MAN_COM_CODE
101	Cake	1000	34
102	Veg Lollipop	4500	15
103	Biscuit	90	34
Output
15	4500
*/

SELECT 
    MAN_COM_CODE, 
    MAX(ITEM_PRICE) AS MAX_ITEM_PRICE
FROM ITEMS
GROUP BY MAN_COM_CODE
HAVING MAX(ITEM_PRICE) > 3000;

-- Selecciona el código del fabricante (MAN_COM_CODE) y el precio máximo del artículo (MAX(ITEM_PRICE))
SELECT MAN_COM_CODE, MAX(ITEM_PRICE) AS MAX_ITEM_PRICE
-- De la tabla ITEMS
FROM ITEMS
-- Agrupa los resultados por el código del fabricante (MAN_COM_CODE)
GROUP BY MAN_COM_CODE
-- Filtra los grupos para incluir solo aquellos donde el precio máximo del artículo (MAX(ITEM_PRICE)) sea mayor a 3000
HAVING MAX(ITEM_PRICE) > 3000;


