$ErrorActionPreference = 'Stop'

$installDir = "$env:LOCALAPPDATA\portalcli"
$binPath = "$installDir\portalcli.exe"
$downloadUrl = "https://github.com/Nexus-god/portal-cli/releases/latest/download/portalcli.exe"

Write-Host "🚀 Installing Portal CLI..." -ForegroundColor Cyan

# Создаем директорию
New-Item -ItemType Directory -Force -Path $installDir | Out-Null

# Качаем бинарник
Write-Host "⬇️  Downloading from $downloadUrl" -ForegroundColor Yellow
Invoke-WebRequest -Uri $downloadUrl -OutFile $binPath -UseBasicParsing

# Добавляем в PATH
$path = [Environment]::GetEnvironmentVariable("Path", "User")
if ($path -notlike "*$installDir*") {
    [Environment]::SetEnvironmentVariable("Path", "$path;$installDir", "User")
    $env:Path = "$env:Path;$installDir"
    Write-Host "✅ Added to PATH" -ForegroundColor Green
}

Write-Host "✅ Portal CLI installed to $binPath" -ForegroundColor Green
Write-Host "🎯 Run 'portalcli' to start" -ForegroundColor Yellow
Write-Host ""
Write-Host "Restart your terminal or run: `$env:Path += ';$installDir'" -ForegroundColor Gray
