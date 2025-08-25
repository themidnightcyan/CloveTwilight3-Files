function GitCommit {
    # Switch to main branch
Write-Host "Switching to main branch..." -ForegroundColor Cyan
git checkout main

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Failed to switch to main branch" -ForegroundColor Red
    exit
}

# Pull latest changes first
Write-Host "Pulling latest changes from main..." -ForegroundColor Cyan
git pull origin main

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Failed to pull latest changes. Please resolve any conflicts manually." -ForegroundColor Red
    exit
}

# Add all changes
Write-Host "Adding all changes..." -ForegroundColor Green
git add .

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Failed to add files" -ForegroundColor Red
    exit
}

# Check if there are any changes to commit
$status = git status --porcelain
if (-not $status) {
    Write-Host "No changes to commit!" -ForegroundColor Yellow
    exit
}

# Prompt for commit message
$commitMessage = Read-Host "Enter commit message"

if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    Write-Host "Commit message cannot be empty!" -ForegroundColor Red
    exit
}

# Commit changes
Write-Host "Committing changes..." -ForegroundColor Green
git commit -m "$commitMessage"

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Failed to commit" -ForegroundColor Red
    exit
}

# Push to main branch
Write-Host "Pushing to main branch..." -ForegroundColor Green
git push origin main

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Failed to push" -ForegroundColor Red
    exit
}

Write-Host "Successfully committed and pushed to main!" -ForegroundColor Green

}

GitCommit