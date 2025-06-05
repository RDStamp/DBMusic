CREATE TABLE [dbo].[AlbumDim] (
    [AlbumId]     INT       NOT NULL,
    [AlbumName]   VARCHAR (100) NULL,
    [ReleaseDate] DATE          NULL,
    [RecordLabel] VARCHAR (100) NULL,
    CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED ([AlbumId] ASC)
);

