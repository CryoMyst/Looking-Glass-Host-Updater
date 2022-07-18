#Requires -RunAsAdministrator

$username = Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -expand UserName

$action = New-ScheduledTaskAction -Execute "powershell" -Argument "-ep Bypass -File install_looking-glass.ps1" -WorkingDirectory $PWD
$trigger = New-ScheduledTaskTrigger -AtStartup
$principal = New-ScheduledTaskPrincipal -UserId $username -RunLevel Highest
$settings = New-ScheduledTaskSettingsSet
$task = New-ScheduledTask -Action $action -Principal $principal -Trigger $trigger -Settings $settings
Register-ScheduledTask -TaskName "Install LookingGlass" -InputObject $task