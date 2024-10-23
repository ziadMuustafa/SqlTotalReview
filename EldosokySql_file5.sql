

--دلوقتي كل الي فات كان كلامنا عن اول نوع من الكويريز وهي ال 
--DDL

--دلوقتي هنتكلم عن تاني نوع من الكويريزوهي ال

--DML -- Data maublation language 
--وهي مجموعة من الكويريز بتخليني ابدأ بقا اغير في الداتا الي عندي و اضيفلها او احذف منها 
--في النوع الي فات احنا كنا بنكريت داتا بيز او جدول او بنحذف داتا بيز او جدول و هكذاا , لكن كل ده لسة مدخلناش داتا اصلا
--احنا بس بنبني الداتا بيز و بنظبطها
--دلوقتي النوع التاني هنبدأ بقا ندخل داتا و نتعامل معاها و كمان نعدل عليها


-----------------------------------------------------------------------------------------------------------------------------------------


--1- INSERT INTO
--هو اول امر عندي من النوع التاني وهو مجرد بس بيسمحلي ادخل داتا للداتا بيز
--بيكون عندي الاوبشن اني ادخل الداتا لجداول بعينهااو ل كولومز معينة جوا الداتا بيز 
--لكن طبعا الكولومز الي معمولة نوت ناال لازم ندخلها قيمة , و لازم تاخد بالك وانت بتدخل قيم للكولومز
--الي عبارة عن فورين كي لريفرنس في جدول تاني ان الجدول ده يكون موجود و الريفرنس كولوم فيه قيم
--و كمان القيم الي تدخلها للفورين كي يكون ليها زيها بالظبط في الريفرنس كولوم الي مربوطة بيه لان هي دي فكرة الفورين كي اصلا

--ممكن متحددش الكولومز الي هتدخلها قيم و ساعتها هتكون مضطر انك تدخل قيم للكولومز كلها
--و هنا تاخد بالك من معلومة مهمة جداا و انت بتحدد البريمري كي لو مخلتهوش ادينتيتي 
--PRIMARY KEY IDENTITY
--ساعتها هتكون لازم انك تدخله بنفسك وانت بتعمل انسيرت بس برضه مينفعش يكون ب ناال و مينفعش يتكرر 
--لكن لو عملته ادينتيتي ساعتها مش هتدخله , اتاكد ينفع اصلا تدخله او لا , ولكن الداتا بيز هتدخله بشكل تلقائي من  رقم واحد
--و تفضل تزوده لوحدها

USE SalesDataBase_Revision
GO ;

INSERT INTO Sales_schema.Customer VALUES (1 ,'Ziad'  , '01065155909' , 'ziad@g.com'  , 'Damn'  , 'Egypt') 
INSERT INTO Sales_schema.Customer VALUES (2 ,'Ali'   , '01056565909' , 'Ali@g.com'   , 'Alex'  , 'Egypt') 
INSERT INTO Sales_schema.Customer VALUES (3 ,'Ziad'  , '01114565609' , 'z@g.com'     , 'Cairo' , 'Egypt') 
INSERT INTO Sales_schema.Customer VALUES (4 ,'kamal' , '01256623409' , 'kiko@g.com'  , 'Alex'  , 'Egypt') 

INSERT INTO Sales_schema.Customer 
VALUES
(
5 
,'Samir' 
, '01051367809' 
, 'Samro@g.com' 
, 'Ports' 
, 'Egypt'  )   --ممكن تنظم الكويري بالشكل ده ممكن تسهل قرايتها اكتر
 

USE SalesDataBase_Revision
INSERT INTO Sales_schema.Staff VALUES (10, 'Sameh'  , 's@g.com' , '01123456789' , 'M' , NULL , NULL )
INSERT INTO Sales_schema.Staff VALUES (20, 'Kareem' , 'k@g.com' , '01123333789' , 'M' , NULL , NULL )
INSERT INTO Sales_schema.Staff VALUES (30, 'Heba'   , 'h@g.com' , '01144444789' , 'F' , NULL , NULL )
INSERT INTO Sales_schema.Staff VALUES (40, 'Ziad'   , 'z@g.com' , '01065155909' , 'M' , NULL , NULL )
INSERT INTO Sales_schema.Staff VALUES (50, 'Zain'   , 'z@g.com' , '01023652336' , 'M' , NULL , NULL )
INSERT INTO Sales_schema.Staff VALUES (60, 'Salma'  , 's@g.com' , '01141416789' , 'F' , NULL , NULL )



--تفدر كمان تحدد كولومز بعينها هي الي تدخلها قيم
INSERT INTO Poduction_schema.Brand (BrandId , BrandName) VALUES ( 10 , 'Nike')
INSERT INTO Poduction_schema.Brand (BrandId , BrandName) VALUES ( 20 , 'Adidas')
INSERT INTO Poduction_schema.Brand (BrandId , BrandName) VALUES ( 30 , 'Puma')


-----------------------------------------------------------------------------------------------------------------------------------------


