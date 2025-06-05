CREATE TABLE [dbo].[Artist] (
    [ArtistId]   INT           IDENTITY (1, 1) NOT NULL,
    [ArtistName] VARCHAR (100) NULL,
    [AgentName]  VARCHAR (100) NULL,
    [DateAdded] DATE NOT NULL DEFAULT GETDATE(), 
    CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED ([ArtistId] ASC)
);

