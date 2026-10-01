# Клонирует репозитории-кандидаты для PatientFlow-AI в D:\koltcov\med_freimworks_project
# Запуск: PowerShell -> .\clone_repos.ps1   (нужен установленный Git for Windows)

$Target = "D:\koltcov\med_freimworks_project"
New-Item -ItemType Directory -Force -Path $Target | Out-Null
Set-Location $Target

$Repos = @(
    # Разобраны подробно (см. report.md)
    "Penn-RAIL/MARC-v1",
    "souvikmajumder26/Multi-Agent-Medical-Assistant",
    "Azure-Samples/healthcare-agent-orchestrator",
    # Строительные блоки по слоям
    "medplum/medplum",
    "AHRQ-CDS/AHRQ-CDS-Connect-CQL-SERVICES",
    "CAMeL-Lab/camel_tools",
    "SinaLab/sinatools",
    "microsoft/presidio",
    "EpistasisLab/BaseAgent",
    "mitmedialab/MDAgents",
    "RADAR-base/RADAR-Kubernetes"
)

foreach ($r in $Repos) {
    $name = $r.Split("/")[1]
    if (Test-Path (Join-Path $Target $name)) {
        Write-Host "skip  $r (already exists)"
        continue
    }
    Write-Host "clone $r"
    git clone --depth 1 "https://github.com/$r.git"
}

Write-Host "Done: $Target"
