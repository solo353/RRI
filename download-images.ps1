# RRI Website - Download All Images
# Run this once from PowerShell to download all site images locally.
# Right-click → "Run with PowerShell"

$dest = "$PSScriptRoot\images"
New-Item -ItemType Directory -Force -Path $dest | Out-Null

$images = @(
    "https://danielr685.sg-host.com/wp-content/uploads/2026/03/RRI-Black-x45.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/04/Direct-Store-Procurement-Shopper-Man.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/04/HUMAN-QC-3-checkboxes-process-250x250-STEEL-BLUE-100x100.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/04/PROCESS-gear-3-squares-250x250-STEEL-BLUE-100x100.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/04/RRI-5-STAR-NEW-1.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/04/RRI-C995-River-Blue-Navy-SIDE.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/04/RRI-Construction-Hi-Vis-Fall-1200x800-1.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/04/RRI-Construction-Street-Orange-SMALL.jpg",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/04/RRI-Mens-reflective-shirt-T300-Lime-FRONT.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/04/RRI-Utility-Night-Safety-Apparel-Hi-Vis-1500.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/04/SLATE-Logo-Construction-Hensel-Phelps-300x300-300hires-150x150.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/04/SLATE-Logo-Construction-Whiting-Turner-300x300-300hires-150x150.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/04/SLATE-Logo-Food-Bev-Coca-Cola-300x300-300hires-150x150.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/04/SLATE-Logo-Food-Bev-Sysco-300x300-300hires-150x150.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/04/SLATE-Logo-Logistics-Penske-300x300-300hires-150x150.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/04/SLATE-Logo-Signature-Aviation-300x300-01-150x150.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/04/TEAM-3-check-boxes-250x250-STEEL-BLUE-100x100.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/05/RRI-Safety-Apparel-V218-120-Lime-Front.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/06/RRI-Corporate-Apparel-Nike-Dri-FIT-Vapor-Polo-NKDC2108-NKDC2108-296-Midnight-navy-Front.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/06/RRI-Corporate-Apparel-Port-Authority-Core-Soft-Shell-Jacket-J317-J317-296-Battleship-grey-Front_1.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/06/RRI-Corporate-Apparel-Port-Authority-Value-Fleece-Jacket-F217-F217-296-Insignia-blue-Front_1.png",
    "https://danielr685.sg-host.com/wp-content/uploads/2026/06/RRI-Corporate-Apparel-Sport-Tek-PosiCharge-Competitor-Tee-ST350-ST350-296-Neon-yellow-Front_1.png"
)

$wc = New-Object System.Net.WebClient
$wc.Headers.Add("User-Agent", "Mozilla/5.0")

foreach ($url in $images) {
    $filename = [System.IO.Path]::GetFileName($url)
    $outPath = Join-Path $dest $filename
    try {
        $wc.DownloadFile($url, $outPath)
        Write-Host "OK  $filename" -ForegroundColor Green
    } catch {
        Write-Host "FAIL $filename - $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "`nDone. Images saved to: $dest" -ForegroundColor Cyan
Read-Host "Press Enter to close"
