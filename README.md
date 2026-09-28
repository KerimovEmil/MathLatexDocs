# Mathematical Notes and Proofs

A repository containing LaTeX documents and proofs covering various classic and modern mathematical topics, together with automated build tooling and a compiled compendium.

## Master Compendium
All documents are aggregated into a single book/compendium:
* **[master.pdf](pdfs/master.pdf)** — Combined document with full table of contents and cross-referencing.

---

## Documents Index

### Special Functions & Analysis
* **Bernoulli Numbers** ([`bernoulli_numbers_main.tex`](tex_files/bernoulli_numbers_main.tex))
  * Generating function and first values
  * Odd Bernoulli zeros proof
  * Bernoulli Polynomials, properties ($B_n(0), B_n(1)$), derivatives, integrals
  * Euler–Maclaurin formula and Stirling's asymptotic expansions
  * Connection to even values of Riemann Zeta $\zeta(2n)$
  * Cauchy product of series and Mertens' Theorem proof
* **Riemann Zeta Function** ([`zeta_function_main.tex`](tex_files/zeta_function_main.tex))
  * Even integer values $\zeta(2n)$ via cotangent expansions
  * Related Dirichlet functions ($\eta(s), \lambda(s)$)
  * Integral forms and Mellin representations
  * Jacobi Theta function modular transformation ($\Theta(1/x) = \sqrt{x}\Theta(x)$)
  * Proof of symmetric completed functional equation ($\xi(s) = \xi(1-s)$)
  * Proof of reflection functional equation ($\zeta(s) = 2^s \pi^{s-1} \sin(\frac{\pi s}{2}) \Gamma(1-s) \zeta(1-s)$)
  * Trivial zeros, critical strip, zero-free boundary, and statement of the Riemann Hypothesis
* **Gamma Function** ([`gamma_function_main.tex`](tex_files/gamma_function_main.tex))
  * Euler–Mascheroni constant
  * Weierstrass product formula
  * Digamma function & Euler integral identities
  * Beta function
  * Stirling's approximation & Bernoulli number asymptotic corrections
* **Sine Product Formula & Basel Problem** ([`Sine_Product_Formula_main.tex`](tex_files/Sine_Product_Formula_main.tex))
  * Euler's sine product formula
  * Basel problem proof ($\zeta(2) = \frac{\pi^2}{6}$)
  * Wallis product & Weierstrass Factorization Theorem
* **Darboux & Euler–Maclaurin Formula** ([`Darboux_formula_main.tex`](tex_files/Darboux_formula_main.tex))
* **Gaussian Integral** ([`Gaussian_integral_main.tex`](tex_files/Gaussian_integral_main.tex))
* **Fourier Series** ([`Fourier_Series_main.tex`](tex_files/Fourier_Series_main.tex))
* **Integral Representation of $\zeta(2)$** ([`Integral_zeta_2_main.tex`](tex_files/Integral_zeta_2_main.tex))
* **Useful Complex Identities** ([`useful_imaginary_identities_main.tex`](tex_files/useful_imaginary_identities_main.tex)) — Three proofs of Euler's formula $e^{ix} = \cos x + i \sin x$.
* **Basic Trigonometric Functions** ([`basic_trig_functions.tex`](tex_files/basic_trig_functions.tex))

### Dynamical Systems & Number Theory
* **Continued Fractions & Gauss–Kuzmin–Wirsing** ([`continued_fraction_main.tex`](tex_files/continued_fraction_main.tex), [`gauss_kuzmin_wirsing.tex`](tex_files/gauss_kuzmin_wirsing.tex))
  * Simple continued fractions and convergents
  * Gauss map $T(x) = \frac{1}{x} - \lfloor\frac{1}{x}\rfloor$
  * Derivation of Gauss measure $h(x) = \frac{1}{\ln 2 (1+x)}$ via telescoping transfer operator
  * Gauss–Kuzmin distribution & Khinchin's constant
  * Transfer operator spectrum and Gauss–Kuzmin–Wirsing constant $\theta \approx 0.303663$

