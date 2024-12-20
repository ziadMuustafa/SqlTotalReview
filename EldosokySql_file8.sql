﻿
--Sub queries (Nested queries)

--ايه هي ال سب كويريز؟ ببساطة وانا شغال علي كويري عادي لقيت ان في معلومة معينة انا محتاجها في النص مش عارفها
--فالحل ببساطة برضه اني اعمل كويري تانية داخلية تجبلي المعلومة دي عشان اعرف اكمل الكويري بتاعتي

--مثلا لو عايز اجيب معلومات عن العملاء الي سنهم اكبر من متوسط اعمار العملاء كلهم 
--ساعتها هعمل ايه؟ هعمل كويري ا سيلكت بيها بيانات العملاء عادي بس و انا بكتب الكونديشن 
--هحتاج اني اقارن بالقيمة الافريدج , ساعتها لازم اعمل كويري داخلية احسب بيها الافريدج عشان اعرف استخدمه
--و اقارن بيه


--الكويري الخارجية اسمها 
--Outer query / Alter query

--و الداخلية اسمها 
--Nested query / sub query

--الكويري الكاملة بقا اسمها 
--Total query مثلا 



SELECT Sales_schema.Customer.CustomerAge , Sales_schema.Customer.CustomerCity
FROM Sales_schema.Customer
WHERE CustomerAge > (
SELECT AVG(Sales_schema.Customer.CustomerAge) FROM Sales_schema.Customer --Nested query
)
--هنا مثلا في المثال الي فات انا الي كان ناقصني اني اعرف الافريدج بكام عشان اخده
--اقران بيه في جملة الكونديشن , عشان كدة عملت السب كويري دي عشان احسبها و اقران بيها





--مثلا عايز اجيب معلومات العميل الي ليه اكبر عمر
--قبل ما نعرف السب كويريز كنا عملناها عن طريق اننا نرتب العملاء حسب العمر و ناخد توب 1
--لكن دلوقتي عايزين نعملها بالسب كويريز
SELECT Sales_schema.Customer.CustomerAge, Sales_schema.Customer.CustomerName , Sales_schema.Customer.CustomerPhone
FROM Sales_schema.Customer
WHERE Sales_schema.Customer.CustomerAge = (
SELECT MAX(Sales_schema.Customer.CustomerAge) FROM Sales_schema.Customer
)




--Nested queries with JOIN

--مثلا عايز اجيب معلومات العملاء الي طلبوا اوردرات الاي دي بتاع الاوردر فيهم اكبر من المتوسط

SELECT C.CustomerName , C.CustomerAge , C.CustomerCity , O.CustomerId , O.OrderId , O.OrderName
FROM Sales_schema.Customer C 
JOIN Sales_schema.Orders O ON C.CustomerId = O.CustomerId
WHERE O.OrderId > (
SELECT AVG(Sales_schema.Orders.OrderId) FROM Sales_schema.Orders
)



--ممكن تكون السب كويري نفسها فيها جوين
--راجع مثال علي الحتة دي



--ALL/ANY

--دلوقتي انا كل مرة لو تلاحظ عندي معلومة بس بتكون ناقصة غالبا بتكون في جملة الكونديشن او الوير
--عشان كدة بعملها سب كويري , ف حتي الان الي بيحصل ان السب كويري دي بترجع ليا قيمة واحدة
--سواء الماكس مثلا او الافريدج او غيره و ناخدها علطول نستخدمها في جملة الكونديشن و نكمل بيها الكويري الكبيرة
--طب افرض السب كويري دي رجعتلي قيم  كتير , اكتر من صف يعني او اكتر من روو ؟ ساعتها هل اقدر استخدمهم 
--في جملة الكونديشن العادي  ب > او  > او = , هل ده ينفع ؟ الاجابة لا لان ببساطة الاكبر من و الاصغر من و اليساوي
--هي باينري اوبريتورز لازم تاخد معاملين بس , و انا راجعلي من السب كويري كذا قيمة 
--هنا بقا تيجي فايدة ال
--ALL() , ANY()
--ببساطة بقدر استخدمهم مع الاكبر من و الاصغر من و اليساوي عادي هنا في الحالة دي
--WHERE [SOME THING ] > ALL( [SUB QUREY RETURN] ) --> لو القيمة الي عندي اكبر من كل القيم الي راجعة من النيست كويري
--WHERE [SOME THING ] > ANY( [SUB QUREY RETURN] ) --> لو القيمة الي عندي اكبر من اي قيمة من القيم الي راجعة من النيست كويري
                                                  --> حتي لو اصغر قيمة




