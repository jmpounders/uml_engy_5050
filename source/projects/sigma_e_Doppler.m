function sigma_e = sigma_e_Doppler(E,a,Gamma_ni,Gamma_i,E_i,sigma0,wavelength,T,k,A)

    u = 2.0./Gamma_i*(E-E_i);
    Gamma_D = 2.0*sqrt(E_i*k*T/A);
    beta = 2.0*Gamma_D/Gamma_i;
    sigma_e = 4.0*pi*a^2 + ...
              sigma0(E).*(2.0*a./wavelength(E).*phi_Doppler(u,beta) ...
                          + Gamma_ni/Gamma_i*psi_Doppler(u,beta));

end

