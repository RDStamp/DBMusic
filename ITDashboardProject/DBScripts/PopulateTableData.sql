USE [Dashboard]
GO

DECLARE @Date DATE = CONVERT(Date, '01 Jan 2000');
DECLARE @End DATE = CONVERT(Date, '31 Dec 2035');

WHILE @Date < @End
BEGIN
    INSERT INTO 
        [dbo].[DateDim]
            (
                [DateValue], [YearNumber], [MonthNumber], [MonthName]
            )
     VALUES
           (
                @Date, DATEPART(year, @Date), DATEPART(month, @Date), DATENAME(month, @Date)
           );

   SET @Date = DATEADD(day, 1, @Date);
END;
GO