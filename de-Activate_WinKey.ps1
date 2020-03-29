Write-Host "      _                        _   _            _     __          ___       _  __          "
Write-Host "     | |             /\       | | (_)          | |    \ \        / (_)     | |/ /          "
Write-Host "   __| | ___ ______ /  \   ___| |_ ___   ____ _| |_  __\ \  /\  / / _ _ __ | ' / ___ _   _ "
Write-Host "  / _` |/ _ \______/ /\ \ / __| __| \ \ / / _` | __|/ _ \ \/  \/ / | | '_ \|  < / _ \ | | |"
Write-Host " | (_| |  __/     / ____ \ (__| |_| |\ V / (_| | |_|  __/\  /\  /  | | | | | . \  __/ |_| |"
Write-Host "  \__,_|\___|    /_/    \_\___|\__|_| \_/ \__,_|\__|\___| \/  \/   |_|_| |_|_|\_\___|\__, |"
Write-Host "                                                      ______                          __/ |"
Write-Host "                                                     |______|                        |___/ "

$path = "HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout"
$check = Get-ItemProperty $path | Select-String "Scancode Map"
if($check){
    Write-Host "Registry Key already exists"
    $loop = "true"
    while($loop -eq "true"){
        $in = Read-Host "Select action: overwrite, remove, abort [o,r,a]"
        if($in -eq "o" -or $in -eq "O" -or $in -eq "overwrite" -or $in -eq "Overwrite"){
            $loop = "false"
            Write-Host "overwriting registry key..."
            New-ItemProperty -Path $path -Name "Scancode Map" -Value ([byte[]](0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x00,0x00,0x5B,0xE0,0x00,0x00,0x5C,0xE0,0x00,0x00,0x00,0x00)) -PropertyType "Binary" -Force
            Write-Host "Windows Key is now:"
            Write-Host "Deactivated" -ForegroundColor Red
            Write-Host "finished"
            sleep 3
        }
        if($in -eq "r" -or $in -eq "R" -or $in -eq "remove" -or $in -eq "Remove"){
            $loop = "false"
            Write-Host "deleting registry key..."
            Remove-ItemProperty -Path $path -Name "Scancode Map"
            Write-Host "Windows Key is now:"
            Write-Host "Activated" -ForegroundColor Green
            Write-Host "finished"
            sleep 3
        }
        if($in -eq "a" -or $in -eq "A" -or $in -eq "abort" -or $in -eq "Abort"){
            $loop = "false"
            Write-Host "aborting script..."
            Write-Host "finished"
            sleep 3
        }
    }
}else{
    Write-Host "Registry Key does not exists"
    $in = Read-Host "Do you want to add the registry key? [y,n]"
    if($in -eq "y" -or $in -eq "Y"){
        Write-Host "Adding registry key..."
        New-ItemProperty -Path $path -Name "Scancode Map" -Value ([byte[]](0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x00,0x00,0x5B,0xE0,0x00,0x00,0x5C,0xE0,0x00,0x00,0x00,0x00)) -PropertyType "Binary"
        Write-Host "Windows Key is now:"
            Write-Host "Deactivated" -ForegroundColor Red
        Write-Host "finished"
        sleep 3
    }else{
        Write-Host "Windows Key is now:"
        Write-Host "Activated" -ForegroundColor Green
        Write-Host "finished"
        sleep 3
    }
}
