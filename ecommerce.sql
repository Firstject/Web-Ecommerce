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
 Product_Desc       VARCHAR(255) NOT NULL ,
 Product_Image      VARCHAR(255) NOT NULL ,
 Product_CategotyID INT NOT NULL ,
 Product_UpdateDate TIMESTAMP NOT NULL ,
 Product_Stock      SMALLINT NOT NULL ,
 Product_Live       SMALLINT NOT NULL ,
 Product_Locaton    VARCHAR(255) NOT NULL ,

PRIMARY KEY (Product_ID),
FOREIGN KEY (Product_CategotyID) REFERENCES ProductCategories (Category_ID)
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





