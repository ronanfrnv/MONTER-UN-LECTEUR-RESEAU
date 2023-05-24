# MONTER-UN-LECTEUR-RESEAU

1. Tout d'abord, nous définissons les variables `$driveLetter` et `$networkPath`. `$driveLetter` représente la lettre du lecteur que nous voulons monter (dans ce cas, "Y"), et `$networkPath` est le chemin réseau vers le lecteur partagé que nous voulons monter.

2. Ensuite, nous utilisons la commande `Get-WmiObject` avec la classe `Win32_LogicalDisk` pour obtenir la liste des lecteurs logiques actuellement montés. Nous filtrons cette liste à l'aide de `Where-Object` pour trouver un lecteur ayant le même `$driveLetter`.

3. Nous utilisons une structure conditionnelle (`if`) pour vérifier si la variable `$drive` est vide, ce qui signifie que le lecteur n'est pas déjà monté.

4. Si le lecteur n'est pas monté, nous utilisons la cmdlet `New-PSDrive` pour monter le lecteur réseau. Cette cmdlet crée un nouveau lecteur virtuel avec le nom spécifié (`$driveLetter`), le fournisseur PowerShell (`FileSystem`) et le chemin réseau (`$networkPath`). L'option `-Persist` est ajoutée pour rendre le lecteur persistant et visible dans l'Explorateur de fichiers.

5. Enfin, nous affichons un message approprié pour indiquer si le lecteur a été monté avec succès ou s'il est déjà monté.

Assurez-vous d'exécuter le script en tant qu'administrateur pour monter le lecteur réseau. N'hésitez pas à poser des questions supplémentaires si nécessaire !

```
$driveLetter = "Y"
$networkPath = "PRECISER ICI LE CHEMIN RÉSEAU"

$drive = Get-WmiObject -Class Win32_LogicalDisk | Where-Object {$_.DeviceID -eq $driveLetter}

if (!$drive) {
    New-PSDrive -Name $driveLetter -PSProvider FileSystem -Root $networkPath -Persist
    Write-Host "Le lecteur Y a été monté avec succès et est maintenant visible dans l'Explorateur de fichiers."
} else {
    Write-Host "Le lecteur Y est déjà monté."
}
```
