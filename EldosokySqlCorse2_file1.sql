
-- T-Sql (Transict Sql)
--Coures 2

--هنا في الكورس ده هنبدأ نتعلم حاجات ادفانسد شوية في ال سيكوال
--What is T-Sql ? 
--ببساطة هي مجموعة اوامر زيادة ضافتها مايكروسوفت علي السيكوال الاساسي و هو خاص ب ال سيكوال سيرفر بس
--We can say , T-Sql is an extension for Sql from Microsoft
--Sql --> the standard language

--1 -Stored procedure
--SQL Server stored procedures are used to group one or more Transact-SQL statements into logical units. 
--The stored procedure is stored as a named object in the SQL Server Database Server.


--When you call a stored procedure for the first time, SQL Server creates an execution plan and stores it in the cache. 
--In the subsequent executions of the stored procedure, 
--SQL Server reuses the plan to execute the stored procedure very fast with reliable performance.

--ببساطة يا صديقي الي بيحصل انك لما بتحفط مجموعة اوامر  ك ستورد بروسيدجر 
--الكومبايلر او البرنامج بيحفز ال
--Excution plan 
--بتاعته في ذاكرة الكاش , بالتالي لما تيجي تستدعيه اول مرة بيكريت البلان دي و يحفظها في الكاش
--بالتالي لما تيجي تستعديه او تعمله كوول يعني بعد كدة بينفدذ ال
--Excution plan 
--الي حفظها في الكاش دي علطول و دا طبعا بيخلي الاداء اسرع كل مرة
--الموضوع كمان جانب تنظيمي عظيم انك تقسم الفايل بتاعك لمجموعة من البروسيدجرز
--افهم اكتر عن ال 
--Excution plan 
--و تفاصيلها


--Stored procedure implimentation



--CREATE PROCEDURE [ProcedureNAme] 
--AS
--BEGIN
--[All quereies to save inside the procedure ]
--End ;

--BEGIN , END --> مش مضطر تحطها بس هي جانب تنظيمي و للاحتياط برضه عشان تضمن انك حاطط التاسكات الي عايز تحفظها بينهم
              --> و ميحصلش ايرورز



--Calling the Procedure
--EXEC [ProcedureNAme] ;




--Ex: Implimenting a procedure
---------------------------------------------------------

USE BikeStores
GO 

CREATE PROCEDURE BrandOverTheAvgProcedure 

AS

BEGIN

SELECT 
     production.brands.brand_name ,
	 production.brands.brand_id 

FROM 
     production.brands 

WHERE 
     production.brands.brand_id > (SELECT AVG(production.brands.brand_id) FROM production.brands)

END ;
	 
---------------------------------------------------------



--Calling the EX procedure
EXEC BrandOverTheAvgProcedure ;


--تقدر كمان تعمل موديفيكيشن او التر يعني للبروسيدجر و تغير الي جواهااا
--اتاكد كدة لما تغيرها اي الي هيختلف في الاكسيكيوشن بلان
--رايت كليك علي البروسيدجر من الاوبجكت اكسبلورر و اتكي علي موديفاي


--طيب كل الي فات ده كان كله 
--Static procedure 

--بمعني اننا بنتكلن عن برويبدجر بترجع نفس ال ريزلت سيت كل مرة
--و ده طبيعي لانها بلوكة واحدة و بتتكرر , حتل لو انا عدلت فيها لكنها في الاخر هتتنفذ برضه بشكل ثابت كل مرة 
--زيادة عليها التعديل بس


--يعني معني كدة انها مبتاخدش اي بارمترز لا انبوت ولا اوتبوت
--طيب عشام نخليها دايناميك يعني تغير ال ريزلت سيت علي حسب الانبوت بارمتر الي مدخله ليها
--و ترجع ليا مثلا اوتبوت بارمتر فيه مثلا عدد الصفوف في ال ريزلت سيت دب
--ساعتها لازم نعمل ال بروسيدجر
--Dynamic procedure

