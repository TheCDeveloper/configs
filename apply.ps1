# AI-generated
Write-Host "[!] THIS WILL REMOVE OLD CONFIGS" -ForegroundColor Yellow
$confirmation = Read-Host "Apply config? [y/N]"

if ($confirmation -notin @("y", "Y")) {
    exit
}

$repoRoot = Get-Location


# Neovim
$nvimDest = Join-Path $env:LOCALAPPDATA "nvim"

Write-Host "`n- Erasing " -NoNewline
Write-Host "nvim" -ForegroundColor Blue

Remove-Item $nvimDest -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "└ Applying" -ForegroundColor Green

New-Item `
    -ItemType SymbolicLink `
    -Path $nvimDest `
    -Target (Join-Path $repoRoot "nvim") | Out-Null


# Alacritty
$alacrittyDest = Join-Path $env:APPDATA "alacritty"

Write-Host "- Erasing " -NoNewline
Write-Host "alacritty" -ForegroundColor Blue

Remove-Item $alacrittyDest -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "└ Applying" -ForegroundColor Green

New-Item `
    -ItemType SymbolicLink `
    -Path $alacrittyDest `
    -Target (Join-Path $repoRoot "alacritty") | Out-Null


Write-Host "`nDone"
