1) 
    Log into the SQL Server and run the following file,
    AFTER changing the destination folders for the files.

    ..\DBMusic\ITDashboardProject\DBScripts\CreateDb.sql

2)
    Using Visual studio run a compare on the newly created DB and this project, update the DB with the changes.

3)
    Run the following file (not required but just in case)
	  
    ..\DBMusic\ITDashboardProject\DBScripts\ResetDb.sql

4)
    Run the following file (required)
    This process populates Date Dimension table required with dummy data. 
	
    ..\DBMusic\ITDashboardProject\DBScripts\PopulateTableData.sql



