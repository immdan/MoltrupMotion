USE master
GO

IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'MoltrupMotion') ALTER DATABASE MoltrupMotion SET Single_User WITH Rollback Immediate
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'MoltrupMotion') DROP DATABASE MoltrupMotion
GO

USE master
GO

--Oprettelse af DB

CREATE DATABASE MoltrupMotion
GO

USE MoltrupMotion
GO

--Oprettelse af tabler

CREATE TABLE PostNummer
(
	zipcode_zipcode INT NOT NULL PRIMARY KEY,
	zipcode_city VARCHAR(25)
)
GO

CREATE TABLE MedlemKonto
(
	medlems_id INT IDENTITY PRIMARY KEY NOT NULL,
	medlems_fornavn NVARCHAR(50) NOT NULL,
	medlems_efternavn NVARCHAR(50) NOT NULL,
	medlems_foedselsdag NVARCHAR(10) NOT NULL,
	medlems_adress NVARCHAR(50) NOT NULL,
	zipcode_zipcode INT FOREIGN KEY REFERENCES PostNummer(zipcode_zipcode),
	medlems_telefon INT,
	medlems_mail NVARCHAR(50) NOT NULL,
	betalt BIT NOT NULL DEFAULT 0
)
GO

CREATE TABLE Kontigent
(
	kontigent_id INT IDENTITY PRIMARY KEY NOT NULL,
	kontigent_pris INT
)
GO

CREATE TABLE FakturaNummer
(
	faktura_id INT IDENTITY PRIMARY KEY NOT NULL,
	medlems_id INT FOREIGN KEY REFERENCES MedlemKonto(medlems_id),
	kontigent_id INT FOREIGN KEY REFERENCES Kontigent(kontigent_id)
)
GO




--Data til tabelerne

INSERT INTO Kontigent (kontigent_pris)
VALUES	(400)
GO
		
--Data til PostNummer Tabel

INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2000, N'Frederiksberg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2100, N'København Ø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2200, N'København N')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2300, N'København S')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2400, N'København NV')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2450, N'København SV')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2500, N'Valby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2600, N'Glostrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2605, N'Brøndby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2610, N'Rødovre')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2620, N'Albertslund')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2625, N'Vallensbæk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2630, N'Taastrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2633, N'Taastrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2635, N'Ishøj')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2640, N'Hedehusene')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2650, N'Hvidovre')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2660, N'Brøndby Strand')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2665, N'Vallensbæk Strand')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2670, N'Greve')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2680, N'Solrød Strand')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2690, N'Karlslunde')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2700, N'Brønshøj')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2720, N'Vanløse')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2730, N'Herlev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2740, N'Skovlunde')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2750, N'Ballerup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2760, N'Måløv')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2765, N'Smørum')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2770, N'Kastrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2791, N'Dragør')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2800, N'Kongens Lyngby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2820, N'Gentofte')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2830, N'Virum')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2840, N'Holte')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2850, N'Nærum')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2860, N'Søborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2880, N'Bagsværd')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2900, N'Hellerup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2920, N'Charlottenlund')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2930, N'Klampenborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2942, N'Skodsborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2950, N'Vedbæk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2960, N'Rungsted Kyst')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2970, N'Hørsholm')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2980, N'Kokkedal')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (2990, N'Nivå')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3000, N'Helsingør')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3050, N'Humlebæk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3060, N'Espergærde')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3070, N'Snekkersten')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3080, N'Tikøb')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3100, N'Hornbæk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3120, N'Dronningmølle')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3140, N'Ålsgårde')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3150, N'Hellebæk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3200, N'Helsinge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3210, N'Vejby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3220, N'Tisvildeleje')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3230, N'Græsted')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3250, N'Gilleleje')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3300, N'Frederiksværk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3310, N'Ølsted')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3320, N'Skævinge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3330, N'Gørløse')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3360, N'Liseleje')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3370, N'Melby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3390, N'Hundested')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3400, N'Hillerød')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3450, N'Allerød')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3460, N'Birkerød')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3480, N'Fredensborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3490, N'Kvistgård')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3500, N'Værløse')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3520, N'Farum')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3540, N'Lynge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3550, N'Slangerup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3600, N'Frederikssund')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3630, N'Jægerspris')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3650, N'Ølstykke')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3660, N'Stenløse')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3670, N'Veksø Sjælland')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3700, N'Rønne')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3720, N'Aakirkeby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3730, N'Nexø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3740, N'Svaneke')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3751, N'Østermarie')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3760, N'Gudhjem')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3770, N'Allinge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3782, N'Klemensker')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3790, N'Hasle')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3900, N'Nuuk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3905, N'Nuussuaq')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3910, N'Kangerlussuaq')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3911, N'Sisimiut')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3912, N'Maniitsoq')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3913, N'Tasiilaq')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3915, N'Kulusuk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3919, N'Alluitsup Paa')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3920, N'Qaqortoq')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3921, N'Narsaq')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3922, N'Nanortalik')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3923, N'Narsarsuaq')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3924, N'Ikerasassuaq')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3930, N'Kangilinnguit')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3932, N'Arsuk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3940, N'Paamiut')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3950, N'Aasiaat')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3951, N'Qasigiannguit')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3952, N'Ilulissat')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3953, N'Qeqertarsuaq')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3955, N'Kangaatsiaq')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3961, N'Uummannaq')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3962, N'Upernavik')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3964, N'Qaarsut')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3970, N'Pituffik')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3971, N'Qaanaaq')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3980, N'Ittoqqortoormiit')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3984, N'Danmarkshavn')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (3985, N'Constable Pynt')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4000, N'Roskilde')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4040, N'Jyllinge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4050, N'Skibby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4060, N'Kirke Såby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4070, N'Kirke Hyllinge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4100, N'Ringsted')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4105, N'Ringsted')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4130, N'Viby Sjælland')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4140, N'Borup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4160, N'Herlufmagle')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4171, N'Glumsø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4173, N'Fjenneslev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4174, N'Jystrup Midtsj')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4180, N'Sorø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4190, N'Munke Bjergby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4200, N'Slagelse')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4220, N'Korsør')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4230, N'Skælskør')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4241, N'Vemmelev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4242, N'Boeslunde')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4243, N'Rude')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4250, N'Fuglebjerg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4261, N'Dalmose')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4262, N'Sandved')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4270, N'Høng')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4281, N'Gørlev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4291, N'Ruds Vedby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4293, N'Dianalund')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4295, N'Stenlille')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4296, N'Nyrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4300, N'Holbæk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4320, N'Lejre')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4330, N'Hvalsø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4340, N'Tølløse')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4350, N'Ugerløse')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4360, N'Kirke Eskilstrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4370, N'Store Merløse')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4390, N'Vipperød')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4400, N'Kalundborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4420, N'Regstrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4440, N'Mørkøv')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4450, N'Jyderup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4460, N'Snertinge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4470, N'Svebølle')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4480, N'Store Fuglede')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4490, N'Jerslev Sjælland')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4500, N'Nykøbing Sj')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4520, N'Svinninge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4532, N'Gislinge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4534, N'Hørve')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4540, N'Fårevejle')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4550, N'Asnæs')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4560, N'Vig')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4571, N'Grevinge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4572, N'Nørre Asmindrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4573, N'Højby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4581, N'Rørvig')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4583, N'Sjællands Odde')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4591, N'Føllenslev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4592, N'Sejerø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4593, N'Eskebjerg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4600, N'Køge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4621, N'Gadstrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4622, N'Havdrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4623, N'Lille Skensved')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4632, N'Bjæverskov')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4640, N'Fakse')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4652, N'Hårlev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4653, N'Karise')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4654, N'Fakse Ladeplads')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4660, N'Store Heddinge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4671, N'Strøby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4672, N'Klippinge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4673, N'Rødvig Stevns')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4681, N'Herfølge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4682, N'Tureby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4683, N'Rønnede')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4684, N'Holme-Olstrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4690, N'Haslev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4700, N'Næstved')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4720, N'Præstø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4733, N'Tappernøje')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4735, N'Mern')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4736, N'Karrebæksminde')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4750, N'Lundby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4760, N'Vordingborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4771, N'Kalvehave')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4772, N'Langebæk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4773, N'Stensved')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4780, N'Stege')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4791, N'Borre')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4792, N'Askeby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4793, N'Bogø By')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4800, N'Nykøbing F')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4840, N'Nørre Alslev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4850, N'Stubbekøbing')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4862, N'Guldborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4863, N'Eskilstrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4871, N'Horbelev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4872, N'Idestrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4873, N'Væggerløse')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4874, N'Gedser')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4880, N'Nysted')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4891, N'Toreby L')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4892, N'Kettinge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4894, N'Øster Ulslev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4895, N'Errindlev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4900, N'Nakskov')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4912, N'Harpelunde')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4913, N'Horslunde')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4920, N'Søllested')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4930, N'Maribo')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4941, N'Bandholm')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4943, N'Torrig L')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4944, N'Fejø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4951, N'Nørreballe')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4952, N'Stokkemarke')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4953, N'Vesterborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4960, N'Holeby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4970, N'Rødby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4983, N'Dannemare')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (4990, N'Sakskøbing')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5000, N'Odense C')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5090, N'Odense C')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5100, N'Odense C')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5200, N'Odense V')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5210, N'Odense NV')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5220, N'Odense SØ')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5230, N'Odense M')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5240, N'Odense NØ')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5250, N'Odense SV')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5260, N'Odense S')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5270, N'Odense N')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5290, N'Marslev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5300, N'Kerteminde')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5320, N'Agedrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5330, N'Munkebo')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5350, N'Rynkeby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5370, N'Mesinge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5380, N'Dalby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5390, N'Martofte')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5400, N'Bogense')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5450, N'Otterup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5462, N'Morud')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5463, N'Harndrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5464, N'Brenderup Fyn')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5466, N'Asperup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5471, N'Søndersø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5474, N'Veflinge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5485, N'Skamby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5491, N'Blommenslyst')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5492, N'Vissenbjerg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5500, N'Middelfart')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5540, N'Ullerslev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5550, N'Langeskov')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5560, N'Aarup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5580, N'Nørre Aaby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5591, N'Gelsted')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5592, N'Ejby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5600, N'Faaborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5610, N'Assens')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5620, N'Glamsbjerg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5631, N'Ebberup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5642, N'Millinge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5672, N'Broby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5683, N'Haarby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5690, N'Tommerup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5700, N'Svendborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5750, N'Ringe')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5762, N'Vester Skerninge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5771, N'Stenstrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5772, N'Kværndrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5792, N'Årslev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5800, N'Nyborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5853, N'Ørbæk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5854, N'Gislev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5856, N'Ryslinge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5863, N'Ferritslev Fyn')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5871, N'Frørup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5874, N'Hesselager')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5881, N'Skårup Fyn')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5882, N'Vejstrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5883, N'Oure')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5884, N'Gudme')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5892, N'Gudbjerg Sydfyn')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5900, N'Rudkøbing')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5932, N'Humble')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5935, N'Bagenkop')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5953, N'Tranekær')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5960, N'Marstal')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5970, N'∆røskøbing')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (5985, N'Søby ∆rø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6000, N'Kolding')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6040, N'Egtved')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6051, N'Almind')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6052, N'Viuf')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6064, N'Jordrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6070, N'Christiansfeld')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6091, N'Bjert')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6092, N'Sønder Stenderup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6093, N'Sjølund')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6094, N'Hejls')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6100, N'Haderslev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6200, N'Aabenraa')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6230, N'Rødekro')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6240, N'Løgumkloster')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6261, N'Bredebro')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6270, N'Tønder')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6280, N'Højer')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6300, N'Gråsten')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6310, N'Broager')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6320, N'Egernsund')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6330, N'Padborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6340, N'Kruså')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6360, N'Tinglev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6372, N'Bylderup-Bov')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6392, N'Bolderslev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6400, N'Sønderborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6430, N'Nordborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6440, N'Augustenborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6470, N'Sydals')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6500, N'Vojens')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6510, N'Gram')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6520, N'Toftlund')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6534, N'Agerskov')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6535, N'Branderup J')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6541, N'Bevtoft')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6560, N'Sommersted')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6580, N'Vamdrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6600, N'Vejen')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6621, N'Gesten')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6622, N'Bække')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6623, N'Vorbasse')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6630, N'Rødding')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6640, N'Lunderskov')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6650, N'Brørup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6660, N'Lintrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6670, N'Holsted')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6682, N'Hovborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6683, N'Føvling')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6690, N'Gørding')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6700, N'Esbjerg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6701, N'Esbjerg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6705, N'Esbjerg Ø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6710, N'Esbjerg V')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6715, N'Esbjerg N')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6720, N'Fanø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6731, N'Tjæreborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6740, N'Bramming')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6752, N'Glejbjerg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6753, N'Agerbæk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6760, N'Ribe')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6771, N'Gredstedbro')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6780, N'Skærbæk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6792, N'Rømø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6800, N'Varde')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6818, N'Årre')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6823, N'Ansager')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6830, N'Nørre Nebel')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6840, N'Oksbøl')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6851, N'Janderup Vestj')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6852, N'Billum')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6853, N'Vejers Strand')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6854, N'Henne')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6855, N'Outrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6857, N'Blåvand')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6862, N'Tistrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6870, N'Ølgod')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6880, N'Tarm')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6893, N'Hemmet')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6900, N'Skjern')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6920, N'Videbæk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6933, N'Kibæk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6940, N'Lem St')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6950, N'Ringkøbing')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6960, N'Hvide Sande')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6971, N'Spjald')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6973, N'Ørnhøj')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6980, N'Tim')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (6990, N'Ulfborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7000, N'Fredericia')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7007, N'Fredericia')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7080, N'Børkop')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7100, N'Vejle')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7120, N'Vejle Øst')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7130, N'Juelsminde')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7140, N'Stouby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7150, N'Barrit')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7160, N'Tørring')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7171, N'Uldum')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7173, N'Vonge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7182, N'Bredsten')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7183, N'Randbøl')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7184, N'Vandel')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7190, N'Billund')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7200, N'Grindsted')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7250, N'Hejnsvig')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7260, N'Sønder Omme')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7270, N'Stakroge')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7280, N'Sønder Felding')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7300, N'Jelling')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7321, N'Gadbjerg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7323, N'Give')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7330, N'Brande')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7361, N'Ejstrupholm')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7362, N'Hampen')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7400, N'Herning')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7401, N'Herning')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7430, N'Ikast')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7441, N'Bording')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7442, N'Engesvang')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7451, N'Sunds')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7470, N'Karup J')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7480, N'Vildbjerg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7490, N'Aulum')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7500, N'Holstebro')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7540, N'Haderup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7550, N'Sørvad')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7560, N'Hjerm')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7570, N'Vemb')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7600, N'Struer')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7620, N'Lemvig')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7650, N'Bøvlingbjerg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7660, N'Bækmarksbro')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7673, N'Harboøre')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7680, N'Thyborøn')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7700, N'Thisted')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7730, N'Hanstholm')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7741, N'Frøstrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7742, N'Vesløs')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7752, N'Snedsted')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7755, N'Bedsted Thy')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7760, N'Hurup Thy')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7770, N'Vestervig')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7790, N'Thyholm')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7800, N'Skive')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7830, N'Vinderup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7840, N'Højslev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7850, N'Stoholm Jyll')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7860, N'Spøttrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7870, N'Roslev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7884, N'Fur')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7900, N'Nykøbing M')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7950, N'Erslev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7960, N'Karby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7970, N'Redsted M')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7980, N'Vils')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (7990, N'Øster Assels')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8000, N'Århus C')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8011, N'Århus C')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8100, N'Århus C')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8200, N'Århus N')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8210, N'Århus V')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8220, N'Brabrand')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8230, N'Åbyhøj')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8240, N'Risskov')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8245, N'Risskov Ø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8250, N'Egå')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8260, N'Viby J')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8270, N'Højbjerg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8300, N'Odder')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8305, N'Samsø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8310, N'Tranbjerg J')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8320, N'Mårslet')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8330, N'Beder')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8340, N'Malling')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8350, N'Hundslund')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8355, N'Solbjerg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8361, N'Hasselager')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8362, N'Hørning')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8370, N'Hadsten')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8380, N'Trige')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8381, N'Tilst')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8382, N'Hinnerup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8400, N'Ebeltoft')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8410, N'Rønde')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8420, N'Knebel')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8444, N'Balle')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8450, N'Hammel')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8462, N'Harlev J')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8464, N'Galten')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8471, N'Sabro')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8472, N'Sporup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8500, N'Grenaa')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8520, N'Lystrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8530, N'Hjortshøj')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8541, N'Skødstrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8543, N'Hornslet')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8544, N'Mørke')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8550, N'Ryomgård')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8560, N'Kolind')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8570, N'Trustrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8581, N'Nimtofte')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8585, N'Glesborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8586, N'Ørum Djurs')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8592, N'Anholt')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8600, N'Silkeborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8620, N'Kjellerup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8632, N'Lemming')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8641, N'Sorring')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8643, N'Ans By')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8653, N'Them')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8654, N'Bryrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8660, N'Skanderborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8670, N'Låsby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8680, N'Ry')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8700, N'Horsens')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8721, N'Daugård')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8722, N'Hedensted')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8723, N'Løsning')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8732, N'Hovedgård')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8740, N'Brædstrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8751, N'Gedved')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8752, N'ØØstbirk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8762, N'Flemming')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8763, N'Rask Mølle')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8765, N'Klovborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8766, N'Nørre Snede')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8781, N'Stenderup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8783, N'Hornsyld')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8800, N'Viborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8830, N'Tjele')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8831, N'Løgstrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8832, N'Skals')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8840, N'Rødkærsbro')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8850, N'Bjerringbro')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8860, N'Ulstrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8870, N'Langå')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8881, N'Thorsø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8882, N'Fårvang')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8883, N'Gjern')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8900, N'Randers')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8950, N'Ørsted')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8961, N'Allingåbro')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8963, N'Auning')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8970, N'Havndal')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8981, N'Spentrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8983, N'Gjerlev J')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (8990, N'Fårup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9000, N'Aalborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9020, N'Aalborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9100, N'Aalborg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9200, N'Aalborg SV')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9210, N'Aalborg SØ')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9220, N'Aalborg Øst')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9230, N'Svenstrup J')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9240, N'Nibe')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9260, N'Gistrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9270, N'Klarup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9280, N'Storvorde')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9293, N'Kongerslev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9300, N'Sæby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9310, N'Vodskov')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9320, N'Hjallerup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9330, N'Dronninglund')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9340, N'Asaa')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9352, N'Dybvad')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9362, N'Gandrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9370, N'Hals')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9380, N'Vestbjerg')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9381, N'Sulsted')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9382, N'Tylstrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9400, N'Nørresundby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9430, N'Vadum')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9440, N'Aabybro')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9460, N'Brovst')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9480, N'Løkken')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9490, N'Pandrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9492, N'Blokhus')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9493, N'Saltum')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9500, N'Hobro')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9510, N'Arden')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9520, N'Skørping')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9530, N'Støvring')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9541, N'Suldrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9550, N'Mariager')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9560, N'Hadsund')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9574, N'Bælum')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9575, N'Terndrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9600, N'Aars')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9610, N'Nørager')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9620, N'Aalestrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9631, N'Gedsted')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9632, N'Møldrup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9640, N'Farsø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9670, N'Løgstør')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9681, N'Ranum')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9690, N'Fjerritslev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9700, N'Brønderslev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9740, N'Jerslev J')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9750, N'Øster Vrå')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9760, N'Vrå')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9800, N'Hjørring')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9830, N'Tårs')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9850, N'Hirtshals')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9870, N'Sindal')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9881, N'Bindslev')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9900, N'Frederikshavn')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9940, N'Læsø')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9970, N'Strandby')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9981, N'Jerup')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9982, N'Ålbæk')
INSERT [dbo].[PostNummer] ([zipcode_zipcode], [zipcode_city]) VALUES (9990, N'Skagen')
GO

