# RRI Website — Git Setup Script
# Run this once from PowerShell in the "RRI Website" folder

Set-Location $PSScriptRoot

# 1. Init repo
git init
git branch -M main

# 2. Create .gitignore
@"
# OS
.DS_Store
Thumbs.db

# Draft / internal files
2026-06-15-rri-website.html
download-images.ps1
CLAUDE.md
setup-git.ps1
"@ | Set-Content .gitignore

# 3. Stage and commit everything
git add .
git commit -m "Initial commit — RRI website v1"

Write-Host ""
Write-Host "Done! Now:" -ForegroundColor Green
Write-Host "Run these commands to push to GitHub:" -ForegroundColor Yellow
Write-Host "   git remote add origin https://github.com/solo353/RRI.git" -ForegroundColor Cyan
Write-Host "   git push -u origin main" -ForegroundColor Cyan
Write-Host ""
Write-Host "4. Then go to https://pages.cloudflare.com and connect the repo" -ForegroundColor Yellow
