# stop-ci.ps1
# This script stops Jenkins and SonarQube in Docker

Write-Host "🛑 Stopping Jenkins and SonarQube..."

# Stop Jenkins if running
docker ps --format '{{.Names}}' | findstr jenkins > $null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Stopping Jenkins..."
    docker stop jenkins
} else {
    Write-Host "⚠️ Jenkins is not running."
}

# Stop SonarQube if running
docker ps --format '{{.Names}}' | findstr sonarqube > $null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Stopping SonarQube..."
    docker stop sonarqube
} else {
    Write-Host "⚠️ SonarQube is not running."
}

Write-Host "🎉 All services stopped."
