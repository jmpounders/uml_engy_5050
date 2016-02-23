function sigma_e = sigma_e(E,a,Gamma_ni,Gamma_i,E_i,sigma0,sigmap,wavelength)

phi0 = a./wavelength(E);
sigma_e = sigmap(E).^2 + ...
          sigma0(E).*(2/Gamma_i*(E-E_i).*sin(2.0*phi0) + ...
                     Gamma_ni/Gamma_i - 2.0*sin(phi0).^2)*Gamma_i^2./(Gamma_i^2 + 4.0*(E-E_i).^2);

end

