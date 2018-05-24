CREATE TABLE [dbo].[FakturaNummer] (
    [faktura_id]   INT IDENTITY (1, 1) NOT NULL,
    [medlems_id]   INT NULL,
    [kontigent_id] INT NULL,
    PRIMARY KEY CLUSTERED ([faktura_id] ASC),
    FOREIGN KEY ([kontigent_id]) REFERENCES [dbo].[Kontigent] ([kontigent_id]),
    FOREIGN KEY ([medlems_id]) REFERENCES [dbo].[MedlemKonto] ([medlems_id])
);

