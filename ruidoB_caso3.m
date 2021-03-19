function B = ruidoB_caso3(x)
% función encargada de calcular el campo B dado alambre infinito con una corriente de 60 A
% a unda distancia de entre 2 m a 3 m del loop de calibración.

%--------------------------------------------------------------------------
%---Parameters settings---
mu_0 = 4*pi*1e-7;  % Permeabilidad magnética del aire.
I = 1; % A
B = -((mu_0*I)/(2*pi*(x)))*1e6;
end

