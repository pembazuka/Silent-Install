# Silent-Install

Edit was made on the fourth line of the MainScript.ps1 to install the exe file silently.


# 1. How to handle failed installation

This can be solved by creating a **function Install-Verification** in the MainScript.ps file that verifies whether Notepad++ has been                 installed in the system or not and providing an output incase it fails.

# 2. How to log the events being handled by the automation script

We create a directory in documents that contains a file called logs that logs every process.This is done in file Install-TextEditor.psm1

mkdir -p "C:\Users\Abby\Documents\Logs"

TMPFILE="C:\Users\Abby\Documents\Logs\logs.txt"

then we write all of the outputs to the file logs.txt using the command tee.

# 3. How to ensure validity of data eg paths, .exe files throughout the execution of the script

This can be solved by creating a **function Validity** in MainScript.ps file that checks to ensure the path as well as the executable exists 
