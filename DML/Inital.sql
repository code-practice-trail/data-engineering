/*=========================================
BANK MASTER
=========================================*/

INSERT INTO trans_schema.BANK
(
    BANK_NAME,
    IFSC_CODE
)
VALUES
('State Bank of India','SBIN0001234'),
('HDFC Bank','HDFC0005678'),
('ICICI Bank','ICIC0009876'),
('Axis Bank','UTIB0004567'),
('Kotak Mahindra Bank','KKBK0008888');



/*=========================================
PERSON MASTER
=========================================*/

INSERT INTO trans_schema.PERSON
(
    FIRST_NAME,
    LAST_NAME,
    DOB,
    PHONE,
    EMAIL
)
VALUES

('Ravi','Kumar',
'1998-01-15',
'9876543210',
'ravi@gmail.com'),

('Arjun','Reddy',
'1997-03-22',
'9876543211',
'arjun@gmail.com'),

('Priya','Sharma',
'1999-06-25',
'9876543212',
'priya@gmail.com'),

('Kiran','Patel',
'1995-11-10',
'9876543213',
'kiran@gmail.com'),

('Sneha','Joshi',
'2000-04-12',
'9876543214',
'sneha@gmail.com');



/*=========================================
ADDRESS MASTER
=========================================*/

INSERT INTO trans_schema.ADDRESS
(
    PERSON_ID,
    ADDRESS_LINE1,
    ADDRESS_LINE2,
    CITY,
    STATE_NAME,
    PINCODE
)
VALUES

(1,
'Flat 101',
'SR Nagar',
'Hyderabad',
'Telangana',
'500038'),

(2,
'House 22',
'Whitefield',
'Bangalore',
'Karnataka',
'560066'),

(3,
'Apartment 12',
'Anna Nagar',
'Chennai',
'Tamil Nadu',
'600040'),

(4,
'Plot 15',
'Madhapur',
'Hyderabad',
'Telangana',
'500081'),

(5,
'Villa 9',
'Banjara Hills',
'Hyderabad',
'Telangana',
'500034');



/*=========================================
CUSTOMER MASTER
=========================================*/

INSERT INTO trans_schema.CUSTOMER
(
    PERSON_ID,
    BANK_ID,
    CUSTOMER_CODE,
    KYC_STATUS
)
VALUES

(1,1,'CUST10001','APPROVED'),
(2,2,'CUST10002','APPROVED'),
(3,3,'CUST10003','APPROVED'),
(4,4,'CUST10004','PENDING'),
(5,5,'CUST10005','APPROVED');



/*=========================================
ACCOUNT MASTER
=========================================*/

INSERT INTO trans_schema.ACCOUNT
(
    CUSTOMER_ID,
    ACCOUNT_NO,
    ACCOUNT_TYPE
)
VALUES

(1,100000000001,'Savings'),
(2,100000000002,'Savings'),
(3,100000000003,'Current'),
(4,100000000004,'Savings'),
(5,100000000005,'Current');



/*=========================================
ACCOUNT BALANCE
=========================================*/

INSERT INTO trans_schema.ACCOUNT_BALANCE
(
    ACCOUNT_ID,
    CURRENT_BALANCE
)
VALUES

(1,50000),
(2,80000),
(3,150000),
(4,25000),
(5,70000);



/*=========================================
CARD
=========================================*/

INSERT INTO trans_schema.CARD
(
    ACCOUNT_ID,
    CARD_NUMBER,
    CARD_TYPE,
    EXPIRY_DATE
)
VALUES

(1,'4567123412341111',
'Debit',
'2028-12-31'),

(2,'4567123412342222',
'Credit',
'2027-08-31'),

(3,'4567123412343333',
'Debit',
'2029-01-31'),

(4,'4567123412344444',
'Debit',
'2028-06-30'),

(5,'4567123412345555',
'Credit',
'2030-10-31');



/*=========================================
UPI MASTER
=========================================*/

INSERT INTO trans_schema.UPI
(
    ACCOUNT_ID,
    VPA
)
VALUES

(1,'ravi@oksbi'),
(2,'arjun@okhdfc'),
(3,'priya@okicici'),
(4,'kiran@okaxis'),
(5,'sneha@okkotak');



/*=========================================
TRANSACTION MASTER
=========================================*/

INSERT INTO trans_schema.TRANSACTION_MASTER
(
    FROM_UPI_ID,
    TO_UPI_ID,
    AMOUNT,
    STATUS
)
VALUES

-- Ravi → Arjun
(1,2,2500,'SUCCESS'),

-- Arjun → Priya
(2,3,4500,'SUCCESS'),

-- Priya → Kiran
(3,4,7000,'SUCCESS'),

-- Ravi first transfer >5000 (business failure)
(1,5,7000,'FAILED'),

-- Kiran → Sneha
(4,5,1500,'SUCCESS'),

-- Sneha insufficient balance example
(5,2,90000,'FAILED'),

-- Priya → Ravi
(3,1,3500,'SUCCESS');

