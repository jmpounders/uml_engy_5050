
% MULTIGROUP iteration not right for numGroups > 2

clear;
clc;
disp('One-Dim, One-Group SN Solver')

solnMesh = struct('nX',  10, ...
                  'x',   linspace(0,10,11), ...
                  'mat', [1;1;1;1;1;1;1;1;1;1],  ...
                  'bc',  [1,1]);

for i = 1:4
    solnMesh = refineMesh(solnMesh);
end

xs = getXS();

q = 1/2*ones(solnMesh.nX,1);
phi_SN = sweep(solnMesh,xs,q,6,2);

xCell = zeros(solnMesh.nX,1);
for i = 1:solnMesh.nX
    xCell(i) = (solnMesh.x(i)+solnMesh.x(i+1))/2.0;
end
plot(xCell,phi_SN)
xlabel('z')
ylabel('Scalar flux')

% The end



