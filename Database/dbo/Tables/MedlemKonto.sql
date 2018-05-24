CREATE TABLE [dbo].[MedlemKonto] (
    [medlems_id]          INT           IDENTITY (1, 1) NOT NULL,
    [medlems_fornavn]     NVARCHAR (50) NOT NULL,
    [medlems_efternavn]   NVARCHAR (50) NOT NULL,
    [medlems_foedselsdag] NVARCHAR (10) NOT NULL,
    [medlems_adress]      NVARCHAR (50) NOT NULL,
    [zipcode_zipcode]     INT           NULL,
    [medlems_telefon]     INT           NULL,
    [medlems_mail]        NVARCHAR (50) NOT NULL,
    [betalt]              BIT           DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([medlems_id] ASC),
    FOREIGN KEY ([zipcode_zipcode]) REFERENCES [dbo].[PostNummer] ([zipcode_zipcode])
);

