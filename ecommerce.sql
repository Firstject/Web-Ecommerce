DROP TABLE OrderDetails;
DROP TABLE Wishlists;
DROP TABLE ProductStats;
DROP TABLE Orders;
DROP TABLE Products;
DROP TABLE ProductCategories;
DROP TABLE Users;

CREATE TABLE ProductCategories
(
 Category_ID  INT NOT NULL ,
 CategoryName VARCHAR(64) NOT NULL ,

PRIMARY KEY (Category_ID)
);

CREATE TABLE Users
(
 UserId                INT NOT NULL,
 Username              VARCHAR(16) NOT NULL ,
 FName                 VARCHAR(32) ,
 LName                 VARCHAR(32) ,
 Email                 VARCHAR(255) NOT NULL ,
 Password              VARCHAR(64) NOT NULL ,
 City                  VARCHAR(64) ,
 User_State            VARCHAR(32) ,
 Address               VARCHAR(100) ,
 Country               VARCHAR(32) ,
 ZIP_Code              VARCHAR(16) ,
 Phone_Number          VARCHAR(48) ,
 Register_Date         TIMESTAMP NOT NULL ,
 Verify_Code           VARCHAR(32) NOT NULL ,
 ResetPass_Code        VARCHAR(32),
 ResetPass_ExpireDate  TIMESTAMP ,
 Activate_Date         TIMESTAMP ,

PRIMARY KEY (UserId)
);

CREATE TABLE Orders
(
 Order_ID           INT NOT NULL ,
 Order_UserID       INT NOT NULL ,
 Order_Amount       INT NOT NULL ,
 Order_ShipName     VARCHAR(128) NOT NULL ,
 Order_ShipAddress  VARCHAR(128) NOT NULL ,
 Order_ShipAddress2 VARCHAR(128) NOT NULL ,
 Order_City         VARCHAR(64) NOT NULL ,
 Order_State        VARCHAR(32) NOT NULL ,
 Order_Zip          VARCHAR(16) NOT NULL ,
 Order_Address      VARCHAR(100) NOT NULL ,
 Order_Phone        VARCHAR(48) NOT NULL ,
 Order_Tax          FLOAT NOT NULL ,
 Order_Email        VARCHAR(100) NOT NULL ,
 Order_Date         TIMESTAMP NOT NULL ,
 Order_Shipped      SMALLINT NOT NULL ,

PRIMARY KEY (Order_ID),
FOREIGN KEY (Order_UserID) REFERENCES Users (UserId)
);

CREATE TABLE Products
(
 Product_ID         INT NOT NULL ,
 Product_Name       VARCHAR(128) NOT NULL ,
 Product_Price      FLOAT NOT NULL ,
 Product_Desc       VARCHAR(255) ,
 Product_Image      VARCHAR(255) ,
 Product_CategoryID INT NOT NULL ,
 Product_UpdateDate TIMESTAMP,
 Product_Stock      SMALLINT NOT NULL ,
 Product_Live       SMALLINT NOT NULL,
 Product_Location   VARCHAR(255) ,

PRIMARY KEY (Product_ID),
FOREIGN KEY (Product_CategoryID) REFERENCES ProductCategories (Category_ID)
);

CREATE TABLE Wishlists
(
 WishlistID int NOT NULL ,
 Wishlist_UserId     int NOT NULL ,
 Wishlist_ProductID int NOT NULL ,

PRIMARY KEY (WishlistID),
FOREIGN KEY (Wishlist_UserId) REFERENCES Users(UserId),
FOREIGN KEY (Wishlist_ProductID) REFERENCES Products(Product_ID)
);

CREATE TABLE ProductStats
(
 ProductStatsID         int NOT NULL ,
 StatType               varchar(16) NOT NULL ,
 ProductStats_ProductID int NOT NULL ,
 ProductStats_UserId    int NOT NULL ,

PRIMARY KEY (ProductStatsID),
FOREIGN KEY (ProductStats_UserId) REFERENCES Users(UserId),
FOREIGN KEY (ProductStats_ProductID) REFERENCES Products(Product_ID)
);

