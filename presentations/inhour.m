lambda = [0.0124, 0.0305, 0.111, 0.301, 1.14, 3.01];  % Delayed neutron decay constant, s^{-1}
betaEff = 0.0067;   % Effective delayed neutron fraction
beta = [0.033, 0.219, 0.196, 0.395, 0.115, 0.042]*betaEff;

lambda = linspace(6,1,6);
rho = 0.001;     % Reactivity
Lambda = 4e-3;   % Generation time, seconds

omega = linspace(-7,1,10000);
RHS = Lambda*omega;
for i = 1:6
    RHS = RHS + beta(i)*omega./(omega+lambda(i));
end

plot(omega,RHS,'Color','blue')
for i = 1:6
    line(-[lambda(i) lambda(i)],[-0.1,0.1],'Color','red')
end
ylim([-0.1 0.1])
grid on
set(gca,'XTickLabel','')