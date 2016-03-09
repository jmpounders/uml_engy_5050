function A = createSparseLaplacian_1D(solnMesh,xs,g)
% Create sparse form of the discrete Laplacian operator with an interior, 
% non-homogeneous coefficient, i.e., L = d/dx a(x) du/dx.

% Store the number of mesh cells in each direction
nx = solnMesh.nX - 1;

% Allocate space for the FDM coupling coefficients
dfdm = zeros(1,nx+1);

% Define the boundary coupling coefficients based on boundary conditions
dcbdy = zeros(4,1);
for b = 1:2
   if (solnMesh.bc(b) == 0) 
      % vacuum boundary
      dcbdy(b) = 0.25; 
   elseif (solnMesh.bc(b) == 1)
      % reflective boundary
      dcbdy(b) = 0.0;
   elseif (solnMesh.bc(b) == 2)
       % zero flux
       dcbdy(b) = 1e10;
   end;
end

% Define the coupling coefficients for all surfaces
% Cardinal directions are with respect to the center (i,j) mesh cell
% Letting K = c, n, e, s, w
%   dcK = diffusion coefficient for mesh cell K
%   dxK = mesh spacing in x direction for mesh cell K
for j = 1:nx
   dcc = 1/(3*xs(solnMesh.mat(j)).sigTr(g));
   hc = solnMesh.x(j+1) - solnMesh.x(j);

   % Define the x-direction coupling coefficients
   if (j < nx), 
      % define the coupling coefficient for the east surface
      dce = 1/(3*xs(solnMesh.mat(j+1)).sigTr(g));
      he = solnMesh.x(j+2) - solnMesh.x(j+1);
      dfdm(j+1) = 2*(dce*dcc/(he*hc)) / (dce/he + dcc/hc);
   end
   if (j == 1),
      % define the coupling coefficient for the west boundary
      dfdm(1) = 2*(dcbdy(1)*dcc/hc) / (dcbdy(1) + dcc/hc);
   end
   if (j == nx),
      % define the coupling coefficient for the east boundary
      dfdm(nx+1) = 2*(dcbdy(2)*dcc/hc) / (dcbdy(2) + dcc/hc);
   end
end

% Define the coefficient matrix
nNonZero = nx + 2*(nx-1);
rowIndex = zeros(nNonZero,1);
colIndex = zeros(nNonZero,1);
matValue = zeros(nNonZero,1);

k = 0;
for j = 1:nx
   
   k = k + 1;
   rowIndex(k) = j;
   colIndex(k) = j;
   matValue(k) = dfdm(j) + dfdm(j+1);

   % coupling to the west
   if (j > 1)
      k = k + 1;
      rowIndex(k) = j;
      colIndex(k) = j-1;
      matValue(k) = -dfdm(j); 
   end;

   % coupling to the east
   if (j < nx)
      k = k + 1;
      rowIndex(k) = j;
      colIndex(k) = j+1;
      matValue(k) = -dfdm(j+1);
   end;

end

% Create the sparse matrix
A = sparse(rowIndex, colIndex, matValue);
