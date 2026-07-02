# AI-generated
$windowsScript = Join-Path $PSScriptRoot "windows.ps1"

if (Test-Path $windowsScript) {
    Write-Host "Executing $windowsScript"
    & powershell.exe -ExecutionPolicy Bypass -File $windowsScript
} else {
    Write-Error "windows.ps1 not found at repo root: $windowsScript"
    exit 1


Write-Host "Installing dev environment..."

# Core tools (lightweight, no VS Build Tools)
winget install --id LLVM.LLVM -e --silent
winget install --id Kitware.CMake -e --silent
winget install --id Rustlang.Rustup -e --silent
winget install --id Microsoft.Pyright -e --silent


Write-Host "Installing libraries..."

# Vulkan SDK (includes headers + validation layers)
winget install --id LunarG.VulkanSDK -e --silent

# Install vcpkg via winget
winget install --id Microsoft.vcpkg -e --silent

# Ensure vcpkg is usable
$env:VCPKG_ROOT = "$env:LOCALAPPDATA\vcpkg"

if (Test-Path $env:VCPKG_ROOT) {
    Write-Host "vcpkg installed at $env:VCPKG_ROOT"
} else {
    Write-Warning "vcpkg install path not found. Check winget installation."
}

# Install libraries via vcpkg (if available)
if (Get-Command vcpkg -ErrorAction SilentlyContinue) {
    vcpkg install sdl3 glm glad
} else {
    Write-Warning "vcpkg not in PATH yet. Restart shell or add manually."
}