### Sequences & Combinatorics
* **Fibonacci Numbers** ([`fibonacci_numbers_main.tex`](tex_files/fibonacci_numbers_main.tex))
  * Binet formulas, matrix powers, ratio limits, and sum identities
* **Tribonacci Numbers** ([`tribonacci_numbers_main.tex`](tex_files/tribonacci_numbers_main.tex))
  * Characteristic equation roots, closed form, and negative index identities
* **Game of Nim, Bouton's Theorem & Fibonacci Bit-Patterns** ([`nim_game_fibonacci.tex`](tex_files/nim_game_fibonacci.tex))
  * Bouton's nim-sum theorem ($P$-positions and $N$-positions)
  * Carryless addition identity: $(a+b) - (a \oplus b) = 2(a \ \& \ b)$
  * Counting $n \le 2^K$ with $n \oplus 2n \oplus 3n = 0$ via Zeckendorf/Fibonacci recurrence (Project Euler 301)
* **Pascal's Row Sum** ([`Pascal_s_row_sum_main.tex`](tex_files/Pascal_s_row_sum_main.tex))
* **Geometric & Arithmetic Series** ([`Geometric_Series_main.tex`](tex_files/Geometric_Series_main.tex), [`Sum_of_Arithmetic_sequence_main.tex`](tex_files/Sum_of_Arithmetic_sequence_main.tex))
* **Recursive Sum of Powers** ([`Recursive_Sum_of_Powers_main.tex`](tex_files/Recursive_Sum_of_Powers_main.tex))

### Algebra, Polynomials & Linear Algebra
* **Exact Polynomial Equation Solutions** ([`Exact_Polynomial_solutions_equations_main.tex`](tex_files/Exact_Polynomial_solutions_equations_main.tex))
  * Quadratic and Cardano/Tartaglia cubic solutions
  * Ferrari's method for depressed and general quartic equations via the resolvent cubic
  * Sylvester matrix $S(P, Q)$ and polynomial Resultant $\operatorname{Res}(P, Q)$
  * General discriminant $\Delta(P) = \frac{(-1)^{n(n-1)/2}}{a_n}\operatorname{Res}(P, P')$
* **Eigenvalues as Lagrange Multipliers** ([`proof_eigenvalue_are_lagrange_mult.tex`](tex_files/proof_eigenvalue_are_lagrange_mult.tex))
  * Rayleigh quotient optimization on the unit sphere
* **Symmetric Positive Definite Matrix Bounds** ([`Symmetric_Positive_Definite_matrix_bounds_main.tex`](tex_files/Symmetric_Positive_Definite_matrix_bounds_main.tex))
* **Ramanujan Identity** ([`Ramanujan_Identity_main.tex`](tex_files/Ramanujan_Identity_main.tex))
* **Quadratic Equation** ([`quadratic_equation_main.tex`](tex_files/quadratic_equation_main.tex))
* **Tangent Slope Without Derivatives** ([`slope_of_tangent_without_derivative_main.tex`](tex_files/slope_of_tangent_without_derivative_main.tex))
* **Logs Simple Method** ([`Logs_simple_method_1_main.tex`](tex_files/Logs_simple_method_1_main.tex))

---

## Build System & Automation

* **Local Compilation**:
  ```powershell
  # Compile all documents + master book into pdfs/
  .\compile_math_docs.ps1

  # Compile a single document
  .\compile_math_docs.ps1 -FileName zeta_function_main.tex
  ```
* **Label Prefixing Utility**:
  ```powershell
  # Automatically prefixes labels and references per topic to ensure collision-free master compilation
  .\fix_labels.ps1
  ```
* **Continuous Integration**:
  * GitHub Actions workflow located at [`.github/workflows/compile.yml`](.github/workflows/compile.yml) runs on push and PR to verify LaTeX compilation across all documents and uploads generated PDFs as build artifacts.