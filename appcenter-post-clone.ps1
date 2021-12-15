write-host "appcenter-post-clone script: Remove Projects from Solution"
write-host "Searching for Solution Files"

#Notes: Include behavior in PowerShell
#https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem?view=powershell-7.2#example-4--get-child-items-using-the-include-parameter


$SLN_PATH = Get-ChildItem -Path $env:APPCENTER_SOURCE_DIRECTORY -Include *.sln -Recurse
$AllProjects = Get-ChildItem -Path $env:APPCENTER_SOURCE_DIRECTORY -Include *.csproj -Exclude "*UWP*.csproj", "ServiceRequest.csproj" -Recurse
write-host $SLN_PATH

foreach ($project in $AllProjects)
{
    write-host "Removing $project from $SLN_PATH"
    dotnet sln $SLN_PATH remove $project
}