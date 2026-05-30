USE [UPI_project]
GO

/****** Object:  StoredProcedure [trans_schema].[sp_insert_address]    Script Date: 30-05-2026 17:25:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER procedure [trans_schema].[sp_insert_address]
(@pid int, @padd1 varchar(200),@padd2 varchar(200), @pcity varchar(100), @psname varchar(100), @ppin varchar(6))
as
begin
INSERT INTO trans_schema.ADDRESS
(
    PERSON_ID,ADDRESS_LINE1,ADDRESS_LINE2,CITY,STATE_NAME,PINCODE)
VALUES

(@pid,@padd1,@padd2,@pcity,@psname,@ppin)

end
GO

