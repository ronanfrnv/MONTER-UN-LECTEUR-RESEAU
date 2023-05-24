$driveLetter = "Y"
$networkPath = ""

$drive = Get-WmiObject -Class Win32_LogicalDisk | Where-Object {$_.DeviceID -eq $driveLetter}

if (!$drive) {
    New-PSDrive -Name $driveLetter -PSProvider FileSystem -Root $networkPath
    Write-Host "Le lecteur Y a été monté avec succès."
} else {
    Write-Host "Le lecteur Y est déjà monté."
}
