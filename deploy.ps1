cd $PSScriptRoot
git add .
git commit -m "Update site"
git push --set-upstream origin main
Write-Host "Deployed!" -ForegroundColor Green
Start-Sleep 2
