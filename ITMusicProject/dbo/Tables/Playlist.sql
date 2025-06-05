CREATE TABLE [dbo].[Playlist] (
    [PlaylistId]  INT           IDENTITY (1, 1) NOT NULL,
    [PlaylisName] VARCHAR (100) NULL,
    [ListnerId]   INT           NOT NULL,
    CONSTRAINT [PK_Playlist_1] PRIMARY KEY NONCLUSTERED ([PlaylistId] ASC),
    CONSTRAINT [FK_Playlist_Listner1] FOREIGN KEY ([ListnerId]) REFERENCES [dbo].[Listener] ([ListenerId])
);


GO
CREATE UNIQUE CLUSTERED INDEX [PK_Playlist]
    ON [dbo].[Playlist]([PlaylistId] ASC, [ListnerId] ASC);