--2-UPDATE
--ده تاني امر من النوع التاني وهو مختص اننا نغير و نعدل في قيم الداتا الي في الداتا بيز
--نقدير نغير في القيم الي جواا و نعدل عليها و يفترض علي حسب كونديشن معين
--خد باااااالك فرق بين ال 
--UPDATE , ALTER
--ALTER ---> ده كان من النوع الاول , دي دي ال , و هنا هو بيغير في هيكل الداتا بيز نفسها , يعني يحذف جدول او يغير اسمه او يضيف جدول
-----------> او يعدل في الكونسترينتس بس كل ده بنعدل في الهيكل بتاع الداتا بيز مش بنعدل في قيم الداتا نفسههههها
--UPDATE ---> اما ابديت ف هي من النوع التاني , دي ام ال , وهنا بقا احنا بنتعامل مع الداتا الي جوا الداتا بيز نفسها 
------------> بنقدر نغير فيها و نعدل عليها علي حسب احنا محتاجين نغير ايه و علي حسب الكونديشن برا الي هنحدده 
------------> زي مثلا غير لي مدينة الكاستمورز الي اسمهم زياد هي اسكندرية و هكذاااا

SELECT * 
FROM Sales_schema.Customer


UPDATE Sales_schema.Customer
SET CustomerCity = 'Alex' 
WHERE CustomerName = 'Ziad' ;


SELECT * 
FROM Sales_schema.Customer


--خد بالك لو محددتش له الكونديشن الي هيغير عنده بالتالي هيغير كل العناصؤ الي في الكولومن
UPDATE Sales_schema.Customer
SET CustomerCity = 'Alex' 


UPDATE Poduction_schema.Brand
SET BrandState = 'Germany'
WHERE ( BrandName IN ('Puma' , 'Adidas') )

SELECT *
FROM Poduction_schema.Brand



-----------------------------------------------------------------------------------------------------------------------------------------


--3- DELETE 
--هي تالت نوع من النوع التاني , دي ام ال , وهي بتعمل نفس وظيفة الابديت لكن بالعكس , بدل ما تضيف قيمة هي بالعكس بقا بتحذف 
--و نفس الفكرة هنا لو محددش له هيحذف القيمة امتي او بناء علي اي كونديشن ساعتها هيحذف كل الريكوردز الي في الالكولوم ده او يمكن الجدول كله كمان
--ودي نقطة خطيرة جدااااااااا
--و تقدر تقوله كمان انك عايز تحذف مثلا اول كذا ريكورد في الجدول او الكولومن من خلال الكي وررد 
--TOP
--او تقوله انك عايز تحذ نسبة معينة من الريكوردز من خلال الكي ورد 
--PERCENT
--او انك تحذف الريكوردز الي بين قيمتين معينين و هكذااا
-- وخد بالك هنا هو بيحذف الريكورد كلها من الجدول , تاني الديليت بيشيل الريكورد كلها مش بيخليها ب ناااال

--DELETE FROM table_name
--CONDITION (لو محطتش كونديشن هيحذف كل الريكوردز)

--DELETE TOP(5) FROM table_name
--CONDITION (لو محطتش كونديشن هيحذف اول 5 ريكوردز كلهم من غير اي كونديشن)



SELECT *
FROM Sales_schema.Customer


DELETE FROM Sales_schema.Customer
WHERE CustomerName = 'Ziad'  --حذف الريكورد كلها من الجدول , مخلهاش ب ناال


DELETE  FROM Sales_schema.Customer
WHERE CustomerEmail = 'kiko@g.com'


SELECT *
FROM Poduction_schema.Brand


DELETE TOP(3) FROM Poduction_schema.Brand

--عملت انسيرت ليهم تاني

DELETE FROM Poduction_schema.Brand
WHERE BrandState = NULL OR BrandId = 10 -- لما عملت الكونديشن علي الناال بس ممسحهاش حاول تبحث فيها
--لما حاولت امسح اول 3 ريكوردز و الشرط مش متحقق عليهم كلهم , الكويري متنفذتش و محذفش و لا واحدة منهم

SELECT *
FROM Sales_schema.Customer ;


DELETE FROM Sales_schema.Customer 
WHERE CustomerId BETWEEN 4 AND 7 ;


--خد بالك تاااني , الديليت بيحذف الريكورد كلها حسب الكونديشن , مش بيخلي قيمتها ب ناال 
--لو عايز تحطهم ب ناال ممكن تستخدم الابديت و تحطلهم قيمة ناال بنفسك و برضه علي حسب الكونديشن 
--الديليت بتشيل الريكورد كلها
--انما الابديت ممكن تعدل في قيمة حاجة واحدة بس في الريكورد و برضه كله حسب الكونديشن



-------------------------------------------------------------------------------------------------------------------------------


-- 3- DQL 
--دلوقتي اخنا اتكلمنا عن نوعين من الكويريز وهما 
--DDL , DML 
--دلوقتي هنتكلم عن النوع التالت وهو ال 
--DQL -- Data Query language

--وهي هنا مسئولة عن انها تظهر ليا البيانات الي موجودة 
--او تظهر ليا يعني البيانات الي عايز اشوفها حسب كونديشن معين مثلا

