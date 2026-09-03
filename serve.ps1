# Local preview: .\serve.ps1   (then http://localhost:4000)
#
# Sets up PATH so Jekyll and ImageMagick are both found, then serves with
# auto-regeneration. Ctrl-C to stop.

$ErrorActionPreference = "Stop"

$ruby = "C:\Ruby33-x64\bin"
$magick = (Get-ChildItem "C:\Program Files\ImageMagick*" -Directory | Select-Object -First 1).FullName
$shim = Join-Path $PSScriptRoot "_tools"   # supplies `convert` -> `magick`

$env:Path = "$shim;$ruby;$magick;" + $env:Path

Set-Location $PSScriptRoot
bundle exec jekyll serve --livereload --port 4000
