--كل ده مازلنا في اول نوع من الكويريز وهو ال
--DDL -Data defination language

--دلوقتي هنتكلم فيها عن الامر
--Alter
--بنقدر نستخدمه عشان نعدل في عمود معين او كونسترينت معين
--Alter Table (table_name) (what to alter)
--عندنا كذا حاجة ممكن نعملها بالامر التر
--Add column , Drop column , Rename column  , Alter column (change atrribute data type , make attribute not null or null) , Alter constraint(Add , drop)...
--NOT NULL --> can not be null , NULL --> can be null

ALTER TABLE Sales_schema.Orders 
ADD OrderState VARCHAR(15)  ;

ALTER TABLE Sales_schema.Staff 
ALTER COLUMN StaffName VARCHAR(15)  ;

--ممكن كمان تعمل ادد لكذا كولوم في نفس المرة طالما جوا نفس الجدول بس لازم تفصل بال , و ال ; عشان تتعمل مظبوط
--خد بالك من الفرق امتي بستخدمي سيمي كولون و فاصلة

ALTER TABLE Sales_schema.Store
ADD StoreCountry VARCHAR(20) ;


--راجع كدة ترتيب العمليات جو الالتر تابل الواحدة اي ممكن يجي مع اي يعني هل ممكن اعمل ادد كولومن و التر كولوم في كويري واحدة ب التر تابل واحدة  ولا لا
--ملحوظة مهمة جداا : لما تيجي تغير الداتا تايب بتاع كولومن بشكل جذري يعني من تشار مثلا للارقام فلازم يكون الجدول فاضي
--والا الداتا بيز مش هتقبل كدة عشان مينفعش يكون متخزن ارقام مثلا في الكولمن ده وانت تخليه كاركترز مثلا

--You can add more than one colomn in one query but , can not alter more than one column in one query
--ALTER TABLE (Table_NamE) ADD Column1 DATATYPE , Column2 DATATYPE , ..... ;
--ALTER TABLE (Table_NamE) ALTER COLUMN Column1 DATATYPE (only one column to be altered in one time) ;
--اتاكد من نفس الفكرة دي في ال دروب وال ري نيييم
--ALTER COLUMN (لازم تكتب كي ورد كولومن)
--ADD (اكتب اسم التابل الجديد علطول من غير كي وورد كولومن)


--طيب الي فات كنا بنتكلم عن الالتر كولوم
--دلوقتي عايزين نشوف ازاي نعمل 
--Alter costraint (ADD CONSTRAINT or DROP CONSTAINT onlyyyyyy)
--هنا الي نقدر نعمله اننا نضيف كونسترينت او نحذفه و دي فايدة زي ما قولنا اننا نعمل كونسترسنت تابل و نسمي فيه الكونسترينتس
--دلوقتي نقدر نستدعيهم و نحذفهم
--احنا نقدر نضيف او نحذف كونسترينت بس , لكن منقدرش نعدل علي كونسترينت موجود اصلا

--خد بالك اي عملية التر لازم تكتب في اولها 
--ALTER TABLE (Table_name) 
--و بعد كدة تعمل التر للي انت عايزه سواء كولوم او كونسترينت
--أتاكد ينفع تضيف كذا كونسترينت في كويري واحدة ولا لا

--ALTER TABLE -----------> (ALTER COLUMN(add , drop , alter , rename) , ALTER CONSTRAINT(add , drop)  )

ALTER TABLE Sales_schema.Staff 
DROP CONSTRAINT  StaffUniNameUnique ;

ALTER TABLE Sales_schema.Staff 
ADD CONSTRAINT  StaffUniNameUnique UNIQUE (StaffUniNakeName);

ALTER TABLE Sales_schema.Staff   --Creating new column in Staff table to represents the gender (M or F)
ADD StaffGender CHAR(1) ;  

ALTER TABLE Sales_schema.Staff 
ADD CONSTRAINT GenderConstraint CHECK (StaffGender = 'M' OR StaffGender = 'F' ) --ADD CONSTRAINT to make sure entering M or F only


CREATE TABLE Sales_schema.Products (

ProductId int , 
ProductName varchar(40) NOT NULL,
ProductCaigory varchar  NOT NULL,
BrandId int , 

--Constraint table 
CONSTRAINT ProductPK PRIMARY KEY (ProductId)
)


ALTER TABLE Sales_schema.Products 
ADD CONSTRAINT BrandFK FOREIGN KEY (BrandId) REFERENCES Sales_schema.Brands (BrandId ) ;-->هنا ربطنا البرودكت ب البراند بعلاقة 1-ميني



--To rename table or column in table or index ,,,,,,
--Wcan use built-in method inside Sql --> sp_rename

--To rename table
--EXCE sp_rename 'Old name' , 'New_name'

--To rename column in table or index or ...
--EXCE sp_rename 'column name (Sales_schema.Products.ProductId)'  ,  'New name'  ,  'the type (COLUMN , INDEX , ....)'

--EXEC --> Stands for EXECUTE

EXEC sp_rename 'Sales_schema.Brand' , 'BrandO' ; --Renaming table
EXEC sp_rename 'Sales_schema.BrandO' , 'Brand' ;
--متنساش انك الزم تستدعي اسم الجدول باسم الاسكيمة


EXEC sp_rename 'Sales_schema.Products.ProductCaigory' , 'ProductCatigory' , 'COLUMN'; --Renaming column in table


--ملاحظة مهمة بس لازم تخلي بالك وانت بتعمل كومنسترينت جديد انه يكون مناسب للداتا الموجودة في الجدول 
--والا الداتا بيز مش هتقبلها و ساعتها لازم يكون الجدول فاضي
--يعني مثلا لو عايز تضيف كونسترينت لكولومن معين عشان يبقي يونيك بس هو اصلا فيه عناصر متكررة من قبل كدة دخلت الكولومن
--ساعتها مش هينفع تضيف الكونسترينت ده الا لو مسحت كل الداتا او الريكوردز الي فيه
--خلي الفكرة دي دايما في دماغك