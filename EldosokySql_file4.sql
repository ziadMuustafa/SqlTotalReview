
--Revision
--هنا هنعمل داتا بيز جديدة هنبني فيها الداتا بيز بشكل كامل الي كانت موجودة في فيديو المراجعة و الفيديوز الي فاتت 



--Creating the database
CREATE DATABASE SalesDataBase_Revision

USE SalesDataBase_Revision 
GO

--Creating 2 Schemas

CREATE SCHEMA Sales_schema 

CREATE SCHEMA Poduction_schema 

USE SalesDataBase_Revision 


-------------------------------------------------------------------------------------------------------------------


--Creating Tables

CREATE TABLE Sales_schema.Customer (

CustomerId int, 
CustomerName varchar(20) not null,
CustomerPhone varchar(15) not null,
CustomerEmail varchar(30) ,
CustomerCity varchar(20) ,
CustomerState varchar(30) not null,


--Constraints table
CONSTRAINT CustomerPK PRIMARY KEY (CustomerId) , 

)



-------------------------------------------------------------------------------------------------------------------



CREATE TABLE Sales_schema.Store (

StoreId int , 
StoreName varchar(20) not null ,
StoreCity varchar(25)  null , 
StoreState varchar(30) not null ,


--Constraints table
CONSTRAINT StorePK PRIMARY KEY (StoreId) ,

)


--------------------------------------------------------------------------------------------------------------


CREATE TABLE Sales_schema.Staff (

StaffId int , 
StaffName varchar(25) ,
StaffEmail varchar(30) ,
StaffPhone varchar (15) ,
StaffGender char(1) ,

StoreId int ,
ManagerId int , 

--Constraints table
CONSTRAINT StaffPK PRIMARY KEY (StaffId) ,
CONSTRAINT StaffGenderCHECK CHECK (StaffGender IN ('M' , 'F')) ,
CONSTRAINT StoreFK FOREIGN KEY (StoreId) REFERENCES Sales_schema.Store (StoreId) ,
CONSTRAINT StaffUnaryRelationFK FOREIGN KEY (ManagerId) REFERENCES Sales_schema.Staff (StaffId) ,
)


------------------------------------------------------------------------------------------------------------------



CREATE TABLE Sales_schema.Orders (

OrderId int ,
OrderName varchar(20),
OrderState varchar(15),

CustomerId int ,
StaffId int , 
StoreId int ,


--Constraints table
CONSTRAINT OrderPK PRIMARY KEY (OrderId) ,
CONSTRAINT OrderStateCHECK CHECK (OrderState = 'Preparing' OR OrderState = 'Shipped' OR OrderState = 'Delivered') ,
CONSTRAINT OrderStateCHECK1 CHECK (OrderState IN ('Preparing' , 'Shipped' , 'Delivered') ) ,  --نفس الي فوق بالظبط
CONSTRAINT CustomerFK FOREIGN KEY (CustomerId) REFERENCES Sales_schema.Customer (CustomerId)  ,
CONSTRAINT StaffFK FOREIGN KEY (StaffId) REFERENCES Sales_schema.Staff (StaffId) ,
CONSTRAINT OrderStoreFK FOREIGN KEY (StoreId) REFERENCES Sales_schema.Store (StoreId) ,
);



----------------------------------------------------------------------------------------------------------------------


CREATE TABLE Poduction_schema.Catigory (
CatigoryId int , 
CatigoryName varchar(25) ,


--Constraints table
CONSTRAINT CatigoryPK PRIMARY KEY (CatigoryId) ,


)


--------------------------------------------------------------------------------------------------------------


CREATE TABLE Poduction_schema.Brand (

BrandId int , 
BrandName varchar(20) NOT NULL,
BrandState varchar(25) ,


--Constraints table 
CONSTRAINT BrandPK PRIMARY KEY (BrandId) ,

)

----------------------------------------------------------------------------------------------------


CREATE TABLE Poduction_schema.Products (

ProductId int , 
ProducrName varchar(30),

CatigoryId int , 
BrandId int , 



--Constraints table
CONSTRAINT ProductPK PRIMARY KEY (ProductId) ,
CONSTRAINT CatigoryFK FOREIGN KEY (CatigoryId) REFERENCES Poduction_schema.Catigory (CatigoryId) ,
CONSTRAINT BrandFK FOREIGN KEY (BrandId) REFERENCES Poduction_schema.Brand (BrandId)

)


----------------------------------------------------------------------------------------------------

--Recall creating databases , tables , Relations from the object explorer
--And how to get a BackUp for the data base
--Recall IDENTITY keyword