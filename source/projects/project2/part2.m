    solnMesh = struct('nX',  12, ...
                     'x',   [linspace(0,35,13)], ...
                      'mat', [2;1;1;1;1;1;1;1;1;1;1;2],  ...
                      'bc',  [1,1]);
    for i = 1:4
      solnMesh = refineMesh(solnMesh);
    end
    xs = getXS();
    [ flux_s6, k_s6 ] = powerIterationSolve( solnMesh,xs,6 );

    xCell = zeros(solnMesh.nX,1);
    for i = 1:solnMesh.nX
        xCell(i) = (solnMesh.x(i)+solnMesh.x(i+1))/2.0;
    end
    plot(xCell,flux_s6)
    xlabel('z')
    ylabel('Scalar flux')

