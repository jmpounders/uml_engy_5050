% 1D Transport...

clear;
% clc;
disp('One-Dim, Two-Group Diffusion Theory Solver')

solnMesh = struct('nX',  10, ...
                  'x',   linspace(0,5,11), ...
                  'mat', [2;1;1;1;3;3;1;1;1;2],  ...
                  'bc',  [2,1]);
solnMesh = struct('nX',  10, ...
  'x',   linspace(0,10,11), ...
  'mat', [1;1;1;1;1;1;1;1;1;1],  ...
  'bc',  [2,1]);

% Read input
options.numMats   = 1;
options.numGroups = 2;
options.maxPowerIters = 1000;
options.eigvTol = 1e-6;

xs = getXS();

for i = 1:1
    solnMesh = refineMesh(solnMesh);
end
q = 1.0/2.0;

nq = 6;
[mu,w] = lgwt(nq,-1,1);

psi = zeros(solnMesh.nX-1,nq);
for m = 1:nq
    if (mu(m) > 0),
        psiInc = 0.0;
        for i = 1:solnMesh.nX-1
            h = solnMesh.x(i+1) - solnMesh.x(i);
            sigma = xs(solnMesh.mat(i)).sigTr(2);
            psi(i,m) = (q*h + 2.0*mu(m)*psiInc)/(sigma*h+2.0*mu(m));
            psiInc = 2.0*psi(i,m) - psiInc;
        end
    else
        psiInc = 0.0;
        for i = solnMesh.nX-1:-1:1
            h = solnMesh.x(i+1) - solnMesh.x(i);
            sigma = xs(solnMesh.mat(i)).sigTr(2);
            psi(i,m) = (q*h - 2.0*mu(m)*psiInc)/(sigma*h-2.0*mu(m));
            psiInc = 2.0*psi(i,m) - psiInc;
        end
    end
end

phi = zeros(solnMesh.nX-1,1);
for i = 1:solnMesh.nX-1
    for n = 1:nq
        phi(i) = phi(i) + w(n)*psi(i,n);
    end
end

plot(phi)

