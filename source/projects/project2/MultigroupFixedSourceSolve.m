function flux = MultigroupFixedSourceSolve(options,solnMesh,xs)
% Coordinate solution of multigroup fixed-source diffusion system
% This only accounts for downscattering from the previous one group!!!!

nx = solnMesh.nX - 1;

flux = ones(nx,options.numGroups);

% Calculate the fixed external source
sourceVec = zeros(nx,1);
for j = 1:nx
   sourceVec(j) = solnMesh.src(j)*(solnMesh.x(j+1) - solnMesh.x(j));
end

for g = 1:options.numGroups
   % calculate the down-scatter source
   if (options.numGroups > 1 && g > 1),
     dsSrc = zeros(nx,1);
     for j = 1:nx
        sigDS = xs(solnMesh.mat(j)).sigS(g,g-1);
        dsSrc(j) = sigDS*fluxg(j)*(solnMesh.x(j+1)-solnMesh.x(j));
     end
   end
   
   % create matrix diagonals and source vector
   Ag = createSparseLinearSys(solnMesh,xs,g);

   if (g == 1),
       bg = sourceVec;
   else
       bg = dsSrc;
   end
   
   % solve sparse linear system
   fluxg = Ag\bg;
   flux(:,g) = fluxg;
end

