
::to set the current location as location of batch file
@setlocal enableextensions
@cd /d "%~dp0"

@echo off
::Script Variables
SET LOGFILE="RS Scripter log.txt"

::Current location
SET SCRIPTFULLPATH="./DeployReports.rss"


::FOLDER TO BE CREATED ON SERVER
SET REPORTFOLDER="Reports" 
SET DATASOURCEFOLDER="DataSources"
SET DATASOURCEPATH="/%DATASOURCEFOLDER%"

::Local
SET REPORTSERVERIP=localhost
SET REPORTSERVER="http://%REPORTSERVERIP%/Reportserver"
SET RS="RS.EXE"
SET FilesToUploadPath="./ReportsToDeploy"
SET DATASOURCENAME="ReportDataSource"
SET TIMEOUT=60

::Clear Log file
IF EXIST %logfile% DEL %logfile%

%RS% -i %SCRIPTFULLPATH% -s %REPORTSERVER% -v ReportFolder=%REPORTFOLDER% -v DataSourceFolder=%DATASOURCEFOLDER% -v DataSourcePath=%DATASOURCEPATH% -v DSname=%DATASOURCENAME% -v filePath=%FilesToUploadPath%  -eMgmt2010 >>%LOGFILE% 2>&1
ECHO. >>%LOGFILE%

::Run script

ECHO. >>%LOGFILE%
ECHO Finished Load at %DATE% %TIME% >>%LOGFILE%
ECHO. >>%LOGFILE%