--مثال مثلا , عايزين نجيب بيانات الستاف كلهم الي الاي دي بتاعهم اكبر من اكبر اي دي للاوردرات الي الموجودة كلها

SELECT * 
FROM Sales_schema.Staff S  JOIN Sales_schema.Orders O
ON S.StaffId = O.StaffId
WHERE S.StaffId > ALL (SELECT O.OrderId FROM Sales_schema.Orders)



-- لو نفس الفكرة عملناها ب 
-- ANY()
-- ساعتها هيجيب الي الاي دي بتاعهم اكبر من اي عنصر في الاوردر اي دي حتي لو اصغر اوردر اي دي


--NESTED QUERY ---> كويري عادية جدااااااا بتبدأ بجملة سيليكت في الطبيعي
--ALL()/ANY()  ---> ALL( NESTED QUERE --> START WITH SELECT ) , ANY( NESTED QUERY --->START WITH SLELECT )


--انما ال 
--IN() , BETWEEN() --> مفيهومش مشكلة عادي لانهم بياخدوا قيم كتير او رينج عادي




-----------------------------------------------------------------------------------------------------------------------



--VIEWS
--اي هي الفيوز ؟ ببساطة دلوقتي مثلا لو انت كتبت كويري معينة بترجع داتا معينة 
--و احتجت انك تستخدم الكويري دي تاني و تشوف الداتا الي بترجعها , هل كل مرة المفروض تكتب الكويري دي تاني ؟
--طبعا اكيد لا ف كان الحل ببساطة انك تحفظ الكويري دي بالريتيرن بتاعها بحيث لما تعوز تستدعيها تكتب اسمها بس في جملة السيليكت
--و حاجة كمان مفيدة في السيكيوريتي , لو مثلا عايز تعرض داتا معينة لبعض اليوزرز و تخفي عنهم الباقي
--هتحط الداتا دي في فيو و تعرضها ليهم و باقي الداتا تخفيها عنهم
--اعرف اكتر عن علاقة الفيوز بال 
--DataBase Cataloge




--Creating th view---------------------------------------------------------------------------------

USE SalesDataBase_Revision
GO

CREATE VIEW CustomerInfoForGreaterThan25Yrs 

AS 

SELECT 
      Sales_schema.Customer.CustomerName ,
	  
	  Sales_schema.Customer.CustomerCity , 

	  Sales_schema.Customer.CustomerPhone , 
	  
	  Sales_schema.Customer.CustomerState

FROM 
      Sales_schema.Customer

WHERE  
      
	  Sales_schema.Customer.CustomerAge > 25  ;   --ألطريقة الي كاتب بيها الكويري دي هي الستاندرد ك مسافات يعني و تنظيم


------------------------------------------------------------------------------------------------


--Retriving the view

SELECT *
FROM CustomerInfoForGreaterThan25Yrs  



--خد بالك الفيو ممكن تتعامل معاه علي انه جدول عادي جدااا
--يعني تنفذ علي ابديت و ديليت و التر عادي جداا
--بس تاخد بالك وانت بتعمل انسيرت مثلا , لازم الفيو يكون جوااااه كل الاتريبيوتس او الكولومز الي مبتاخدش نااال و البرايمري كي
--لانك مينفعش باي حال من الاحوال تعمل انسيرت من غير ما تحط قيم للبرايمري كي لو مكنتش عاملة ايدينتيتي و كمان الكولومز الي 
--NOT NULL
--لانك في النهاية بتعمل انسيرت لصفوف جديدة خد بالك  
--فلازم تخدل قيم للبرايمري كي و الكولومز النوت نااال
--لو عايز تعدل قيمة بعينها في جدول بعينه في كولوم بعينه , تقدر تستخدم ابديت


--ممكن تطبق اكتر علي الالتر و الابديت و الديليت و الانسيرت لل فيو

--Recall the revision video of sql level 1

--الديستينكت بتيجي بعد او مع السيليييكت علطوووول
--SELECT DISTINCT [ANY THING]
--FROM [ANY THING]
--WHERE [ANY CONDITION] --> ممكن تستخدم كونديشن علي حسب محتاج تعرض ايه و ممكن متستخدمهوش

-- CITY LIKE '%---'  OR  CITY LIKE '%---'  OR  CITY LIKE '%---'  OR  CITY LIKE '%---'  ---> كدة صح
-- CITY LIKE '%---'  OR  LIKE '%---'  OR  LIKE '%---'  OR  LIKE '%---'  ---> كدة غلط

--SUBSTR(STRING , START , LENGTH) --> Built in function in MySql no in Sql server

--راجع و شوف فيدويهات المراجعة الي اخر كورس 1
--Revision 1 , 2 , 3



--بس كدة


