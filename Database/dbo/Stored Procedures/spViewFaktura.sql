
--spViewFaktura
CREATE PROCEDURE spViewFaktura
@id INT
AS
SELECT * FROM FakturaNummer
WHERE faktura_id = @id
