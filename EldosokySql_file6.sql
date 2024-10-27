
--Order by 
--هو يعتبر تاني نوع من الاوامر الي من النوع 
--DQL 
--بعد ال سيليكت
--طب هي بتعمل ايه ؟ ببساطة هي بترتب الداتا بتاعتي الي هتتعرض 
--خد بالك هي بترتب الداتا الي هتتعرض قدامك من جملة السيليكت بس , لكن مش معني كدة انها بترتبها جوا الداتا بيز نفسها 
--بترتب الداتا الي هتتعرض بشكل تصاعدي او تنازلي عادي , لكن الديفولت بتاعها انها ترتب تصاعدي 
--و طبعا بترتبها علي اساس حاجة معينة او ممكن يرتب علي اساس كذا حاجة و بمشي عليهم بالترتيب
--By defaut ASCENDING --> لو عايز تخليه يرتب تنازلي اكتب جمبه
------------------------> DESC

--SELECT (SOME THING)
--FROM (DATA BASE)
--WHERE (CONDITION)
--ORDER BY (ORDER BY DESC)


USE SalesDataBase_Revision
GO 


--هنزود الداتا الي عندنا شوية عشان نعرف نستخدم الامر بشكل اوضح
INSERT INTO Sales_schema.Customer VALUES (50 ,'Fayez'  , '01156654565' , 'F@g.com' , 'Menof' , 'Egypt' , 35) 
INSERT INTO Sales_schema.Customer VALUES (60 ,'Sally'  , '01178989895' , 'S@g.com' , 'Alex'  , 'Egypt' , 22) 
INSERT INTO Sales_schema.Customer VALUES (70 ,'Said'   , '01012345565' , 'S@g.com' , 'Qina'  , 'Egypt' , 32) 
INSERT INTO Sales_schema.Customer VALUES (80 ,'Jamal'  , '01236563338' , 'J@g.com' , 'Cairo' , 'Egypt' , 30) 
INSERT INTO Sales_schema.Customer VALUES (90 ,'Karam'  , '01012355588' , 'K@g.com' , 'Mans'  , 'Egypt' , 21) 
INSERT INTO Sales_schema.Customer VALUES (100 ,'Ahmed' , '01234688662' , 'A@g.com' , 'Suiz'  , 'Egypt' , 20) 
INSERT INTO Sales_schema.Customer VALUES (110 ,'Nosir' , '01211233456' , 'N@g.com' , 'Cairo' , 'Egypt' , 39) 



SELECT Sales_schema.Customer.CustomerAge , Sales_schema.Customer.CustomerName
FROM Sales_schema.Customer
WHERE CustomerPhone LIKE '011%'    --العملاء الي ارقامهم بتبدأ ب 011


SELECT Sales_schema.Customer.CustomerName AS Cname , Sales_schema.Customer.CustomerAge AS CUSage
FROM Sales_schema.Customer
ORDER BY CustomerAge  -- هيرتب تصاعدي

--طب لو انا عايز ارتب تنازلي ؟ هضيف كلمة 
--DESC

SELECT Sales_schema.Customer.CustomerAge AS Age
FROM Sales_schema.Customer
ORDER BY CustomerAge DESC


--ممكن كمان ارتب علي اساس كذا حاجة , زي السن و المرتب مثلا , طب هيرتب كدة ازاي ؟
--هيمشي بالتريب , هيرتب علي اساس الحاجة الي كتبتها الاول و في حاجة كذا عنصر متساويين فيها هيبدأ يرتبهم علي اساس الحاجة التانية


SELECT Sales_schema.Customer.CustomerAge AS Age , Sales_schema.Customer.CustomerName
FROM Sales_schema.Customer
ORDER BY CustomerAge  , CustomerName

--هنا الي هيحصل هيرتب تصاعدي باي ديفولت علي اساس السن
--و لو لقي كذا عميل نفس السن هيبدأ بقا يبص علي الاسم و يرتبهم ابجدي تصاعديا باي ديفولت برضه
--زي ما قولنا لو عايزه يرتب تنازلي بدل تصاعدي بتحط كلمة 
--DESC
--في الاخر


