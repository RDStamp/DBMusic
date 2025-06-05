CREATE TABLE [dbo].[Listener] (
    [ListenerId]       INT           IDENTITY (1, 1) NOT NULL,
    [ListenerName]     VARCHAR (100) NULL,
    [Email]            VARCHAR (100) NULL,
    [RegistrationDate] DATE          DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Listner] PRIMARY KEY CLUSTERED ([ListenerId] ASC)
);

