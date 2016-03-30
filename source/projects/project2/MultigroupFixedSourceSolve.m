function flux = MultigroupFixedSourceSolve(solnMesh,xs,N,fluxInit)
% Coordinate solution of multigroup fixed-source diffusion system
% This only accounts for downscattering from the previous one group!!!!

nx = solnMesh.nX;
numGroups = length(xs(1).sigTr);

% Calculate the fixed external source
fissionSource = zeros(nx,1);
for j = 1:nx
   fissionSource(j) = solnMesh.src(j)/2;
end

flux = fluxInit;
for si = 1:1000
    fluxOld = flux;

    for g = 1:numGroups
       % calculate the down-scatter source
       scatterSource = zeros(nx,1);
       for gp = 1:numGroups
         for j = 1:nx
            scatterSource(j) = scatterSource(j) + xs(solnMesh.mat(j)).sigS(g,gp)*flux(j,gp)/2;
         end
       end

       if (g == 1),
           bg = scatterSource+fissionSource;
       else
           bg = scatterSource;
       end

       % solve sparse linear system
       flux(:,g) = sweep_refl(solnMesh, xs, bg, N, g);
    end
    if max(abs(flux-fluxOld)./flux) < 1e-4, break; end
end