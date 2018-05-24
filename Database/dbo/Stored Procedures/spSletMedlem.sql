
--spSletMedlem
CREATE PROCEDURE spSletMedlem
@medlemID INT
AS
DELETE FROM MedlemKonto
WHERE medlems_id = @medlemID
