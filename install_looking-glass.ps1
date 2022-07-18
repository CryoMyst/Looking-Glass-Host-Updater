#Requires -RunAsAdministrator

$binary_zip = "looking-glass.zip"
$binary_dir = "looking-glass"
$binary = "${binary_dir}/looking-glass-host-setup.exe"

Remove-Item -Force -ErrorAction SilentlyContinue $binary_zip
Remove-Item -Force -Recurse -ErrorAction SilentlyContinue $binary_dir

Invoke-WebRequest https://looking-glass.io/artifact/bleeding/host -OutFile $binary_zip
Expand-Archive -Path $binary_zip
Start-Process -Wait -FilePath $binary -ArgumentList "/S" -Verb RunAs