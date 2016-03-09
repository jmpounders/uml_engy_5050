function A = createSparseLinearSys(solnMesh,xs,g)
% Create sparse linear system corresponding to within-group diffusion equation
% This function creates all of the matrix "diagonals" and uses the MatLab
% sparse function to create a sparse coefficient matrix.

% Store the number of mesh cells in each direction
nx = solnMesh.nX - 1;

% Define the coefficient matrix
nNonZero = nx;
rowIndex = zeros(nNonZero,1);
colIndex = zeros(nNonZero,1);
matValue = zeros(nNonZero,1);

k = 0;
for j = 1:nx
   vol = solnMesh.x(j+1) - solnMesh.x(j);

   k = k + 1;
   rowIndex(k) = j;
   colIndex(k) = j;
   matValue(k) = (xs(solnMesh.mat(j)).sigA(g) + sum(xs(solnMesh.mat(j)).sigS(:,g)) - xs(solnMesh.mat(j)).sigS(g,g))*vol;
end

% Create the sparse matrix
A = createSparseLaplacian_1D(solnMesh,xs,g);
A = A + sparse(rowIndex, colIndex, matValue);
