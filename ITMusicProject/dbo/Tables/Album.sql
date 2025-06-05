CREATE TABLE [dbo].[Album] (
    [AlbumId]     INT           IDENTITY (1, 1) NOT NULL,
    [AlbumName]   VARCHAR (100) NULL,
    [ReleaseDate] DATE          NULL,
    [RecordLabel] VARCHAR (100) NULL,
    [DateAdded] DATE NOT NULL DEFAULT GETDATE(), 
    CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED ([AlbumId] ASC)
);

