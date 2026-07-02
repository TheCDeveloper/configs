# AI-generated
Write-Host "Installing required packages..."

winget install --id Neovim.Neovim -e --silent
winget install --id Neovide.Neovide -e --silent


Write-Host "Applying configuration..."

# Get repo root (parent of install-scripts)
$repoRoot = Split-Path -Parent $PSScriptRoot
$applyScript = Join-Path $repoRoot "apply.ps1"

if (Test-Path $applyScript) {
    & powershell.exe -ExecutionPolicy Bypass -File $applyScript
} else {
    Write-Error "apply.ps1 not found at repo root: $applyScript"
    exit 1
}
