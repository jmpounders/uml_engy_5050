
% MULTIGROUP iteration not right for numGroups > 2

clear;
% clc;
disp('One-Dim, Two-Group Diffusion Theory Solver')

geom = struct('nReg', 4);
solnMesh = struct('nX',  10, ...
                  'x',   linspace(0,400,11), ...
                  'mat', [2;1;1;1;3;3;1;1;1;2],  ...
                  'bc',  [2,1]);

% Read input
options.numMats   = 1;
options.numGroups = 2;
options.maxPowerIters = 1000;
options.eigvTol = 1e-6;
options.kappa = 200*1.6021773e-13;  % J

xs = getXS();
for i = 1:solnMesh.nX
    disp(xs(solnMesh.mat(i)).sigA)
end

for i = 1:4
    solnMesh = refineMesh(solnMesh);
end
return
[ flux, k ] = powerIterationSolve( options,solnMesh,xs );
%[ flux, rho, temp, k, options, maxErr ] = oneDimMPSolver( XSTAB, solnMesh, coolant, fuel, options );


rmpath(genpath('./OneDimSolver'));
rmpath(genpath('./Input'));
rmpath(genpath('./CommonTools'));
% the end



