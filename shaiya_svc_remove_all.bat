@echo off
net stop ps_dbAgent
net stop ps_gameLog
net stop ps_game
net stop ps_gamewar
net stop ps_login
net stop ps_session
net stop ps_userLog
net stop PSM_AgentClient
net stop PSM_AgentServer
net stop shaiya_server
net stop shaiya_serverf
echo.
sc delete ps_dbAgent
sc delete ps_gameLog
sc delete ps_game
sc delete ps_gamewar
sc delete ps_login
sc delete ps_session
sc delete ps_userLog
sc delete PSM_AgentClient
sc delete PSM_AgentServer
sc delete shaiya_server
sc delete shaiya_serverf
pause
@exit