------------------------------------------------------------------------------------------------------------------------


--JOIN
--الجوين هي من ضمن اوامر ال دي كيو ال بره و الي بتتحكم في طريقة عرض الداتا بس
--طيب هي لازمتها ايه ؟ ببساطة انا كل الفترة الي فاتت دي كنت بتعامل و بعرض داتا من جدول واحد بس , لكن في الحقيقة
--انا في الحياة العملية بحتاج دايما اعرض داتا من كذا جدول في نفس الوقت 
--زي مثلا لو عندي عملاء بيعملوا مثلا اوردرات , لو انا عايو اعرف كل عميل و تفاصيل الاوردرات الي طلبها ساعتها لازم
--اعمل جوين بين جدول العملاء و جدول الاوردرات عشان اعرضهم مع بعض و طبعا علي حسب المشترك ما بينهم

-- JOIN has alot of types inner(the default) , outer , right , left , full
-- الجوين و احنا بنعمله لازم نحدد حاجة مشتركة بين الجداول نعمل جوين علي اساسها و غالبا ما بيكون الفورين كي



--عندنا طريقتين عشان نعمل الجوين 
--1- من خلال كويري عادية ب كونديشن 
--2- من خلال استخدام كي ورد جوين


--1 
--SELECT [Attributes of table 1] [Attributes of table2]
--FROM [Table 1] , [Table 2]
--WHERE [Mutual attribute] = [Mutual attribute]

--2
--SELECT [Attributes of table 1] [Attributes of table2]
--FROM [Table 1] 
--JOIN [Table 2] ON [Mutual attribute] = [Mutual attribute]

--Note --> Allias could be done with AS keyword to view the new name in the selected data to view
---------> it could be done with just writing [TableName.Attribute] [Any anme] --> Customer.CustomerName C
---------> الفرق بس انها مش هتتعرض و لكن ينفع تستخدها في الكويريز و تختصر الاسم الطويل بالذات في جمل الجوين , اتاكد من المعلومة دي



--1 INNER JOIN 
--  الي بيحصل فيها بيعرضلي الداتا الي مشتركين بس في الاتربيوت الي انت حددته عشان تعمل الجوين علي اساسه

--هنعمل انسيرت لشوية اوردرات عشان نعرف نستخدمها

USE SalesDataBase_Revision
INSERT INTO Sales_schema.Orders VALUES (1 , 'Or1' , 'Preparing' , '1' , NULL , NULL )
INSERT INTO Sales_schema.Orders VALUES (2 , 'Or2' , 'Preparing' , '1' , NULL , NULL )
INSERT INTO Sales_schema.Orders VALUES (3 , 'Or3' , 'Delivered' , '2' , NULL , NULL )
INSERT INTO Sales_schema.Orders VALUES (4 , 'Or4' , 'Shipped' , '3' , NULL , NULL )
INSERT INTO Sales_schema.Orders VALUES (5 , 'Or5' , 'Shipped' , '3' , NULL , NULL )

SELECT *
FROM Sales_schema.Customer

SELECT *
FROM Sales_schema.Orders


USE SalesDataBase_Revision
GO


--JOIN 1  (INNER JOIN by def)
SELECT  CustomerName  , CustomerEmail, OrderId , OrderName 
FROM Sales_schema.Customer C  , Sales_schema.Orders O
WHERE C.CustomerId = O.CustomerId


--JOIN 2  (INNER JOIN by def)
SELECT CustomerName  , CustomerAge , Sales_schema.Customer.CustomerId , OrderName , OrderState
FROM Sales_schema.Customer
JOIN Sales_schema.Orders ON Sales_schema.Customer.CustomerId = Sales_schema.Orders.CustomerId


--خد بالك , انا حاولت اعرض الاتربيوت المشترك بينهم مرتين عملي ايرور
--استخدمت ال ايليس بطريقة جديدة المرادي



SELECT CustomerName , CustomerAge , C.CustomerId , OrderName , OrderState 
FROM Sales_schema.Customer C , Sales_schema.Orders O
WHERE C.CustomerId = O.CustomerId
ORDER BY CustomerAge DESC