--ببساطة الي هنزوده بس علي البروسيدجر العادية , اننا هنضيف ليها بارمترز سواء انبوت ندخلها , او اوتبوت نستناه ك ريترن 
--لتنفيذ البروسيدجر دي تحديدا بالانبوت ده تحديدا

--ممكن تعمل بروسيدجرر جديدة و تحط فيها البارمترز او تعمل التر ل بروسيدجر قديمة و تضيف ليها البارمتر





--Implimentation of Dynamic procedure

USE BikeStores
GO 

CREATE PROCEDURE DynamicFindProduct(@Price AS INT)  --INPUT PARAM (@ParamName AS DATATYPE)

AS

BEGIN

SELECT production.products.product_name , product_id FROM  production.products
WHERE  production.products.list_price = @Price 

END ;


EXEC DynamicFindProduct 200 ;







--ALTER THE PROCEDURE --> Using [ > ] rather than [ = ]
USE BikeStores
GO 

ALTER PROCEDURE [dbo].[DynamicFindProduct](@Price AS INT)  --INPUT PARAM

AS

BEGIN

SELECT production.products.product_name , product_id FROM  production.products
WHERE  production.products.list_price > @Price 

END ;



EXEC DynamicFindProduct 200 ;




--ممكن نحط كمان البارمترز دي اوبشنال , يعني اليوزر يدخل قيم ليها او لا و في قيمة ديفولت تتنفذ لو مدخلش حاجة 
--ممكن تجخل البارمتر كدة 
--EXEC Proced1 
-- @Param1 = [] 
-- @Param2 = []
--

--ممكن كمان تعمل اةتبوت بارمتر يرجع ريترن معين علي حسب ال ريزلت سيت دي
--لازم تكتب جمبه 
--OUTPUT ---> عشان يكون اوتبوت بارمتر
--الانبوت مش محتاج تكتب جمبه انبوت
--ممكن نحط في البروسيدجر اي عدد من البارمتر سواء انبوت او اوتبوت



--هنطبق كل دول في المثال الي جاي



--------------------------------------------------------------------------------
--Ex: 
USE BikeStores
GO

CREATE PROCEDURE DynamicFind (
       @LowPrice AS INT = 200 ,
	   @HighPrice AS INT = 2000 ,
	   @CountOfRows AS INT OUTPUT 
)

AS 

BEGIN

SELECT 
      production.products.product_name ,
	  production.products.product_id

FROM 
      production.products

WHERE
      products.list_price BETWEEN @LowPrice AND @HighPrice

SELECT @CountOfRows = @@ROWCOUNT 

END ;


--Caling EX procedure

DECLARE @Count AS int  ;

EXEC DynamicFind 
@LowPrice  = 50 ,
@HighPrice =  200 ,
@CountOfRows = @Count ;


--حاول تفهم حتة الديكلير دي 
--و كمل الي ناقص هناا
--و حاول تعرف ليه الاوتبوت مش بيظهر مع اني عامله سيليكت


------------------------------------------------------------------------------------------------------------------


--Functions
--هي تعتبر نفس الستورد بروسيدجر في الفكرة و التطبيق
--بس في كام فرق هنا

--اولا ان الفانكشن لازم كدة كدة ترجع ريتيرن , ده كدة كدة غصب عنك لكن الستورد بروسيدجر
--مكنش شرط تدخله بارمتر او تطلع منه ريتيرن

--الفرق التاني انه الفانكشن انت تقدر تستخدمها عادي في جملة سيليكت زي
SELECT MAX(production.brands.brand_id)  FROM production.brands

--اما الستورد بروسيدجور لازم تستدعيه ب كي ورد اكسكيو
EXEC DynamicFindProduct 100 

--الفانكشن بقا نوعين يعم الحج
--بيلت ان فانكشنز و دي بتبقي موجودة جواا السيكوال مكتوبة من قبل كدة و تقدر تستخدمها علطول زي الاجرجيت فانكشنز مثلا
--و ليها كذا نوع 
--Numeric , String , Date , System

