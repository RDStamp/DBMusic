CREATE TABLE [dbo].[Rating] (
    [RatingId]  INT  IDENTITY (1, 1) NOT NULL,
    [SongId]    INT  CONSTRAINT [DF_Rating_SongId] DEFAULT ((0)) NOT NULL,
    [Rating]    INT  NOT NULL,
    [DateAdded] DATE CONSTRAINT [DF_Rating_DateAdded] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED ([SongId] ASC),
    CONSTRAINT [ChkRating_Rating] CHECK ([Rating]>=(0) AND [Rating]<=(5)),
    CONSTRAINT [FK_Rating_Song] FOREIGN KEY ([SongId]) REFERENCES [dbo].[Song] ([SongId])
);

