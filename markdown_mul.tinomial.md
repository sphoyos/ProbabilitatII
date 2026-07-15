# Tema 3: Algunes distribucions multivariants

## La Distribució Multinomial: Definició

La distribució multinomial és la generalització natural de la distribució binomial quan cada assaig independent pot donar lloc a **més de dos resultats possibles**.

\begin{block}{Experiment Multinomial}
Considerem una seqüència de $n$ llançaments (assaigs) independents. En cada llançament pot ocórrer un i només un de entre $k$ successos possibles (categories) $C_1, C_2, \dots, C_k$. 

La probabilitat que ocorri el succés $C_i$ en qualsevol assaig és constant i la denotem per $p_i$, on:
$$\sum_{i=1}^{k} p_i = 1$$
\end{block}

Si definim el vector aleatori $\mathbf{X} = (X_1, X_2, \dots, X_k)^T$, on $X_i$ és el nombre de vegades que observem la categoria $C_i$ en els $n$ assaigs, diem que:
$$\mathbf{X} \sim \mathcal{M}(n; p_1, p_2, \dots, p_k)$$

---

## Funció de Probabilitat Conjunta

Atès que els assaigs són independents i que hi ha restriccions de suma ($\sum X_i = n$), la funció de probabilitat conjunta (PMF) del vector aleatori $\mathbf{X}$ és:

\vspace{0.3cm}

$$P(X_1 = x_1, X_2 = x_2, \dots, X_k = x_k) = \frac{n!}{x_1! x_2! \cdots x_k!} \prod_{i=1}^{k} p_i^{x_i}$$

\vspace{0.3cm}

\begin{alertblock}{Restriccions del Suport}
La funció és diferent de zero si i només si els valors $x_i$ són enters no negatius que compleixen estrictament:
$$\sum_{i=1}^{k} x_i = n$$
Això implica que el vector $\mathbf{X}$ té realment dimensió efectiva $k-1$, ja que coneguts $k-1$ valors, l'últim queda totalment determinat: $X_k = n - \sum_{i=1}^{k-1} X_i$.
\end{alertblock}

---

## Moments de la Multinomial: Esperança i Variància

Els moments marginals es dedueixen fàcilment considerant cada categoria de manera aïllada contra "la resta" (un esquema d'èxit/fracàs binomial):

* **Vector d'Esperances:**
  $$E[X_i] = n p_i \quad \forall i = 1, \dots, k$$

* **Variàncies (Elements de la diagonal de $\Sigma$):**
  $$Var(X_i) = n p_i (1 - p_i) \quad \forall i = 1, \dots, k$$

\vspace{0.2cm}

Aquestes fórmules són exactament les mateixes que les d'una distribució binomial $Bin(n, p_i)$.

---

## Estructura de Dependència: Covariància i Correlació

La característica més important de la distribució multinomial és que **les seves variables no són independents** (a causa de la restricció de suma constant $n$).

\begin{block}{Covariància creuada}
Per a qualsevol parella de categories diferents ($i \neq j$), la covariància és sempre **negativa**:
$$Cov(X_i, X_j) = -n p_i p_j$$
\end{block}

* **Interpretació estadística:** El signe negatiu és intuïtiu. Com que el nombre total d'assaigs $n$ és fix, si observem molts resultats d'una categoria $C_i$ (un valor de $X_i$ gran), forçosament ens queden menys assaigs disponibles per a la resta de categories.
* **Coeficient de Correlació de Pearson:**
  $$\rho_{ij} = \frac{-n p_i p_j}{\sqrt{n p_i (1-p_i)} \sqrt{n p_j (1-p_j)}} = -\sqrt{\frac{p_i p_j}{(1-p_i)(1-p_j)}} < 0$$

---

## Distribucions Marginals i Condicionades

La distribució multinomial gaudeix de propietats de tancament molt elegants:

### 1. Marginals Unidimensionals
Cada component individual segueix una distribució binomial:
$$X_i \sim Bin(n, p_i)$$

### 2. Agrupació de Categories (Marginals Multivariants)
Si agrupem diverses categories en una de sola (per exemple, unim les categories 1 i 2 en una nova categoria $C^* = C_1 \cup C_2$), el nou vector reduït segueix sent multinomial:
$$(X_1 + X_2, X_3, \dots, X_k)^T \sim \mathcal{M}(n; p_1 + p_2, p_3, \dots, p_k)$$

### 3. Distribucions Condicionades
Si fixem els valors d'un subconjunt de variables, la distribució de les restants torna a ser multinomial amb el nombre d'assaigs que queden disponibles:
$$(X_1, \dots, X_{r} \mid X_{r+1} = x_{r+1}, \dots, X_k = x_k) \sim \mathcal{M}\left( n - \sum_{j=r+1}^{k} x_j ; \frac{p_1}{p^*}, \dots, \frac{p_r}{p^*} \right)$$
on $p^* = \sum_{i=1}^{r} p_i$.