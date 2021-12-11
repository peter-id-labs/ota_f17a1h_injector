#requires -version 4

if ($IsLinux -or $IsmacOS) `
{Write-Error "This script requires Microsoft Windows Operating System."; exit 1}

$ProgressPreference = 'SilentlyContinue'
$RunScript = (Split-Path -Leaf $MyInvocation.MyCommand.Definition).Replace('.ps1','.bat')
if([Environment]::OSVersion.Version -lt (New-Object Version 6,1))
{[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12}

Invoke-WebRequest `
-uri http://github.com/thefirefox12537/ota_f17a1h_injector/releases/latest/download/$RunScript `
-OutFile "${env:tmp}\$RunScript"

& "${env:tmp}\$RunScript" @args
Remove-Item -LiteralPath "${env:tmp}\$RunScript"

exit 0