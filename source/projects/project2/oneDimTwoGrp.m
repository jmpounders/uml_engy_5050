clear;
clc;
disp('One-Dim, Multi-Group SN Solver')

solnMesh = struct('nX',  10, ...
                  'x',   [linspace(0,25,11)], ...
                  'mat', [1;1;1;1;1;1;1;1;1;1],  ...
                  'bc',  [1,1]);

for i = 1:4
    solnMesh = refineMesh(solnMesh);
end

xs = getXS();

[ flux_s6, k_s6 ] = powerIterationSolve( solnMesh,xs,6 );