CREATE TABLE OrderDetails
(
 DetailID         INT NOT NULL ,
 Detail_OrderID   INT NOT NULL ,
 Detail_ProductID INT NOT NULL ,
 Detail_Name      VARCHAR(255) NOT NULL ,
 Detail_Price     FLOAT NOT NULL ,
 Detail_Quantity  INT NOT NULL ,

PRIMARY KEY (DetailID),
FOREIGN KEY (Detail_ProductID) REFERENCES Products(Product_ID),
FOREIGN KEY (Detail_OrderID) REFERENCES Orders(Order_ID)
);

--INSERT COMMAND

DELETE FROM Users;
DELETE FROM Products;
DELETE FROM ProductCategories;

INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (1,'AlliLovely','Bobby','Freeman','tskirvin@optonline.net','25d55ad283aa40af464c76d713c7ad','San Diego','California','639 Ocello Street','92103','619-887-0185','2018-11-1 10:17:50.123','4479c8f1ccc6f4d6fa5ec46757903e5f');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (2,'ArticleAir','Deanna','Lane','cremonini@live.com','48afaca63a3b3f8592271414e69744e5','Louisville','Kentucky','1918 Karen Lane','40207','502-895-2768','2018-11-1 12:30:40.124','a034b91f82c1c2137021ca6baf66690');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (3,'Discovermi','Jerica','Kelly','pizza@me.com','e19d5cd5af378da5f63f891c7467af','Bridgeport','Connecticut','1228 Raoul Wallenberg Place','6604',NULL,'2018-11-1 14:49:25.125','9ffb2c92ce5423e9eb63724af22b072');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (4,'Fanshomi','Nicola','Hunt','mhassel@comcast.net','4ec9c66da2d9fcd74cd17825fcc03eac','Jeffersonville','Indiana','3657 Charack Road','47130',NULL,'2018-11-1 17:21:14.156','3b9bf25521598e14198fa31ac45490cc');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (5,'lonomadster','Jamilyn','Lawrence','hamilton@att.net','7bcffa7d719e836de3edf1cb67031','Morgantown','West Virginia','1731 Agriculture Lane','26505',NULL,'2018-11-1 20:05:45.127','81eff99d8a9f9f7023f7b0f2f1e8c373');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (6,'LogicGery','Anuj','Ramirez','payned@optonline.net','5cf98f90a45c92e67297b4f0cfcf92cc','Madison','Wisconsin','2866 Comfort Court','53711',NULL,'2018-11-1 20:11:23.128','ef30207976b9effc97240e7e91da76');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (7,'MsNote','Philip','Murray','wilsonpm@verizon.net','3eca3389b7f6f886cb2fc778eee5ae','Savanna','Illinois','711 Emeral Dreams Drive','61074',NULL,'2018-11-2 03:16:14.129','53f717b7544df4a699c96d9d2a0ce2e');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (8,'Rightshop','Cristine','Henderson','hling@hotmail.com','3feb3ec2e57a6e9afdb97c2bb63e63b','Rougon','Louisiana','3978 Eva Pearl Street','unknown',NULL,'2018-11-2 06:05:23.130','b6f919253391cc1428d3a6cc7e5b3f2b');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (9,'Sosageiger','Vitoria','Vasquez','jhardin@me.com','125856881435b2e2c894617d8264b36d','Rogersville','Tennessee','2399 Nixon Avenue','37856',NULL,'2018-11-2 06:17:54.131','6c1b639b344daf22a21c7f15dbbd37f5');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (10,'Tegrapsi','Charles','Brown','pdbaby@yahoo.com','f4ee841ee5c58cfa59ae67fd11ab6c60','Oklahoma City','Oklahoma','1894 Luke Lane','73102',NULL,'2018-11-2 07:59:55.132','e375ca7e494156a8a1b35afedd69ad33');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (11,'Metalue','Etta','Hudson','scarolan@gmail.com','a6e3a1b04ee6527f59981e9f46b997e','Cocoa','Florida','4676 Stoneybrook Road','32922',NULL,'2018-11-2 09:44:46.133','f8458f85d0a2f0a08c30c4b0f892fdd4');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (12,'Ethican','Leonela','Woods','ianbuck@aol.com','16ea28c9b5d57b9f0c89931f2d634b','Appleton','Wisconsin','3820 Orphan Road','54913',NULL,'2018-11-2 10:11:59.134','97bebc4ac22dd4be67a16cbc42221153');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (13,'Taxmedit','Henry','Powell','leviathan@yahoo.com','9d34e3a9288e45c8db7c74e1db1efa','Reisterstown','Maryland','2981 Cambridge Place','21136',NULL,'2018-11-2 12:27:13.135','32ea2bef23cb402944eaff75d39c5c4');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (14,'TinnyWork','Danita','OSullivan','esasaki@verizon.net','b8f8312b939f0abb38eeafd4fd17f3','New Haven','Connecticut','2328 Whitman Court','6511',NULL,'2018-11-2 13:39:48.136','86ce1c7e2147423ff090af78db93af2a');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (15,'MrStone','Marc','Wallace','msherr@icloud.com','ab792e8480f3fc341f3949117ae871f3','Bedford','Massachusetts','4687 C Street','1730',NULL,'2018-11-2 23:42:32.137','3254541c7d2703385a6729d555be0e1');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (16,'Bucketzf','Juan','Rogers','bcevc@optonline.net','e11170b8cbd2d7412651cb967fa28e5','Lee S Summit','Missouri','3211 Tree Frog Lane','64063',NULL,'2018-11-3 08:34:45.138','22e45d5ab9ce92514552365b7438271');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (17,'Cripoter','Alaina','Burns','pontipak@sbcglobal.net','156feac83dbddc8bb9c3f8da70d29e','Miami','Florida','2295 Warner Street','33131',NULL,'2018-11-3 10:25:01.139','789ea7aa72b911da98ca07f7c5aa0f9');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (18,'MoTrump','Estebana','Kim','suresh@outlook.com','c8db34426c2a7b54068ad46d9da05d','New Berlin','Wisconsin','3300 Larry Street','53151',NULL,'2018-11-3 13:24:14.140','c5438af75aee98f62667b1ab9e520cb');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (19,'Citruks','Emmanuel','Mcdonald','tattooman@outlook.com','cacbc69fab3f2223c54570f9a615fae','Albuquerque','New Mexico','923 Chapmans Lane','87121',NULL,'2018-11-3 21:36:07.141','c9d23f736af627c652663793153cb2e0');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (20,'Awanseat','Damian','Porter','willg@mac.com','21a67ccabae6863c4e36c8a2c79cb744','Chappaqua','New York','4560 Lake Forest Drive','10514',NULL,'2018-11-4 14:48:01.142','612a543ee2a99d8ef6021d966b028d');

