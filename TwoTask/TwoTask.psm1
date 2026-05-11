function Task01 {
    Clear-Host

    $ParentDir = Split-Path $PSScriptRoot -Parent
    $SourceFile = Join-Path $ParentDir "laiendid.txt"
    $OutputFile = Join-Path $ParentDir "random.txt"

    if (Test-Path $SourceFile) {
        $Extensions = Get-Content $SourceFile | Where-Object { $_ -ne "" }
        
        Write-Host "Lisan automaatselt 100 laiendit..." -ForegroundColor Cyan
        
        # Automaatne tsükkel 100 korda
        for ($i = 0; $i -lt 100; $i++) {
            $RandomExt = $Extensions | Get-Random
            $RandomExt | Out-File -FilePath $OutputFile -Append -Encoding utf8
        }
        
        Write-Host "Valmis. Faili random.txt lisati 100 rida." -ForegroundColor Green
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
        if ($null -eq $MatchCount) { $MatchCount = 0 }
        
        Write-Host "Laiendit '$Extension' leiti failist $MatchCount korda." -ForegroundColor Yellow
    } else {
        Write-Error "Faili 'random.txt' ei leitud."
    }
}

Export-ModuleMember -Function Task01, Task02