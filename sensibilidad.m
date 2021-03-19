function porcentaje = sensibilidad(I,resolucion,incertidumbre,numero_cuentas)
% Función para calcular la sensibilidad del campo B dado un equipo determinado.
B_I = calcularBdelLoop(0.5,0.5,0,0,0,I,43);
delta_I = (I*(incertidumbre/100))+(resolucion*numero_cuentas);
B_delta_I = calcularBdelLoop(0.5,0.5,0,0,0,delta_I,43);
porcentaje = (B_delta_I(3)/B_I(3))*100;
end

