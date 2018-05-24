
--STORED PROCEDURES

 --spOpretMedlem
CREATE PROCEDURE spOpretMedlem 
@fornavn NVARCHAR(50), 
@efternavn NVARCHAR(50), 
@foedselsdag NVARCHAR(10), 
@adress NVARCHAR(50), 
@postnummer INT, 
@telefon INT, 
@mail NVARCHAR(50)
AS
INSERT INTO MedlemKonto
( medlems_fornavn,
 medlems_efternavn,
 medlems_foedselsdag,
 medlems_adress,
 zipcode_zipcode, medlems_telefon,
 medlems_mail
)
VALUES
(
 @fornavn,
 @efternavn,
 @foedselsdag,
 @adress,
 @postnummer,
 @telefon,
 @mail
)
