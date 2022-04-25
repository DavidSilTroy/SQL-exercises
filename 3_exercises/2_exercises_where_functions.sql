#FROM HnS_exercise

############### WHERE FUNCTIONS ###############
#1.	Show the products (product name) whose name begins with HP. There is no need to differentiate between large and small letters. (13 results)
select productName from hns.product where productName like "HP%";

#2.	Show all product categories whose names end with  ‘rs’. Show the product categories in ascending order according to the category name.(3 results)
select * from hns.productcategory where productCategory like "%rs" ;

#3.	Show the products for which the selling price is between 80 and 100 euros. Sort the result in ascending order of the selling price. (18 results)
select * from hns.product where salesPrice between 80 and 100 order by salesPrice;



select * from hns.customer;