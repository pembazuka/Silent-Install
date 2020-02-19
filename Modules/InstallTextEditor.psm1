mkdir -p "C:\Users\pemba\Documents\Logs"
New-Item "C:\Users\pemba\Documents\Logs\logs.txt"
$SetupFileLocation = "C:\Users\Abby\Downloads\npp.7.7.1.Installer.x64.exe"
function Install-TextEditor {
    <#
    .Description
    This is a cmdlet that installs a text editor
    #>
    process {
        $retryInstallCount = 10
        $output = $false
        try {
            if ($retryInstallCount -gt 0) {
                Write-Information "=========================================================" 
                Write-Information "Installing Text Editor"
                Write-Information "========================================================="
                #1. retry installation if failed
                #2. check if installation was successful
                #validate the setup file passed is valid
                Write-Information "Installation beginning..."
                Write-Information "" | tee -a $TMPFILE
                Start-Process -FilePath $SetupFileLocation -ArgumentList '/silent' -Wait -ErrorAction Stop
                Write-Information "Installation completed."
                Write-Information ""
                $output = $true
            }
        }
        catch {
            $output = $false
            Write-Error "Notepadplus installation failed. Retry installation. $PSItem"
            Write-Information ""
            Install-TextEditor $SetupFileLocation
        }
        return $output
    }
}
Install-TextEditor 6> C:\Users\pemba\Documents\Logs\logs.txt
