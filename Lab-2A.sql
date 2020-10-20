/*
 */

-- Place your solution to the lab in this file.

/* Part 1 */
IF NOT EXISTS (SELECT name FROM master.sys.databases WHERE name = N'L2A_NathanBabchuk')
BEGIN
    CREATE DATABASE [L2A_NathanBabchuk]
END
GO

USE [L2A_NathanBabchuk]
GO




IF EXISTS (SELECT [TABLE_NAME] FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'ConsignmentAgreement')
BEGIN
 
    DROP TABLE [ConsignmentAgreement]
END
GO



IF EXISTS (SELECT [TABLE_NAME] FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'ConsignmentLineitem')
BEGIN
 
    DROP TABLE [ConsignmentLineitem]
END
GO



IF EXISTS (SELECT [TABLE_NAME] FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Category')
BEGIN
 
    DROP TABLE [Category]
END
GO


 
IF EXISTS (SELECT [TABLE_NAME] FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'CustomerType')
BEGIN
 
    DROP TABLE [CustomerType]
END
GO

 IF EXISTS (SELECT [TABLE_NAME] FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Customer')
BEGIN
 
    DROP TABLE [Customer]
END
GO


IF EXISTS (SELECT [TABLE_NAME] FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'CustomerReward')
BEGIN
 
    DROP TABLE [CustomerReward]
END
GO

 
IF EXISTS (SELECT [TABLE_NAME] FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'StaffTraining')
BEGIN
 
    DROP TABLE [StaffTraining]
END
GO

IF EXISTS (SELECT [TABLE_NAME] FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Training')
BEGIN
 
    DROP TABLE [Training]
END
GO


IF EXISTS (SELECT [TABLE_NAME] FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'StaffType')
BEGIN
 
    DROP TABLE [StaffType]
END
GO

IF EXISTS (SELECT [TABLE_NAME] FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Staff')
BEGIN
 
    DROP TABLE [Staff]
END
GO
 

CREATE TABLE [StaffType]
(
    TypeID      int
    CONSTRAINT PK_StafffType_TypeID PRIMARY KEY
    
    
    
                        NOT NULL,   
    TypeName    varchar(20) NOT NULL,   
)

CREATE TABLE [Staff]
(
             StaffID       int              
             CONSTRAINT PK_Staff_StaffID PRIMARY KEY CLUSTERED (StaffID)
                                           NOT NULL,
            FirstName       varchar(50)    NOT NULL,      
            LastName        varchar(50)    NOT NULL,     
            TypeID          int
            CONSTRAINT FK_StaffType_TypeID FOREIGN KEY REFERENCES StaffType(TypeID) 
                                           NOT NULL, 
)            
       

CREATE TABLE [Training]
(
            TrainingID      int
            CONSTRAINT PK_Training_TrainingID PRIMARY KEY (TrainingID)
                                        NOT NULL,
            [Description]   varchar(30) NOT NULL,
            StartDate       datetime    NOT NULL, 
            EndDate         datetime    NOT NULL,
 
)

CREATE TABLE [StaffTraining] 
(
            StaffID        int
            CONSTRAINT FK_Staff_StaffID FOREIGN KEY REFERENCES Staff(StaffID)NOT NULL,
                                    
            TrainingID      int
            CONSTRAINT FK_Training_TrainingID FOREIGN KEY REFERENCES Training(TrainingID)NOT NULL,
                                    
            Grade           char(4) 
            
            CONSTRAINT PK_StaffTraining_TrainingID_StaffID PRIMARY KEY CLUSTERED(TrainingID, StaffID) NOT NULL,
)           


CREATE TABLE [CustomerReward]
(           RewardCode          char(1)
            CONSTRAINT PK_CustomerReward_RewardCode PRIMARY KEY CLUSTERED(RewardCode)
                                            NOT NULL,           
            [Description]       varchar(40) NOT NUll,    
            DiscountPercentage  tinyint     NOT NULL,
)

CREATE TABLE [Customer]

(
    CustomerID     int
    CONSTRAINT PK_Customer_CustomerID PRIMARY KEY CLUSTERED(CustomerID)
                            NOT NULL,
    FirstName       varchar(50)        NOT NULL,
    LastName        varchar(50)        NOT NULL,
    [Address]       varchar(60)        NOT NULL,
    City            varchar(70)        NOT NULL,
    Province        char(2)            NOT NULL,
    PostalCode      char(6)            NOT NULL,
    Phone           varchar(30)
                                       NOT NULL,
    RewardCode      char(1)            
    CONSTRAINT FK_CustomerReward_RewardCode FOREIGN KEY REFERENCES CustomerReward(RewardCode)
                                     NULL,
    TypeID          int
    CONSTRAINT FK2_StaffType_TypeID FOREIGN KEY REFERENCES Stafftype(TypeID)
                                NOT NULL,
 
)

CREATE TABLE [CustomerType]
(
            CustomerTypeID      int
            CONSTRAINT PK_CustomerType_CustomerTypeID PRIMARY KEY CLUSTERED(CustomerTypeID)
                                            NOT NULL,
            [Description]       varchar(40) NOT NULL,                        
 
)

CREATE TABLE [Category]
(
             CategoryCode    int
             CONSTRAINT PK_Category_CategoryCode PRIMARY KEY
                                    NOT NULL,
             [Description]  varchar(20) NOT NULL,
             CategoryCost   smallmoney  NOT NULL,                    
)

CREATE TABLE [ConsignmentAgreement]
(
             ConsignmentID      int
             CONSTRAINT PK_ConsignmentAgreemnt_ConsignmentID PRIMARY KEY
                                        NOT NULL,
             CustomerID         int
             CONSTRAINT FK_Customer_CustomerID FOREIGN KEY REFERENCES Customer(CustomerID)                            
                                        NOT NULL,
             CategoryCode       int
             CONSTRAINT FK_Category_CategoryCode FOREIGN KEY REFERENCES Category(categoryCode)
                                        NOT NULL,
             [date]            datetime NOT NULL,
             Subtoal            money   NOT NULL,
             Total              money   NOT NULL,
             GST                money   NOT NULL,
             RewardsDiscount    money       NULL,                                  
)
 
CREATE TABLE [ConsignmentLineitem] 
(
            ConsignmentID       int
            CONSTRAINT FK_ConsignmentAgreement_ConsignmentID FOREIGN KEY REFERENCES ConsignmentAgreement(ConsignmentID)
                                             NOT NULL,
            CategoryCode        int
            CONSTRAINT FK2_Category_CategoryCode FOREIGN KEY REFERENCES Category(CategoryCode)
                                            NOT NULL,
            [Description]      varchar(120) NOT NULL,
            StartPrice          money       NOT NULL,
            LowPrice            money       NOT NULL,
            LineNumber          smallint
            CONSTRAINT PK_ConsignmentAgreementConsignmentLineitem_ConsignmentID_LineNumber PRIMARY KEY
                                            NOT NULL,                   
)


/* Part 2 */
GO

/* Part 3 */
GO

/* Part 4 */
GO


