#Paths
$WorkingDirectory = split-path -parent $MyInvocation.MyCommand.Definition
$ModulesLocationPath = "$WorkingDirectory\Modules"
$InstallationfileLocation = "C:\Users\Abby\Downloads\npp.7.7.1.Installer.x64.exe"
# 
function Validity {
    <#
    .Description

    Performs validity check to verify the path of the executable is correct and that the executable exists
    #>
    FILE=$InstallationfileLocation
    if (test -f "$FILE"){
        Write-Information "FILE exist"
    }
    else{
        Write-Information "FILE doesn't exist"
    }

}

function RegisterModules {
    <#
    .Description

    Registers all modules created and placed in scripts within the modules folder
    #>
    if (Test-Path $ModulesLocationPath) {
        foreach ($item in (Get-ChildItem -Path $ModulesLocationPath)) {
            Import-Module "$ModulesLocationPath\$item"
        }
    }
    else {
        Write-Information "Path $ModulesLocationPath does not exist"
    }
}

function Install-Verification {
    if(Test-Path "C:\Program Files (x86)\Notepad++\notepad++.exe"){
        Write-output "Notepad++ is already installed on your machine."
    }
    Else{
        Write-Output "Notepad++ is not installed on your machine."
    } 
}

function Main {
    <#
    .Description
    This is the point of entry for program execution.
    It is from this point that installation of the text editorwill be intiated

    #>
    Validity
    RegisterModules
    Install-TextEditor $InstallationfileLocation
    Install-Verification
}
Main
