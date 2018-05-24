
--spBetalt
CREATE PROCEDURE spBetalt
@betaltID INT, 
@betalt BIT
AS
UPDATE MedlemKonto
SET
 betalt = @betalt
WHERE medlems_id = @betaltID
