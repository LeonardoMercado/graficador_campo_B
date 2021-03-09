function B = BporNorma(I,n,a)
% Función creada para calcular el campo B en el eje Z según la norma IEEE
% 644-2019:

mu_0 = 4*pi*1e-7;  % Permeabilidad magnética del aire.
B = ((-1*mu_0*I*n*sqrt(2))/(pi*a))*1e6;

end

