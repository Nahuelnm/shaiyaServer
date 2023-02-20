@echo off
SET dir_install=%~dp1
sc create shaiya_server binpath= %dir_install%PSM_Server\PSMServer_Agent.exe type= own start= auto
sc create shaiya_serverf binpath= %dir_install%PSM_Client\PSM_Agent.exe type= own start= auto
echo NT Services for Shaiya created
pause
@exit