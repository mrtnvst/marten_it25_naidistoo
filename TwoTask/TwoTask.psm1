function Task01 {
    param ([int]$Count = 1)
    
    # Puhastame ekraani
    Clear-Host

    # Määrame teed (liigume mooduli kaustast ühe taseme üles)
    $SourceFile = Join-Path $PSScriptRoot "..\extensions.txt"
    $OutputFile = Join-Path $PSScriptRoot "..\random.txt"

    if (Test-Path $SourceFile) {
        $Extensions = Get-Content $SourceFile | Where-Object { $_ -ne "" }
        
        if ($null -eq $Extensions) {
            Write-Host "Viga: '$SourceFile' on tühi."
            return
        }

        Write-Host "Adding $Count random extensions to file 'random.txt'..."
        
        for ($i = 0; $i -lt $Count; $i++) {
            $RandomExt = $Extensions | Get-Random
            # Lisame faili lõppu uuele reale
            $RandomExt | Out-File -FilePath $OutputFile -Append -Encoding utf8
        }
        Write-Host "Ready"
    } else {
        Write-Host "Error: File '$SourceFile' not found."
    }
}

function Task02 {
    param ([string]$Extension)

    if (-not $Extension) {
        Write-Host "Kasutamine: Task02 <laiend>"
        Write-Host "Näide: Task02 .jpg"
        return
    }

    $InputFile = Join-Path $PSScriptRoot "..\random.txt"

    if (Test-Path $InputFile) {
        # Loeme faili ja filtreerime täpsed vasted
        $Content = Get-Content $InputFile
        $MatchCount = ($Content | Where-Object { $_ -eq $Extension }).Count

        if ($MatchCount -gt 0) {
            Write-Host "Laiendit '$Extension' leiti failist $MatchCount korda."
        } else {
            Write-Host "Laiendit '$Extension' ei leitud."
        }
    } else {
        Write-Host "Viga: Faili 'random.txt' ei leitud. Käivita esmalt Task01."
    }
}

Export-ModuleMember -Function Task01, Task02