function B = ruidoBcaso3b(x)
% función encargada de calcular el campo B dado dos alambres infinitos con una corriente de 60 A
% a una distancia de 3 m del loop de calibración y 1 cm entre ellos.

%--------------------------------------------------------------------------
%---Parameters settings---
mu_0 = 4*pi*1e-7;  % Permeabilidad magnética del aire.
beta = atan(0.005/(0.5 + x));
I = 1; % A 
B = (((mu_0*I)/(pi*(0.5 + x)))*sin(beta))*1e9;

end

