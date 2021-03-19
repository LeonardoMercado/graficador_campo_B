% Script para el desarrollo de la solución visual de un campo B generado
% por cables conductores.
% Autor: Leonardo Fabio Mercado Benítez.
% Correo: lfmercadobe@unal.edu.co o lfmercadobe@gmail.com.
% Version: 0.1

clc;
clear;
close all;
%--------------------------------------------------------------------------
% Parameters definition:
datos_solicitados = {'a','b','n','límites a analizar[±]','Δ del análisis','Corriente','x:','y:','z:'};
dimensiones = [1 50];
por_defecto = {'0.5','0.5','43','0.03','0.01','5','0','0','0'};
input = inputdlg(datos_solicitados,'Ingrese los datos:',dimensiones,por_defecto);
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Processing:
if ~isempty(input)
    a = str2double(input{1});
    b = str2double(input{2});
    n = str2double(input{3});
    lim_calcular = str2double(input{4});    
    delta = str2double(input{5});
    I = str2double(input{6});
    x = str2double(input{7});
    y = str2double(input{8});
    z = str2double(input{9});
    graficador3D(a,b,x,y,z,I,n,lim_calcular,delta);    
else
    msgbox("Operación cancelada",'Cancelado','warn');
    clc;
    close all;
    clear;
end
%--------------------------------------------------------------------------