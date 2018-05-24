
--spViewKonto
CREATE PROCEDURE spViewKonto
@id INT
AS
SELECT * FROM MedlemKonto
WHERE medlems_id = @id
