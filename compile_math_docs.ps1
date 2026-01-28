param (
    [string]$FileName
)

$OutputFolder = "pdfs"
$SourceDir = "tex_files"

# 1. Create testing folder if it doesn't exist
if (-not (Test-Path $OutputFolder)) {
    New-Item -ItemType Directory -Path $OutputFolder | Out-Null
    Write-Host "Created folder: $OutputFolder" -ForegroundColor Gray
}

# 2. Find .tex files
if ($FileName) {
    # If FileName is provided, look for that specific file
    $Files = Get-ChildItem -Path $SourceDir -Filter "$FileName" -Recurse
    if (-not $Files) {
        # Check if they forgot the .tex extension
        if ($FileName -notlike "*.tex") {
            $Files = Get-ChildItem -Path $SourceDir -Filter "$FileName.tex" -Recurse
        }
    }
    
    if (-not $Files) {
        Write-Host "[ERROR] Could not find file: $FileName" -ForegroundColor Red
        exit
    }
}
else {
    # Default behavior: Find all .tex files
    $Files = Get-ChildItem -Path $SourceDir -Filter "*.tex" -Recurse
}

Write-Host "Starting LaTeX Compilation..." -ForegroundColor Cyan
Write-Host "----------------------------------"

$Count = 0
foreach ($File in $Files) {
    # Only compile files that are standalone documents (contain \begin{document})
    $Content = Get-Content $File.FullName -Raw
    if ($Content -match "\\begin\{document\}") {
        Write-Host "Processing: $($File.Name)" -ForegroundColor Yellow
        
        $AbsOutput = Join-Path (Get-Location) $OutputFolder
        
        # Change directory to the file's location so pdflatex finds local inputs (like preamble.tex)
        Push-Location $File.DirectoryName
        
        # Run pdflatex
        # -interaction=nonstopmode: Don't stop for errors
        # -output-directory: Put all results (PDF + logs) into the testing folder
        & pdflatex -interaction=nonstopmode -output-directory="$AbsOutput" $File.Name | Out-Null
        
        Pop-Location
        
        if (Test-Path "$OutputFolder\$($File.BaseName).pdf") {
            Write-Host "  [OK] Successfully compiled." -ForegroundColor Green
            $Count++
        }
        else {
            Write-Host "  [ERROR] Failed to compile. Check $($File.BaseName).log in $OutputFolder" -ForegroundColor Red
        }
    }
}

Write-Host "----------------------------------"
Write-Host "Cleaning up auxiliary files..." -ForegroundColor Gray

$AuxExtensions = "*.aux", "*.log", "*.out", "*.fls", "*.fdb_latexmk", "*.synctex.gz", "*.toc", "*.nav", "*.snm", "*.vrb"
foreach ($Ext in $AuxExtensions) {
    Get-ChildItem -Path $OutputFolder -Filter $Ext | Remove-Item -Force
}

Write-Host "Done! Compiled $Count documents into the '$OutputFolder' directory." -ForegroundColor Cyan
