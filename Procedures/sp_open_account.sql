USE [UPI_project]
GO

/****** Object:  StoredProcedure [trans_schema].[sp_open_account]    Script Date: 30-05-2026 17:25:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER procedure [trans_schema].[sp_open_account]
	(@pbank_id int,@fname varchar(50) ,@lname varchar(50),@pdob date, @pphone varchar(10), @pemail varchar(100) ,
	@padd1 varchar(200),@padd2 varchar(200), @pcity varchar(100), @psname varchar(100), @ppin varchar(6)
	)
as 
 declare @pid bigint;
begin


exec trans_schema.sp_insert_person_details @pbank_id,@fname,@lname,@pdob,@pphone,@pemail, @pid  output;

print 'printing received pid'
print @pid

EXEC	trans_schema.sp_insert_address @pid,@padd1,@padd2,@pcity,@psname,@ppin;

exec	trans_schema.sp_create_customer @pid,@pbank_id;

end;
GO

