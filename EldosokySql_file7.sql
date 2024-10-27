
--Aggregate functions

--لسة مكملين في ال
--DQL ---> وهي ز يما قولنا مسئولة عن عرض الداتا بس مش بتغير فيها
--سواء السيلكت او الجوين او الاجرجريت فانكشنز , هما بيتحكموا بس في طريقة عرض الداتا لكن مش بيغيروا في الداتا نفسها

--Aggregate functions 
--هي بيلت ان فانكشنز موجودة في السيكوال اصلا بتاخد مني احد الجداوب ك انبوت و ترجع ليا قيمة واحدة

--MAX() , MIN() , AVG() , SUM() , COUNT() , COUNT(*) , MAX( DISTINCT | --- ) , MIN(DISTINCT | ---) ,,,,,

--كل واحدة منهم بترجع قيمة معينة , اما اكبر قيمة في جدول معين او اقل قيمة في جدول معين و هكذااا
--COUNT() --> بتعد عدد القيم الي في الكولوم و مبتعدش القيم الي ب نااال
--COUNT(*) --> بتعد عدد القيم الي في الجدول و بتحسب معاهم القيم الي ب ناال

--AVG() --> بتجيب الافريدج بتاع كل القيم الي في الكولوم حتي المتكرر فيهااا
--AVG(DISTINCT ---) --> بتجيب الافردج بتاع القيم الي في الكولوم من غير ما تحسب المتكرر

--ممكن تطبقها عادي علي باقي الاجريجيت فانكشنز و لكن مثلا في حالة الماكس و المينيمم هتلاقيها هي هي ف مش منطقي تستخدمها


USE SalesDataBase_Revision
GO

SELECT MAX(Sales_schema.Customer.CustomerId)
FROM Sales_schema.Customer


--Using alliases
SELECT MAX(Sales_schema.Orders.OrderId) "MaxId"    --  "AlliasName" another way to make allias
FROM Sales_schema.Orders


SELECT MAX(SalesDataBase_Revision.Poduction_schema.Brand.BrandId) AS MaxBrandId 
FROM SalesDataBase_Revision.Poduction_schema.Brand


SELECT MIN(Sales_schema.Customer.CustomerAge) "MinAge" , MAX(Sales_schema.Customer.CustomerId) AS 'MaxId' , COUNT(Sales_schema.Customer.CustomerEmail)
FROM Sales_schema.Customer


SELECT COUNT(Sales_schema.Customer.CustomerState) AS CountWithoutNull , COUNT(*) "CountWithNull"
FROM Sales_schema.Customer


SELECT AVG(Sales_schema.Orders.CustomerId) "AvgWithتكرار" , AVG(DISTINCT Sales_schema.Orders.OrderId) AS "AvgWithoutتكرار"
FROM Sales_schema.Orders


SELECT SUM(SalesDataBase_Revision.Poduction_schema.Brand.BrandId) AS 'مجموع الاي ديز'
FROM SalesDataBase_Revision.Poduction_schema.Brand


SELECT SUM(DISTINCT SalesDataBase_Revision.Poduction_schema.Brand.BrandId) AS 'مجموع الاي ديز'
FROM SalesDataBase_Revision.Poduction_schema.Brand  --كدة كدة الاي دي مبيتكررش ف هي هي

--Making alliases
--1 Using AS key word
--2 USing [Table name or Attribute name] allias_name
--3 Using [Table name or Attribute name] "allias_name"

--حاول تدور او تشوف لو في فروقات ما بينهم في الاستخدام

-- COUNT() --> بتعدد عدد القيم الي في الكولومن
-- SUM()   --> بتحسب مجموع القيم دي كام


--ممكن كمان تستخدم الاجريجيت فانكشنز مع ال كونيشنز
--يعني مثلا هاتلي اعلي اي دي لكل الي اسمهم زياد

SELECT MAX(Sales_schema.Customer.CustomerId) AS 'MaxZiadId' 
FROM Sales_schema.Customer
WHERE CustomerName = 'Ziad'



------------------------------------------------------------------------------------------------------------------------------


--GROUP BY() clause

--اي هي الجروب باي ؟ هي اداة دايما بتستخدم مع الاجريجيت فانكشنز
--طب لازمتها ايه؟ ببساطة الاجريجيت فانكشنز لما بطبقها علي كولومن معين , بتتنفذ جينيرال علي الكولومن كله
--يعني بتحسب مثلا اكبر او اصغر اي دي في كولوم الاي دي
--طب افرض مثلا انا عايز اقسم النتيجة الي هتتعرض ليا ل جروبات , بمعني اني مثلا اقسمهم لجربات علي حسب الاسم
--يعني مثلا يشوفلي اكبر اي دي لكل اسم موجود , مثلا يشوفلي اكبر اي دي للي اسمهم زياد و اكبر اي دي للي اسمهم محمد و هكذا علي كل الاسماء
--لاني عامل جروب باي نيم , بالتالي هو هينفذ و يرجع النتيجة في شكل جروبات علي حسب حاجة معينة
--احنا كنا طبقنا حاجة قريبة شوية من المفهوم ده فوق لما عملنا الاجريجيت فانكشن مع كونديشن


SELECT Sales_schema.Customer.CustomerName , MAX(Sales_schema.Customer.CustomerAge)
FROM Sales_schema.Customer
GROUP BY Sales_schema.Customer.CustomerName

--هنا هو بيعرض اكبر سن علي حسب كل اسم يعني اكبر سن للي اسمه زياد و اكبر سن للي اسمه احمد و و اكبر سن للي اسمه علي و هكذا


--طب افرض انا عايز اخصص الموضوع شوية و اضيف كونديشن مثلا 
--ساعتها بنستخدم كي ورد
--HAVING [Condition]

