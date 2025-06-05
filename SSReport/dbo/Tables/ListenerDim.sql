CREATE TABLE [dbo].[ListenerDim] (
    [ListenerId]       INT           NOT NULL,
    [ListenerName]     VARCHAR (100) NULL,
    [RegistrationDate] DATE          NULL,
    CONSTRAINT [PK_Listner] PRIMARY KEY CLUSTERED ([ListenerId] ASC)
);

