function phi = sweep(solnMesh, xs, q, N, g)

% Get quadrature
[mu,w] = lgwt(N,-1,1);

% Initialize angular flux
psi = zeros(solnMesh.nX-1,N);

% Sweep each direction
for m = 1:N
    if (mu(m) > 0),
        psiInc = 0.0;
        for i = 1:solnMesh.nX-1
            h = solnMesh.x(i+1) - solnMesh.x(i);
            sigma = xs(solnMesh.mat(i)).sigTr(g);
            psi(i,m) = (q(i)*h + 2.0*mu(m)*psiInc)/(sigma*h+2.0*mu(m));
            psiInc = 2.0*psi(i,m) - psiInc;
        end
    else
        psiInc = 0.0;
        for i = solnMesh.nX-1:-1:1
            h = solnMesh.x(i+1) - solnMesh.x(i);
            sigma = xs(solnMesh.mat(i)).sigTr(g);
            psi(i,m) = (q(i)*h - 2.0*mu(m)*psiInc)/(sigma*h-2.0*mu(m));
            psiInc = 2.0*psi(i,m) - psiInc;
        end
    end
end

% Calculate scalar flux
phi = zeros(solnMesh.nX-1,1);
for i = 1:solnMesh.nX-1
    for n = 1:N
        phi(i) = phi(i) + w(n)*psi(i,n);
    end
end