SELECT Sales_schema.Customer.CustomerName , MIN(Sales_schema.Customer.CustomerAge) AS MinAge
FROM Sales_schema.Customer
GROUP BY Sales_schema.Customer.CustomerName
HAVING CustomerName = 'Ziad' 


SELECT Sales_schema.Customer.CustomerName , MIN(Sales_schema.Customer.CustomerAge) "MinAge"
FROM Sales_schema.Customer
GROUP BY Sales_schema.Customer.CustomerName
HAVING MIN(Sales_schema.Customer.CustomerAge) > 25


--لو انت مستخدم اجرجيت فانكشنز في جملة السيلكت مينفعش تعرض جمبها كولومز عادية
--الا الي هتستخدمها مع الجرووب باي بسسس
SELECT Sales_schema.Customer.CustomerName , CustomerAge , MIN(Sales_schema.Customer.CustomerAge) "MinAge"
FROM Sales_schema.Customer
GROUP BY Sales_schema.Customer.CustomerName

--هنا مثلا في المثال الي فوق انا مستخدم اجرجيت فانكشن بالتالي مينفعش استخدم كولوم عادي الا لو هعمل بيه تحت جروب باي
--ف هنا مثلا الكاستومر نيم ينفع احطه عادي لاني مستخدم في الجروب باي
--اما الكاستومر ايدج ميينفعش استحدمه لاني و لا مستخدمه في الاجرجيت فانكشن و لا بعمل بيه جروب باي

--راجع الجروب باي مع الجوين , مع اكتر من عمود يعني
--اتاكد اذا كان ينفع تعمل اكتر من جملة جروب باي في نفس الكويري ولا لا

--رااااااااااااجع الجوين مع الجروب باي مع الاوردر باااااي
--انا عديتها للامانة بس لازم ترجعلها مهمةة جداااااااا و ليها فيديو منفصل

----------------------------------------------------------------------------------------------------------------------------------


--SELECT TOP / SELECT TOP WITH TIES

--SELECT TOP [num/ num PERCENT] or you can put them in ()  [Attribute/Column name]
--FROM [Table name]

--اي فكرة السليكت توب ؟ هي بسيطة جداا هي كالعادي ز ي ما احنا لسة في ال دي كيو ال لسة مجرد بنتحكم في طريقة عرض الداتا
--السيليكت توب لوحدها بتعرض ليا الكذا ريكورد الي في قمة الكولومن و الكذا دي يا اما رقم بنحدده يا اما نسبة بنحددها برضه

SELECT TOP 3 Sales_schema.Customer.CustomerId   --هنا مجرد هيعرضلي اول 3 قيم بس للكولومن بتاع ال الاي دي 
FROM Sales_schema.Customer


--بس في الحقيقة يعني السيليكت توب في العادة او في اغلب الاوقات يعني بتستخدم مع الاوردر باي
--لاني ببقي محتاج مثلا اعرض اكبر 3 عملاء في السن مثلا او اكبر 10 في المية من العملاء مثلا من حيث الاي دي و هكذااا

SELECT TOP (3) Sales_schema.Customer.CustomerName , Sales_schema.Customer.CustomerAge 
FROM Sales_schema.Customer
ORDER BY Sales_schema.Customer.CustomerAge
--هنا مثلا في المثال الي فات ده هيغرض توب 3 اسماء العملاء و اعمار التلاتة بس مش الاعمار كلها



--ممكن تكتب رقم او نسبة 
SELECT TOP 10 PERCENT Sales_schema.Customer.CustomerName , Sales_schema.Customer.CustomerAge
FROM Sales_schema.Customer
ORDER BY Sales_schema.Customer.CustomerAge

--لو نسبة القيم الي هتتغرض طلعت رقم كسر بيقرب للرقم الاكبر , مفيش حاجة مثلا اسمها 11 قيمة و نص



--SELECT TOP WITH TIES
--هي هي بتادي نفس الوظيفة بس في اختلاف بسيط
--هنا الي بيختلف انه بتجيب برضه التوب للقيم علي حسب انت عايز توب كام و لكن الجديد هنا انها بتبص علي اخر قيمة من القيم التوب
--و بتبدأ تشوف هل القيمة دي متكررة او يعني بيناظرها مثلا اسماء تانية ساعتها هيعرضهم كلهم
--لو ملغبطاك راجعها

SELECT TOP (50) PERCENT WITH TIES Sales_schema.Staff.StaffName , Sales_schema.Staff.StoreId
FROM Sales_schema.Staff
ORDER BY Sales_schema.Staff.StaffId DESC


--ORDER BY ---> By default is ASCENDING
--السيليكت توب هي جملة سيليكت عاديييييية جدااا و لكن الفرق بس انها بتعرضلي في اعلي القائمة
--عشان كدة لازم تحط بعدها الكولوم الي عايز تعمله سيلييييكت زي حملة السيليكت العادية
--ركزززز في دي اووووي


--SELECT [COLUMN to select] , [COLUMN to select] , [COLUMN to select],,,,,,
--FROM [Table name]

--نفس الستراكشر بالظبط للسيليكت توب
--SELECT TOP [رقم او نسبة ] [COLUMN to select] , [COLUMN to select] , [COLUMN to select],,,,,,
--FROM [Table name]

--ممكن تحط الرقم او النسبة علطول بعد ال توب
--TOP 1 , TOP 2 , TOP 3 PERCENT ,,,,,,,

--او ممكن تحطهم في قووس
--TOP(1) , TOP(5) , TOP(10) PERCENT , TOP (15) PERCENT , TOP (12)PERCENT , TOP(20)PERCENT --> زي ما انت شايف المسافات مش بتفرق


--Recall SELF & CROSS JOIN