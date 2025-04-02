# Interactive menu for managing security features
function ShowMenu {
    Write-Host "Select an option:"
    Write-Host "1. Enable Core Isolation"
    Write-Host "2. Disable Core Isolation"
    Write-Host "3. Enable Hyper-V"
    Write-Host "4. Disable Hyper-V"
    Write-Host "5. Enable Virtualization-Based Security (VBS)"
    Write-Host "6. Disable Virtualization-Based Security (VBS)"
    Write-Host "7. Exit"
}

# Function to enable Core Isolation (Memory Integrity)
function EnableCoreIsolation {
    Write-Host "Enabling Core Isolation..."
    # Memory Integrity is a part of Core Isolation
    Set-MpPreference -EnableMemoryIntegrity $true
    Write-Host "Core Isolation has been enabled."
}

# Function to disable Core Isolation (Memory Integrity)
function DisableCoreIsolation {
    Write-Host "Disabling Core Isolation..."
    Set-MpPreference -EnableMemoryIntegrity $false
    Write-Host "Core Isolation has been disabled."
}

# Function to enable Hyper-V virtualization platform
function EnableHyperV {
    Write-Host "Enabling Hyper-V..."
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -NoRestart
    Write-Host "Hyper-V has been enabled. Please restart your computer."
}

# Function to disable Hyper-V virtualization platform
function DisableHyperV {
    Write-Host "Disabling Hyper-V..."
    Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -NoRestart
    Write-Host "Hyper-V has been disabled. Please restart your computer."
}

# Function to enable Virtualization-Based Security (VBS)
function EnableVBS {
    Write-Host "Enabling Virtualization-Based Security (VBS)..."
    # Modify registry key to enable VBS
    reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\DeviceGuard" /v EnableVirtualizationBasedSecurity /t REG_DWORD /d 1 /f
    Write-Host "VBS has been enabled."
}

# Function to disable Virtualization-Based Security (VBS)
function DisableVBS {
    Write-Host "Disabling Virtualization-Based Security (VBS)..."
    reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\DeviceGuard" /v EnableVirtualizationBasedSecurity /t REG_DWORD /d 0 /f
    Write-Host "VBS has been disabled."
}

# Main program loop
do {
    ShowMenu
    $choice = Read-Host "Enter the number of your choice"

    switch ($choice) {
        1 { EnableCoreIsolation }
        2 { DisableCoreIsolation }
        3 { EnableHyperV }
        4 { DisableHyperV }
        5 { EnableVBS }
        6 { DisableVBS }
        7 { Write-Host "Exiting program."; break }
        default { Write-Host "Invalid selection, please try again." }
    }
} while ($choice -ne 7)
