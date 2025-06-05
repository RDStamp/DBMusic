CREATE TABLE [dbo].[GanreDim] (
    [GanreId]   INT         NOT NULL,
    [GanreName] VARCHAR (100) NULL,
    CONSTRAINT [PK_Ganre] PRIMARY KEY CLUSTERED ([GanreId] ASC)
);

