# Quick script to push changes to your live website
# Double-click this file or run it in PowerShell: .\push-changes.ps1

Write-Host "🚀 Pushing changes to live website..." -ForegroundColor Cyan
Write-Host ""

# Check if there are any changes
$status = git status --short
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Host "✅ No changes to commit. Everything is up to date!" -ForegroundColor Green
    exit
}

# Stage all changes
Write-Host "📦 Staging changes..." -ForegroundColor Yellow
git add .

# Auto-generate commit message with timestamp
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
$commitMessage = "Update: $timestamp"
Write-Host ""
Write-Host "💾 Auto-generated commit message: $commitMessage" -ForegroundColor Yellow

# Commit changes
Write-Host ""
Write-Host "💾 Committing changes..." -ForegroundColor Yellow
git commit -m $commitMessage

# Push to GitHub
Write-Host ""
Write-Host "📤 Pushing to GitHub..." -ForegroundColor Yellow
git push

Write-Host ""
Write-Host "✅ Done! GitHub Pages will auto-deploy your changes in ~1-2 minutes." -ForegroundColor Green
Write-Host "   Your site: https://natancoresh-chiappori.github.io/" -ForegroundColor Cyan
Write-Host "   Check GitHub Actions for deployment status." -ForegroundColor Green
Write-Host ""

