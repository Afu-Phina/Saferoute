<#
build_and_upload.ps1

Builds a release APK for the Flutter app and optionally uploads it to a web host
via FTP or SCP. Uses environment variables to avoid embedding credentials in the
script. Run from the repository root.

Usage examples:
- Just build and show APK path:
  pwsh ./scripts/build_and_upload.ps1

- Build and upload via SCP (requires OpenSSH scp on PATH):
  $env:SCP_TARGET = 'user@host:/path/to/public_html/saferoute.apk'
  pwsh ./scripts/build_and_upload.ps1 -method scp

- Build and upload via FTP:
  $env:FTP_URL = 'ftp://yourserver.com/public_html'
  $env:FTP_USER = 'ftpuser'
  $env:FTP_PASS = 'ftppassword'
  $env:REMOTE_PATH = 'saferoute.apk'  # optional
  pwsh ./scripts/build_and_upload.ps1 -method ftp

#>

param(
    [ValidateSet('none','ftp','scp')]
    [string]$method = 'none'
)

Write-Host "Building Flutter release APK..."
flutter pub get
flutter build apk --release

$apkPath = Join-Path (Get-Location) 'build\app\outputs\flutter-apk\app-release.apk'
if (-not (Test-Path $apkPath)) {
    Write-Error "APK not found at $apkPath. Build likely failed. Check 'flutter build' output."
    exit 1
}

Write-Host "APK built: $apkPath"

switch ($method) {
    'ftp' {
        if (-not $env:FTP_URL -or -not $env:FTP_USER -or -not $env:FTP_PASS) {
            Write-Error "Set FTP_URL, FTP_USER and FTP_PASS environment variables before running."
            exit 1
        }
        $remoteBase = $env:FTP_URL.TrimEnd('/')
        $remoteName = $env:REMOTE_PATH -or 'saferoute.apk'
        $remote = "$remoteBase/$remoteName"
        Write-Host "Uploading $apkPath to FTP $remote"
        $wc = New-Object System.Net.WebClient
        $wc.Credentials = New-Object System.Net.NetworkCredential($env:FTP_USER,$env:FTP_PASS)
        try {
            $wc.UploadFile($remote,'STOR',$apkPath)
            Write-Host "FTP upload complete."
        } catch {
            Write-Error "FTP upload failed: $_"
            exit 1
        }
    }
    'scp' {
        if (-not $env:SCP_TARGET) {
            Write-Error "Set SCP_TARGET environment variable like user@host:/path/saferoute.apk"
            exit 1
        }
        $target = $env:SCP_TARGET
        Write-Host "Uploading $apkPath to $target via scp"
        $rc = & scp $apkPath $target
        if ($LASTEXITCODE -ne 0) {
            Write-Error "scp failed with exit code $LASTEXITCODE"
            exit $LASTEXITCODE
        }
        Write-Host "SCP upload complete."
    }
    default {
        Write-Host "Build complete. APK path: $apkPath"
    }
}
