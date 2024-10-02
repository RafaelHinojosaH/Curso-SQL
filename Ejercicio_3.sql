/*
3. Sum of Product Prices by Manufacturing Date
You want to find the sum of product price based on the manufacturing date.
Write a SQL query to display the MANU_DATE and sum of PROD_PRICE if the sum of PROD_PRICE at least 500 more than the maximum PROD_PRICE for the respective MANU_DATE. Also, group the output data by MANU_DATE.

1.Schema
    CREATE TABLE PRODUCT(
    PRO_NO int(10) PRIMARY KEY,
    PROD_NAME VARCHAR(50),
    MANU_DATE DATE,
    PROD_PRICE int(10),
    SALES_ID int(10)
    )

2.Table structure
    PRODUCT
    Name	Type	Description
    PRO_NO	int(10)	Column denoting PRO_NO representing the product number.
    PROD_NAME	VARCHAR(50)	Column denoting PROD_NAME representing the name of the product.
    MANU_DATE	DATE	Column denoting MANU_DATE representing the manufacturing date of the product.
    PROD_PRICE	int(10)	Column denoting PROD_PRICE representing the price of the product.
    SALES_ID	int(10)	Column denoting SALES_ID representing the id of the salesman selling the product.

3.Sample testcase 1
    Input
    PRODUCT
    PRO_NO	PROD_NAME	MANU_DATE	PROD_PRICE	SALES_ID
    101	Cake	2020-10-11	1000	34
    102	Veg Lollipop	2020-11-11	4500	15
    103	Biscuit	2020-10-11	900	34
    Output
    2020-10-11	1900
*/

SELECT 
    MANU_DATE, 
    SUM(PROD_PRICE) AS total_price
FROM PRODUCT
GROUP BY MANU_DATE
HAVING SUM(PROD_PRICE) >= MAX(PROD_PRICE) + 500;


