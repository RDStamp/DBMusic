﻿CREATE TABLE [dbo].[Ganre] (
    [GanreId] INT IDENTITY (1, 1) NOT NULL,
    [GanreName] VARCHAR (100) NULL,
    [DateAdded] DATE NOT NULL DEFAULT GETDATE(), 
    CONSTRAINT [PK_Ganre] PRIMARY KEY CLUSTERED ([GanreId] ASC)
);