INSERT INTO MedlemKonto (medlems_fornavn,medlems_efternavn,medlems_foedselsdag,medlems_adress,zipcode_zipcode,medlems_mail,betalt)
VALUES	('Anders', 'Andersen', '10-10-1980', 'Andersvej 22 ST', 7100, 'anders@hjem.dk', 0),
	('Sanders', 'Andersen', '08-10-1985', 'Villavej 18', 7500, 'sanders@hok.dk', 1),
	('Bart', 'Simpson', '01-12-1966', 'Oakstreet 20', 6100, 'bs@springfield.dk', 0),
	('Svend', 'Olesen', '30-06-1990', 'Overgade 16', 6500, 'olesen@tdc.dk', 0),
	('Erik', 'Rasmussen', '10-10-1965', 'Violvej 8', 8600, 'anders@hjem.dk', 1)
GO

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
GO

--spSoegMedlem
CREATE PROCEDURE spSoegMedlem
@soegmedlem NVARCHAR(50)
AS
SELECT * FROM MedlemKonto WHERE medlems_fornavn LIKE '%' + @soegmedlem + '%' OR medlems_efternavn LIKE '%' + @soegmedlem + '%' OR medlems_foedselsdag LIKE '%' + @soegmedlem + '%'
GO

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
GO

--spViewKonto
CREATE PROCEDURE spViewKonto
@id INT
AS
SELECT * FROM MedlemKonto
WHERE medlems_id = @id
GO

--spViewFaktura
CREATE PROCEDURE spViewFaktura
@id INT
AS
SELECT * FROM FakturaNummer
WHERE faktura_id = @id
GO

--spBetalt
CREATE PROCEDURE spBetalt
@betaltID INT, 
@betalt BIT
AS
UPDATE MedlemKonto
SET
 betalt = @betalt
WHERE medlems_id = @betaltID
GO

--spViewBetalt
CREATE PROCEDURE spViewBetalt
@id INT
AS
SELECT * FROM MedlemKonto 
WHERE betalt = @id
GO

--spSletMedlem
CREATE PROCEDURE spSletMedlem
@medlemID INT
AS
DELETE FROM MedlemKonto
WHERE medlems_id = @medlemID
GO