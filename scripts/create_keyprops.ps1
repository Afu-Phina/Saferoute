<#
Interactive script to create android/key.properties locally.
This writes an untracked file `android/key.properties` with keystore values.
Do NOT commit the created file to source control.

Run from the repo root in PowerShell:
  pwsh ./scripts/create_keyprops.ps1
#>

Write-Host "This will create 'android/key.properties' with your keystore settings."
$confirm = Read-Host "Continue? (y/n)"
if ($confirm -ne 'y') { Write-Host 'Aborted.'; exit 0 }

$storeFile = Read-Host "Relative path to keystore file (e.g. android/my-release-key.jks)"
$storePassword = Read-Host "Keystore password" -AsSecureString
$keyPassword = Read-Host "Key password" -AsSecureString
$keyAlias = Read-Host "Key alias (the alias you used when creating the keystore)"

# Convert secure strings to plain text just for writing to file
function Convert-SecureStringToPlainText($ss) {
    $bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($ss)
    try { [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr) } finally { [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr) }
}

$storePasswordPlain = Convert-SecureStringToPlainText $storePassword
$keyPasswordPlain = Convert-SecureStringToPlainText $keyPassword

$content = @"
storePassword=$storePasswordPlain
keyPassword=$keyPasswordPlain
keyAlias=$keyAlias
storeFile=$storeFile
"@

$outPath = Join-Path (Get-Location) 'android\key.properties'
Set-Content -Path $outPath -Value $content -Encoding UTF8
Write-Host "Wrote $outPath (do NOT commit this file)."
