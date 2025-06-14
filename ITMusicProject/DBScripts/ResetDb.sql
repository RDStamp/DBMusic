USE [Music]
GO

DELETE FROM [dbo].[PlayHistory];
GO
DELETE FROM [dbo].[PlaylistSong];
GO
DELETE FROM [dbo].[Playlist];
GO
DELETE FROM [dbo].[Song];
GO
DELETE FROM [dbo].[Listener];
GO
DELETE FROM [dbo].[Ganre];
GO
DELETE FROM [dbo].[Artist];
GO
DELETE FROM [dbo].[Album];
GO
DELETE FROM [dbo].[Rating];
GO

DBCC CHECKIDENT ('Playlist', RESEED, 0);
GO
DBCC CHECKIDENT ('Song', RESEED, 0);
GO
DBCC CHECKIDENT ('Listener', RESEED, 0);
GO
DBCC CHECKIDENT ('Ganre', RESEED, 0);
GO
DBCC CHECKIDENT ('Artist', RESEED, 0);
GO
DBCC CHECKIDENT ('Album', RESEED, 0);
GO
DBCC CHECKIDENT ('Rating', RESEED, 0);
GO