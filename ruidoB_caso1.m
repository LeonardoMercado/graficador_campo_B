function B = ruidoB_caso1(a,I_1)
% función encargada de calcular el campo B dado alambre infinito con una corriente I_1.

%--------------------------------------------------------------------------
%---Parameters settings---
mu_0 = 4*pi*1e-7;  % Permeabilidad magnética del aire.

B = -((mu_0*I_1)/(6*pi*a))*1e6;
end




