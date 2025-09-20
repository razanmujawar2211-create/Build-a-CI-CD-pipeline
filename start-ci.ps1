Write-Host "🚀 Starting Jenkins and SonarQube with persistence..."

# Create Docker volumes if they don't exist
docker volume create jenkins_home | Out-Null
docker volume create sonarqube_data | Out-Null
docker volume create sonarqube_extensions | Out-Null
docker volume create sonarqube_logs | Out-Null

# Stop and remove old containers if running
docker stop jenkins sonarqube 2>$null
docker rm jenkins sonarqube 2>$null

# Start Jenkins with persistent volume
Write-Host "⚙️ Starting Jenkins..."
docker run -d --name jenkins `
  -p 8080:8080 -p 50000:50000 `
  -v jenkins_home:/var/jenkins_home `
  jenkins/jenkins:lts

# Start SonarQube with persistent volumes
Write-Host "⚙️ Starting SonarQube..."
docker run -d --name sonarqube `
  -p 9000:9000 `
  -v sonarqube_data:/opt/sonarqube/data `
  -v sonarqube_extensions:/opt/sonarqube/extensions `
  -v sonarqube_logs:/opt/sonarqube/logs `
  sonarqube:lts-community

Write-Host "🎉 Jenkins → http://localhost:8080"
Write-Host "🎉 SonarQube → http://localhost:9000"

