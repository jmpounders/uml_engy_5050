function [ fissionSource, fissionSourceTotal ] = calculateFissionSource( solnMesh, xs, flux )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    fissionSourceTotal = 0;
    fissionSource = zeros(solnMesh.nX-1,1);
    for i = 1:solnMesh.nX-1
        fissionSource(i) = xs(solnMesh.mat(i)).nuBar*sum(xs(solnMesh.mat(i)).sigF(:)'.*flux(i,:));
        fissionSourceTotal = fissionSourceTotal + fissionSource(i)*(solnMesh.x(i+1)-solnMesh.x(i));
    end
    
end

