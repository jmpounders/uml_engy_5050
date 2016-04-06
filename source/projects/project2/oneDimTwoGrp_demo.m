
% MULTIGROUP iteration not right for numGroups > 2

clear;
% clc;
disp('One-Dim, Two-Group Diffusion Theory Solver')

xs = getXS();

solnMesh = struct('nX',  10, ...
                  'x',   linspace(0,100,11), ...
                  'mat', [1;1;1;1;1;1;1;1;1;1],  ...
                  'bc',  [2,1]);
for i = 1:2
    solnMesh = refineMesh(solnMesh);
end

[ flux_unref, k_unref ] = powerIterationSolve( solnMesh,xs,6 );



solnMesh = struct('nX',  12, ...
                  'x',   [-20,linspace(0,100,11),20], ...
                  'mat', [2;1;1;1;1;1;1;1;1;1;1;2],  ...
                  'bc',  [2,1]);
for i = 1:2
    solnMesh = refineMesh(solnMesh);
end

[ flux_ref, k_ref ] = powerIterationSolve( solnMesh,xs,6 );

rmpath(genpath('./OneDimSolver'));
rmpath(genpath('./Input'));
rmpath(genpath('./CommonTools'));
% the end



