@echo off
:: Run PowerShell script as Administrator
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command ""& {irm https://massgrave.dev/get | iex}""' -Verb RunAs}"
