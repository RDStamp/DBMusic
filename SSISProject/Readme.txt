1) 
    Open this solution in Visual Studio
2)
   Follow the steps outlined in ..\DBMusic\ITMusicProject\Readme.txt
   Creats and populates the Music DB containing the raw source data.
3)
   Follow the steps outlined in ..\DBMusic\ITDashboardProject\Readme.txt
   Creats and populates the Dashboard DB containing the required default data.
4)
    Edit the connection managers in the "ConnectionManagers" folder to point to the created DB's.
5)
    Run the following package file SSISMusicPackage.dtsx inside VS.
    Runs the SSIS Package to transfer all the latest data over from the Music DB to the Dashboard DB. 
    Under normal circumstances this package would be published to the SQL server and scheduled to run ot process the previous days data
    
	  