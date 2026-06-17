cd $PSScriptRoot
git add .
git commit -m "Update site"
git push
Write-Host "Deployed!" -ForegroundColor Green
Start-Sleep 2
