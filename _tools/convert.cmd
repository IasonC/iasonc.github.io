@echo off
REM jekyll-imagemagick hardcodes `convert`, but ImageMagick 7 dropped that alias and
REM Windows resolves the name to C:\Windows\System32\convert.exe (the disk-format
REM tool) instead. This shim forwards to `magick`. Put this directory on PATH ahead
REM of System32 — serve.ps1 does that for you.
magick %*
