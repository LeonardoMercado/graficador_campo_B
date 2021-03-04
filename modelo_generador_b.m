%% Modelo para el generador de campo B.

clear;
clc;
close all;

%--------------------------------------------------------------------------
% Inputs:
datos_solicitados = {'x:','y:','z:','a:','b:','N','Corriente:'};
dimensiones = [1 50];
por_defecto = {'0','0','0','0.5','0.5','4','1'};
input = inputdlg(datos_solicitados,'Ingrese los datos:',dimensiones,por_defecto);
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Check and processing:
if ~isempty(input)
    %--------------------------------------------------------------------------
    % Casting
    x = str2double(input{1});
    y = str2double(input{2});
    z = str2double(input{3});
    a = str2double(input{4});
    b = str2double(input{5});
    N = str2double(input{6});
    I = str2double(input{7});    
    %--------------------------------------------------------------------------
    % Parámetros:
    mu_0 = 4*pi*1e-7; % H/m
    C = zeros(1,4);
    C(4) = a + x;
    C(1) = -1*C(4);
    C(3) = a - x;
    C(2) = -1*C(3);
    d = zeros(1,4);
    d(2) = b + y;
    d(1) = d(2);
    d(4) = y - b;
    d(3) = d(4);        
    r = zeros(1,4);
    r(1) = sqrt((a + x)^2 + (b + y)^2 + z^2);
    r(2) = sqrt((a - x)^2 + (b + y)^2 + z^2);
    r(3) = sqrt((a - x)^2 + (b - y)^2 + z^2);
    r(4) = sqrt((a + x)^2 + (b - y)^2 + z^2);
    %--------------------------------------------------------------------------    
    % Processing
    sumatoria = 0;
    for i = 1:4
        termino_interno = ((((-1)^i)*d(i))/(r(i)*(r(i)+((-1)^i+1)*C(i))))-((C(i))/(r(i)*(r(i)+d(i))));        
        sumatoria = sumatoria + termino_interno;
    end
    Bz = ((mu_0)/(4*pi))*(I*N)*(sumatoria);
    disp(Bz);
else
    msgbox('Operación cancelada..');    
end
%--------------------------------------------------------------------------

%% Por norma en (0,0,0):
a = 0.5;
Bz_aux = (mu_0*I*2*sqrt(2))/(pi*a);
disp(Bz_aux)
