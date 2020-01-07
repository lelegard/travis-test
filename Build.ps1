if (((Get-ExecutionPolicy) -ne "Unrestricted") -and ((Get-ExecutionPolicy) -ne "RemoteSigned")) {
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force -ErrorAction:SilentlyContinue
}
Import-Module -Force -Name (Join-Path $PSScriptRoot Build-Common.psm1)

$MSBuild = (Find-MSBuild)

& $MSBuild "$PSScriptRoot\test.sln" /nologo /maxcpucount /property:Configuration=Release /property:Platform=x64 "/target:dll;app;app_dll"
