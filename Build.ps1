param(
    [switch]$GitPull = $false,
    [switch]$Installer = $false,
    [switch]$NoLowPriority = $false,
    [switch]$Debug = $false,
    [switch]$Release = $false,
    [switch]$Win32 = $false,
    [switch]$Win64 = $false,
    [switch]$NoTeletext = $false,
    [switch]$NoPause = $false
)

Set-StrictMode -Version 3
if (((Get-ExecutionPolicy) -ne "Unrestricted") -and ((Get-ExecutionPolicy) -ne "RemoteSigned")) {
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force -ErrorAction:SilentlyContinue
}
Import-Module -Force -Name (Join-Path $PSScriptRoot Build-Common.psm1)

$MSBuild = (Find-MSBuild)

echo "MSBuild=$MSBuild"
echo "Debug=$Debug"
echo "Release=$Release"
echo "Win32=$Win32"
echo "Win64=$Win64"