SELECT C.CustomerName , C.CustomerEmail , O.CustomerId , O.OrderName , O.OrderState
FROM Sales_schema.Customer C  JOIN Sales_schema.Orders O  ON C.CustomerId = O.CustomerId 
 

--كام ملاحظة
--Ambigous name --> بسبب ان في اتربيوت و غالبا بيكون المشترك ليه نفس الاسم في جدولين بالتالي هو مش عارف ده انهي واحد فيهم
------------------> عشان كدة لازم تحط اسم الجدول قبله

--Using alliases eases the queries alot
--عشان اعرف استخدم ال الايليس فوق في جملة السيليكت , حطيته  تحت الاول في جملة ال فروم 


---------------------------------------------------------------------------------------------------------------------------------------


--2 OUTER JOIN or FULL JOIN (the same)
--المرة الي فاتت في الاينر جوين كان ايه الي بيحصل ؟ كان بيعرض ليا الداتا الي في الجدول اليمين الي ليها ماتشينج مع الشمال
--و الداتا الي في الجدول الشمال الي ليها ماتشينج مع اليمين 
--يعني مثلا يعرض كل العملاء الي ليهم اوردرات مناظرة فعلا في جدول الاوردرز و يعرض الاوردرز الي ليها عملاء طلبوها فعلا
--في جدول العملاء , عشان كدة مش بيطلعلي اي حاجة ب ناال في الحاجات المشتركة

--طيب و الاوتر او الفوول جوين ؟ الي بيحصل انه مبيعتمدش اي ماتشينج , هو بيعرض الداتا الي في الجدول اليمين كلها
--و الي في الجدول الشمال كلها بس جمب بعض , و الي ملوش ماتشينج في الجدول التاني بيحط الخاة المناظرة له في الجدول التاني ب نااال
--من الاخر بيعرض كل حاجة يعني

SELECT C.CustomerName , C.CustomerAge , C.CustomerId , O.OrderId , O.OrderName , O.OrderState
FROM Sales_schema.Customer C 
FULL JOIN  Sales_schema.Orders O ON C.CustomerId = O.OrderId

--FULL is the same as OUTER

SELECT C.CustomerName , C.CustomerEmail , C.CustomerId , O.OrderId , O.OrderName , O.OrderState
FROM Sales_schema.Customer C
FULL OUTER JOIN  Sales_schema.Orders O 
ON C.CustomerId = O.OrderId

--Use [ FULL OUTER JOIN ] OR [FULL JOIN] --> [OUTER JOIN] Will excute error


------------------------------------------------------------------------------------------------------------------------------


--3 - LEFT & RIGHT JOIN
--اي الي هيختلف هنا بقا ؟ احنا قولنا في الاينر جوين انه بيعرض الداتا الي علي اليمين الي ليها ماتشينج في الجدول الشمال
--و بيعرض الداتا الي علي الشمال الي ليها ماتشينج علي اليمين و دول بس الي بيتعرضوا , الباقي من هنا او من هنا 
--لو ملوش حاحة مشتركة  مع الجدول التاني مش هيتعرض بالتالي زي ما قولنا مش بيظهر في الخانات المشتركة اي حاجة ب ناال
--و في الفوول او الاوتر جوين ؟ قولنا انه مش بيعتمد اي ماتشينج , هو بيعرض الداتا الي علي اليمين كلها
--و الي علي الشمال كلها و الي ملوش ماتشينج في الجدول المناظر بيحط الخانة المناظرة له ب ناال
--يعني مثلا لو في عميل مطلبش اي اوردر , ساعتها هيعرضه  وهيعرض جمبه الاورد اي دي و الاوردر نيم مثلا ب ناااااال
--و العكس برضه لو في اوردر ملووش عميل طلبه , ساعتها هيعرضه بس هيعرض جمبه اسم العميل و الاي دي ب نااال
--الكلام ده مكنش بيظهر اصلا في الاينر جوين

