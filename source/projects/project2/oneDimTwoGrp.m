clear;
clc;
disp('One-Dim, Multi-Group SN Solver')

solnMesh = struct('nX',  12, ...
                  'x',   [-5,linspace(0,25,11),30], ...
                  'mat', [2;1;1;1;1;1;1;1;1;1;1;2],  ...
                  'bc',  [1,1]);

for i = 1:4
    solnMesh = refineMesh(solnMesh);
end

xs = getXS();

[ flux_s6, k_s6 ] = powerIterationSolve( solnMesh,xs,6 );

rmpath(genpath('./OneDimSolver'));
rmpath(genpath('./Input'));
rmpath(genpath('./CommonTools'));
% the end



