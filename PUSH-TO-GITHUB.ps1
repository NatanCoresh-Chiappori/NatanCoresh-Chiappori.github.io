# Enhanced PowerShell script to push changes to GitHub Pages
# Double-click this file or run: .\PUSH-TO-GITHUB.ps1

# Set console title and colors
$Host.UI.RawUI.WindowTitle = "Push Changes to GitHub Pages"
$Host.UI.RawUI.ForegroundColor = "Green"

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  PUSH CHANGES TO GITHUB PAGES" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Your site: https://natancoresh-chiappori.github.io/" -ForegroundColor Yellow
Write-Host ""

# Check if git is available
try {
    $null = git --version 2>&1
} catch {
    Write-Host "ERROR: Git is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Git from https://git-scm.com/" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Check if we're in a git repository
try {
    $null = git rev-parse --git-dir 2>&1
} catch {
    Write-Host "ERROR: Not a git repository" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Show current status
Write-Host "Checking for changes..." -ForegroundColor Yellow
$status = git status --short
if ($status) {
    Write-Host $status -ForegroundColor Gray
} else {
    Write-Host "No changes detected." -ForegroundColor Gray
}
Write-Host ""

# Stage all changes
Write-Host "[1/4] Staging all changes..." -ForegroundColor Yellow
git add .
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to stage changes" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Check if there are any changes to commit
$staged = git diff --cached --name-only
if (-not $staged) {
    Write-Host ""
    Write-Host "No changes to commit. Everything is up to date!" -ForegroundColor Green
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 0
}

# Show what will be committed
Write-Host ""
Write-Host "Files to be committed:" -ForegroundColor Cyan
git diff --cached --name-status | ForEach-Object {
    Write-Host "  $_" -ForegroundColor Gray
}
Write-Host ""

# Auto-generate commit message with timestamp
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
$commitMessage = "Update: $timestamp"
Write-Host "[2/4] Auto-generated commit message: $commitMessage" -ForegroundColor Yellow

# Commit changes
Write-Host ""
Write-Host "[3/4] Committing changes..." -ForegroundColor Yellow
git commit -m $commitMessage
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to commit changes" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Push to GitHub
Write-Host ""
Write-Host "[4/4] Pushing to GitHub..." -ForegroundColor Yellow
git push origin main
if ($LASTEXITCODE -ne 0) {
    Write-Host "Trying alternative branch name..." -ForegroundColor Yellow
    git push origin master
    if ($LASTEXITCODE -ne 0) {
        Write-Host "ERROR: Failed to push to GitHub" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
}

# Success message
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  SUCCESS!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Your changes have been pushed to GitHub!" -ForegroundColor Green
Write-Host ""
Write-Host "GitHub Pages will automatically deploy in 1-2 minutes." -ForegroundColor Cyan
Write-Host ""
Write-Host "Your live site: " -NoNewline
Write-Host "https://natancoresh-chiappori.github.io/" -ForegroundColor Yellow
Write-Host ""
Write-Host "Check deployment status:" -ForegroundColor Cyan
Write-Host "https://github.com/NatanCoresh-Chiappori/personal-website/actions" -ForegroundColor Yellow
Write-Host ""
Read-Host "Press Enter to exit"

