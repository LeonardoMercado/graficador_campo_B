function porcentaje = sensibilidad_2(I,rango)
% Función para calcular la sensibilidad del campo B dado un equipo determinado.
incertidumbre = 0.3;
if rango==1
    aux = 2*(0.06/100);
elseif rango==2
    aux = 7*(0.05/100);
end
B_I = calcularBdelLoop(0.5,0.5,0,0,0,I,43);
delta_I = (I*(incertidumbre/100))+(aux);
B_delta_I = calcularBdelLoop(0.5,0.5,0,0,0,delta_I,43);
porcentaje = (B_delta_I(3)/B_I(3))*100;
end

