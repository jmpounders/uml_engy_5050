function [ flux, k ] = powerIterationSolve( options,solnMesh,xs )
% Solve the diffusion eigenvalue problem using a power iteration

flux = ones(solnMesh.nX,options.numGroups);
k = 1;
F = 1;
for kiter = 1:options.maxPowerIters
    Fold = F/k;
    [ fissionSource, F ] = calculateFissionSource( solnMesh, xs, flux );
    
    kold = k;
    k = F/Fold;
    if (abs(k - kold) < options.eigvTol)
        break
    end
    solnMesh.src = fissionSource/k;
    flux = MultigroupFixedSourceSolve(options,solnMesh,xs);
end
if (kiter == options.maxPowerIters)
    warning('Eigenvalue not converged.')
end

fluxNorm = 0;
for i = 1:solnMesh.nX-1
    fluxNorm = fluxNorm + flux(i)*(solnMesh.x(i+1)-solnMesh.x(i));
end
flux = flux/fluxNorm;

end

