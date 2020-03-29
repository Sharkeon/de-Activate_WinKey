# de-Activate_WinKey
## Description
Simple Powershell-Script to deactivate and activate the Windows-Key, helpful for gaming.


### How to start the script
- Download the script
- Open a powershell console with admin privileges
  - Open windows-startmenu
  - Search for powershell
  - Right click and select "run as administrator"
- Navigate to the directory where your script is stored
  - > Set-Location C:\Users\<yourUsername>\Downloads
- Execute script
  - > .\de-Activate.WinKey.ps1
- (if powershell warns you that executing scripts is disabled, just enter yes. This allows the execution only for this action. After you close the window, it will go back to default (disabled)


### How to use the script
- If the registry key for the windows key deactivation doesn't already exist, the script will ask you if you want to add it,
you can enter "y" and you will be done or you can deny it by entering "n"
- If the registry key already exists you can enter "r" to remove the key or you can overwrite it with "o" or you can abort the script with "a"

### Save method
If you want to make sure your registry won't get damaged you can backup it before hand.
Just enter
> regedit

in the windows-startmenu and open it.
Select file (top left) and select export.
Save the file to a save place and you are done.
