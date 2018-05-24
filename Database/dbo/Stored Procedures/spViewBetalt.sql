
--spViewBetalt
CREATE PROCEDURE spViewBetalt
@id INT
AS
SELECT * FROM MedlemKonto 
WHERE betalt = @id
