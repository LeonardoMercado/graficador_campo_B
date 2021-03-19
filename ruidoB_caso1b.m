function B = ruidoB_caso1b(I)
% función encargada de calcular el campo B dado alambre infinito con una corriente I_1.

%--------------------------------------------------------------------------
%---Parameters settings---
mu_0 = 4*pi*1e-7;  % Permeabilidad magnética del aire.
a = 0.5;
B = -((mu_0*I)/(4*pi*a))*1e6;
end

