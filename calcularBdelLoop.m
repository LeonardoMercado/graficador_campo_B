function [B] = calcularBdelLoop(a,b,x,y,z,I,n)
% función encargada de calcular el campo B dado un punto en el espacio.

%--------------------------------------------------------------------------
%---Parameters settings---
id_cable = 1;
mu_0 = 4*pi*1e-7;
B_aux = zeros(1,4);
%--------------------------------------------------------------------------
if z==0
    if x<=a && y<=b
        for i = 1:1:4                
            if id_cable==1 %Case for first wire
                d = a+x;
                y1 = b-y;
                y2 = b+y;
                theta_1 = atan(y1/d);
                theta_2 = atan(y2/d);
                B_aux(1) = (mu_0*I*(sin(theta_1)+sin(theta_2)))/(4*pi*d);
                id_cable = 2;
            elseif id_cable==2 %Case for second wire
                d = b-y;
                y1 = a-x;
                y2 = a+x;
                theta_1 = atan(y1/d);
                theta_2 = atan(y2/d);
                B_aux(2) = (mu_0*I*(sin(theta_1)+sin(theta_2)))/(4*pi*d);
                id_cable = 3;
            elseif id_cable==3 %Case for third wire
                d = a-x;
                y1 = b+y;
                y2 = b-y;
                theta_1 = atan(y1/d);
                theta_2 = atan(y2/d);
                B_aux(3) = (mu_0*I*(sin(theta_1)+sin(theta_2)))/(4*pi*d);
                id_cable = 4;
            elseif id_cable==4 %Case for fourth wire
                d = b+y;
                y1 = a+x;
                y2 = a-x;
                theta_1 = atan(y1/d);
                theta_2 = atan(y2/d);
                B_aux(4) = (mu_0*I*(sin(theta_1)+sin(theta_2)))/(4*pi*d);
            end
        end
    else
        msgbox("El punto a calcular supera los límites.",'Error','error');
    end
    B = [0,0,-1*n*sum(B_aux)];
else
    disp("no entramos");
end

end

