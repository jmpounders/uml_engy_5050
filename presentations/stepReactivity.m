lambda = [0.0124, 0.0305, 0.111, 0.301, 1.14, 3.01];  % Delayed neutron decay constant, s^{-1}
betaEff = 0.0067;   % Effective delayed neutron fraction
beta = [0.033, 0.219, 0.196, 0.395, 0.115, 0.042]*betaEff;

rho = 0.001;     % Reactivity
Lambda = 1e-4;   % Generation time, seconds
P0 = 1;
C0 = (beta./(lambda*Lambda)*P0)';

t = linspace(0,10,1000);

% Point kinetics coefficient matrix
M = [(rho-betaEff)/Lambda, lambda;
     beta(1)/Lambda,-lambda(1),0,0,0,0,0;
     beta(2)/Lambda,0,-lambda(2),0,0,0,0;
     beta(3)/Lambda,0,0,-lambda(3),0,0,0;
     beta(4)/Lambda,0,0,0,-lambda(4),0,0;
     beta(5)/Lambda,0,0,0,0,-lambda(5),0;
     beta(6)/Lambda,0,0,0,0,0,-lambda(6)];
 
 [V,D] = eig(M);
 y = V\[P0;C0];
 
 P = 0;
 for i = 1:6
     P = P + y(i)*V(1,i)*exp(D(i,i)*t);
 end
 
 plot(t,P)
 disp(sort(diag(D)))
 ylabel('Relative Power')
 xlabel('Time [seconds]')
 
