
--spRetMedlem
CREATE PROCEDURE spRetMedlem 
@medlemID INT, 
@fornavn NVARCHAR(50), 
@efternavn NVARCHAR(50), 
@adress NVARCHAR(50), 
@postnummer INT, 
@telefon INT, 
@mail NVARCHAR(50)
AS
UPDATE MedlemKonto
SET
 medlems_fornavn = @fornavn,
 medlems_efternavn = @efternavn,
 medlems_adress = @adress,
 zipcode_zipcode = @postnummer, medlems_telefon = @telefon,
 medlems_mail = @mail
WHERE medlems_id = @medlemID
