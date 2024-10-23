USE EldosokyCourseDataBase
GO 

--دلوقتي هنتكلم عن تالت نوع من الكونسترينتس وهو ال

--CHECK constraint
--وهو ببساطة بيحدد لياا في كل عمود القيمالي ينفع تخشه سواء اكبر من قيمة معينة او اصغر او بين رينج معين او مثلا بيساوي قيمة معينة
--زي مثلا ان المرتب لازم يكون اقل من 15000 و اكبر من 3000
--فساعتها نستخدم ال تشيك كونسترينت عشان نحد  القيم الي يقبلها العمود ده
--We can use (BETWEEN -- AND --) , ( --  = -- ) , ( -- > --) ,,,,,

CREATE TABLE Sales_schema.Staff(

StaffId int ,
StaffName varchar(30) not null,
StaffSalary numeric(7,2) not null ,  -- numeric data type represents the decimal , with fractions  (total num of digits , num of fractions)
StaffUniNakeName varchar(10) ,


--Constraints table
CONSTRAINT StaffFK PRIMARY KEY (StaffId) ,
CONSTRAINT StaffUniNameUnique UNIQUE (StaffUniNakeName) ,
CONSTRAINT StaffSalaryCHECK CHECK (StaffSalary > 10000  AND StaffSalary < 50000)  --OR using (StaffSalary BETWEEN 10000 AND 50000),
--ممكن زي ما قولنا تكتب الكونسترينت فوق و ساعتها لازم جمب كل اتربييوت تكتب كونسترينت خااص بيها بس
--لكن في الجدول بتاع الكونسترينت بتسمي الكونسترينت و ينفع تديه لاي اتربييوت

)


--Foriegn key constraint 
--دلوقتي هنتكلم عن نوع جديد من الكونسترينتس و يعتبر اهم نوع لان الداتا بيز كلها قايمة عليه 
--الكونسترينت ده بيستخدم انه يربط الجداول ببعضها و يظبط العلاقات علي حسب نوعها
--عشان كدة محتاج تكون مراجع انواع العلاقات المختلفة بين الجداول ز ازاي تعملها ماب للداتا بيز و ازاي تعمل 
--Normalization

--العلاقات بتتصنف علي اساس 
-- 1-Cardinality --> One-To-Many  , One-To-One  , Many-To-Many
-- 2- Participation --> May/Must , May/May , Must/May , Must/Must
-- 3- Degree --> Unary , Binary , Ternary , Nry...

--هنا هنشرح بس علي اول نوع عشان نوضح فكرة ال فورين كي بس

--و زي مقولنا معزم الجداول بيكون فيها فورين كي عشان نربط الجداول ببعض
--عشان كدة هنعدل بعض الجداول و نعملها من جديد
--in 1-m realtion --> we put the PK of the one as a FK in the many as a reference

DROP TABLE Sales_schema.Staff

CREATE TABLE Sales_schema.Store (

StoreId int ,
StoreName varchar(30) not null,
StoreCity varchar(30) not null,

--Constraint table
CONSTRAINT StorePK PRIMARY KEY (StoreId) ,

) ;



CREATE TABLE Sales_schema.Staff (
StaffId int ,
StaffName varchar(30) not null,
StaffSalary numeric(7,2) not null ,  -- numeric data type represents the decimal , with fractions  (total num of digits , num of fractions)
StaffUniNakeName varchar(10) ,
StoreId int ,  --the foregn key must be the same data type and size of the reference table

--Constraints table
CONSTRAINT StaffPK PRIMARY KEY (StaffId) ,
CONSTRAINT StaffUniNameUnique UNIQUE (StaffUniNakeName) ,
CONSTRAINT StaffSalaryCHECK CHECK (StaffSalary > 10000  AND StaffSalary < 50000) ,  --OR using (StaffSalary BETWEEN 10000 AND 50000),
--ممكن زي ما قولنا تكتب الكونسترينت فوق و ساعتها لازم جمب كل اتربييوت تكتب كونسترينت خااص بيها بس
--لكن في الجدول بتاع الكونسترينت بتسمي الكونسترينت و ينفع تديه لاي اتربييوت

--Adding FK of Store table to maintain 1-m realtion between them
CONSTRAINT StoreFK FOREIGN KEY (StoreId) REFERENCES Sales_schema.Store (StoreId) ,

) ;

--خد بالك طالما حطيت الجدول في سكيمة لازم تكتب اسك السكيمة قبله


DROP TABLE Sales_schema.customers 

CREATE TABLE Sales_schema.Customers (

CustomerId int not null ,
CustomerFirstName varchar(30) not null ,
CustomerLastName varchar(30) ,
CustomerEmail varchar(50) not null ,
CustomerCity varchar(20) not null ,
CustomerStreet varchar(50) not null ,
CustomerZipCode int  ,    --varchar(number of charactrs inside the char)
CustomerCountry varchar(25) not null ,

--Constraint table
CONSTRAINT CustomerPK PRIMARY KEY (CustomerId) ,

) ;


CREATE TABLE Sales_schema.Orders (

OrderId int , 
OrderName varchar(40),
CustomerId int , 


--Constraint table
CONSTRAINT OrderPK PRIMARY KEY (OrderId) ,
CONSTRAINT CustomerFK FOREIGN KEY (CustomerId) REFERENCES Sales_schema.Customers (CustomerId)  ,

);

--خد بالك لازم تحط الاقواس مظبوطة بعد نوع الكونسترينت
-- PRIMARY KEY (OrderId) , FOREIGN KEY (CustomerId) ,.....



--ملاجظات علي ال فورين كي
--لازم الفورن كي يكون نفس الداتا تايب و الجم بتاع الريفرنس
--Refernce integrity --> مقصود بيه انه لما بتعمل فورين كي في جدول ك ريفرنس للجدول الي بتعمل معاه العلاقة , لازم القيم الي ياخدها
-----------------------> تكون موجودة في الجدول الاصلي او الريفرنس و الا الداتا بيز مش هتقبلها لانك اصلا عاملها عشان تربطهم ببعض
-----------------------> ف ازاي هتحط قيمة للفورين كي مش موجودة اصلا في الجدول الاصلي و ده شئ مش منطقي طبعا
--Foreign key attribute could be null , not like the PK --> ممكن تاخد قيمة ب ناال عادي لو عايز تحطها ب ماال يعني لكن مبنفعش تحط قيمة
----------------------------------------------------------> مش موجودة في الجدول الريفرنس
--Refernce table (the ONE side) --> Parent table , Refrenced table (the MANY side) ---> child table




