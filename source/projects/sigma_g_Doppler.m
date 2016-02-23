function sigma_g = sigma_g_Doppler(E,Gamma_gi,Gamma_i,E_i,sigma0,T,k,A)

    u = 2.0./Gamma_i*(E-E_i);
    Gamma_D = 2.0*sqrt(E_i*k*T/A);
    beta = 2.0*Gamma_D/Gamma_i;
    sigma_g = sigma0(E).*Gamma_gi/Gamma_i.*psi_Doppler(u,beta);

end