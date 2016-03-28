function [ flux, k ] = powerIterationSolve( solnMesh,xs,N )
% Solve the diffusion eigenvalue problem using a power iteration

maxPowerIterations = 1000;

flux = ones(solnMesh.nX-1,length(xs(1).sigTr));
k = 1;
F = 1;
for kiter = 1:maxPowerIterations
    Fold = F;
    [ fissionSource, F ] = calculateFissionSource( solnMesh, xs, flux );
    
    kold = k;
    k = k*F/Fold;
    if (abs(k - kold) < 1.0e-6)
        break
    end
    solnMesh.src = fissionSource/k;
    flux = MultigroupFixedSourceSolve(solnMesh,xs,N,flux);
end
if (kiter == maxPowerIterations)
    warning('Eigenvalue not converged.')
end

fluxNorm = 0;
for i = 1:solnMesh.nX-1
    fluxNorm = fluxNorm + flux(i)*(solnMesh.x(i+1)-solnMesh.x(i));
end
flux = flux/fluxNorm;

end

