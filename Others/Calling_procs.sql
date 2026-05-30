
use upi_project;


DECLARE @pbank_id int=2
DECLARE @fname varchar(50) ='RAM'
DECLARE @lname varchar(50) ='G'
DECLARE @pdob date  =GETDATE()-3650
DECLARE @pphone varchar(10) ='100100100'
DECLARE @pemail varchar(100) ='RAM@GMAIL.COM'
DECLARE @padd1 varchar(200)= 'HYD1'
DECLARE @padd2 varchar(200)= 'HYD2'
DECLARE @pcity varchar(100) ='HYDERABAD'
DECLARE @psname varchar(100)='TG'
DECLARE @ppin varchar(6) ='500014'
BEGIN
	BEGIN TRANSACTION

exec trans_schema.sp_open_account  @pbank_id,@fname,@lname ,@pdob,@pphone,@pemail,@padd1,@padd2,@pcity,@psname,@ppin

END

rollback



select * from trans_schema.PERSON

select * from trans_schema.ADDRESS;

select * from trans_schema.customer;


DROP SEQUENCE trans_schema.SEQ_CUSTOMER_CODE;

CREATE SEQUENCE trans_schema.SEQ_CUSTOMER_CODE
START WITH 10006
INCREMENT BY 1;

SELECT  CONCAT('CUST',
NEXT VALUE FOR
        trans_schema.SEQ_CUSTOMER_CODE)
