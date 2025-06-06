CREATE TABLE [dbo].[FactData] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [SongId]     INT           NOT NULL,
    [SongName]   VARCHAR (100) NULL,
    [AlbumId]    INT           NOT NULL,
    [ArtistId]   INT           NOT NULL,
    [GanreId]    INT           NOT NULL,
    [ListenerId] INT           NOT NULL,
    [PlayDate]   DATETIME      NOT NULL,
    [PlayDay]    DATE          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_FactData_Album] FOREIGN KEY ([AlbumId]) REFERENCES [dbo].[AlbumDim] ([AlbumId]),
    CONSTRAINT [FK_FactData_Artist] FOREIGN KEY ([ArtistId]) REFERENCES [dbo].[ArtistDim] ([ArtistId]),
    CONSTRAINT [FK_FactData_DateDim] FOREIGN KEY ([PlayDay]) REFERENCES [dbo].[DateDim] ([DateValue]),
    CONSTRAINT [FK_FactData_Ganre] FOREIGN KEY ([GanreId]) REFERENCES [dbo].[GanreDim] ([GanreId]),
    CONSTRAINT [FK_FactData_Listner] FOREIGN KEY ([ListenerId]) REFERENCES [dbo].[ListenerDim] ([ListenerId]),
    CONSTRAINT [FK_FactData_RatingDim] FOREIGN KEY ([SongId]) REFERENCES [dbo].[RatingDim] ([SongId])
);


GO
CREATE NONCLUSTERED INDEX [IX_QueryOpt]
    ON [dbo].[FactData]([PlayDate] ASC)
    INCLUDE([SongId], [GanreId], [ListenerId], [SongName]);

