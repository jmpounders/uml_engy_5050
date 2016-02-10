function f = psi_Doppler(u, beta)

n = 10;
[x, w] = GaussHermite(n);
f = 0;
for i = 1:n
    f = f + 1.0./(1.0 + (x(i)*beta + u).^2)*w(i);
end

f = 1.0/sqrt(pi)*f;