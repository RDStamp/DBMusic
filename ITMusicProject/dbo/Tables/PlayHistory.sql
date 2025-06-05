CREATE TABLE [dbo].[PlayHistory] (
    [ListenerId] INT      NOT NULL,
    [SongId]     INT      NOT NULL,
    [PlayDate]   DATETIME NOT NULL,
    [DateAdded] DATE NOT NULL DEFAULT GETDATE(), 
    CONSTRAINT [PK_PlayHistory_1] PRIMARY KEY NONCLUSTERED ([ListenerId] ASC, [SongId] ASC, [PlayDate] ASC) ON [PRIMARY],
    CONSTRAINT [FK_PlayHistory_Listner] FOREIGN KEY ([ListenerId]) REFERENCES [dbo].[Listener] ([ListenerId]),
    CONSTRAINT [FK_PlayHistory_Song] FOREIGN KEY ([SongId]) REFERENCES [dbo].[Song] ([SongId])
) ON [PlayHistoryPS] ([PlayDate]);

