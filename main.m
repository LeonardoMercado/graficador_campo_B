% Script para el desarrollo de la solución visual de un campo B generado
% por 4 filamentos alambre conductor.


clc;
clear;
close all;


%--------------------------------------------------------------------------
% Parameters definition
datos_solicitados = {'Corriente','x:','y:','z:'};
dimensiones = [1 50];
por_defecto = {'1','0.5','0.5','0'};
input = inputdlg(datos_solicitados,'Ingrese los datos:',dimensiones,por_defecto);
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Processing:
if ~isempty(input)
    I = str2double(input{1});
    x = str2double(input{2});
    y = str2double(input{3});
    z = str2double(input{4});
    graficador3D(x,y,z);
else
    msgbox("Operación cancelada");
    clc;
    close all;
    clear;
end
%--------------------------------------------------------------------------