CREATE TABLE [dbo].[DateDim] (
    [DateId]      INT          IDENTITY (1, 1) NOT NULL,
    [DateValue]   DATE         NOT NULL,
    [YearNumber]  INT          NOT NULL,
    [MonthNumber] INT          NOT NULL,
    [MonthName]   VARCHAR (10) NOT NULL,
    CONSTRAINT [PK__DateDim__A426F2338CF2694A] PRIMARY KEY CLUSTERED ([DateValue] ASC)
);

