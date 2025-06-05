CREATE TABLE [dbo].[PlaylistSong] (
    [PlaylistId]    INT NOT NULL,
    [SongId]        INT NOT NULL,
    [PlaylistOrder] INT NULL,
    CONSTRAINT [PK_PlaylistSong] PRIMARY KEY CLUSTERED ([PlaylistId] ASC, [SongId] ASC),
    CONSTRAINT [FK_PlaylistSong_Playlist] FOREIGN KEY ([PlaylistId]) REFERENCES [dbo].[Playlist] ([PlaylistId]),
    CONSTRAINT [FK_PlaylistSong_Song] FOREIGN KEY ([SongId]) REFERENCES [dbo].[Song] ([SongId])
);

