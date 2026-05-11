function Task01 {
    param ([int]$Count = 1)
    Clear-Host

    # Dünaamiline tee leidmine: võtab mooduli asukoha ja läheb ühe taseme üles
    $ParentDir = Split-Path $PSScriptRoot -Parent
    $SourceFile = Join-Path $ParentDir "extensions.txt"
    $OutputFile = Join-Path $ParentDir "random.txt"

    if (Test-Path $SourceFile) {
        $Extensions = Get-Content $SourceFile | Where-Object { $_ -ne "" }
        Write-Host "Adding $Count random extensions to file 'random.txt'..." -ForegroundColor Cyan
        
        for ($i = 0; $i -lt $Count; $i++) {
            $RandomExt = $Extensions | Get-Random
            $RandomExt | Out-File -FilePath $OutputFile -Append -Encoding utf8
        }
        Write-Host "Ready" -ForegroundColor Green
    } else {
        Write-Error "Faili '$SourceFile' ei leitud."
    }
}

function Task02 {
    param ([string]$Extension)
    if (-not $Extension) { Write-Warning "Lisa laiend!"; return }

    $ParentDir = Split-Path $PSScriptRoot -Parent
    $InputFile = Join-Path $ParentDir "random.txt"

    if (Test-Path $InputFile) {
        $Content = Get-Content $InputFile
        $MatchCount = ($Content | Where-Object { $_ -eq $Extension }).Count
        Write-Host "Laiendit '$Extension' leiti failist $MatchCount korda." -ForegroundColor Yellow
    } else {
        Write-Error "Faili 'random.txt' ei leitud."
    }
}

Export-ModuleMember -Function Task01, Task02