INSERT INTO ProductCategories(Category_ID,CategoryName) VALUES (0,'Uncategorized');
INSERT INTO ProductCategories(Category_ID,CategoryName) VALUES (1,'Apple');
INSERT INTO ProductCategories(Category_ID,CategoryName) VALUES (2,'Smartphone');
INSERT INTO ProductCategories(Category_ID,CategoryName) VALUES (3,'Notebook');
INSERT INTO ProductCategories(Category_ID,CategoryName) VALUES (4,'Tablet');
INSERT INTO ProductCategories(Category_ID,CategoryName) VALUES (5,'Camera');
INSERT INTO ProductCategories(Category_ID,CategoryName) VALUES (6,'Gadget');
INSERT INTO ProductCategories(Category_ID,CategoryName) VALUES (7,'Accessory');

INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (1,'iPhone 6',12900,NULL,NULL,1,NULL,6,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (2,'iPhone 6s Plus',22500,NULL,NULL,1,NULL,2,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (3,'iPhone 7',26500,NULL,NULL,1,NULL,10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (4,'iPhone 7 Plus',31500,NULL,NULL,1,NULL,29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (5,'iPhone 8',34500,NULL,NULL,1,NULL,6,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (6,'iPhone 8 Plus',38500,NULL,NULL,1,NULL,25,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (7,'iPhone X',46500,NULL,NULL,1,NULL,26,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (8,'iPad mini 4',19900,NULL,NULL,1,NULL,16,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (9,'iPad Pro',42100,NULL,NULL,1,NULL,16,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (10,'iPad',17900,NULL,NULL,1,NULL,13,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (11,'iPad 6th Gen',19900,NULL,NULL,1,NULL,6,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (12,'iMac',82900,NULL,NULL,1,NULL,26,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (13,'MacBook',57900,NULL,NULL,1,NULL,15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (14,'MacBook Air',42900,NULL,NULL,1,NULL,10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (15,'MacBook Pro Retina',100900,NULL,NULL,1,NULL,2,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (16,'Series 3 Watch Sport GPS',10900,NULL,NULL,1,NULL,29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (17,'Series 3 Watch Sport Cellular',14400,NULL,NULL,1,NULL,20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (18,'Series 3 Watch Cellular',29900,NULL,NULL,1,NULL,27,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (19,'Series 3 Watch Editon Cellular',49900,NULL,NULL,1,NULL,14,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (20,'Series 3 Watch Nike Cellular',14400,NULL,NULL,1,NULL,1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (21,'Mate 10',21900,NULL,NULL,2,NULL,23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (22,'P20',17990,NULL,NULL,2,NULL,22,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (23,'P10',12990,NULL,NULL,2,NULL,20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (24,'Nova 3',16900,NULL,NULL,2,NULL,18,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (25,'Nova 2i',7900,NULL,NULL,2,NULL,2,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (26,'Find X',29990,NULL,NULL,2,NULL,3,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (27,'R15 Pro',17990,NULL,NULL,2,NULL,18,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (28,'F9',10990,NULL,NULL,2,NULL,25,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (29,'R9S',10990,NULL,NULL,2,NULL,13,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (30,'A83',6900,NULL,NULL,2,NULL,5,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (31,'Note9',33900,NULL,NULL,2,NULL,23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (32,'S9',33900,NULL,NULL,2,NULL,0,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (33,'J8',9490,NULL,NULL,2,NULL,18,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (34,'A8',17990,NULL,NULL,2,NULL,24,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (35,'A6',10900,NULL,NULL,2,NULL,28,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (36,'V11',13999,NULL,NULL,2,NULL,17,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (37,'V9',8999,NULL,NULL,2,NULL,20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (38,'X21',14999,NULL,NULL,2,NULL,26,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (39,'Y85',6999,NULL,NULL,2,NULL,27,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (40,'Y71',4999,NULL,NULL,2,NULL,29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (41,'Swift SF714-51T-M3JU/T002',59990,NULL,NULL,3,NULL,10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (42,'Swift SF514-52T-83C0/T004',42990,NULL,NULL,3,NULL,9,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (43,'Swift SF514-52T-57ZG/T004',32990,NULL,NULL,3,NULL,15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (44,'Swift SF315-41-R7JD/T017(W)',22990,NULL,NULL,3,NULL,1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (45,'Swift SF315-41-R4YS/T019',20990,NULL,NULL,3,NULL,24,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (46,'VivoBook S530UN-BQ187T',29990,NULL,NULL,3,NULL,14,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (47,'VivoBook S410UN-EB292T',29990,NULL,NULL,3,NULL,29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (48,'VivoBook S510UN-BQ208T(W)',27990,NULL,NULL,3,NULL,18,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (49,'VivoBook S410UN-EB121T(W)',25990,NULL,NULL,3,NULL,7,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (50,'ZenBook UX410UQ-GV052T(W)',25900,NULL,NULL,3,NULL,14,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (51,'XPS13W56791606TH-SL',79990,NULL,NULL,3,NULL,9,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (52,'W56691425TH-Wh',32990,NULL,NULL,3,NULL,16,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (53,'V5471-W56854202THW-Sr(W)',30990,NULL,NULL,3,NULL,6,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (54,'7472-W56791261TH-Gy(W)',29990,NULL,NULL,3,NULL,17,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (55,'5370-W566851005PTH-Sl',29990,NULL,NULL,3,NULL,22,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (56,'ENVY 13-AD168TX',40490,NULL,NULL,3,NULL,19,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (57,'ENVY x360 13-AG0000AU',29990,NULL,NULL,3,NULL,12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (58,'ENVY 13-AD167TX',27990,NULL,NULL,3,NULL,14,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (59,'Pavilion x360 14-CD0037TX(W)',26990,NULL,NULL,3,NULL,6,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (60,'X360 14-BA158TX',26990,NULL,NULL,3,NULL,12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (61,'720S-15IKB-81AC001DTA(W)',49990,NULL,NULL,3,NULL,12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (62,'720S-81BV4YTA(W)',30990,NULL,NULL,3,NULL,20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (63,'YOGA 530-14IKB 81EK000XTA(W)',29990,NULL,NULL,3,NULL,2,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (64,'YOGA 520-81C800D6TA(W)',29990,NULL,NULL,3,NULL,14,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (65,'YOGA 520-81C8007LTA(W)',29990,NULL,NULL,3,NULL,21,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (66,'GP73 8RE-454TH',43900,NULL,NULL,3,NULL,19,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (67,'GF62 8RE-031TH',39990,NULL,NULL,3,NULL,7,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (68,'GP73 8RD-083TH(W)',37900,NULL,NULL,3,NULL,21,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (69,'GP62M 7REX-2633TH(W)(No Bag)',37900,NULL,NULL,3,NULL,10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (70,'GF62 8RE-055TH',36900,NULL,NULL,3,NULL,23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (71,'M5 Pro',18990,NULL,NULL,4,NULL,1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (72,'M5',13990,NULL,NULL,4,NULL,1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (73,'M3',12900,NULL,NULL,4,NULL,23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (74,'T3',7990,NULL,NULL,4,NULL,2,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (75,'MIIX 520-121KB-81CG01LXTA(W)',32990,NULL,NULL,4,NULL,23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (76,'MIIX 520-121KB-81CG01LWTA(W)',24990,NULL,NULL,4,NULL,28,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (77,'YOGA Book YB1-X91F-ZA150147TH(W)',22990,NULL,NULL,4,NULL,4,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (78,'MIIX 320-10ICR 80XF00G7TA(LTE)',15990,NULL,NULL,4,NULL,29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (79,'Galaxy Tab S4',23900,NULL,NULL,4,NULL,19,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (80,'Galaxy Tab S3',21900,NULL,NULL,4,NULL,30,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (81,'Galaxy Tab A 10.1',11900,NULL,NULL,4,NULL,20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (82,'Galaxy Tab A 8.0',8900,NULL,NULL,4,NULL,20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (83,'Surface Book 2 15inch 1TB',118900,NULL,NULL,4,NULL,23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (84,'Surface Book 2 13inch',109900,NULL,NULL,4,NULL,18,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (85,'Surface Book 2 15inch 512GB',103900,NULL,NULL,4,NULL,23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (86,'Surface Laptop 13inch',101900,NULL,NULL,4,NULL,1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (87,'Fujifilm Camera Compact X-100F EE Silver',46990,NULL,NULL,5,NULL,23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (88,'Sony Camera Compact DSC-RX100M5',31990,NULL,NULL,5,NULL,8,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (89,'Sony Camera Compact DSC-RX100M4',29990,NULL,NULL,5,NULL,17,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (90,'Sony Compact Camera RX0',24990,NULL,NULL,5,NULL,18,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (91,'Canon Camera Compact PWS G7X Mark II',20690,NULL,NULL,5,NULL,30,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (92,'Nikon Camera Compact Coolpix P900 BK',19900,NULL,NULL,5,NULL,10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (93,'Canon Camera DSLR EOS 5D MARK IV + Lens EF24-105 F4 L II',170900,NULL,NULL,5,NULL,29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (94,'Nikon Camera DSLR D850 24-120 4G ED VR Kit',144900,NULL,NULL,5,NULL,29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (95,'Canon Camera DSLR EOS 5D MaARK IV + Lens EF24-70 F4 L IS USM',129900,NULL,NULL,5,NULL,9,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (96,'Nikon DSLR Camera D850 Body',124900,NULL,NULL,5,NULL,7,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (97,'Canon Camera DSLR EOS 5D MARK IV Body',100900,NULL,NULL,5,NULL,26,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (98,'Nikon Camera DSLR D750 24-120 KIT',89990,NULL,NULL,5,NULL,20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (99,'Leica Mirrorless Camera M10 Black Chrome Finish',275200,NULL,NULL,5,NULL,4,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (100,'Leica Mirrorless Camera SL (Typ 601)Black',232400,NULL,NULL,5,NULL,23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (101,'Leica Mirrorless Camera CL PRIME KIT 18mm.',137500,NULL,NULL,5,NULL,17,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (102,'Sony Mirrorless Camera ILCE-7M3K/BCAP2',74990,NULL,NULL,5,NULL,7,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (103,'Fujifilm Camera Mirrorless X-T2/18-55 Kit-EE Black',69990,NULL,NULL,5,NULL,9,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (104,'Fujifilm Mirrorless Camera X-T2 Kit 18-135mm.',59990,NULL,NULL,5,NULL,17,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (105,'Anitech Multi-Cooker S200',1790,NULL,NULL,6,NULL,15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (106,'Anitech Induction S100-Red',1590,NULL,NULL,6,NULL,16,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (107,'Anitech Oven S101 BarBGon',1550,NULL,NULL,6,NULL,9,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (108,'Anitech Smoothie S301-BarBGon',990,NULL,NULL,6,NULL,3,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (109,'DJI Mavic Pro Platinum Fly More Combo Alpine Silver',59300,NULL,NULL,6,NULL,0,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (110,'DJI Mavic 2 Pro (EU) Dark Grey',56500,NULL,NULL,6,NULL,15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (111,'DJI Mavic 2 Zoom (EU) Dark Gray',49000,NULL,NULL,6,NULL,3,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (112,'DJI Mavic Pro Platinum Alpine Silver',46600,NULL,NULL,6,NULL,20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (113,'CS@ iRobot roomba 980',39800,NULL,NULL,6,NULL,6,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (114,'CS@ iRobot roomba 960',36900,NULL,NULL,6,NULL,15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (115,'CS@ iRobot roomba 890',29900,NULL,NULL,6,NULL,12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (116,'CS@ iRobot roomba 670',20900,NULL,NULL,6,NULL,23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (117,'CS@ Garmin Smartwatch Fenix 5 Plus (GPS/SEA) DLC Carbon Gray w/Black Band',30900,NULL,NULL,6,NULL,8,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (118,'CS@ Garmin Smartwatch Fenix 5,Sapphire Black, GPS Watch, SEA',23900,NULL,NULL,6,NULL,3,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (119,'CS@ Garmin Smartwatch Fenix 5S Frost Blue Tone Sapphire with forst blue band',23900,NULL,NULL,6,NULL,12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (120,'CS@ Garmin Smartwatch Forerunner 235 Black Gray',9690,NULL,NULL,6,NULL,2,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (121,'GoPro Camera FUSION Black',22000,NULL,NULL,6,NULL,19,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (122,'GoPro Hero7 Black',14500,NULL,NULL,6,NULL,15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (123,'GoPro Hero6 Black',12900,NULL,NULL,6,NULL,6,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (124,'CS@ Remax Car Holder LETTO 3in1 Magnetic Charging Black',599,NULL,NULL,7,NULL,12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (125,'CS@ Remax Car Holder LETTO 3in1 Magnetic Charging Silver',599,NULL,NULL,7,NULL,4,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (126,'Loukin Screen Cleaner 100ml Blue',250,NULL,NULL,7,NULL,0,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (127,'Loukin Screen Cleaner 100ml Green',250,NULL,NULL,7,NULL,10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (128,'Pentagonz Joy Dakuwaqa Black',990,NULL,NULL,7,NULL,4,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (129,'Anitech Joy Pad J236 Black',490,NULL,NULL,7,NULL,10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (130,'CS@ Remax Microphone Karaoke RMK-K02 Gold',1150,NULL,NULL,7,NULL,15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (131,'CS@ Remax Microphone Karaoke RMK-K02 Silver',1150,NULL,NULL,7,NULL,19,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (132,'Belkin Valet Charge Dock for Apple Watch/iPhone Silver (F8J183qeSLV)',5790,NULL,NULL,7,NULL,20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (133,'Belkin PowerHouse Charge Dock for Apple Watch + iPhone Black(FJ200qeBLK)',4390,NULL,NULL,7,NULL,26,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (134,'Targus Numeric Keypad (TGS-AKP10AP)',550,NULL,NULL,7,NULL,20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (135,'Keypad Retractable Wireless Anitech N181-Black',429,NULL,NULL,7,NULL,18,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (136,'Spigen Regnum A103 Mouse Pad Silk (000EP20877)',650,NULL,NULL,7,NULL,1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (137,'Spigen Regnum A100 Mouse Pad Silk (SGP11884)',490,NULL,NULL,7,NULL,15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (138,'CS@ Ugreen USB 3.0 HUB with Type-C port Black (40850)',690,NULL,NULL,7,NULL,28,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (139,'Momax Onelink Multi-Media Card Reader',690,NULL,NULL,7,NULL,10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (140,'CS@ Ugreen Type-C Multifunctional Converter (40873)',2990,NULL,NULL,7,NULL,23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (141,'PQI USB-C 6-Port Multi Pro HUB Black',2990,NULL,NULL,7,NULL,12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (142,'Bose SoundWear Companion Speaker Black',13500,NULL,NULL,7,NULL,21,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (143,'Marshall Speaker Kilburn Black + Major II Bluetooth Black (Bundle Pack)',11990,NULL,NULL,7,NULL,29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (144,'Marshall Speaker Bluetooth 2.1 Woburn Multi-Room Black',27990,NULL,NULL,7,NULL,7,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (145,'Marshall Speaker Bluetooth 2.1 Woburn Black',24990,NULL,NULL,7,NULL,13,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (146,'Creative Speaker 2.0 SBS A60',415,NULL,NULL,7,NULL,13,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (147,'Anitech Speaker SK220',399,NULL,NULL,7,NULL,1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (148,'Microlab Speaker 2.1 X3',2650,NULL,NULL,7,NULL,12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (149,'EDIFIER Speaker 2.1 M1335',1990,NULL,NULL,7,NULL,23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (150,'CS@ Jabra Bluetooth Headset Pulse Elite Sport 4.5 hours Grey',9900,NULL,NULL,7,NULL,14,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (151,'CS@ Plantronics Voyager 3240 with Case Black',4890,NULL,NULL,7,NULL,12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (152,'Philips Earbud SHE3010/00 White',290,NULL,NULL,7,NULL,15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (153,'Philips Earbud SHE3010/00 Black',290,NULL,NULL,7,NULL,16,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (154,'Sony Earbud with Mic. MDR AS210 AP Black',790,NULL,NULL,7,NULL,9,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (155,'Sony Earbud with Mic. MDR AS210 AP White',790,NULL,NULL,7,NULL,28,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (156,'Sony Headphone with Mic. Wireless WH-1000XM2NME Gold',13990,NULL,NULL,7,NULL,1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (157,'Marshall Headphone with Mic. Wireless Mid',7490,NULL,NULL,7,NULL,19,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (158,'JBL Inear Inspire 100 Red',890,NULL,NULL,7,NULL,7,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (159,'JBL Inear Inspire 100 Teal',890,NULL,NULL,7,NULL,23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (160,'Sony Unear with Mic. MDR-XB80BSLZE Blue',4990,NULL,NULL,7,NULL,24,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (161,'Sony Unear with Mic. MDR-XB80BSLZE Black',4990,NULL,NULL,7,NULL,14,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (162,'BeoPlay Inear with Mic. Wireless Earset Black',12900,NULL,NULL,7,NULL,29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (163,'BeoPlay Inear with Mic. Wireless Earset White',12900,NULL,NULL,7,NULL,10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (164,'SanDisk iXpand Charger and Backup Base 256GB',6790,NULL,NULL,7,NULL,8,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (165,'SanDisk iXpand Charger and Backup Base 128GB',4290,NULL,NULL,7,NULL,29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (166,'ADATA USB Drive S102PRO 128GB USB 3.0 Speed 100MB Grey',1920,NULL,NULL,7,NULL,16,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (167,'SanDisk Ultra Dual Drive USB Type-C 128GB USB3.1',1799,NULL,NULL,7,NULL,19,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (168,'CS@ PhotoFast TubeDrive 64GB',3290,NULL,NULL,7,NULL,10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (169,'CS@ PhotoFast TubeDrive 32GB',2490,NULL,NULL,7,NULL,25,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (170,'SanDisk MicroSDXC Ultra 256GB 100MB/s R Class10 (SDSQUAR_256G_GN6MA)',5950,NULL,NULL,7,NULL,18,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (171,'SanDisk Micro SD Ultra SDXC 200GB',4569,NULL,NULL,7,NULL,0,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (172,'SanDisk SDXC Extreme Pro 128GB',3990,NULL,NULL,7,NULL,1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (173,'SanDisk SDXC Extreme 128GB',2315,NULL,NULL,7,NULL,4,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (174,'Logitech Living Room Keyboard K400 Plus - Black',1690,NULL,NULL,7,NULL,27,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (175,'Logitech Living Room Keyboard K400 Plus - White',1690,NULL,NULL,7,NULL,5,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (176,'Logitech Mouse Wireless MX Master 2S',3790,NULL,NULL,7,NULL,11,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (177,'Logitech Mouse MX ERGO Wireless Trackball',3499,NULL,NULL,7,NULL,11,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (178,'Microsoft Keyboard + Mouse HW Desktop 900 Thai Wireless optical',1790,NULL,NULL,7,NULL,2,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (179,'Microsoft Keyboard + Mouse HW Desktop 2000 Wireless BlueTrack',1590,NULL,NULL,7,NULL,8,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (180,'Logitech Spotlight Wireless Bluetooth Presentation Remote New Slate',4299,NULL,NULL,7,NULL,24,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (181,'Logitech Spotlight Wireless Bluetooth Presentation Remote New Gold',4290,NULL,NULL,7,NULL,13,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (182,'CS@ Cozistyle Laptop Bag 13-14 inch City Backpack Slim Ploy Collection Gray',3790,NULL,NULL,7,NULL,17,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (183,'CS@ Thule Backpack Crossover 25L Blue(15) TCBP317CB',3495,NULL,NULL,7,NULL,16,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (184,'CS@ Incase City Collection Brief for MacBook Pro 13 (CL55493) Black',3290,NULL,NULL,7,NULL,17,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (185,'CS@ Incase City Collection 13 Brief Heather Black/Gunmetal Gray',3190,NULL,NULL,7,NULL,11,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (186,'BaNANA Luggage Set 20+24+28 inch set LB34 Black',4190,NULL,NULL,7,NULL,14,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (187,'Luggage BaNAN LB27 Silver',1990,NULL,NULL,7,NULL,16,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (188,'CS@ Monopoly All in one organizer 13 Beige',1500,NULL,NULL,7,NULL,25,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (189,'CS@ Monopoly All in one organizer 13 Cool Grey',1500,NULL,NULL,7,NULL,5,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (190,'GP Battery Charger PB50 wRecyko + 2000mAh AA (pack 4)',1390,NULL,NULL,7,NULL,22,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (191,'GP Battery ReCykp+ 2600mAh AA wUSB Charger (pack4)',540,NULL,NULL,7,NULL,15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (192,'Adonit TravelCube Adapter with Wireless Charger Black (Global)',2790,NULL,NULL,7,NULL,5,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (193,'CS@ Cheero Power Bank Danboard 13400 mah Snowman',2690,NULL,NULL,7,NULL,25,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (194,'Wacom Stylus CTL-6100WL/P0-CX Medium Bluetooth Berry Pink',8779,NULL,NULL,7,NULL,24,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (195,'Wacom Stylus CTL-6100WL/E0-CX Medium Bluetooth Pistachio Green',8779,NULL,NULL,7,NULL,26,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (196,'Adonit Stylus Pixel Pro Black',3590,NULL,NULL,7,NULL,9,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_CategoryID,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (197,'Adonit Stylus Pixel Pro Grey',3590,NULL,NULL,7,NULL,5,1,'Thailand');
