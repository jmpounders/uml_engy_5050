clear;
clc;
disp('One-Dim, Multi-Group SN Solver')

solnMesh = struct('nX',  3, ...
                  'x',   [0.0, 0.5, 1.5, 2.0], ...
                  'mat', [2;1;2],  ...
                  'bc',  [2,1]);

for i = 1:4
    solnMesh = refineMesh(solnMesh);
end

xs = getXS();

[ flux_s6, k_s6 ] = powerIterationSolve( solnMesh,xs,6 );


% Bsq = (pi/max(solnMesh.x))^2;
% D = 1./(3*xs(1).sigTr);
% SigR = xs(1).sigTr - diag(xs(1).sigS)';
% nSigf = xs(1).nuBar*xs(1).sigF;
% sigDs = xs(1).sigS(2,1);
% kk = (nSigf(1)*(D(2)*Bsq+SigR(2)) + sigDs*nSigf(2))/((D(1)*Bsq + SigR(1))*(D(2)*Bsq + SigR(2)))

rmpath(genpath('./OneDimSolver'));
rmpath(genpath('./Input'));
rmpath(genpath('./CommonTools'));
% the end



