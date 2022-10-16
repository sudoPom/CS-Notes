# Singular Value Decomposition

`Singular value decomposition (SVD)` allows the decomposition of a non square matrix into three special matrices.
$$
X = U\Sigma V^T
$$

* $U$ is an orthonormal $m\times m$ matrix
* $\Sigma$ is an $m\times n$ diagonal matrix of non negative, increasing singular values

* $V$ is an orthonormal $n\times n$ matrix

Because both U and V are orthonormal their transpose is equal to their inverse.

$U^T = U^-1$

$V^T = V^-1$

Recall that $A = U\Lambda V^T$ where $A$ is a symmetric square matrix.

Using this:
$$
XX^T = (U\Sigma V^T)(U\Sigma V^T)^T \newline
= U\Sigma V^T (V)(\Sigma)^T(U)^T \newline
= U\Sigma V^TV\Sigma^TU^T
$$
Recalling that the product between an orthonormal matrix and it's transpose is the identity matrix $V^TV = I$.
$$
=U\Sigma\Sigma^TU^T
$$
This works as $XX^T$ will always give a square, symmetrical matrix.

The matrix $U$ is equal to the eigenvectors of $XX^T$.

The matrix $\Sigma$ is  equal to a matrix of size $m\times n$. The leading diagonal is that of the eigenvalues square rooted, padded with 0s to ensure it is the right size.
