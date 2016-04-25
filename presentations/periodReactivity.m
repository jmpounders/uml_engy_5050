lambda = [0.0124, 0.0305, 0.111, 0.301, 1.14, 3.01];  % Delayed neutron decay constant, s^{-1}
betaEff = 0.0067;   % Effective delayed neutron fraction
beta = [0.033, 0.219, 0.196, 0.395, 0.115, 0.042]*betaEff;

rho = 0.001;     % Reactivity
Lambda = 1e-4;   % Generation time, seconds
P0 = 1;
C0 = (beta./(lambda*Lambda)*P0)';

t = linspace(0,1,1000);

% Point kinetics coefficient matrix
M = [(rho-betaEff)/Lambda, lambda;
     beta(1)/Lambda,-lambda(1),0,0,0,0,0;
     beta(2)/Lambda,0,-lambda(2),0,0,0,0;
     beta(3)/Lambda,0,0,-lambda(3),0,0,0;
     beta(4)/Lambda,0,0,0,-lambda(4),0,0;
     beta(5)/Lambda,0,0,0,0,-lambda(5),0;
     beta(6)/Lambda,0,0,0,0,0,-lambda(6)];
 
  
 rhos = linspace(-0.001,0.006,100);
 omega = 0*rhos;
 for i = 1:length(rhos)
     M(1,1) = (rhos(i)-betaEff)/Lambda;
     [V,D] = eig(M);
     D = sort(diag(D));
     omega(i) = D(7);
 end

plot(rhos/betaEff,omega)
grid on
ylabel('\omega')
xlabel('\rho / \beta')