% Script para el desarrollo de la solución visual de un campo B generado
% por 4 filamentos alambre conductor.
% Autor: Leonardo Fabio Mercado Benítez.
% Correo: lfmercadobe@unal.edu.co o @gmail.com.

clc;
clear;
close all;
%--------------------------------------------------------------------------
% Parameters definition
datos_solicitados = {'a','b','n','Corriente','x:','y:','z:'};
dimensiones = [1 50];
por_defecto = {'0.5','0.5','1','1','0','0','0'};
input = inputdlg(datos_solicitados,'Ingrese los datos:',dimensiones,por_defecto);
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Processing:
if ~isempty(input)
    a = str2double(input{1});
    b = str2double(input{2});
    n = str2double(input{3});
    I = str2double(input{4});
    x = str2double(input{5});
    y = str2double(input{6});
    z = str2double(input{7});
    graficador3D(a,b,x,y,z);
    B = calcularBdelLoop(a,b,x,y,z,I,n);
    disp(B);
else
    msgbox("Operación cancelada",'Cancelado','warn');
    clc;
    close all;
    clear;
end
%--------------------------------------------------------------------------