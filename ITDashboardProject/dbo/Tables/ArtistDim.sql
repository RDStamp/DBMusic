CREATE TABLE [dbo].[ArtistDim] (
    [ArtistId]   INT          NOT NULL,
    [ArtistName] VARCHAR (100) NULL,
    [AgentName]  VARCHAR (100) NULL,
    CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED ([ArtistId] ASC)
);

