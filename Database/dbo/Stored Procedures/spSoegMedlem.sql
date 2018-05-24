
--spSoegMedlem
CREATE PROCEDURE spSoegMedlem
@soegmedlem NVARCHAR(50)
AS
SELECT * FROM MedlemKonto WHERE medlems_fornavn LIKE '%' + @soegmedlem + '%' OR medlems_efternavn LIKE '%' + @soegmedlem + '%' OR medlems_foedselsdag LIKE '%' + @soegmedlem + '%'
