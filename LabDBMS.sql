-- Problem 1 --
create database if not exists `order-directory`;
use `order-directory`;
create table supplier (
	SUPP_ID int primary key auto_increment,
    SUPP_NAME varchar(50) not null,
    SUPP_CITY varchar(50) not null,
    SUPP_PHONE varchar(50) not null
);
select * from supplier;
create table customer(
	CUS_ID int primary key auto_increment,
    CUS_NAME varchar(20) not null,
    CUS_PHONE varchar(10) not null,
    CUS_CITY varchar(30) not null,
    CUS_GENDER char
);

create table category(
	CAT_ID int primary key auto_increment,
    CAT_NAME varchar(20) not null
);

create table product(
	PRO_ID int primary key auto_increment,
    PRO_NAME varchar(20) not null default "Dummy",
    PRO_DESC varchar(60),
    CAT_ID int,
    foreign key (CAT_ID) references category(CAT_ID)
);

create table supplier_pricing(
	PRICING_ID int primary key auto_increment,
    PRO_ID int,
    SUPP_ID int,
    SUPP_PRICE int default 0,
    foreign key (PRO_ID) references product(PRO_ID),
    foreign key (SUPP_ID) references supplier(SUPP_ID)
);

create table `order`(
	ORD_ID int primary key auto_increment,
    ORD_AMOUNT int not null,
    ORD_DATE date not null,
    CUS_ID int,
    PRICING_ID int,
    foreign key (CUS_ID) references customer(CUS_ID),
    foreign key (PRICING_ID) references supplier_pricing(PRICING_ID)
);

create table rating(
	RAT_ID int primary key auto_increment,
    ORD_ID int,
    RAT_RATSTARS int not null,
    foreign key (ORD_ID) references `order`(ORD_ID)
);
    
    
    
-- Problem 2 --
INSERT INTO supplier VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO supplier VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO supplier VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO supplier VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO supplier VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

INSERT INTO customer VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO customer VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO customer VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO customer VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO customer VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

INSERT INTO category VALUES( 1,"BOOKS");
INSERT INTO category VALUES(2,"GAMES");
INSERT INTO category VALUES(3,"GROCERIES");
INSERT INTO category VALUES (4,"ELECTRONICS");
INSERT INTO category VALUES(5,"CLOTHES");

INSERT INTO product VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO product VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO product VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO product VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO product VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO product VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO product VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO product VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO product VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO product VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO product VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO product VALUES(12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO supplier_pricing VALUES(1,1,2,1500);
INSERT INTO supplier_pricing VALUES(2,3,5,30000);
INSERT INTO supplier_pricing VALUES(3,5,1,3000);
INSERT INTO supplier_pricing VALUES(4,2,3,2500);
INSERT INTO supplier_pricing VALUES(5,4,1,1000);
INSERT INTO supplier_pricing VALUES(6,12,2,780);
INSERT INTO supplier_pricing VALUES(7,12,4,789);
INSERT INTO supplier_pricing VALUES(8,3,1,31000);
INSERT INTO supplier_pricing VALUES(9,1,5,1450);
INSERT INTO supplier_pricing VALUES(10,4,2,999);
INSERT INTO supplier_pricing VALUES(11,7,3,549);
INSERT INTO supplier_pricing VALUES(12,7,4,529);
INSERT INTO supplier_pricing VALUES(13,6,2,105);
INSERT INTO supplier_pricing VALUES(14,6,1,99);
INSERT INTO supplier_pricing VALUES(15,2,5,2999);
INSERT INTO supplier_pricing VALUES(16,5,2,2999);


INSERT INTO `order` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `order` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `order` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `order` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `order` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `order` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `order` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `order` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `order` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `order` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `order` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `order` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `order` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `order` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `order` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `order` VALUES(116,99,"2021-09-17",2,14);


INSERT INTO rating VALUES(1,101,4);
INSERT INTO rating VALUES(2,102,3);
INSERT INTO rating VALUES(3,103,1);
INSERT INTO rating VALUES(4,104,2);
INSERT INTO rating VALUES(5,105,4);
INSERT INTO rating VALUES(6,106,3);
INSERT INTO rating VALUES(7,107,4);
INSERT INTO rating VALUES(8,108,4);
INSERT INTO rating VALUES(9,109,3);
INSERT INTO rating VALUES(10,110,5);
INSERT INTO rating VALUES(11,111,3);
INSERT INTO rating VALUES(12,112,4);
INSERT INTO rating VALUES(13,113,2);
INSERT INTO rating VALUES(14,114,1);
INSERT INTO rating VALUES(15,115,1);
INSERT INTO rating VALUES(16,116,0);

-- Problem 3 --
select cus_gender,count(cus_gender) from customer
	where cus_id in (Select cus_id from `order` group by cus_id
		having sum(ord_amount) >= 3000)
    group by cus_gender
    order by cus_gender;
    
-- Problem 4 --
select ord_id, ord_amount, ord_date, o.cus_id, o.pricing_id, p.pro_name 
	from `order` o, supplier_pricing sp, product p 
    where sp.pricing_id = o.pricing_id and sp.pro_id=p.pro_id and o.cus_id=2 ;

-- Problem 5 --
select * from supplier where
	supp_id in (select supp_id from supplier_pricing group by supp_id having count(supp_id) > 1);
    
-- Problem 6 --
select @@session.sql_mode into @session_sql_mode;
set session sql_mode='';
select c.cat_id, cat_name, pro_name, min_price from
	(select cat_id, p.pro_id, min(supp_price) as min_price from supplier_pricing sp, product p where
		sp.pro_id = p.pro_id group by p.cat_id) as cat_min_price,category c, product p
        where c.cat_id = p.cat_id
			and p.pro_id = cat_min_price.pro_id;
set session sql_mode=@session_sql_mode;

-- Problem 7 --
select p.pro_id,pro_name from product p, supplier_pricing sp, `order` o
	where p.pro_id = sp.pro_id
		and sp.pricing_id = o.pricing_id
        and o.ord_date > '2021-10-05';

-- Problem 8 --
select cus_name, cus_gender from customer where cus_name like 'A%' or cus_name like '%A';

-- Problem 9 --
DELIMITER &&
CREATE PROCEDURE display_supplier_ratings()
BEGIN

select s.supp_id, s.supp_name, avg(rat_ratstars),
	case when avg(rat_ratstars) = 5 then 'Excellent Service'
		 when avg(rat_ratstars) > 4 then 'Good Service'
         when avg(rat_ratstars) > 2 then 'Average Service'
         else 'Poor Service'
	end as type_of_service
    from supplier s, `order` o, supplier_pricing sp, rating r
    where s.supp_id = sp.supp_id
		and sp.pricing_id = o.pricing_id
        and o.ord_id = r.ord_id
	group by s.supp_id order by s.supp_id;
END &&
DELIMITER ;
call display_supplier_ratings();
