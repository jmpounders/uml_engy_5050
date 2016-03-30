function phi = sweep_refl(solnMesh, xs, q, N, g)

% Get quadrature
[mu,w] = lgwt(N,-1,1);

% Initialize angular flux
psi = zeros(solnMesh.nX,N);

psiL = zeros(N,1);
psiR = zeros(N,1);

% Sweep each direction
psiOld = psi+1.0;
for bcIter = 1:50
    for m = 1:N
        if (mu(m) > 0),
            psiInc = psiL(m);
            for i = 1:solnMesh.nX
                h = solnMesh.x(i+1) - solnMesh.x(i);
                sigma = xs(solnMesh.mat(i)).sigTr(g);
                psi(i,m) = (q(i)*h + 2.0*mu(m)*psiInc)/(sigma*h+2.0*mu(m));
                psiInc = 2.0*psi(i,m) - psiInc;
            end
            psiR(N-m+1) = psiInc;
        else
            psiInc = psiR(m);
            for i = solnMesh.nX:-1:1
                h = solnMesh.x(i+1) - solnMesh.x(i);
                sigma = xs(solnMesh.mat(i)).sigTr(g);
                psi(i,m) = (q(i)*h - 2.0*mu(m)*psiInc)/(sigma*h-2.0*mu(m));
                psiInc = 2.0*psi(i,m) - psiInc;
            end
            psiL(N-m+1) = psiInc;
        end
    end
    if (norm(psi-psiOld)/norm(psiOld)<1e-8), break; end;
    psiOld = psi;
end

% Calculate scalar flux
phi = zeros(solnMesh.nX,1);
for i = 1:solnMesh.nX
    for n = 1:N
        phi(i) = phi(i) + w(n)*psi(i,n);
    end
end


