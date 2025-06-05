CREATE TABLE [dbo].[Song] (
    [SongId]   INT           IDENTITY (1, 1) NOT NULL,
    [SongName] VARCHAR (100) NULL,
    [ArtistId] INT           NOT NULL,
    [AlbumId]  INT           NOT NULL,
    [GanreId]  INT           NOT NULL,
    CONSTRAINT [PK_Song] PRIMARY KEY CLUSTERED ([SongId] ASC),
    CONSTRAINT [FK_Song_Album] FOREIGN KEY ([AlbumId]) REFERENCES [dbo].[Album] ([AlbumId]),
    CONSTRAINT [FK_Song_Artist] FOREIGN KEY ([ArtistId]) REFERENCES [dbo].[Artist] ([ArtistId]),
    CONSTRAINT [FK_Song_Ganre] FOREIGN KEY ([GanreId]) REFERENCES [dbo].[Ganre] ([GanreId]),
);

