Write-Output "Script"
Write-Output "1. List All Users"
Write-Output "2. Create Account"
Write-Output "3 Delete Account"
Write-Output "4. Reset Password"
Write-Output "5. Exit"
while ($true) {
    $initialOption = Read-Host "Select option (1-5)"
    if ($initialOption -eq "1"){
        #Gets the ADuser then selects and writes thespecific objects specified to the terminal in a formated table.
        Get-ADuser -Filter * | Select-Object Name, SamAccountName, Enabled | Format-Table
    } elseif ($initialOption -eq  "2") {
        $name = Read-Host "Name"
        $accountName = Read-Host "SAM Account Name"
        $password = Read-Host -AsSecureString "Password"
        
        #Fires off The command
        New-ADuser -Name $name -SamAccountName $accountName -AccountPassword $password -enable
    } elseif (initialOption -eq "3") {
        $accountName = Read-Host "Account Name"
        Remove-ADuser -Identity $accountName
        Write-Ouput "Account Deleted!"
    } elseif ($initialOption -eq "4") {
        Write-Output "1. Make User Type Password At Logon"
        Write-Output "2. Reset Password, and make user type new password at logon."
        $getResetOption = Read-Host "Select Option (1-2)"
        if ($getResetOption -eq "1") {
            $accountName = Read-Host -AsSecureString "Password"
            Set-ADuser -Identity $accountName -ChangePasswordAtLogon $true
            Get-ADuser -Identity $accountName -Properties PasswordExpired | Select-Object
            Write-Output "New Password will be inputed at logon."
        } elseif ($getResetOption -eq "2") {
            $accountName = Read-Host "SAM Account Name"
            $password = Read-Host -AsSecureString "Password"
            Set-ADAccountPassword -Identity $accountName -Reset -NewPassword $Password
            Get-ADuser -Identity $accountName -Properties PasswordExpired | Select-Object Name, PasswordExpired | Format-Table       
            Write-Ouput "Password Reset and Password will be inputed at logon." 
        } else {
            Write-Ouput "Incorrect Input"
        }

    } elseif ($initialOption -eq "5") {
        break
    } else {
        Write-Output "Incorrect Input"
    }

}

#Be sure to write the comments out exactly like the original its useful to take notes lukas. The last time you did not take notes you forgot everything also stop typing the y key with your right hand.