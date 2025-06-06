CREATE TABLE [dbo].[RatingDim] (
    [SongId] INT NOT NULL,
    [Rating] INT NOT NULL,
    CONSTRAINT [PK_RatingDim] PRIMARY KEY CLUSTERED ([SongId] ASC)
);

