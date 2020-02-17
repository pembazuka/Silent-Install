mkdir -p "C:\Users\Abby\Documents\Logs"
TMPFILE="C:\Users\Abby\Documents\Logs\logs.txt"
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
                Write-Information "=========================================================" | tee -a $TMPFILE
                Write-Information "Installing Text Editor" | tee -a $TMPFILE
                Write-Information "=========================================================" | tee -a $TMPFILE
                #1. retry installation if failed
                #2. check if installation was successful
                #validate the setup file passed is valid
                Write-Information "Installation beginning..." | tee -a $TMPFILE
                Write-Information "" | tee -a $TMPFILE
                Start-Process -FilePath $SetupFileLocation -Verb runas  -Wait -ErrorAction Stop
                Write-Information "Installation completed." | tee -a $TMPFILE
                Write-Information "" | tee -a $TMPFILE
                $output = $true
            }
        }
        catch {
            $output = $false
            Write-Error "Notepadplus installation failed. Retry installation. $PSItem" | tee -a $TMPFILE
            Write-Information "" | tee -a $TMPFILE
            Install-TextEditor $SetupFileLocation
        }
        return $output
    }
}
