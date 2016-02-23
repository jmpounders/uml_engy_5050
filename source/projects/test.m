A = 238                             % ratio of nuclear mass to neutron mass
a = (0.123*A^(1.0/3.0) + 0.08)*1e-12   % hard-sphere radius of nucleu, cm
I = 0                               % target spin, unitless
J = 0.5                             % compound nucleus spin, unitless
E_i = 80.749                        % location of resonance, eV
Gamma_i = 0.024865                  % total resonance width, eV
Gamma_ni = 0.001865                 % neutron partial width, eV
Gamma_gi = 0.0230                   % radiative capture partial width, eV
c = 2.99792458e10                   % speed of light in vacuum, cm/s
m = 939.57e6/c^2                   % mass of neutron, eV/c^2 = eV s^2/cm^2
hbar = 4.135667662e-15/(2.0*pi)  % reduced plank's constant, eV s
gJ = (2*J+1)/(2*(2*I+1))            % statistical spin factor, unitless

