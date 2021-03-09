function [B] = calcularBdelLoop(a,b,x,y,z,I,n)
% función encargada de calcular el campo B dado un punto en el espacio.

%--------------------------------------------------------------------------
%---Parameters settings---
id_cable = 1;
mu_0 = 4*pi*1e-7;  % Permeabilidad magnética del aire.
B = zeros(1,3);
%--------------------------------------------------------------------------
if x<=a && y<=b && z<=a
    for i = 1:1:4
        if id_cable==1 %Case for first wire
            d = a+x;
            d2 = sqrt(d^2+z^2);
            beta = atan(z/d);
            y1 = b-y;
            y2 = b+y;
            theta_1 = atan(y1/d2);
            theta_2 = atan(y2/d2);
            B_aux = (mu_0*I*(sin(theta_1)+sin(theta_2)))/(4*pi*d2);
            B(1) = B_aux*sin(beta);
            B(3) = -B_aux*cos(beta);
            id_cable = 2;            
        elseif id_cable==2 %Case for second wire
            d = b-y;
            d2 = sqrt(d^2+z^2);
            beta = atan(z/d);
            y1 = a-x;
            y2 = a+x;
            theta_1 = atan(y1/d2);
            theta_2 = atan(y2/d2);
            B_aux = (mu_0*I*(sin(theta_1)+sin(theta_2)))/(4*pi*d2);
            B(2) = B(2) + (-B_aux*sin(beta));
            B(3) = B(3) + (-B_aux*cos(beta));            
            id_cable = 3;
        elseif id_cable==3 %Case for third wire
            d = a-x;
            d2 = sqrt(d^2+z^2);
            beta = atan(z/d);
            y1 = b+y;
            y2 = b-y;
            theta_1 = atan(y1/d2);
            theta_2 = atan(y2/d2);
            B_aux = (mu_0*I*(sin(theta_1)+sin(theta_2)))/(4*pi*d2);
            B(1) = B(1) + (-B_aux*sin(beta));
            B(3) = B(3) + (-B_aux*cos(beta));                        
            id_cable = 4;
        elseif id_cable==4 %Case for fourth wire
            d = b+y;
            d2 = sqrt(d^2+z^2);
            beta = atan(z/d);
            y1 = a+x;
            y2 = a-x;
            theta_1 = atan(y1/d2);
            theta_2 = atan(y2/d2);
            B_aux = (mu_0*I*(sin(theta_1)+sin(theta_2)))/(4*pi*d2);
            B(2) = B(2) + (B_aux*sin(beta));
            B(3) = B(3) + (-B_aux*cos(beta));            
        end
    end
    %B = B*n; %Retorna el valor de campo hallado en T
    B = B*n*1e6; %Retorna el valor de campo hallado en µT
else
    msgbox("El punto a calcular supera los límites.",'Error','error');
end
    
end

