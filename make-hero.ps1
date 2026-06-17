Set-Location $PSScriptRoot
Add-Type -AssemblyName System.Drawing

$heroUrl = "https://danielr685.sg-host.com/wp-content/uploads/2026/04/RRI-Construction-Hi-Vis-Fall-1200x800-1.png"
$logoUrl = "https://danielr685.sg-host.com/wp-content/uploads/2026/03/RRI-Black-x45.png"
$outDir  = "$PSScriptRoot\images"
$outPath = "$outDir\hero-branded.png"

New-Item -ItemType Directory -Force -Path $outDir | Out-Null

Write-Host "Downloading..." -ForegroundColor Cyan
$wc = New-Object System.Net.WebClient
$hero = [System.Drawing.Bitmap]::new([System.IO.MemoryStream]::new($wc.DownloadData($heroUrl)))
$logo = [System.Drawing.Bitmap]::new([System.IO.MemoryStream]::new($wc.DownloadData($logoUrl)))

Write-Host "Hero: $($hero.Width)x$($hero.Height)  Logo: $($logo.Width)x$($logo.Height)" -ForegroundColor Gray

# Scale logo to 90px wide (left-chest badge size)
$logoW = 90
$logoH = [int]($logo.Height * ($logoW / $logo.Width))

# Position: left chest of jacket (viewer's left, yellow panel above reflective stripe)
# On a 1200x800 image this lands around x=555, y=235
$x = 555
$y = 235

$g = [System.Drawing.Graphics]::FromImage($hero)
$g.SmoothingMode     = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g.DrawImage($logo, $x, $y, $logoW, $logoH)
$g.Dispose()

$hero.Save($outPath, [System.Drawing.Imaging.ImageFormat]::Png)
Write-Host "Saved: $outPath" -ForegroundColor Green

$hero.Dispose(); $logo.Dispose()
Write-Host "Done! Now run deploy.ps1 to push to the site." -ForegroundColor Yellow
