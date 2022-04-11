DROP TABLE OrderDetails;
DROP TABLE Orders;
DROP TABLE Products;
DROP TABLE AccountHistory;
DROP TABLE Users;

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

CREATE TABLE Products
(
 Product_ID         INT NOT NULL ,
 Product_Name       VARCHAR(128) NOT NULL ,
 Product_Price      FLOAT NOT NULL ,
 Product_Desc       VARCHAR(255) ,
 Product_Image      VARCHAR(255) ,
 Product_Category   VARCHAR(50) ,
 Product_UpdateDate TIMESTAMP,
 Product_Stock      SMALLINT NOT NULL ,
 Product_Live       SMALLINT NOT NULL,
 Product_Location   VARCHAR(255) ,

PRIMARY KEY (Product_ID)
);

CREATE TABLE Orders
(
 Order_ID              INT NOT NULL ,
 Order_ProductID       INT NOT NULL ,
 Order_ProductQuantity INT ,
 Order_ProductPrice    FLOAT ,

PRIMARY KEY (Order_ID),
FOREIGN KEY (Order_ProductID) REFERENCES Products (Product_ID)
);

CREATE TABLE AccountHistory
(
 HistoryId      INT NOT NULL ,
 History_UserId INT NOT NULL,
 History_Type   VARCHAR(64) , 
 History_Date   TIMESTAMP ,
 History_Info   VARCHAR(128) ,
 History_Info2  VARCHAR(128) ,
 
PRIMARY KEY (HistoryId),
FOREIGN KEY (History_UserId) REFERENCES Users (UserId)
);

CREATE TABLE OrderDetails
(
 DetailID            INT NOT NULL ,
 Detail_UserID       INT NOT NULL ,
 Detail_OrderID      INT NOT NULL ,
 Detail_OrderNumber  INT NOT NULL ,
 Detail_OrderDate    TIMESTAMP ,
 Detail_UserRealName VARCHAR(100) ,
 Detail_Address      VARCHAR(400) ,
 Detail_TotalPrice   FLOAT ,

PRIMARY KEY (DetailID),
FOREIGN KEY (Detail_UserID) REFERENCES Users(UserId),
FOREIGN KEY (Detail_OrderID) REFERENCES Orders(Order_ID)
);

--INSERT COMMAND

DELETE FROM Users;
DELETE FROM Products;

INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (1,'AlliLovely','Bobby','Freeman','tskirvin@optonline.net','25d55ad283aa40af464c76d713c7ad','San Diego','California','639 Ocello Street','92103','619-887-0185','2018-11-1 10:17:50.123','4479c8f1ccc6f4d6fa5ec46757903e5f');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (2,'ArticleAir','Deanna','Lane','cremonini@live.com','48afaca63a3b3f8592271414e69744e5','Louisville','Kentucky','1918 Karen Lane','40207','502-895-2768','2018-11-1 12:30:40.124','a034b91f82c1c2137021ca6baf66690');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (3,'Discovermi','Jerica','Kelly','pizza@me.com','e19d5cd5af378da5f63f891c7467af','Bridgeport','Connecticut','1228 Raoul Wallenberg Place','6604',NULL,'2018-11-1 14:49:25.125','9ffb2c92ce5423e9eb63724af22b072');
INSERT INTO Users(UserId,Username,FName,LName,Email,Password,City,User_State,Address,ZIP_Code,Phone_Number,Register_Date,Verify_Code) VALUES (4,'Fanshomi','Nicola','Hunt','mhassel@comcast.net','4ec9c66da2d9fcd74cd17825fcc03eac','Jeffersonville','Indiana','3657 Charack Road','47130',NULL,'2018-11-1 17:21:14.156','3b9bf25521598e14198fa31ac45490cc');

INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (1,'iPhone 6',12900,'This is product of iphones.','https://support.apple.com/library/APPLE/APPLECARE_ALLGEOS/SP705/SP705-iphone_6-mul.png','Apple','2018-07-30 02:48:56.437',6,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (2,'iPhone 6s Plus',22500,'This is product of iphones.','https://support.apple.com/library/APPLE/APPLECARE_ALLGEOS/SP727/SP727-iphone6s-plus-rosegold-select-2015.png','Apple','2018-01-28 21:36:59.899',2,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (3,'iPhone 7',26500,'This is product of iphones.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/P/W/PWB000235231.jpg','Apple','2018-08-11 09:20:54.329',10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (4,'iPhone 7 Plus',31500,'This is product of iphones.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/P/W/PWB000226695.jpg','Apple','2018-03-04 13:47:29.510',29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (5,'iPhone 8',34500,'This is product of iphones.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000235479.jpg','Apple','2018-06-05 14:04:59.865',6,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (6,'iPhone 8 Plus',38500,'This is product of iphones.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/i/p/iphone8plus-gold.jpg','Apple','2018-05-09 05:17:01.411',25,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (7,'iPhone X',46500,'This is product of iphones.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/i/p/iphonex-silver-34br-34fl-2up-us-en-screen.jpg','Apple','2018-08-03 09:04:17.630',26,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (8,'iPad mini 4',19900,'This is product of ipads.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/P/W/PWB000219131_1.jpg','Apple','2018-09-21 06:26:17.890',16,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (9,'iPad Pro',42100,'This is product of ipads.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/i/p/ipad_pro_11_wi-fi-silver_3.jpg','Apple','2018-04-03 22:09:27.517',16,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (10,'iPad',17900,'This is product of ipads.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/t/h/th-ipad_air_wi-fi_10.9_in_space_gray_1_1.jpg','Apple','2018-03-29 04:46:51.876',13,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (11,'iPad 6th Gen',19900,'This is product of ipads.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000240055_1__1.jpg','Apple','2018-06-14 12:09:59.541',6,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (12,'iMac',82900,'This is product of Macs.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/0/0/000248773_t.jpg','Apple','2018-04-09 09:22:43.935',26,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (13,'MacBook',57900,'This is product of Macs.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/3/_/3._apple_imac_27_5k.jpg','Apple','2018-04-09 14:52:45.276',15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (14,'MacBook Air',42900,'This is product of Macs.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/m/a/macbook_air_space_gray_1.jpg','Apple','2018-04-10 05:00:08.812',10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (15,'MacBook Pro Retina',100900,'This is product of Macs.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/P/W/PWB000216234.jpg','Apple','2018-01-15 07:00:04.344',2,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (16,'Series 3 Watch Sport GPS',10900,'This is product of Apple Watchs.','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/42-alu-space-sport-black-nc-1up_GEO_TH_LANG_TH?wid=470&hei=556&fmt=png-alpha&.v=1594318657000','Apple','2018-10-24 00:15:25.775',29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (17,'Series 3 Watch Sport Cellular',14400,'This is product of Apple Watchs.','https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000239499.jpg','Apple','2018-10-24 05:25:45.090',20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (18,'Series 3 Watch Cellular',29900,'This is product of Apple Watchs.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000239499.jpg','Apple','2018-09-02 01:11:34.814',27,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (19,'Series 3 Watch Editon Cellular',49900,'This is product of Apple Watchs.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/2/3/239475_mqm52tha.jpg','Apple','2018-06-04 10:17:25.667',14,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (20,'Series 3 Watch Nike Cellular',14400,'This is product of Apple Watchs.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000239485.jpg','Apple','2018-03-03 14:49:04.098',1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (21,'Huawei Mate 10',21900,'This is product of Huawei Phones.','https://www-file.huawei.com/-/media/corporate/images/news2/171017-1.png?la=en','Smartphone','2018-01-15 20:19:59.217',23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (22,'Huawei P20',17990,'This is product of Huawei Phones.','https://consumer-img.huawei.com/content/dam/huawei-cbg-site/common/mkt/list-image/phones/p20/P20-listimg-black.png','Smartphone','2018-09-22 11:54:14.389',22,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (23,'Huawei P10',12990,'This is product of Huawei Phones.','https://www.beartai.com/wp-content/uploads/2017/02/huawei-p10-phone.jpg','Smartphone','2018-07-27 22:00:47.739',20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (24,'Huawei Nova 3',16900,'This is product of Huawei Phones.','https://consumer-img.huawei.com/content/dam/huawei-cbg-site/common/mkt/list-image/phones/nova3/nova3-listimage.png','Smartphone','2018-02-27 19:00:14.910',18,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (25,'Huawei Nova 2i',7900,'This is product of Huawei Phones.','https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/P/W/PWB000235333.jpg','Smartphone','2018-04-04 07:51:03.026',2,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (26,'Oppo Find X',29990,'This is product of Oppo Phones.','https://www.notebookcheck.net/uploads/tx_nbc2/OppoFindX__1_.JPG','Smartphone','2018-09-06 01:46:08.176',3,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (27,'Oppo R15 Pro',17990,'This is product of Oppo Phones.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000241793_1.jpg','Smartphone','2018-01-29 08:42:28.286',18,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (28,'Oppo F9',10990,'This is product of Oppo Phones.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000244059.jpg','Smartphone','2018-02-06 10:28:44.112',25,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (29,'Oppo R9S',10990,'This is product of Oppo Phones.','https://assorted.downloads.oppo.com/static/assets/images/products/r9splus/m/sec-1-mobile-4f769d2619f75e15d95ca70a37347c493ca3e0a2.jpg','Smartphone','2018-08-14 04:59:16.374',13,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (30,'Oppo A83',6900,'This is product of Oppo Phones.','https://assorted.downloads.oppo.com/static/assets/images/products/a83-2018/m1-249c6d0ac91267822bb7d28bb145fadaf3fa3369.jpg','Smartphone','2018-02-16 13:29:43.948',5,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (31,'Samsung Note9',33900,'This is product of Samsung Phones.','https://images.samsung.com/is/image/samsung/p5/th/smartphones/galaxy-note9/images/special-offer/butler-model-big.png?$ORIGIN_PNG$','Smartphone','2018-03-17 10:10:46.123',23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (32,'Samsung S9',33900,'This is product of Samsung Phones.','https://images.samsung.com/is/image/samsung/au-galaxy-s9-sm-g960-sm-g960fzpaxsa-frontpurple-93441470?$720_576_PNG$','Smartphone','2018-08-06 03:19:26.900',0,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (33,'Samsung J8',9490,'This is product of Samsung Phones.','https://images.samsung.com/is/image/samsung/th-galaxy-j8-j810-sm-j810yzkdthl-frontblack-107912043?$720_576_PNG$','Smartphone','2018-08-04 23:55:43.654',18,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (34,'Samsung A8',17990,'This is product of Samsung Phones.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000241833.jpg','Smartphone','2018-06-07 07:29:32.278',24,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (35,'Samsung A6',10900,'This is product of Samsung Phones.','https://droidsans.com/spec-samsung-galaxy-a6-2018-and-a6-plus-2018/galaxy-a6-leaked-blue/','Smartphone','2018-08-08 11:31:15.382',28,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (36,'Vivo V11',13999,'This is product of Vivo Phones.','https://asia-exstatic-vivofs.vivo.com/PSee2l50xoirPK7y/1542253439033/414db0a0f529502e1ee796b4b016eba6.png','Smartphone','2018-01-27 14:35:41.362',17,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (37,'Vivo V9',8999,'This is product of Vivo Phones.','https://asia-exstatic-vivofs.vivo.com/PSee2l50xoirPK7y/1542268308306/423a32a48d5350d414d8b586aecd8a99.png','Smartphone','2018-02-22 02:44:09.189',20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (38,'Vivo X21',14999,'This is product of Vivo Phones.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000241937_1.jpg','Smartphone','2018-02-10 18:05:16.119',26,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (39,'Vivo Y85',6999,'This is product of Vivo Phones.','https://asia-exstatic-vivofs.vivo.com/PSee2l50xoirPK7y/1543226548030/88b3d54e3facc4a54aaf962faa6bc5fa.png','Smartphone','2018-06-17 06:58:51.837',27,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (40,'Vivo Y71',4999,'This is product of Vivo Phones.','https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000243118-1_1.jpg','Smartphone','2018-10-31 06:50:46.711',29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (41,'Acer Swift SF714-51T-M3JU/T002',59990,'This is product of Acer Notebooks.','https://img10.jd.co.th/n0/jfs/t31/85/91278850/190606/1ed85b34/5c590f41N05e29f5c.jpg!q70.jpg','Notebook','2018-03-17 08:34:26.198',10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (42,'Acer Swift SF514-52T-83C0/T004',42990,'This is product of Acer Notebooks.','https://www.jib.co.th/img_master/product/original/20180917102007_29880_21_1.jpg','Notebook','2018-05-07 22:26:00.267',9,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (43,'Acer Swift SF514-52T-57ZG/T004',32990,'This is product of Acer Notebooks.','https://www.jib.co.th/img_master/product/original/20181211173952_28865_235_1.jpg','Notebook','2018-06-18 04:16:56.235',15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (44,'Acer Swift SF315-41-R7JD/T017(W)',22990,'This is product of Acer Notebooks.','https://www.jib.co.th/img_master/product/original/20180910132840_29206_23_1.jpg','Notebook','2018-10-08 12:54:16.276',1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (45,'Acer Swift SF315-41-R4YS/T019',20990,'This is product of Acer Notebooks.','https://notebookspec.com/nbs/upload_notebook/20180130-155255_c.jpg','Notebook','2018-07-05 01:44:05.909',24,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (46,'Asus VivoBook S530UN-BQ187T',29990,'This is product of Asus Notebooks.','https://notebookspec.com/nbs/upload_notebook/20180829-143347_c.jpg','Notebook','2018-03-10 00:02:58.819',14,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (47,'Asus VivoBook S410UN-EB292T',29990,'This is product of Asus Notebooks.','https://www.jib.co.th/img_master/uploads/Content/S410UNEB292T/img-performance.png','Notebook','2018-10-04 08:19:06.467',29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (48,'Asus VivoBook S510UN-BQ208T(W)',27990,'This is product of Asus Notebooks.','https://www.jib.co.th/img_master/uploads/Content/S510UNBQ208T/1509184563456.jpg','Notebook','2018-05-26 17:51:42.287',18,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (49,'Asus VivoBook S410UN-EB121T(W)',25990,'This is product of Asus Notebooks.','https://www.jib.co.th/img_master/product/original/20180718085815_28301_24_1.png','Notebook','2018-01-24 19:35:54.123',7,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (50,'Asus ZenBook UX410UQ-GV052T(W)',25900,'This is product of Asus Notebooks.','https://notebookspec.com/nbs/upload_notebook/20170223-103931_c.png','Notebook','2018-01-19 10:22:14.048',14,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (51,'Dell XPS13W56791606TH-SL',79990,'This is product of Dell Notebooks.','https://notebookspec.com/nbs/upload_notebook/20211029-230435_c.jpg','Notebook','2018-05-16 21:38:29.875',9,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (52,'Dell W56691425TH-Wh',32990,'This is product of Dell Notebooks.','https://aumento.officemate.co.th/media/catalog/product/y/0/y066528.jpg?imwidth=640','Notebook','2018-04-23 04:53:20.385',16,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (53,'Dell V5471-W56854202THW-Sr(W)',30990,'This is product of Dell Notebooks.','https://img.biggo.com.tw/s6p1k8qO42sNRupNUG0nqTHPsuQVC4S-z7-PawhY9pvI/http://sub.tw/productimg/202004301008305cd22ba207956ef15303b6e01484944b.jpg','Notebook','2018-08-12 14:22:19.190',6,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (54,'Dell 7472-W56791261TH-Gy(W)',29990,'This is product of Dell Notebooks.','https://notebookspec.com/nbs/upload_notebook/20170331-131129_c.jpg','Notebook','2018-05-12 02:16:35.234',17,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (55,'Dell 5370-W566851005PTH-Sl',29990,'This is product of Dell Notebooks.','https://notebookspec.com/nbs/upload_notebook/20180622-171723_cp.jpg','Notebook','2018-09-15 21:54:30.718',22,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (56,'HP ENVY 13-AD168TX',40490,'This is product of HP Notebooks.','https://www.specnotebook.com/wp-content/uploads/2019/02/ENVY-13-f.jpg','Notebook','2018-09-24 10:10:18.635',19,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (57,'HP ENVY x360 13-AG0000AU',29990,'This is product of HP Notebooks.','https://notebookspec.com/nbs/upload_notebook/20210210-105301_c.jpg','Notebook','2018-03-30 22:16:41.101',12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (58,'HP ENVY 13-AD167TX',27990,'This is product of HP Notebooks.','https://notebookspec.com/nbs/upload_notebook/20180604-131254_c.jpg','Notebook','2018-02-22 05:29:48.098',14,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (59,'HP Pavilion x360 14-CD0037TX(W)',26990,'This is product of HP Notebooks.','https://notebookspec.com/nbs/upload_notebook/20210210-115501_c.jpg','Notebook','2018-07-04 01:22:19.385',6,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (60,'HP X360 14-BA158TX',26990,'This is product of HP Notebooks.','https://notebookspec.com/nbs/upload_notebook/20180516-130554_c.jpg','Notebook','2018-06-25 15:58:04.645',12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (61,'Lenovo 720S-15IKB-81AC001DTA(W)',49990,'This is product of Lenovo Notebooks.','https://www.jib.co.th/img_master/product/original/20180924101218_28926_21_1.jpg','Notebook','2018-09-30 12:26:47.112',12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (62,'Lenovo 720S-81BV4YTA(W)',30990,'This is product of Lenovo Notebooks.','https://notebookspec.com/nbs/upload_notebook/20180205-170326_c.jpg','Notebook','2018-01-17 00:11:17.376',20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (63,'Lenovo YOGA 530-14IKB 81EK000XTA(W)',29990,'This is product of Lenovo Notebooks.','https://notebookspec.com/nbs/upload_notebook/20180525-151128_c.jpg','Notebook','2018-09-07 14:47:40.447',2,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (64,'Lenovo YOGA 520-81C800D6TA(W)',29990,'This is product of Lenovo Notebooks.','https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/0/0/000237566_yoga520-14ikbr.jpg','Notebook','2018-02-27 02:39:53.912',14,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (65,'Lenovo YOGA 520-81C8007LTA(W)',29990,'This is product of Lenovo Notebooks.','https://notebookspec.com/nbs/upload_notebook/20170627-193527_c.jpg','Notebook','2018-01-02 17:27:51.004',21,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (66,'MSI GP73 8RE-454TH',43900,'This is product of MSI Notebooks.','https://notebookspec.com/web/wp-content/uploads/2018/08/MSI-GP73-Leopart-8RE-30.jpg','Notebook','2018-08-09 14:44:20.872',19,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (67,'MSI GF62 8RE-031TH',39990,'This is product of MSI Notebooks.','https://notebookspec.com/nbs/upload_notebook/20180524-160846_c.jpg','Notebook','2018-07-27 11:23:15.187',7,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (68,'MSI GP73 8RD-083TH(W)',37900,'This is product of MSI Notebooks.','https://notebookspec.com/nbs/upload_notebook/20180524-155846_c.jpg','Notebook','2018-02-24 06:59:13.117',21,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (69,'MSI GP62M 7REX-2633TH(W)(No Bag)',37900,'This is product of MSI Notebooks.','https://notebookspec.com/nbs/upload_notebook/20170905-154733_c.jpg','Notebook','2018-04-26 16:11:37.276',10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (70,'MSI GF62 8RE-055TH',36900,'This is product of MSI Notebooks.','https://notebookspec.com/nbs/upload_notebook/20180524-160846_c.jpg','Notebook','2018-01-28 17:25:47.459',23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (71,'Huawei M5 Pro',18990,'This is product of Huawei Tablets.','https://consumer-img.huawei.com/content/dam/huawei-cbg-campaign/2018/mediapad-m5-10-pro/common/m5-10pro-listimage-grey.png','Tablet','2018-09-25 06:42:30.846',1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (72,'Huawei M5',13990,'This is product of Huawei Tablets.','https://media.bnn.in.th/media/huawei/huawei-tablet-mediapad-m5-8-4-inch-gray/6901443227723-content7.jpg','Tablet','2018-08-12 18:05:55.425',1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (73,'Huawei M3',12900,'This is product of Huawei Tablets.','https://consumer-res.huaweistatic.com/th/tablets/mediapad-m3-th/assets/mediapadm3/images/1-header-front.png?1489418247852','Tablet','2018-04-03 18:03:13.014',23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (74,'Huawei T3',7990,'This is product of Huawei Tablets.','https://img01.huaweifile.com/sg/ms/ph/pms/product/6901443364336/800_800_CA5B65BD23C9FDC142197321688D409325EE3CEEBF37F0FFmp.webp','Tablet','2018-08-15 23:11:39.031',2,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (75,'Lenovo MIIX 520-121KB-81CG01LXTA(W)',32990,'This is product of Lenovo Tablets.','https://notebookspec.com/nbs/upload_notebook/20171220-110713_c.jpg','Tablet','2018-01-02 08:48:44.658',23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (76,'Lenovo MIIX 520-121KB-81CG01LWTA(W)',24990,'This is product of Lenovo Tablets.','https://notebookspec.com/nbs/upload_notebook/20171220-110713_c.jpg','Tablet','2018-02-01 12:54:08.448',28,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (77,'Lenovo YOGA Book YB1-X91F-ZA150147TH(W)',22990,'This is product of Lenovo Tablets.','https://notebookspec.com/nbs/upload_notebook/20160915-133057_c.jpg','Tablet','2018-01-11 18:02:29.947',4,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (78,'Lenovo MIIX 320-10ICR 80XF00G7TA(LTE)',15990,'This is product of Lenovo Tablets.','https://www.notebookcheck.net/uploads/tx_nbc2/LenovoMiix320__1_.JPG','Tablet','2018-10-15 00:26:32.975',29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (79,'Samsung Galaxy Tab S4',23900,'This is product of Samsung Tablets.','https://www.notebookcheck.net/fileadmin/Notebooks/Samsung/Galaxy_Tab_S4/Samsung_Galaxy_Tab_S4_5030.jpg','Tablet','2018-09-28 08:41:07.328',19,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (80,'Samsung Galaxy Tab S3',21900,'This is product of Samsung Tablets.','https://images.samsung.com/is/image/samsung/latin-en-galaxy-tab-s3-lte-sm-t825nzkatpa-frontblack-75668276?$720_576_PNG$','Tablet','2018-07-03 04:54:08.168',30,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (81,'Samsung Galaxy Tab A 10.1',11900,'This is product of Samsung Tablets.','https://images.samsung.com/is/image/samsung/sg-galaxy-tab-a-t515-sm-t515nzkexsp-frontblack-thumb-165452577?$480_480_PNG$','Tablet','2018-02-04 21:58:54.075',20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (82,'Samsung Galaxy Tab A 8.0',8900,'This is product of Samsung Tablets.','https://images.samsung.com/is/image/samsung/au-galaxy-taba-t290-sm-t290nzkaxsa-frontblack-thumb-172128804?$480_480_PNG$','Tablet','2018-05-27 02:40:47.501',20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (83,'Surface Book 2 15inch 1TB',118900,'This is product of Surface Tablets.','https://notebookspec.com/nbs/upload_notebook/20180217-173630_c.jpg','Tablet','2018-02-09 22:32:35.148',23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (84,'Surface Book 2 13inch',109900,'This is product of Surface Tablets.','https://www.jib.co.th/img_master/product/original/20180801152037_29113_24_1.png','Tablet','2018-03-11 02:45:19.436',18,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (85,'Surface Book 2 15inch 512GB',103900,'This is product of Surface Tablets.','https://notebookspec.com/nbs/upload_notebook/20180217-173630_c.jpg','Tablet','2018-09-16 08:05:58.742',23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (86,'Surface Laptop 13inch',101900,'This is product of Surface Tablets.','https://notebookspec.com/nbs/upload_notebook/20180217-173630_c.jpg','Tablet','2018-07-25 22:41:08.168',1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (87,'Fujifilm Camera Compact X-100F EE Silver',46990,'This is Compact Camera Products.','Sony Camera Compact DSC-RX100M4','Camera','2018-10-17 05:02:58.412',23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (88,'Sony Camera Compact DSC-RX100M5',31990,'This is Compact Camera Products.','https://www.sony.co.th/image/994cd965d02e91cc99108fead8257aed?fmt=pjpeg&wid=1014&hei=396&bgcolor=F1F5F9&bgc=F1F5F9','Camera','2018-03-01 20:01:32.468',8,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (89,'Sony Camera Compact DSC-RX100M4',29990,'This is Compact Camera Products.','https://www.sony.co.th/image/59416b80c62a6a184e16b04ec3a60143?fmt=pjpeg&bgcolor=FFFFFF&bgc=FFFFFF&wid=2515&hei=1320','Camera','2018-02-25 08:04:33.705',17,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (90,'Sony Compact Camera RX0',24990,'This is Compact Camera Products.','https://www.sony.co.th/image/d2fb8d52e2a5d79f689ec2c5833331dc?fmt=pjpeg&wid=330&bgcolor=FFFFFF&bgc=FFFFFF','Camera','2018-04-22 14:50:52.632',18,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (91,'Canon Camera Compact PWS G7X Mark II',20690,'This is Compact Camera Products.','https://th.canon/media/image/2018/08/01/fc54e82dac214218993365522272bdbf_powershot-g7-x-mark-ii.png','Camera','2018-03-04 01:49:08.409',30,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (92,'Nikon Camera Compact Coolpix P900 BK',19900,'This is Compact Camera Products.','https://www.ec-mall.com/wp-content/uploads/2015/07/Nikon-Coolpix-P900_1.jpg','Camera','2018-03-22 06:56:35.958',10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (93,'Canon Camera DSLR EOS 5D MARK IV + Lens EF24-105 F4 L II',170900,'This is DSLR Camera Products.','https://th.canon/media/image/2018/07/03/8a2741e6db5f49f5b7ae91e34c3ad045_eos-5d-mk-iv-body-b21.png','Camera','2018-09-19 05:22:20.863',29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (94,'Nikon Camera DSLR D850 24-120 4G ED VR Kit',144900,'This is DSLR Camera Products.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000238484_2.jpg','Camera','2018-01-04 05:17:11.476',29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (95,'Canon Camera DSLR EOS 5D MaARK IV + Lens EF24-70 F4 L IS USM',129900,'This is DSLR Camera Products.','https://th.canon/media/image/2018/07/03/8a2741e6db5f49f5b7ae91e34c3ad045_eos-5d-mk-iv-body-b21.png','Camera','2018-08-10 02:15:42.712',9,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (96,'Nikon DSLR Camera D850 Body',124900,'This is DSLR Camera Products.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000238484_2.jpg','Camera','2018-06-01 17:14:35.369',7,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (97,'Canon Camera DSLR EOS 5D MARK IV Body',100900,'This is DSLR Camera Products.','https://th.canon/media/image/2018/07/03/8a2741e6db5f49f5b7ae91e34c3ad045_eos-5d-mk-iv-body-b21.png','Camera','2018-07-06 00:24:59.427',26,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (98,'Nikon Camera DSLR D750 24-120 KIT',89990,'This is DSLR Camera Products.','https://www.digital2home.com/wp-content/uploads/2019/08/nikon-d750-af-s-nikkor-24-120mm-02.jpg','Camera','2018-08-20 15:13:23.045',20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (99,'Leica Mirrorless Camera M10 Black Chrome Finish',275200,'This is Mirrorless Camera Products.','https://www.zoomcamera.net/wp-content/uploads/2020/11/Leica-M10-R-Digital-Rangefinder-Camera-Black-Chrome-1.jpg','Camera','2018-02-27 00:42:02.304',4,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (100,'Leica Mirrorless Camera SL (Typ 601)Black',232400,'This is Mirrorless Camera Products.','https://cdn.shopify.com/s/files/1/0253/1179/products/TBPhotography-7330_1024x1024.jpg?v=1571438640','Camera','2018-10-29 01:50:12.680',23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (101,'Leica Mirrorless Camera CL PRIME KIT 18mm.',137500,'This is Mirrorless Camera Products.','https://www.bhphotovideo.com/images/images2500x2500/leica_19313_cl_mirrorless_digital_camera_1435942.jpg','Camera','2018-04-16 03:57:06.907',17,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (102,'Sony Mirrorless Camera ILCE-7M3K/BCAP2',74990,'This is Mirrorless Camera Products.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/0/0/000239060_ilce-7m3k_1.jpg','Camera','2018-08-30 09:28:16.453',7,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (103,'Fujifilm Camera Mirrorless X-T2/18-55 Kit-EE Black',69990,'This is Mirrorless Camera Products.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/0/0/000244174_x-t3b1855kit.jpg','Camera','2018-07-01 00:52:59.178',9,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (104,'Fujifilm Mirrorless Camera X-T2 Kit 18-135mm.',59990,'This is Mirrorless Camera Products.','https://media-cdn.bnn.in.th/15243/4516278933927-3-square_medium.jpg','Camera','2018-04-23 10:34:07.248',17,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (105,'Anitech Multi-Cooker S200',1790,'This Home Appliance Products.','https://www.jib.co.th/img_master/product/original/20181016175020_30469_24_1.png','Gadget','2018-09-19 06:49:23.458',15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (106,'Anitech Induction S100-Red',1590,'This Home Appliance Products.','https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000237946.jpg','Gadget','2018-08-06 06:09:55.478',16,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (107,'Anitech Oven S101 BarBGon',1550,'This Home Appliance Products.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000244345.jpg','Gadget','2018-04-30 10:39:48.147',9,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (108,'Anitech Smoothie S301-BarBGon',990,'This Home Appliance Products.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000244345.jpg','Gadget','2018-05-14 16:50:55.089',3,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (109,'DJI Mavic Pro Platinum Fly More Combo Alpine Silver',59300,'This is Hoobby & Entertainment Products.','https://credityou.co/upload/image/202006/b5b00620-9a37-4940-acba-2cbc20a6a044.jpg','Gadget','2018-06-09 05:02:21.358',0,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (110,'DJI Mavic 2 Pro (EU) Dark Grey',56500,'This is Hoobby & Entertainment Products.','https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/2/4/244158_y.jpg','Gadget','2018-04-24 21:20:12.418',15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (111,'DJI Mavic 2 Zoom (EU) Dark Gray',49000,'This is Hoobby & Entertainment Products.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/2/4/244156_y_1.jpg','Gadget','2018-07-05 00:48:03.470',3,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (112,'DJI Mavic Pro Platinum Alpine Silver',46600,'This is Hoobby & Entertainment Products.','https://itgadget.co.th/wp-content/uploads/2018/12/PicQuery-2-400x400.jpg','Gadget','2018-07-08 10:42:52.008',20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (113,'CS@ iRobot roomba 980',39800,'This is Home Automation Products.','https://www.thanop.com/wp-content/uploads/2016/05/irobot-roomba-980-side.jpg','Gadget','2018-09-21 18:10:59.975',6,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (114,'CS@ iRobot roomba 960',36900,'This is Home Automation Products.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/2/4/242910_roomba_960_2_.jpg','Gadget','2018-03-07 07:40:40.656',15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (115,'CS@ iRobot roomba 890',29900,'This is Home Automation Products.','https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/0/0/000234768_roomba_890_1.jpg','Gadget','2018-03-18 01:06:40.425',12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (116,'CS@ iRobot roomba 670',20900,'This is Home Automation Products.','https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/2/4/242912_roomba670_2__1.jpg','Gadget','2018-06-24 08:43:09.708',23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (117,'CS@ Garmin Smartwatch Fenix 5 Plus (GPS/SEA) DLC Carbon Gray w/Black Band',30900,'This is Activity Tracker Products.','https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/0/0/000267837_fenix5_plus_tita_sap.jpg','Gadget','2018-05-30 16:10:07.475',8,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (118,'CS@ Garmin Smartwatch Fenix 5,Sapphire Black, GPS Watch, SEA',23900,'This is Activity Tracker Products.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000242423-2.jpg','Gadget','2018-03-26 16:26:07.121',3,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (119,'CS@ Garmin Smartwatch Fenix 5S Frost Blue Tone Sapphire with forst blue band',23900,'This is Activity Tracker Products.','https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/0/0/000267831_fenix_5s_sap_frost_1.jpg','Gadget','2018-10-23 10:02:09.032',12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (120,'CS@ Garmin Smartwatch Forerunner 235 Black Gray',9690,'This is Activity Tracker Products.','https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/P/W/PWB000224477.jpg','Gadget','2018-02-27 07:32:07.470',2,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (121,'GoPro Camera FUSION Black',22000,'This is Camera Products.','https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/2/3/238232_y.jpg','Gadget','2018-06-08 01:00:44.996',19,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (122,'GoPro Hero7 Black',14500,'This is Camera Products.','https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/2/4/249825_bundle_1.jpg','Gadget','2018-02-16 11:42:55.063',15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (123,'GoPro Hero6 Black',12900,'This is Camera Products.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000235236_1.jpg','Gadget','2018-10-12 03:47:24.747',6,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (124,'CS@ Remax Car Holder LETTO 3in1 Magnetic Charging Black',599,'This is Accessory Items.','https://aumento.officemate.co.th/media/catalog/product/O/F/OFM4005039.jpg','Accessory','2018-03-05 10:13:39.457',12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (125,'CS@ Remax Car Holder LETTO 3in1 Magnetic Charging Silver',599,'This is Accessory Items.','https://aumento.officemate.co.th/media/catalog/product/O/F/OFM4005039.jpg','Accessory','2018-03-17 04:35:51.412',4,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (126,'Loukin Screen Cleaner 100ml Blue',250,'This is Accessory Items.','https://media.bnn.in.th/media/loukin/loukin-screen-cleaner-100ml-green/6955725001853-content1.jpg','Accessory','2018-03-28 13:06:08.708',0,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (127,'Loukin Screen Cleaner 100ml Green',250,'This is Accessory Items.','https://media.bnn.in.th/media/loukin/loukin-screen-cleaner-100ml-green/6955725001853-content1.jpg','Accessory','2018-03-15 18:58:02.235',10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (128,'Pentagonz Joy Dakuwaqa Black',990,'This is Accessory Items.','http://https://media-cdn.bnn.in.th/84272/8859221706763-1-square_medium.jpg','Accessory','2018-02-15 09:58:50.089',4,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (129,'Anitech Joy Pad J236 Black',490,'This is Accessory Items.','https://www.jib.co.th/img_master/product/original/20180920172830_20493_24_1.png','Accessory','2018-10-06 01:21:17.012',10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (130,'CS@ Remax Microphone Karaoke RMK-K02 Gold',1150,'This is Accessory Items.','https://www.ido.lk/wp-content/uploads/2021/03/Noise-Canceling-Professional-Microphone.jpg','Accessory','2018-04-20 07:29:33.425',15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (131,'CS@ Remax Microphone Karaoke RMK-K02 Silver',1150,'This is Accessory Items.','https://aumento.officemate.co.th/media/catalog/product/O/F/OFM4005091.jpg?imwidth=640','Accessory','2018-06-03 18:18:00.748',19,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (132,'Belkin Valet Charge Dock for Apple Watch/iPhone Silver (F8J183qeSLV)',5790,'This is Accessory Items.','https://www.belkin.com/images/product_webdam/978196/renditions/webdam.web.1000.1000.jpeg','Accessory','2018-05-17 22:34:00.123',20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (133,'Belkin PowerHouse Charge Dock for Apple Watch + iPhone Black(FJ200qeBLK)',4390,'This is Accessory Items.','https://www.belkin.com/images/productmt_aem/f0193e94-23c9-4b81-a217-7d33b50fc601/renditions/cq5dam.web.1000.1000.jpeg','Accessory','2018-08-04 04:48:49.147',26,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (134,'Targus Numeric Keypad (TGS-AKP10AP)',550,'This is Accessory Items.','https://www.belkin.com/images/productmt_aem/f0193e94-23c9-4b81-a217-7d33b50fc601/renditions/cq5dam.web.1000.1000.jpeg','Accessory','2018-09-11 18:41:27.356',20,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (135,'Keypad Retractable Wireless Anitech N181-Black',429,'This is Accessory Items.','https://storage.googleapis.com/anitech-cloud-media/2020/04/Keypad-N181-01.jpg','Accessory','2018-02-14 11:54:44.432',18,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (136,'Spigen Regnum A103 Mouse Pad Silk (000EP20877)',650,'This is Accessory Items.','https://media-cdn.bnn.in.th/77062/8809466649424-1-square_medium.jpg','Accessory','2018-06-01 15:08:53.402',1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (137,'Spigen Regnum A100 Mouse Pad Silk (SGP11884)',490,'This is Accessory Items.','https://www.spigen.com.sg/pub/media/catalog/product/cache/913882db37a51ac3e7bd768e2b01bd7d/7/1/71puoc7wqil._sl1000_.jpg','Accessory','2018-03-08 08:52:14.602',15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (138,'CS@ Ugreen USB 3.0 HUB with Type-C port Black (40850)',690,'This is Accessory Items.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/0/0/000270477_40850_usbc_4port_bk.jpg','Accessory','2018-05-26 10:11:58.248',28,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (139,'Momax Onelink Multi-Media Card Reader',690,'This is Accessory Items.','https://mercular.s3.ap-southeast-1.amazonaws.com/images/products/2021/06/Product/momax-one-link-mult-media-card-reader-silver-01.jpg','Accessory','2018-06-23 09:18:50.361',10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (140,'CS@ Ugreen Type-C Multifunctional Converter (40873)',2990,'This is Accessory Items.','https://media-cdn.bnn.in.th/103663/6957303848737-1.jpg','Accessory','2018-10-21 18:30:53.508',23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (141,'PQI USB-C 6-Port Multi Pro HUB Black',2990,'This is Accessory Items.','https://media-cdn.bnn.in.th/18886/4712876273360-3-square_medium.jpg','Accessory','2018-08-21 03:36:54.482',12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (142,'Bose SoundWear Companion Speaker Black',13500,'This is Speaker Items.','https://backend.central.co.th/media/catalog/product/c/4/c466c45806b8990e0a87f9631cfa0ec6a3d24388_641eba3d24734b16b7897343afeaae4fdummy_3.jpg','Accessory','2018-05-31 16:36:16.712',21,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (143,'Marshall Speaker Kilburn Black + Major II Bluetooth Black (Bundle Pack)',11990,'This is Speaker Items.','https://www.jib.co.th/img_master/product/original/2018071810544730637_1.jpg','Accessory','2018-02-24 01:38:16.435',29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (144,'Marshall Speaker Bluetooth 2.1 Woburn Multi-Room Black',27990,'This is Speaker Items.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000241951.jpg','Accessory','2018-10-30 01:51:20.469',7,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (145,'Marshall Speaker Bluetooth 2.1 Woburn Black',24990,'This is Speaker Items.','https://media-cdn.bnn.in.th/52577/7340055355391-3-square_medium.jpg','Accessory','2018-04-30 20:51:13.120',13,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (146,'Creative Speaker 2.0 SBS A60',415,'This is Speaker Items.','https://www.jib.co.th/img_master/product/original/20180801131321_5386_21_1.jpg','Accessory','2018-06-15 10:23:44.491',13,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (147,'Anitech Speaker SK220',399,'This is Speaker Items.','https://static-01.shop.com.mm/original/cc1a34eacab3bf4899e9a7c94ab32e16.jpg','Accessory','2018-05-13 16:32:38.025',1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (148,'Microlab Speaker 2.1 X3',2650,'This is Speaker Items.','https://www.jib.co.th/img_master/product/original/20180802141034_14725_21_1.jpg','Accessory','2018-06-19 15:26:09.147',12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (149,'EDIFIER Speaker 2.1 M1335',1990,'This is Speaker Items.','https://mercular.s3.ap-southeast-1.amazonaws.com/upload/products/2018/05/Edifier-M1335-Speaker.jpg','Accessory','2018-07-11 02:41:37.965',23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (150,'CS@ Jabra Bluetooth Headset Pulse Elite Sport 4.5 hours Grey',9900,'This is Headphone Items.','https://media.bnn.in.th/media/jabra/bluetooth-headset-pulse-elite-sport-4-5-hours-grey/5707055043345-content1.jpg','Accessory','2018-09-29 19:23:42.428',14,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (151,'CS@ Plantronics Voyager 3240 with Case Black',4890,'This is Headphone Items.','https://img10.jd.co.th/n0/jfs/t22/50/10663283/148234/4ecdc7ad/5b56a843Nac5e2cba.jpg!q70.jpg','Accessory','2018-01-18 10:06:26.675',12,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (152,'Philips Earbud SHE3010/00 White',290,'This is Headphone Items.','https://res.wemall.com/945263/w_640,h_640,c_thumb/w_640,h_640,c_crop/2952c79a035c3cf5f51f5bbdb955488c/2029640101.jpg','Accessory','2018-10-23 11:52:26.721',15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (153,'Philips Earbud SHE3010/00 Black',290,'This is Headphone Items.','https://images.philips.com/is/image/PhilipsConsumer/SHE3010BK_00-IMS-en_AU?wid=420&hei=360&$jpglarge$','Accessory','2018-04-21 08:59:11.425',16,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (154,'Sony Earbud with Mic. MDR AS210 AP Black',790,'This is Headphone Items.','https://media-cdn.bnn.in.th/15654/4548736033429-1-square_medium.jpg','Accessory','2018-05-03 02:34:47.589',9,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (155,'Sony Earbud with Mic. MDR AS210 AP White',790,'This is Headphone Items.','https://th-live-02.slatic.net/p/0d6c0f4a2864ecd89e1958138a00769e.jpg','Accessory','2018-05-04 11:19:53.607',28,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (156,'Sony Headphone with Mic. Wireless WH-1000XM2NME Gold',13990,'This is Headphone Items.','https://store.sony.com.au/dw/image/v2/ABBC_PRD/on/demandware.static/-/Sites-sony-master-catalog/default/dw3c9923d3/images/WH1000XM2N/WH1000XM2N.png','Accessory','2018-06-30 19:51:52.124',1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (157,'Marshall Headphone with Mic. Wireless Mid',7490,'This is Headphone Items.','https://media-cdn.bnn.in.th/52414/7340055332965-1-square_medium.jpg','Accessory','2018-08-06 16:46:26.153',19,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (158,'JBL Inear Inspire 100 Red',890,'This is Headphone Items.','https://media-cdn.bnn.in.th/49563/6925281922732-3-square_medium.jpg','Accessory','2018-01-02 02:58:27.758',7,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (159,'JBL Inear Inspire 100 Teal',890,'This is Headphone Items.','https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000233432-1_1.jpg','Accessory','2018-02-04 20:07:28.480',23,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (160,'Sony Unear with Mic. MDR-XB80BSLZE Blue',4990,'This is Headphone Items.','https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/P/W/PWB000227014.jpg','Accessory','2018-04-27 05:31:21.697',24,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (161,'Sony Unear with Mic. MDR-XB80BSLZE Black',4990,'This is Headphone Items.','https://m.media-amazon.com/images/I/51kOEV1JmPL._SY355_.jpg','Accessory','2018-07-22 22:50:22.120',14,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (162,'BeoPlay Inear with Mic. Wireless Earset Black',12900,'This is Headphone Items.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/0/0/000236345_b43-e8-blk_2.jpg','Accessory','2018-01-09 15:55:01.247',29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (163,'BeoPlay Inear with Mic. Wireless Earset White',12900,'This is Headphone Items.','https://media-cdn.bnn.in.th/40966/5705260073218-1-square_medium.jpg','Accessory','2018-05-29 15:15:30.489',10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (164,'SanDisk iXpand Charger and Backup Base 256GB',6790,'This is Data Storage Items.','https://media-cdn.bnn.in.th/42962/619659164805-001-square_medium.jpg','Accessory','2018-04-25 00:37:18.140',8,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (165,'SanDisk iXpand Charger and Backup Base 128GB',4290,'This is Data Storage Items.','https://media-cdn.bnn.in.th/42956/619659164799-1-square_medium.jpg','Accessory','2018-08-27 19:01:38.370',29,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (166,'ADATA USB Drive S102PRO 128GB USB 3.0 Speed 100MB Grey',1920,'This is Data Storage Items.','https://www.invadeit.co.th/ImageHandlerInt.ashx?Oid=41914&Table=ProductBase&Column=Image&maxSize=440','Accessory','2018-03-01 17:33:24.248',16,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (167,'SanDisk Ultra Dual Drive USB Type-C 128GB USB3.1',1799,'This is Data Storage Items.','https://media-cdn.bnn.in.th/42670/619659142063-3-square_medium.jpg','Accessory','2018-08-09 22:53:30.082',19,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (168,'CS@ PhotoFast TubeDrive 64GB',3290,'This is Data Storage Items.','http://www.caseduck.com/images/content/original-1628400474516.png','Accessory','2018-07-02 02:57:30.480',10,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (169,'CS@ PhotoFast TubeDrive 32GB',2490,'This is Data Storage Items.','https://www.vgadz.com/wp-content/uploads/2021/07/1-160.png','Accessory','2018-04-23 13:16:39.732',25,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (170,'SanDisk MicroSDXC Ultra 256GB 100MB/s R Class10 (SDSQUAR_256G_GN6MA)',5950,'This is Data Storage Items.','https://media-cdn.bnn.in.th/43380/SanDisk-Ultra-MicroSDXC-C10-U1-UHS-I-120MB-s-R-256GB-1-square_medium.jpg','Accessory','2018-03-19 08:18:41.412',18,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (171,'SanDisk Micro SD Ultra SDXC 200GB',4569,'This is Data Storage Items.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000249479.jpg','Accessory','2018-08-16 06:34:54.368',0,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (172,'SanDisk SDXC Extreme Pro 128GB',3990,'This is Data Storage Items.','https://www.jib.co.th/img_master/product/original/2019030211483333128_1.JPG','Accessory','2018-01-10 12:47:20.704',1,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (173,'SanDisk SDXC Extreme 128GB',2315,'This is Data Storage Items.','https://www.jib.co.th/img_master/product/original/2019030211571433130_1.JPG','Accessory','2018-05-13 01:27:24.638',4,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (174,'Logitech Living Room Keyboard K400 Plus - Black',1690,'This is Mouse & Keyboard Items.','https://jib.co.th/img_master/product/original/20180919141259_19356_24_1.png','Accessory','2018-08-15 06:05:38.096',27,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (175,'Logitech Living Room Keyboard K400 Plus - White',1690,'This is Mouse & Keyboard Items.','https://media-cdn.bnn.in.th/4525/97855115379-00001.jpg','Accessory','2018-03-20 15:49:06.017',5,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (176,'Logitech Mouse Wireless MX Master 2S',3790,'This is Mouse & Keyboard Items.','https://www.jib.co.th/img_master/product/original/20180806114155_27641_24_1.png','Accessory','2018-03-12 22:35:59.257',11,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (177,'Logitech Mouse MX ERGO Wireless Trackball',3499,'This is Mouse & Keyboard Items.','https://resource.logitech.com/w_800,c_lpad,ar_4:3,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/mice/mx-ergo/gallery/mx-ergo-gallery-01.png?v=1','Accessory','2018-01-07 10:37:45.470',11,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (178,'Microsoft Keyboard + Mouse HW Desktop 900 Thai Wireless optical',1790,'This is Mouse & Keyboard Items.','https://media.bnn.in.th/media/microsoft/microsofe-keyboard-mouse-hw-desktop900/889842003024-content1.jpg','Accessory','2018-04-06 01:30:36.699',2,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (179,'Microsoft Keyboard + Mouse HW Desktop 2000 Wireless BlueTrack',1590,'This is Mouse & Keyboard Items.','https://media.bnn.in.th/media/microsoft/microsofe-keyboard-mouse-hw-desktop200/885370252866-content1.jpg','Accessory','2018-10-24 23:05:41.580',8,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (180,'Logitech Spotlight Wireless Bluetooth Presentation Remote New Slate',4299,'This is Mouse & Keyboard Items.','https://media-cdn.bnn.in.th/4659/97855127778-01-square_medium.jpg','Accessory','2018-01-15 03:46:19.473',24,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (181,'Logitech Spotlight Wireless Bluetooth Presentation Remote New Gold',4290,'This is Mouse & Keyboard Items.','https://media-cdn.bnn.in.th/92662/Logitech-Spotlight-Wireless-Bluetooth-Presentation-Remote-Gold-02-square_medium.jpg','Accessory','2018-04-20 20:26:15.736',13,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (182,'CS@ Cozistyle Laptop Bag 13-14 inch City Backpack Slim Ploy Collection Gray',3790,'This is Bag Items.','https://cdn4.425degree.com/media/catalog/product/cache/6c9c9feefb3972d2a3cb36150b8f09ee/g/2/g2_1_1.jpg','Accessory','2018-04-28 20:38:54.124',17,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (183,'CS@ Thule Backpack Crossover 25L Blue(15) TCBP317CB',3495,'This is Bag Items.','https://www.thule.com/-/p/WM0qzxXAqyChfRUtjTgtGGUe6J3GaUJPWbgmRkiRUU8/rs:fit/h:1200/w:1800/plain/approved/std.lang.all/40/16/584016.jpg','Accessory','2018-04-08 13:53:13.706',16,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (184,'CS@ Incase City Collection Brief for MacBook Pro 13 (CL55493) Black',3290,'This is Bag Items.','https://www.incase.co.th/wp-content/uploads/2020/03/1-11.jpg','Accessory','2018-05-14 09:11:08.523',17,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (185,'CS@ Incase City Collection 13 Brief Heather Black/Gunmetal Gray',3190,'This is Bag Items.','https://media.bnn.in.th/media/incase/incase-city-collection-13-brief-heather-black-gunmetal-gray/650450136721-content1.jpg','Accessory','2018-01-03 03:54:59.107',11,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (186,'BaNANA Luggage Set 20+24+28 inch set LB34 Black',4190,'This is Bag Items.','https://cf.shopee.co.th/file/0442cc548a94f1cd705adf5e796852ac','Accessory','2018-07-09 07:47:35.480',14,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (187,'Luggage BaNAN LB27 Silver',1990,'This is Bag Items.','https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/b/7/b722b06f6152d278fc48698f574d8d8c7c0ad64b_mkp0746362dummy_1.jpg','Accessory','2018-05-01 23:33:07.374',16,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (188,'CS@ Monopoly All in one organizer 13 Beige',1500,'This is Bag Items.','https://cf.shopee.co.th/file/ff5d4671f7d5b6508a8c3b0af4407d91','Accessory','2018-09-21 02:10:46.148',25,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (189,'CS@ Monopoly All in one organizer 13 Cool Grey',1500,'This is Bag Items.','https://cf.shopee.co.th/file/ff5d4671f7d5b6508a8c3b0af4407d91','Accessory','2018-02-18 13:22:24.693',5,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (190,'GP Battery Charger PB50 wRecyko + 2000mAh AA (pack 4)',1390,'This is Powerbank Items.','https://www.tohome.com/images/imageproduct/500/26052018/PB50GSCAE210-1.jpg?v=1','Accessory','2018-07-23 04:59:32.124',22,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (191,'GP Battery ReCykp+ 2600mAh AA wUSB Charger (pack4)',540,'This is Powerbank Items.','https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/P/W/PWB000234275.jpg','Accessory','2018-10-26 09:41:09.052',15,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (192,'Adonit TravelCube Adapter with Wireless Charger Black (Global)',2790,'This is Powerbank Items.','http://cdn.shopify.com/s/files/1/0286/0456/products/travelcube.701_1200x1200.png?v=1544501653','Accessory','2018-10-15 03:59:05.314',5,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (193,'CS@ Cheero Power Bank Danboard 13400 mah Snowman',2690,'This is Powerbank Items.','https://cheero.co.th/wp-content/uploads/cheero-power-plus-3-13400mah-white-05-600x400.png','Accessory','2018-05-23 19:14:35.570',25,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (194,'Wacom Stylus CTL-6100WL/P0-CX Medium Bluetooth Berry Pink',8779,'This is Stylus Items.','https://media-cdn.bnn.in.th/38596/4949268706131-2-square_medium.jpg','Accessory','2018-06-10 15:28:46.490',24,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (195,'Wacom Stylus CTL-6100WL/E0-CX Medium Bluetooth Pistachio Green',8779,'This is Stylus Items.','https://media-cdn.bnn.in.th/38596/4949268706131-2-square_medium.jpg','Accessory','2018-09-28 07:50:20.354',26,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (196,'Adonit Stylus Pixel Pro Black',3590,'This is Stylus Items.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000243215.jpg','Accessory','2018-06-01 15:36:29.077',9,1,'Thailand');
INSERT INTO Products(Product_ID,Product_Name,Product_Price,Product_Desc,Product_Image,Product_Category,Product_UpdateDate,Product_Stock,Product_Live,Product_Location) VALUES (197,'Adonit Stylus Pixel Pro Grey',3590,'This is Stylus Items.','https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000243216.jpg','Accessory','2018-02-21 14:00:25.142',5,1,'Thailand');

INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (1, 1, 1, 12900.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (2, 2, 1, 22500.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (3, 3, 1, 26500.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (4, 4, 1, 31500.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (5, 5, 1, 34500.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (6, 6, 1, 38500.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (7, 7, 1, 46500.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (8, 11, 1, 19900.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (9, 15, 1, 100900.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (10, 16, 1, 10900.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (11, 17, 1, 14400.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (12, 18, 1, 29900.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (13, 19, 1, 49900.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (14, 20, 1, 14400.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (15, 21, 1, 21900.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (16, 76, 10, 24990.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (17, 71, 16, 18990.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (18, 87, 1, 46990.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (19, 76, 10, 24990.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (20, 1, 14, 12900.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (21, 2, 8, 22500.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (22, 3, 5, 26500.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (23, 4, 14, 31500.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (24, 5, 3, 34500.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (25, 6, 7, 38500.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (26, 7, 1, 46500.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (27, 8, 4, 19900.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (28, 9, 1, 42100.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (29, 11, 2, 19900.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (30, 12, 2, 82900.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (31, 108, 1, 990.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (32, 141, 1, 2990.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (33, 141, 1, 2990.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (34, 141, 1, 2990.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (35, 108, 1, 990.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (36, 24, 1, 16900.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (37, 3, 1, 26500.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (38, 23, 1, 12990.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (39, 22, 1, 17990.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (40, 21, 2, 21900.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (41, 141, 4, 2990.0);
INSERT INTO ORDERS (ORDER_ID, ORDER_PRODUCTID, ORDER_PRODUCTQUANTITY, ORDER_PRODUCTPRICE) 
	VALUES (42, 41, 15, 59990.0);

INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (1, 4, 1, 60131, '2018-11-26 16:09:35.948', 'Nicola Hunt', 'Jeffersonville 3657 Charack Road  47130', 475100.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (2, 4, 2, 60131, '2018-11-26 16:09:35.948', 'Nicola Hunt', 'Jeffersonville 3657 Charack Road  47130', 475100.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (3, 4, 3, 60131, '2018-11-26 16:09:35.948', 'Nicola Hunt', 'Jeffersonville 3657 Charack Road  47130', 475100.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (4, 4, 4, 60131, '2018-11-26 16:09:35.948', 'Nicola Hunt', 'Jeffersonville 3657 Charack Road  47130', 475100.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (5, 4, 5, 60131, '2018-11-26 16:09:35.948', 'Nicola Hunt', 'Jeffersonville 3657 Charack Road  47130', 475100.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (6, 4, 6, 60131, '2018-11-26 16:09:35.948', 'Nicola Hunt', 'Jeffersonville 3657 Charack Road  47130', 475100.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (7, 4, 7, 60131, '2018-11-26 16:09:35.948', 'Nicola Hunt', 'Jeffersonville 3657 Charack Road  47130', 475100.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (8, 4, 8, 60131, '2018-11-26 16:09:35.948', 'Nicola Hunt', 'Jeffersonville 3657 Charack Road  47130', 475100.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (9, 4, 9, 60131, '2018-11-26 16:09:35.948', 'Nicola Hunt', 'Jeffersonville 3657 Charack Road  47130', 475100.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (10, 4, 10, 60131, '2018-11-26 16:09:35.948', 'Nicola Hunt', 'Jeffersonville 3657 Charack Road  47130', 475100.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (11, 4, 11, 60131, '2018-11-26 16:09:35.948', 'Nicola Hunt', 'Jeffersonville 3657 Charack Road  47130', 475100.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (12, 4, 12, 60131, '2018-11-26 16:09:35.948', 'Nicola Hunt', 'Jeffersonville 3657 Charack Road  47130', 475100.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (13, 4, 13, 60131, '2018-11-26 16:09:35.948', 'Nicola Hunt', 'Jeffersonville 3657 Charack Road  47130', 475100.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (14, 4, 14, 60131, '2018-11-26 16:09:35.948', 'Nicola Hunt', 'Jeffersonville 3657 Charack Road  47130', 475100.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (15, 4, 15, 60131, '2018-11-26 16:09:35.948', 'Nicola Hunt', 'Jeffersonville 3657 Charack Road  47130', 475100.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (16, 3, 16, 60146, '2018-11-26 16:10:04.444', 'Jerica Kelly', 'Bridgeport 1228 Raoul Wallenberg Place  6604', 664710.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (17, 3, 17, 60146, '2018-11-26 16:10:04.444', 'Jerica Kelly', 'Bridgeport 1228 Raoul Wallenberg Place  6604', 664710.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (18, 3, 18, 60146, '2018-11-26 16:10:04.444', 'Jerica Kelly', 'Bridgeport 1228 Raoul Wallenberg Place  6604', 664710.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (19, 1, 20, 60149, '2018-11-26 16:14:39.811', 'Bobby Freeman', 'San Diego 639 Ocello Street  92103', 1680900.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (20, 1, 21, 60149, '2018-11-26 16:14:39.811', 'Bobby Freeman', 'San Diego 639 Ocello Street  92103', 1680900.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (21, 1, 22, 60149, '2018-11-26 16:14:39.811', 'Bobby Freeman', 'San Diego 639 Ocello Street  92103', 1680900.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (22, 1, 23, 60149, '2018-11-26 16:14:39.811', 'Bobby Freeman', 'San Diego 639 Ocello Street  92103', 1680900.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (23, 1, 24, 60149, '2018-11-26 16:14:39.811', 'Bobby Freeman', 'San Diego 639 Ocello Street  92103', 1680900.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (24, 1, 25, 60149, '2018-11-26 16:14:39.811', 'Bobby Freeman', 'San Diego 639 Ocello Street  92103', 1680900.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (25, 1, 26, 60149, '2018-11-26 16:14:39.811', 'Bobby Freeman', 'San Diego 639 Ocello Street  92103', 1680900.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (26, 1, 27, 60149, '2018-11-26 16:14:39.811', 'Bobby Freeman', 'San Diego 639 Ocello Street  92103', 1680900.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (27, 1, 28, 60149, '2018-11-26 16:14:39.811', 'Bobby Freeman', 'San Diego 639 Ocello Street  92103', 1680900.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (28, 1, 29, 60149, '2018-11-26 16:14:39.811', 'Bobby Freeman', 'San Diego 639 Ocello Street  92103', 1680900.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (29, 1, 30, 60149, '2018-11-26 16:14:39.811', 'Bobby Freeman', 'San Diego 639 Ocello Street  92103', 1680900.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (30, 1, 31, 60160, '2018-11-26 16:15:00.832', 'Bobby Freeman', 'San Diego 639 Ocello Street  92103', 990.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (31, 1, 32, 60161, '2018-11-26 16:16:02.493', 'Bobby Freeman', 'San Diego 639 Ocello Street  92103', 2990.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (32, 1, 33, 60162, '2018-11-26 16:16:08.982', 'Bobby Freeman', 'San Diego 639 Ocello Street  92103', 2990.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (33, 1, 34, 60163, '2018-11-26 16:16:17.84', 'Bobby Freeman', 'San Diego 639 Ocello Street  92103', 2990.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (34, 2, 35, 60164, '2018-11-26 16:17:21.826', 'Deanna Lane', 'Louisville 1918 Karen Lane  40207', 119170.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (35, 2, 36, 60164, '2018-11-26 16:17:21.826', 'Deanna Lane', 'Louisville 1918 Karen Lane  40207', 119170.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (36, 2, 37, 60164, '2018-11-26 16:17:21.826', 'Deanna Lane', 'Louisville 1918 Karen Lane  40207', 119170.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (37, 2, 38, 60164, '2018-11-26 16:17:21.826', 'Deanna Lane', 'Louisville 1918 Karen Lane  40207', 119170.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (38, 2, 39, 60164, '2018-11-26 16:17:21.826', 'Deanna Lane', 'Louisville 1918 Karen Lane  40207', 119170.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (39, 2, 40, 60164, '2018-11-26 16:17:21.826', 'Deanna Lane', 'Louisville 1918 Karen Lane  40207', 119170.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (40, 1, 41, 60170, '2018-11-26 16:18:32.869', 'Bobby Freeman', 'San Diego 639 Ocello Street  92103', 11960.0);
INSERT INTO ORDERDETAILS (DETAILID, DETAIL_USERID, DETAIL_ORDERID, DETAIL_ORDERNUMBER, DETAIL_ORDERDATE, DETAIL_USERREALNAME, DETAIL_ADDRESS, DETAIL_TOTALPRICE) 
	VALUES (41, 1, 42, 60171, '2018-11-26 16:19:43.268', 'Bobby Freeman', 'San Diego 639 Ocello Street  92103', 899850.0);

INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (1, 1, 'user.login', '2018-11-26 15:45:43.191', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (2, 1, 'user.login', '2018-11-26 15:45:54.003', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (3, 1, 'user.change_password', '2018-11-26 15:46:33.602', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (4, 1, 'user.failed_login', '2018-11-26 15:46:43.783', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (5, 1, 'user.login', '2018-11-26 15:46:45.421', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (6, 1, 'user.login', '2018-11-26 15:48:24.932', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (7, 1, 'user.login', '2018-11-26 15:48:39.688', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (8, 1, 'user.login', '2018-11-26 15:48:57.708', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (9, 1, 'user.change_email', '2018-11-26 15:49:09.828', 'Changed to tskirvin@optonline.net', NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (10, 2, 'user.login', '2018-11-26 15:51:36.56', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (11, 2, 'user.failed_login', '2018-11-26 15:51:48.051', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (12, 2, 'user.failed_login', '2018-11-26 15:51:49.149', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (13, 2, 'user.failed_login', '2018-11-26 15:51:49.769', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (14, 2, 'user.login', '2018-11-26 15:51:52.795', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (15, 2, 'user.change_password', '2018-11-26 15:52:05.684', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (16, 1, 'user.login', '2018-11-26 15:52:46.604', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (17, 1, 'user.login', '2018-11-26 15:53:03.004', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (18, 1, 'user.login', '2018-11-26 15:53:07.119', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (19, 1, 'user.login', '2018-11-26 15:53:11.41', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (20, 3, 'user.login', '2018-11-26 16:07:33.788', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (21, 3, 'user.login', '2018-11-26 16:07:50.294', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (22, 3, 'user.login', '2018-11-26 16:08:00.012', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (23, 3, 'user.failed_login', '2018-11-26 16:08:05.404', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (24, 3, 'user.failed_login', '2018-11-26 16:08:11.096', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (25, 3, 'user.failed_login', '2018-11-26 16:08:14.208', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (26, 3, 'user.login', '2018-11-26 16:08:17.755', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (27, 4, 'user.login', '2018-11-26 16:08:42.5', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (28, 4, 'user.order', '2018-11-26 16:09:36.068', '60131', NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (29, 3, 'user.login', '2018-11-26 16:09:46.127', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (30, 3, 'user.order', '2018-11-26 16:10:04.517', '60146', NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (31, 3, 'user.login', '2018-11-26 16:13:04.801', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (32, 1, 'user.login', '2018-11-26 16:13:36.392', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (33, 1, 'user.order', '2018-11-26 16:14:39.951', '60149', NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (34, 1, 'user.order', '2018-11-26 16:15:00.897', '60160', NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (35, 1, 'user.login', '2018-11-26 16:15:31.268', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (36, 1, 'user.order', '2018-11-26 16:16:02.562', '60161', NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (37, 1, 'user.order', '2018-11-26 16:16:09.044', '60162', NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (38, 1, 'user.order', '2018-11-26 16:16:18.118', '60163', NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (39, 1, 'user.failed_login', '2018-11-26 16:16:26.272', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (40, 1, 'user.login', '2018-11-26 16:16:27.446', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (41, 1, 'user.change_password', '2018-11-26 16:16:40.439', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (42, 2, 'user.login', '2018-11-26 16:16:52.639', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (43, 2, 'user.order', '2018-11-26 16:17:21.889', '60164', NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (44, 2, 'user.failed_login', '2018-11-26 16:17:28.237', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (45, 2, 'user.failed_login', '2018-11-26 16:17:30.447', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (46, 2, 'user.login', '2018-11-26 16:17:35.03', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (47, 1, 'user.login', '2018-11-26 16:18:18.488', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (48, 1, 'user.order', '2018-11-26 16:18:32.927', '60170', NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (49, 2, 'user.failed_login', '2018-11-26 16:18:45.25', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (50, 2, 'user.login', '2018-11-26 16:18:48.436', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (51, 1, 'user.login', '2018-11-26 16:18:56.126', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (52, 1, 'user.failed_login', '2018-11-26 16:19:03.452', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (53, 1, 'user.login', '2018-11-26 16:19:04.46', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (54, 1, 'user.failed_login', '2018-11-26 16:19:07.63', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (55, 1, 'user.login', '2018-11-26 16:19:08.553', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (56, 1, 'user.failed_login', '2018-11-26 16:19:14.245', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (57, 1, 'user.login', '2018-11-26 16:19:15.366', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (58, 1, 'user.failed_login', '2018-11-26 16:19:18.066', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (59, 1, 'user.login', '2018-11-26 16:19:18.872', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (60, 1, 'user.failed_login', '2018-11-26 16:19:21.603', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (61, 1, 'user.login', '2018-11-26 16:19:22.498', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (62, 1, 'user.failed_login', '2018-11-26 16:19:25.488', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (63, 1, 'user.login', '2018-11-26 16:19:26.663', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (64, 1, 'user.login', '2018-11-26 16:19:34.793', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (65, 1, 'user.order', '2018-11-26 16:19:43.332', '60171', NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (66, 1, 'user.login', '2018-11-26 16:19:47.515', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (67, 1, 'user.login', '2018-11-26 16:20:03.783', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (68, 1, 'user.login', '2018-11-26 16:20:06.799', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (69, 1, 'user.login', '2018-11-26 16:20:09.22', NULL, NULL);
INSERT INTO ACCOUNTHISTORY (HISTORYID, HISTORY_USERID, HISTORY_TYPE, HISTORY_DATE, HISTORY_INFO, HISTORY_INFO2) 
	VALUES (70, 1, 'user.login', '2018-11-26 16:21:39.952', NULL, NULL);

-- 	