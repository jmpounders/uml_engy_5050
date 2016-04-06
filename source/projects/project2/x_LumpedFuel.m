clear;
% clc;
disp('One-Dim, Multi-Group SN Solver')

pitch = 0.5;
width = 0.35;
ci = (pitch-width)/2.0;
solnMesh = struct('nX',  3, ...
                  'x',   [0.0, ci, ci+width, pitch], ...
                  'mat', [2;1;2],  ...
                  'bc',  [2,1]);

for i = 1:4
    solnMesh = refineMesh(solnMesh);
end

xs = getXS();

[ flux, k ] = powerIterationSolve( solnMesh,xs,2 );
k

xCell = zeros(solnMesh.nX,1);
for i = 1:solnMesh.nX
    xCell(i) = (solnMesh.x(i)+solnMesh.x(i+1))/2.0;
end
subplot(1,2,1)
plot(xCell,flux(:,1))
title('Fast flux')
xlabel('x')
dy = ylim;
line([ci ci],dy,'Color','black')
line([pitch-ci pitch-ci],dy,'Color','black')
ylim(dy)
subplot(1,2,2)
plot(xCell,flux(:,2))
title('Thermal flux')
xlabel('x')
dy = ylim;
line([ci ci],dy,'Color','black')
line([pitch-ci pitch-ci],dy,'Color','black')
ylim(dy)


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



