param()

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

$repositoryRoot = $PSScriptRoot
$buildScript = Join-Path $repositoryRoot "build-app-store.ps1"
$artifactBundle = Join-Path $repositoryRoot "AppStore\artifacts\Renamer.bundle"
$outputZip = Join-Path $repositoryRoot "AppStore\artifacts\Renamer-1.0.0-Autodesk-Marketplace.zip"

if (@(Get-Process -Name "acad" -ErrorAction SilentlyContinue).Count -gt 0) {
    throw "AutoCAD is running. Close AutoCAD 2026 and AutoCAD 2027, then run the BAT again."
}

if (-not (Test-Path -LiteralPath $buildScript -PathType Leaf)) {
    throw "Build script was not found: '$buildScript'."
}

if ([string]::IsNullOrWhiteSpace($env:APPDATA)) {
    throw "APPDATA is not available for the current Windows user."
}

Write-Host "Removing generated build folders..."
$generatedPaths = @(
    (Join-Path $repositoryRoot "AppStore\artifacts"),
    (Join-Path $repositoryRoot "Renamer App for AutoCAD\bin"),
    (Join-Path $repositoryRoot "Renamer App for AutoCAD\obj")
)
foreach ($generatedPath in $generatedPaths) {
    if (Test-Path -LiteralPath $generatedPath) {
        Write-Host "Removing $generatedPath"
        Remove-Item -LiteralPath $generatedPath -Recurse -Force
    }
}

Write-Host "Building Renamer for AutoCAD 2026 (.NET 8) and AutoCAD 2027 (.NET 10)..."
& $buildScript
if ($LASTEXITCODE -ne 0) {
    throw "The Autodesk Marketplace build failed."
}

if (-not (Test-Path -LiteralPath $artifactBundle -PathType Container)) {
    throw "The build did not create '$artifactBundle'."
}

$pluginRoot = Join-Path $env:APPDATA "Autodesk\ApplicationPlugins"
$installedBundle = Join-Path $pluginRoot "Renamer.bundle"
New-Item -ItemType Directory -Path $pluginRoot -Force | Out-Null

$knownTestBundles = @(
    (Join-Path $pluginRoot "Renamer.bundle"),
    (Join-Path $pluginRoot "LayerRenamer.bundle"),
    (Join-Path $pluginRoot "Layer Renamer.bundle"),
    (Join-Path $pluginRoot "LayerRenamerApp.bundle")
)
foreach ($knownBundle in $knownTestBundles) {
    if (Test-Path -LiteralPath $knownBundle) {
        Write-Host "Removing $knownBundle"
        Remove-Item -LiteralPath $knownBundle -Recurse -Force
    }
}

Write-Host "Installing $installedBundle"
Copy-Item -LiteralPath $artifactBundle -Destination $installedBundle -Recurse -Force

$sourceFiles = @(Get-ChildItem -LiteralPath $artifactBundle -Recurse -File)
$installedFiles = @(Get-ChildItem -LiteralPath $installedBundle -Recurse -File)
if ($sourceFiles.Count -eq 0 -or $sourceFiles.Count -ne $installedFiles.Count) {
    throw "Installed bundle verification failed: source file count $($sourceFiles.Count), installed file count $($installedFiles.Count)."
}

foreach ($sourceFile in $sourceFiles) {
    $relativePath = $sourceFile.FullName.Substring($artifactBundle.Length).TrimStart('\')
    $installedFile = Join-Path $installedBundle $relativePath
    if (-not (Test-Path -LiteralPath $installedFile -PathType Leaf)) {
        throw "Installed bundle verification failed; missing '$relativePath'."
    }

    $sourceHash = (Get-FileHash -LiteralPath $sourceFile.FullName -Algorithm SHA256).Hash
    $installedHash = (Get-FileHash -LiteralPath $installedFile -Algorithm SHA256).Hash
    if ($sourceHash -ne $installedHash) {
        throw "Installed bundle verification failed; hash mismatch for '$relativePath'."
    }
}

$packageHash = (Get-FileHash -LiteralPath $outputZip -Algorithm SHA256).Hash
Write-Host ""
Write-Host "Renamer was built and installed successfully."
Write-Host "Installed bundle: $installedBundle"
Write-Host "Marketplace ZIP: $outputZip"
Write-Host "Marketplace ZIP SHA256: $packageHash"
Write-Host "Start AutoCAD 2026 or 2027 and run APPAUTOLOADER, then choose Reload if AutoCAD was already open before you closed it."
