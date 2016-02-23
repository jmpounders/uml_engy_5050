function sigma_g = sigma_g(E,Gamma_gi,Gamma_i,E_i,sigma0)

    sigma_g = sigma0(E)*Gamma_gi*Gamma_i./(Gamma_i^2 + 4.0*(E-E_i).^2);

end