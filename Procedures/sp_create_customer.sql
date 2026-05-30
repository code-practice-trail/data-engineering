
USE [UPI_project]
GO

/****** Object:  StoredProcedure [trans_schema].[sp_create_customer]    Script Date: 30-05-2026 17:17:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER  procedure [trans_schema].[sp_create_customer] 
(
		   @p_PERSON_ID bigint,
           @p_BANK_ID int
)
as
begin
INSERT INTO [trans_schema].[CUSTOMER]
           ([PERSON_ID]
           ,[BANK_ID]
           ,[CUSTOMER_CODE]
           ,[KYC_STATUS]
           ,[CREATED_AT])
     VALUES
           (@p_PERSON_ID,
           @p_BANK_ID ,
           CONCAT('CUST',NEXT VALUE FOR
        trans_schema.SEQ_CUSTOMER_CODE),
           'APPROVED',
			current_timestamp);
end;
GO

