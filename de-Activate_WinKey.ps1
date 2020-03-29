Write-Host " __      __.__        ____  __.                       ___________                  .__          "
Write-Host "/  \    /  \__| ____ |    |/ _|____ ___.__.           \__    ___/___   ____   ____ |  |   ____  "
Write-Host "\   \/\/   /  |/    \|      <_/ __ <   |  |   ______    |    | /  _ \ / ___\ / ___\|  | _/ __ \ "
Write-Host " \        /|  |   |  \    |  \  ___/\___  |  /_____/    |    |(  <_> ) /_/  > /_/  >  |_\  ___/ "
Write-Host "  \__/\  / |__|___|  /____|__ \___  > ____|             |____| \____/\___  /\___  /|____/\___  >"
Write-Host "       \/          \/        \/   \/\/                              /_____//_____/           \/"

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