--SELECT (ANY THING) 
--FROM (DATA BASE)

USE SalesDataBase_Revision

SELECT Sales_schema.Customer.CustomerCity
FROM Sales_schema.Customer

SELECT * 
FROM Sales_schema.Orders

SELECT Sales_schema.Staff.StaffGender
FROM Sales_schema.Staff

--زي ما انت شايف انا اقدر اعرض الداتا الي انا عايزها مش مجرد اني اعرض الداتا كلها 
--ممكن اعرض عواميد معينة او اتربيوتس معينة او اعرض الداتا كلها


--كمان ممكن اتحكم في شكل الداتا الي طالعة 
--يعني ممكن اعرض المرتب مضروب في مية 
--او اعرض مجموع الاسم الاول و الاخر يعني اعملهم كونكاتينيشن و اعرضهم في كولومن واحد
--و ممكن كمان اعرض العمود ده باسم مختلف من خلال استخدام ال
--Alias

USE SalesDataBase_Revision

SELECT *
FROM SalesDataBase_Revision.Poduction_schema.Brand

SELECT SalesDataBase_Revision.Poduction_schema.Brand.BrandState + SalesDataBase_Revision.Poduction_schema.Brand.BrandName AS STATENAME
FROM SalesDataBase_Revision.Poduction_schema.Brand


SELECT Sales_schema.Customer.CustomerCity + Sales_schema.Customer.CustomerName AS CityName
FROM Sales_schema.Customer


--افتكر استخدام 
--USE , GO keywords


--ممكن كمان تختار الداتا الي عايز تعرضها بناء علي كونديشن معين و كمان تختار تعرض كذا كولوم في نفس الوقت و ده منطقي جداا
SELECT Sales_schema.Customer.CustomerEmail AS CustEmail , Sales_schema.Customer.CustomerPhone , Sales_schema.Customer.CustomerName
FROM Sales_schema.Customer
WHERE Customer.CustomerName = 'Ziad'


--Imprtant keywords --> IN( , )  ;  BETWEEN(-- AND --)  ;  NOT IN( , )  ; AND , OR , = NULL , = NOT NULL , IS NULL , IS NOT NULL 
--We can use them to make the condition easier

SELECT * 
FROM Sales_schema.Customer 
WHERE CustomerState IS NOT NULL


SELECT Sales_schema.Customer.CustomerName , Sales_schema.Customer.CustomerName
FROM Sales_schema.Customer
WHERE Sales_schema.Customer.CustomerCity IN ('Alex' , 'Ports')


ALTER TABLE Sales_schema.Customer
ADD CustomerAge int ;


UPDATE TOP(1) Sales_schema.Customer
SET CustomerAge  = 22 
WHERE CustomerName IN ('kamal')

UPDATE Sales_schema.Customer
SET CustomerAge  = 30 
WHERE CustomerName = 'Ali'


select *
from Sales_schema.Customer


--DISTINCT keyword
--بتستخدم انها ترجعلي الداتا الي عايز ارجعها بدوت تكراار

--SELECT DISTINCT (SOME THING)
--FROM (DATA BASE)

SELECT *
FROM Sales_schema.Staff

SELECT DISTINCT Sales_schema.Staff.StaffGender
FROM Sales_schema.Staff

SELECT DISTINCT Sales_schema.Staff.StaffEmail AS Smail
FROM Sales_schema.Staff
WHERE StaffId > 10 


--------------------------------------------------------------------------------------------------------------------------------------------

--LIKE operator 
--نقدر نستخدمه عشان نحددد شكل الداتا الي عايز ين نعرضها
--بمعني مثلا اني احدد اني عايز اعرض الاسامي الي بتبدأ بحرف ال سي و تنتهي ب حرف ال بي
--او مثلا اعرف الاسامي الي بتبدا بحرف من ال 
--A TO C [A - C]
--% العلامة دي معاناها الاخر , لو حطيتها بعد الحرف يبقي هجيب كل الي بيبدأ بالحرف ده , لو حطيتها قبله يبقي هيجيب كل الي بينتهي بيه


SELECT Sales_schema.Staff.StaffName
FROM Sales_schema.Staff
WHERE StaffName LIKE 'Z%'  -- كل الي بيبدأ بحرف الزد


SELECT Sales_schema.Staff.StaffGender
FROM Sales_schema.Staff
WHERE StaffName LIKE '[A , k]%' -- كل الي بيبدأ بحرف من ال اي لل كيه 


SELECT DISTINCT Sales_schema.Staff.StaffPhone AS Sphone
FROM Sales_schema.Staff
WHERE StaffGender = 'M' AND StaffId IN (10 , 20 , 30 , 50 , 60) AND StaffEmail LIKE '%@g.com'

--ممكن تطلب منه انه يعرضلك الداتا الي بتنتهي ب اكسريشن كامل معين مش مجرد حرف
--زي  انك تتاكد من تيمة الايميل مثلا انه بينتهي ب 
--@g.com

--اللايك اوبريتور فيه حاجات كتيير جداا ممكن ترجعلها كلها من الديكومنتيشن بتاع مايكروسوفت