--طب اي الجديد في الليفت و الرايت جوين ؟
--الجديد هنا اني بختار اعرض جمب من الجمبين بس كله حتي لو ملوش ماتشينج مع الجدول التاني
--و لكن الجمب التاني مش هيتعرض الا الي له ماتشينج بس برضه
--يعني ايه يعم الكلام ده؟
--ببساطة مثلا هنكمل علي مثال العملاء و الاوردرز , لو العملاء هو الجدول اليمين و الاوردرز هو الجدول الشمال
--ساعتها لو انا عملت رايت جوبن بينهم
--هيعرض الداتا الي في الجدول اليمين كلها حتي لو ملهاش ماتشينج , اما الجدول الشمال هيعرض الي له ماتشينج بس
--يعني مثلا لو في عميل مطلبش اي اوردر هيعرضه و هيعرض جمبه الاوردرات ب نااال
--لكن لو في اوردرات مفيش عميل طلبها مش هيعرضها خاااالص , و طبعا العكس صحيح في حالة ال ليفت جوين
--بس كدة ده الموضوع


--هنا مثلا عملت ليفت جوين , بالتالي هيعرض كل العملاء حتي لو ملهومش ماتشينج
--يعني مطلبوش اوردرات بالتالي مفيش بال اي دي بتاعهم اي اوردرات مناظرة في جدول الاوردرز , الي ملوش اوردرات هيحط في الاوردات نااال
SELECT C.CustomerName , C.CustomerCity , C.CustomerAge , C.CustomerId AS Cid , O.CustomerId , O.OrderName , O.OrderState
FROM Sales_schema.Customer C 
LEFT JOIN Sales_schema.Orders O 
ON C.CustomerId = O.OrderId




--هنا عملت العكس , هيعرض كل الاوردرات حتي لو محدش طلبهم يعني بالاي دي المشترك مع جدول العملاء
--مفيش اي عميل مناظر ليهم طلبهم
SELECT C.CustomerName , C.CustomerCity , C.CustomerAge , C.CustomerId AS Cid , O.CustomerId , O.OrderName , O.OrderState
FROM Sales_schema.Customer C 
RIGHT JOIN Sales_schema.Orders O 
ON C.CustomerId = O.OrderId

--خد بالك الطريقة الاولي لعمل الجوين تنفع مع الاينر جوين فقططط

------------------------------------------------------------------------------------------------------------------------------


--Joining more than 2 tables
--ساعات بكون محتاج اني اعرض الداتا من 3 او 4 جداول , ساعتها لازم احتاج اني اعمل جوين من اكتر بين اكتر من جدول
--و ساعات تانية مثلا بحتاج اني اعمل جوين بين جدولين عادي و لكن مفيش رابط مباشر ما بينهم , ساعتها بحتاج اني اربط بينهم من خلال
--جدول وسيط بينهم
--و عامة فكرة الربط بين اكتر من جدول بتعتمد علي اني عندي جداول وسيطة


-- JOIN 1 (without using join keyword)

--هنعمل انسيرت للستور
INSERT INTO Sales_schema.Store VALUES (1 , 'E-tech' , 'Alex' , 'Eg')
INSERT INTO Sales_schema.Store VALUES (2 , 'A-tech' , 'Cairo' , 'Eg')
INSERT INTO Sales_schema.Store VALUES (3 , 'C-tech' , 'Menof' , 'Eg')
INSERT INTO Sales_schema.Store VALUES (4 , 'B-tech' , 'PortS' , 'Eg')

UPDATE  Sales_schema.Orders
SET StaffId = 40
WHERE OrderId = 5 OR OrderId = 4


SELECT O.OrderName , O.OrderState , S.StaffName , S.StaffGender , St.StoreName , St.StoreName
FROM Sales_schema.Orders O , Sales_schema.Staff S , Sales_schema.Store St
WHERE O.StaffId = S.StaffId AND O.StoreId = St.StoreId


--خد بالك لازم يكون في حاجة مشتركة او وسيط عشان تعرف تنفذ الدمج بين اكتر من جدول
--لازم تتاكد ان القيم مظبوطة عشان تعرف تعمل الدمج , حتي تلاحظ اننا عملنا انسيرت و ابديت في الستاف و الستور عشان نعرف نطبق المبدأ بتاعنا
--لو متلغبط ممكن تراجعه تاني


------------------------------------------------------------------------------------------------------------------------------