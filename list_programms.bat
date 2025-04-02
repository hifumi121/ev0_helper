@echo off

:: Path to the JSON output file
set OUTPUT_FILE=%USERPROFILE%\Desktop\installed_programs.json

:: Execute PowerShell script
powershell -Command "Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion | ConvertTo-Json | Out-File '%OUTPUT_FILE%'"

echo The list of installed programmes has been saved to %OUTPUT_FILE%.
pause
