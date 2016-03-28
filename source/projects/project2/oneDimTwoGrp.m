
% MULTIGROUP iteration not right for numGroups > 2

clear;
% clc;
disp('One-Dim, Two-Group Diffusion Theory Solver')

solnMesh = struct('nX',  10, ...
                  'x',   linspace(0,400,11), ...
                  'mat', [1;1;1;1;1;1;1;1;1;1],  ...
                  'bc',  [2,1]);

for i = 1:4
    solnMesh = refineMesh(solnMesh);
end

xs = getXS();

[ flux, k ] = powerIterationSolve( solnMesh,xs,2 );
k


Bsq = (pi/max(solnMesh.x))^2;
D = 1./(3*xs(1).sigTr);
SigR = xs(1).sigTr - diag(xs(1).sigS)';
nSigf = xs(1).nuBar*xs(1).sigF;
sigDs = xs(1).sigS(2,1);
kk = (nSigf(1)*(D(2)*Bsq+SigR(2)) + sigDs*nSigf(2))/((D(1)*Bsq + SigR(1))*(D(2)*Bsq + SigR(2)))

rmpath(genpath('./OneDimSolver'));
rmpath(genpath('./Input'));
rmpath(genpath('./CommonTools'));
% the end



