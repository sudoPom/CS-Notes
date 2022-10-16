# Eigendecompositions

The `eigendecomposition` of a square matrix is the set of eigenvector, eigenvalue pairs which satisfy:
$$
A\vec{v_i} = \lambda_i\vec{v_i}, v_i \neq \vec{0}
$$
The direction of the eigenvectors are preserved but their lengths are scaled by the eigenvalues.

$A$ can be represented by:
$$
A = V\Lambda V^{-1}
$$
But this is only the case when $A$ is symmetrical $(A = A^T)$

Where $V = [v_1, v_2, v_3]$ and $\Lambda$ is a diagonal matrix consisting of the eigenvalues. 

With the eigendecomposition the inverse can be computed as follows:
$$
A^{-1} = (V\Lambda V^{-1})^{-1}\newline
= (V^{-1})^{-1}(\Lambda^{-1})(V)^{-1} \newline
= V\Lambda^{-1}V^{-1}
$$
Which is exactly the same as the original, except that $\Lambda$ is inverted.

`Editors note: The inverse of matrix multiplication is just the inverse of each matrix multiplied in reverse (right to left)`

