1) 
    Log into the SQL Server and run the following file,
    AFTER changing the destination folders for the files.

    ..\DBMusic\ITMusicProject\DBScripts\CreateDb.sql

2)
    Using Visual studio run a compare on the newly created DB and this project, update the DB with the changes.

3)
    Run the following file (not required but just in case)
	  
    ..\DBMusic\ITMusicProject\DBScripts\ResetDb.sql

4)
    Run the following file (required)
    This process populates most of the tables required with dummy data. There is some randomisation in the inserts but the data is not truely randomised and is unlikely to reflect true real world behaviour.
    However the data should be sufficent for this exercise. 
	  
    ..\DBMusic\ITMusicProject\DBScripts\PopulateTableData.sql

    NOTE The Final Step 
    /****** Object:  Database [Music].[dbo].[PlayHistory] ******/
    Will take a while as it generates a large number of rows.