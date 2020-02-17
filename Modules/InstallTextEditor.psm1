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
                Write-Information ""
                Start-Process -FilePath $SetupFileLocation -Verb runas  -Wait -ErrorAction Stop
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