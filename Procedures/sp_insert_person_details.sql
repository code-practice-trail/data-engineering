USE [UPI_project]
GO

/****** Object:  StoredProcedure [trans_schema].[sp_insert_person_details]    Script Date: 30-05-2026 17:25:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER procedure [trans_schema].[sp_insert_person_details]
	(@pbank_id int,@fname varchar(50) ,@lname varchar(50),@pdob date, @pphone varchar(10), @pemail varchar(100),
	@pout_pid int output
	)
as
declare  @pid bigint=0;
begin

print 'sp_insert_person_details starts'

INSERT INTO trans_schema.PERSON
(FIRST_NAME,LAST_NAME, DOB,PHONE,EMAIL
)
VALUES(@fname,@lname,@pdob,@pphone,@pemail);


print 'Person created....'
SET @pout_pid = SCOPE_IDENTITY();
SELECT @pid=PERSON_ID 
FROM trans_schema.PERSON WHERE EMAIL=@pemail;


end;
GO