--انا عملتلهم سكيب الصراحة فانت مهممممممممممم اوي تبص عليهم كلهم و طريقة استخدامهم 
--و تحفظ المهم منهم


--النوع التاني من الفانكشنز هي ال يوزر ديفيند فانكشنز  وهي فانكشنز انت الي بتعملها بنفسك
--و تقدر تستدعيها زي ما قولت و كمان تستخدمها في جملة السيليكت عادي جداا , عكس البروسيدجور مكنش ينفع 
--تستدعيه الا من خلال ال كي ورد اكسكيو


--راااااجع البيلت ان فانكشنززز من الديكومنتيشن متنساااااش 


--Recall--------------------------------------------------------------------------------------------------------
CREATE TABLE Table1 (

FirstN INT , 
LSDT INT ,
SDCD  VARCHAR(23) , 
SSN INT NOT NULL , 
Table2PK INT 

--Constraints Table
CONSTRAINT K1 PRIMARY KEY (SSN) ,
CONSTRAINT K2 UNIQUE(FirstN) , 
CONSTRAINT K3 FOREIGN KEY (Table2PK) REFERENCES Production.brands


)


--TRUNCATE , Difference between TRUNCATE & DELETE
--In SQL, the TRUNCATE statement is used to delete all rows from a table quickly and efficiently, without logging individual row deletions.
--Here are some key points about TRUNCATE:

--Speed: It is generally faster than the DELETE statement because it does not generate individual row delete logs.

--No WHERE Clause: Unlike DELETE, TRUNCATE cannot be used with a WHERE clause. It removes all records in the table.

--Table Structure: It does not affect the table structure, including its schema, indexes, or constraints.

--Transaction Log: In most databases, 
--TRUNCATE uses less transaction log space because it logs the deallocation of data pages rather than individual row deletions.

--Cannot Be Rolled Back: In some databases, if TRUNCATE is executed outside of a transaction, it cannot be rolled back, 
--making it a more permanent operation than DELETE.

--Permissions: Generally, you need higher permissions to execute a TRUNCATE operation compared to DELETE


--من الاخر كدة هي وظيفتها انها بتمسح كل القيم الي في الجدول و ترجعه فاضي تاني
--هي هي نفس الديليت بالظبط بس الديليت ممكن تاخد كونديشن و  تمسح ريكوردز او صفوف بعينها بس
--لكن ترانكيت بتمسح كل الريكوردز الي في الجدووول كلهاااا

TRUNCATE TABLE Table1  -- لازم تكتب ترانكيت تابل مش تابل بس
DROP TABLE Table1      -- هنا برضه لازم تكتب دروب تابل مش دروب بس

------------------------------------------------------------------------------------------------------------------


--User defined functions

--هي فانكشنز بتعملها بنفسك و ليها فانكشناليتي معينة انت الي بتحددها
--و زي مقولنا الفانكشز لازم يكون ليها ريتيرن


--الفانكشنز كمان ليها انواع

--Scaller functions 
--هي الفانكشنز الي بتاخد مني بارمتر او اكتر و ب تريترن ليها فاليو واحدة

--لو الفانكشن بتاعتك مش بيلت ان لازم تنادي باسم ها الكامل الي هو قلها اسم الاسكيما بتاعتها



--Implemtation

--CREATE FUNCTION [schema_name.]function_name (parameter_list)
--RETURNS data_type AS
--BEGIN
--    statements
--    RETURN value
--END

--EX:



CREATE FUNCTION production.SumNums(
@num1 INT ,
@num2 INT 
)

RETURNS INT AS
BEGIN

RETURN @num2 + @num1 ;
 
END ;


SELECT production.SumNums(10 , 20) AS Sum ;


--راجع الفانكشنز كويس اوووي و السينتكس بتاعها و تفاصيلهااا من جواااااا


--راجع الكورس التااااانس عاااااامة مهم جدااااا تراجعه كويس جدااا جدااااا