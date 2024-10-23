

--MS Sql server with dr. M.Eldosoky

-- System databases --> كذا داتا بيز نازلين مع السيستم
-- 1- master
-- 2- model 
-- 3- msdb
-- 4- tempdb

--راجع تفاصيلهم من دوكيومنتيشن مايكروسوفت


--Creating new database 
--1 Right click on Databases at the object explorer --> select add new database
--2 Write a query

--When using 1st option you can determine Databasename , Database size , Database location , Database size auto grouth(by MegaBytes or percentage)
--and Database userer or whi can connect to the data base
--When creating any database --> 2 files are created --> Data file (ROW DATA) , Log file

--Data file --> بيتخزن فيه الداتا نفسها الي في الداتا بيز
--Log file --> بيتخزن فيها العمليات و التغيرات و الكيويريز الي حصلت علي الداتا و كمان اليوزرز الي عملوا التغيرات دي


-- خلينا بق نتكلم عن انواع الكويريزز

--DDL , DML , DCL , TCL , DQL

-- DDL , Data definition language 
--وهي الي بنكريت بيها الداتا زي امر 
--Create (Databsase , table ,schema,,) , alter

--لو عايزين نكريت داتا بيز من الكويري نعمل امر كرريت داتا بيز بس خد بالك هو هيكريت ليك الداتا بيز بالمواصفات الديفولت
-- سواء اسايز او المكان او الماكس سايز و الفايل جروث و هكذا و نفس الكلام بالنسبة لل لوج فايل

CREATE DATABASE EldosokyCourseDataBase  --Default(size , max size , location , file grouth)


--ممكن بقا احنا نحدد المواصفات دي بنفسنا

CREATE DATABASE  EldosokyCourseDataBase
ON (

FILENAME = "D:\DotNet\DotNet_DataBaseSqlServer\SqlServerEldosokyCourse\DataBases" ,
NAME = EldosokyCourseDataBase  , 
SIZE = 10 MB,
MAXSIZE = 20 MB ,
FILEGROWTH = 1024KB 

) 

LOG ON (

NAME = EldosokyCourseDataBase_LOG ,
FILENAME = "D:\DotNet\DotNet_DataBaseSqlServer\SqlServerEldosokyCourse\DataBases"  ,
SIZE = 10 MB,
MAXSIZE = 20 MB ,
FILEGROWTH = 1024KB
) ;


--USE keyword --> to use now a specific database

USE EldosokyCourseDataBase

--DROP 
--حذف داتا بيز او جدول مثلا

DROP DATABASE EldosokyCourseDataBase 

--Schema --> مجموعة من الجداول مرتبطة ببعض

create schema Sales_schema 
create schema Production_schema

USE EldosokyCourseDataBase

DROP SCHEMA Production_schema

-- وانت بتكريت الاسكيما ممكن تضيف ليها الاونر للسكيما دي بس دي حاجة اختياري و عامة اي حاجة بين
--[] 
--بتبقي اختياري


--Creating tables
-- كالعادة زي الداتا بيز ممكن تكريت برضه جدول من الاوبجكت اكسبلورر
--و ممكن من خلال الكويوري
--لو انت معملتش اي سكيمة , البرنامج هيحط الداول بتاعتك جوا الديفولت سكيما 
--dbo.table ---> dbo (data base owner) , this is the defaule schema

--و انت بتكريت الجدول ممكن تحددله برضه انت هتعمله في انهي داتا بيز او انهي اسكيما و دي بتكون اختياري 
--عشان كدة بتتحط بين 
--[DATABASE name] OR [SCHEMA name]


CREATE TABLE sales_schema.customers (

CustomerId int not null ,
CustomerFirstName varchar(30) not null ,
CustomerLastName varchar(30) ,
CustomerEmail varchar(50) not null ,
CustomerCity varchar(20) not null ,
CustomerStreet varchar(50) not null ,
CustomerZipCode int  ,    --varchar(number of charactrs inside the char)
CustomerCountry varchar(25) not null ,


--Constraints  --> قيود علي الداتا الي ينفع يقبلها الاتربيوت ده زي النوت ناال و البرايمري كي و الفورين كي و فيه كتيير طبعا
--All constraints --> PRIMARY key , FORIEGN key , CHECK , NOT NULL , UNIQUE
--Primary key must be Unique and not null --> يعني لازم يكون له قيمة و لازم قيمته متكررش لان ده الي بنفرق بيه بين الريكوردز و بعضها في كل جدول
--ممكن تكتب الكونسترينتس كلها فوق جمب كل اتربيوت الكونسترينت الي عايزه معاه

--و لكن الطريقة الافضل و الفورمال عامة انك تكتبه تحت كلها في جدول مرة واحدة و اسمه ال 
--constraint table
--ده بيديك ميزة كمان انك بتدي الكونسترينت اسم بالتالي تقدر تستعديه و تغير فيه عادي و افهم اكتر و اعرف اكتر عن الميزة دي كووويس

--Constraint table
CONSTRAINT CustomerPK PRIMARY KEY (CustomerId) ,

)


--تاني افتكر , الكونسترينتس هي من اسمها قيود بفرضها علي اتربيوت معين جوا الجدول او التابل عشان اقيد القيم الي ينفع الجدول دي يقبلها 
--وكمان هل ينفع  يتكرر ولا لا و هل ينفع يكوون ب ناال ولا لا و هكذاااا و كل ده اصلا يا ريس بيكون وانا ب كريت التابل مش وانا بعدل علييه , خد بااالك
--اتاكد كدة ينفع نعمل الكونسترينت بتاع النوت ناال تحت في التابل ولا لا


CREATE TABLE sales_schema.Brands ( 

BrandId INT NOT NULL ,
BrandNmae VARCHAR(50) ,


--Constraint table
CONSTRAINT BrandsPK PRIMARY KEY (BrandId) 

)


CREATE TABLE sales_schema.Catigories (

CatigoryId INT ,
CatigoryName VARCHAR(30) NOT NULL,
)



--كنا اتكلمنا عن اول نوع من انواع الكونسترينتس وهو البريمري كي و دلوقتي هنتكلن عن تاني نوع وهو ال 
--UNIQUE
--ببساطة هو انك بتقول ان الاتربيوت ده القيم الي فيه مينفعش تتكرر باي شكل من الاشكال , لازم كل قيمة تخش العمود ده تكون مختلفة و مميزة
--طيب اي الفرق بقا بينها و بين البربمري كي؟ الفرق يا صديقي ان البريمري كي بيفرض شرطين وهما انه لازم يكون
--unique and not null
--اما اليونيك كونسترينت فهو بيفرض ان القيمة تكون يونيك بس يعني متتكررش لمن ينفع تاخد نااال عادي

--لو عايزين نعدل في جدول ممكن نحذفهو نكتبه كله تاني او نستخدم التر تابل
--(اتاكد كدة الله يخليك بنستدعي اسم الكونسترينت ازاي)

--ابقي طبق الكونسترينت بتاع اليونيك علي الجدول الي جي 
-- Constraints --> Primary key , Foriegn key , Unique , CHECK , NOT NULL 