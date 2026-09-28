# Script to add unique prefixes to LaTeX labels and references
# Handles both explicit \label commands and custom environment labels

$filePrefixMap = @{
    'continued_fraction_main.tex'                       = 'cf'
    'gauss_kuzmin_wirsing.tex'                          = 'gkw'
    'bernoulli_numbers_main.tex'                        = 'bn'
    'gamma_function_main.tex'                           = 'gf'
    'zeta_function_main.tex'                            = 'zf'
    'fibonacci_numbers_main.tex'                        = 'fib'
    'tribonacci_numbers_main.tex'                       = 'trib'
    'nim_game_fibonacci.tex'                            = 'nim'
    'Sine_Product_Formula_main.tex'                     = 'spf'
    'Ramanujan_Identity_main.tex'                       = 'ram'
    'Darboux_formula_main.tex'                          = 'dar'
    'Exact_Polynomial_solutions_equations_main.tex'     = 'eps'
    'Fourier_Series_main.tex'                           = 'fs'
    'Gaussian_integral_main.tex'                        = 'gi'
    'Geometric_Series_main.tex'                         = 'gs'
    'Integral_zeta_2_main.tex'                          = 'iz2'
    'Logs_simple_method_1_main.tex'                     = 'log'
    'Pascal_s_row_sum_main.tex'                         = 'pas'
    'Recursive_Sum_of_Powers_main.tex'                  = 'rsp'
    'Sum_of_Arithmetic_sequence_main.tex'               = 'sas'
    'Symmetric_Positive_Definite_matrix_bounds_main.tex'= 'spd'
    'quadratic_equation_main.tex'                       = 'qe'
    'slope_of_tangent_without_derivative_main.tex'      = 'std'
    'useful_imaginary_identities_main.tex'              = 'uii'
    'proof_eigenvalue_are_lagrange_mult.tex'            = 'pev'
    'basic_trig_functions.tex'                          = 'btf'
}

$texFilesDir = Join-Path (Get-Location) "tex_files"

foreach ($file in $filePrefixMap.Keys) {
    $filePath = Join-Path $texFilesDir $file
    if (Test-Path $filePath) {
        $prefix = $filePrefixMap[$file]
        $prefixWithColon = $prefix + ':'
        Write-Host "Processing $file with prefix $prefixWithColon"
        
        $content = Get-Content $filePath -Raw -Encoding UTF8
        
        # 1. Replace custom environment parameters (mytheorem, mydefinition, mylemma)
        # Pattern: \begin{mytheorem}{Title}{label_name}
        $content = $content -replace '(\\begin\{mytheorem\}\{[^}]+\}\{)(?!' + $prefix + ':)([^}]+)\}', "`$1$prefixWithColon`$2}"
        $content = $content -replace '(\\begin\{mydefinition\}\{[^}]+\}\{)(?!' + $prefix + ':)([^}]+)\}', "`$1$prefixWithColon`$2}"
        $content = $content -replace '(\\begin\{mylemma\}\{[^}]+\}\{)(?!' + $prefix + ':)([^}]+)\}', "`$1$prefixWithColon`$2}"
        
        # 2. Replace explicit \label{...} commands
        $labelPattern = '\\label\{(?!' + $prefix + ':)(?!thm:' + $prefix + ':)(?!def:' + $prefix + ':)(?!lem:' + $prefix + ':)(?!cor:' + $prefix + ':)(?!eq:' + $prefix + ':)([^}]+)\}'
        $labelReplacement = "\label{$prefixWithColon`$1}"  
        $content = $content -replace $labelPattern, $labelReplacement
        
        # 3. Replace \ref{...} references
        $content = $content -replace '\\ref\{thm:(?!' + $prefix + ':)([^}]+)\}', "\ref{thm:$prefixWithColon`$1}"
        $content = $content -replace '\\ref\{def:(?!' + $prefix + ':)([^}]+)\}', "\ref{def:$prefixWithColon`$1}"
        $content = $content -replace '\\ref\{lem:(?!' + $prefix + ':)([^}]+)\}', "\ref{lem:$prefixWithColon`$1}"
        $content = $content -replace '\\ref\{cor:(?!' + $prefix + ':)([^}]+)\}', "\ref{cor:$prefixWithColon`$1}"
        $content = $content -replace '\\ref\{eq:(?!' + $prefix + ':)([^}]+)\}', "\ref{eq:$prefixWithColon`$1}"
        
        $refPattern = '\\ref\{(?!thm:)(?!def:)(?!lem:)(?!cor:)(?!eq:)(?!' + $prefix + ':)([^}]+)\}'
        $refReplacement = "\ref{$prefixWithColon`$1}"
        $content = $content -replace $refPattern, $refReplacement
        
        [System.IO.File]::WriteAllText($filePath, $content, [System.Text.Encoding]::UTF8)
        Write-Host "  Updated all labels and references in $file"
    } else {
        Write-Host "  Warning - $file not found"
    }
}

Write-Host "`nCompleted! All labels and references have been prefixed."
