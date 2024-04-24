@echo off
net stop wuauserv
net stop bits
net stop dosvc
net stop wercplsupport

shutdown /r /t 0
