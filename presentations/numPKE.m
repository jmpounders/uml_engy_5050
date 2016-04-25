lambda = [0.0124, 0.0305, 0.111, 0.301, 1.14, 3.01];  % Delayed neutron decay constant, s^{-1}
betaEff = 0.0067;   % Effective delayed neutron fraction
Lambda = 1e-4;   % Generation time, seconds

P0 = 1;
C0 = (beta./(lambda*Lambda)*P0)';

t0 = 0.0
tmax = 60;
[t,P] = ode15s(@pke, [t0 tmax], [P0;C0]);

plot(t,P(:,1))
xlabel('Relative Power')
ylabel('Time [seconds]')