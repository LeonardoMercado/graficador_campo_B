% Script para desarrollar las gráficas del manual de afectaciones a la
% medición de campo magnético.

% Author: Leonardo Fabio Mercado Benítez.
% Soporte: lfmercadobe@unal.edu.co.
% Github: https://github.com/LeonardoMercado

%% 1.	Afectación por desplazamiento en la medición en el eje x
clc;
clear;
close all;

variacion_a = [0 0.005 0.010 0.015 0.020 0.025 0.03 0.035];
I = 10.278; % A
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(I,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label_y = -0.000025;
distancia_label_x = 0;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0+variacion_a(i),0,0,I,43);
    Bm(i) = B_aux(3);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;    
end

figure(1)
plot(variacion_a,Bm_sobre_Bn,'k','LineWidth',1.5)
hold on;
scatter(variacion_a,Bm_sobre_Bn,'b','filled');
title('Campo B con variación en la medición en el eje x','FontSize',14);
xlabel('x [m]','FontSize',12);
xticks(variacion_a);
ylabel('Bm/Bn','FontSize',12);
yticks(Bm_sobre_Bn);
axis([variacion_a(1) variacion_a(end) Bm_sobre_Bn(1) Bm_sobre_Bn(end)])
grid on
grid minor;
ax = gca;
ax.GridAlpha = 1;
ax.MinorGridAlpha = 0.1;

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-3
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label_x,Bm_sobre_Bn(i)+distancia_label_y,strcat(diferencia,'%'),'FontWeight','bold');
end

%% 2.	Afectación por desplazamiento en la medición en el eje z
clc;
clear;
close all;

variacion_a = [0 0.005 0.010 0.015 0.020 0.025 0.03 0.035];
I = 10.278; % A
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(I,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label_y = -0.000025;
distancia_label_x = 0.001;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0,0,0+variacion_a(i),I,43);
    Bm(i) = B_aux(3);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;    
end

figure(1)
plot(variacion_a,Bm_sobre_Bn,'k','LineWidth',1.5)
hold on;
scatter(variacion_a,Bm_sobre_Bn,'b','filled');
title('Campo B con variación en la medición en el eje z','FontSize',14);
xlabel('z [m]','FontSize',12);
xticks(variacion_a);
ylabel('Bm/Bn','FontSize',12);
aux = sort(Bm_sobre_Bn);
yticks(aux);
axis([variacion_a(1) variacion_a(end) Bm_sobre_Bn(end) Bm_sobre_Bn(1)])
grid on
grid minor;
ax = gca;
ax.GridAlpha = 1;
ax.MinorGridAlpha = 0.1;

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-3
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label_x,Bm_sobre_Bn(i)+distancia_label_y,strcat(diferencia,'%'),'FontWeight','bold');
end

%% 3.	Afectación por desplazamiento en la medición en el eje x, y:
clc;
clear;
close all;

variacion_a = [0 0.005 0.010 0.015 0.020 0.025 0.03 0.035];
I = 10.278; % A
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(I,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label_y = 0;
distancia_label_x = 0.0009;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0+variacion_a(i),0+variacion_a(i),0,I,43);
    Bm(i) = B_aux(3);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;    
end

figure(1)
plot(variacion_a,Bm_sobre_Bn,'k','LineWidth',1.5)
hold on;
scatter(variacion_a,Bm_sobre_Bn,'b','filled');
title('Campo B con variación en la medición en el eje x, y','FontSize',14);
xlabel('x, y [m]','FontSize',12);
xticks(variacion_a);
ylabel('Bm/Bn','FontSize',12);
yticks(Bm_sobre_Bn);
axis([variacion_a(1) variacion_a(end) Bm_sobre_Bn(1) Bm_sobre_Bn(end)])
grid on
grid minor;
ax = gca;
ax.GridAlpha = 1;
ax.MinorGridAlpha = 0.1;

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-3
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label_x,Bm_sobre_Bn(i)+distancia_label_y,strcat(diferencia,'%'),'FontWeight','bold');
end

%% 4.	Afectación por desplazamiento en la medición en el eje x, y, z:
clc;
clear;
close all;

variacion_a = [0 0.005 0.010 0.015 0.020 0.025 0.03 0.035];
I = 10.278; % A
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(I,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label_y = 0;
distancia_label_x = 0;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0+variacion_a(i),0+variacion_a(i),0+variacion_a(i),I,43);
    Bm(i) = B_aux(3);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;    
end

figure(1)
plot(variacion_a,Bm_sobre_Bn,'k','LineWidth',1.5)
hold on;
scatter(variacion_a,Bm_sobre_Bn,'b','filled');
title('Campo B con variación en la medición en el eje x, y, z','FontSize',14);
xlabel('x, y, z [m]','FontSize',12);
xticks(variacion_a);
ylabel('Bm/Bn','FontSize',12);
aux = sort(Bm_sobre_Bn);
aux = [aux(1:end-3) aux(end)];
yticks(aux);
axis([variacion_a(1) variacion_a(end) Bm_sobre_Bn(end) Bm_sobre_Bn(1)])
grid on
grid minor;
ax = gca;
ax.GridAlpha = 1;
ax.MinorGridAlpha = 0.1;

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-3
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label_x,Bm_sobre_Bn(i)+distancia_label_y,strcat(diferencia,'%'),'FontWeight','bold');
end

%%	5.	Afectación por la incertidumbre en el montaje:
clc;
clear;
close all;

variacion_a = [0 0.001 0.002 0.003 0.005 0.010 0.015 0.02];
I = 10.278; % A
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(I,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label_y = 0;
distancia_label_x = 0.00015;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5+variacion_a(i),0.5+variacion_a(i),0,0,0,I,43);
    Bm(i) = B_aux(3);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;    
end

figure(1)
plot(variacion_a,Bm_sobre_Bn,'k','LineWidth',1.5)
hold on;
scatter(variacion_a,Bm_sobre_Bn,'b','filled');
title('Campo B con variación en las distancias a=b','FontSize',14);
xlabel('a, b [m]','FontSize',12);
xticks(variacion_a);
ylabel('Bm/Bn','FontSize',12);
aux = sort(Bm_sobre_Bn);
aux = [aux(1:end-3) aux(end)];
yticks(aux);
axis([variacion_a(1) variacion_a(end) Bm_sobre_Bn(end) Bm_sobre_Bn(1)])
grid on
grid minor;
ax = gca;
ax.GridAlpha = 1;
ax.MinorGridAlpha = 0.1;

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-3
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label_x,Bm_sobre_Bn(i)+distancia_label_y,strcat(diferencia,'%'),'FontWeight','bold');
end
%% 6.	Afectación por la incertidumbre en la corriente de alimentación del bucle:

%%	7.	Afectación por la incertidumbre en n:
clc;
clear;
close all;

variacion_a = [0 1 2 3];
I = 10.278; % A
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(I,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label_y = -0.001;
distancia_label_x = 0.01;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0,0,0,I,43+variacion_a(i));
    Bm(i) = B_aux(3);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;    
end

figure(1)
plot(variacion_a,Bm_sobre_Bn,'k','LineWidth',1.5)
hold on;
scatter(variacion_a,Bm_sobre_Bn,'b','filled');
title('Campo B con variación en las espiras del loop','FontSize',14);
xlabel('n [# espiras]','FontSize',12);
xticks(variacion_a);
ylabel('Bm/Bn','FontSize',12);
yticks(Bm_sobre_Bn);
axis([variacion_a(1) variacion_a(end) Bm_sobre_Bn(1) Bm_sobre_Bn(end)])
grid on
grid minor;
ax = gca;
ax.GridAlpha = 1;
ax.MinorGridAlpha = 0.5;

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-3
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label_x,Bm_sobre_Bn(i)+distancia_label_y,strcat(diferencia,'%'),'FontWeight','bold');
end


%% a.	afectación por un cable infinito sin corriente cancelada en las cercanías del bucle:

clc;
clear;
close all;

variacion_a = 1:0.5:12;
I = 1; % A
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(I,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));




for i=1:1:length(variacion_a)
    B_aux = ruidoB_caso3(variacion_a(i));
    Bm_sobre_Bn(i) = -1*B_aux;
end

figure(1)
plot(variacion_a,Bm_sobre_Bn,'k','LineWidth',1.5)
hold on;
scatter(variacion_a,Bm_sobre_Bn,'b','filled');
title('Campo B generado por amperio dado un cable infinito externo al bucle','FontSize',14);
xlabel('x [m]','FontSize',12);
xticks(variacion_a);
ylabel('campo B [ µT ] x Amperio','FontSize',12);
aux = sort(Bm_sobre_Bn);
%yticks(aux);
axis([variacion_a(1) variacion_a(end) Bm_sobre_Bn(end) Bm_sobre_Bn(1)])
grid on
grid minor;
ax = gca;
ax.GridAlpha = 0.5;
ax.MinorGridAlpha = 0.3;
texto_1 = "Dado que se desconoce la corriente de fuga que pasa por el cable se recomienda medir con un equipo que tenga escala en los nT";
texto_2 = "con el fin de conocer la interferencia real sobre el equipo en calibración.";
text(2.3,0.175,texto_1,'FontSize',12,'FontWeight','bold');
text(2.3,0.17,texto_2,'FontSize',12,'FontWeight','bold');

%%
% b.	Afectación por un par de cables infinitos con corriente cancelada en las cercanías del bucle:

clc;
clear;
close all;

variacion_a = 1:0.5:12;
I = 1; % A
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(I,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));



for i=1:1:length(variacion_a)
    B_aux = ruidoBcaso3b(variacion_a(i));
    Bm_sobre_Bn(i) = B_aux;
end

figure(1)
plot(variacion_a,Bm_sobre_Bn,'k','LineWidth',1.5)
hold on;
scatter(variacion_a,Bm_sobre_Bn,'b','filled');
title('Campo B generado por amperio dado un par de cables infinitos externo al bucle','FontSize',14);
xlabel('x [m]','FontSize',12);
xticks(variacion_a);
ylabel('campo B [nT] x Amperio','FontSize',12);
aux = sort(Bm_sobre_Bn);
%yticks(aux);
axis([variacion_a(1) variacion_a(end) Bm_sobre_Bn(end) Bm_sobre_Bn(1)])
grid on
grid minor;
ax = gca;
ax.GridAlpha = 1;
ax.MinorGridAlpha = 0.5;

%%
% c.	Afectación por un tablero de 1m x 2m energizado cercanos al bucle generador de campo:

clc;
clear;
close all;

variacion_a = 2:0.5:6;
I = 1; % A
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(I,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));




for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(1,2,0,0,variacion_a(i),I,1);
    Bm_sobre_Bn(i) = -1*(B_aux(3)*1e3);
end

figure(1)
plot(variacion_a,Bm_sobre_Bn,'k','LineWidth',1.5)
hold on;
scatter(variacion_a,Bm_sobre_Bn,'b','filled');
title('Campo B generado por un tablero externo de 1 m x 2 m','FontSize',14);
xlabel('x [m]','FontSize',12);
xticks(variacion_a);
ylabel('campo B [nT] x Amperio','FontSize',12);
aux = sort(Bm_sobre_Bn(1:end));
yticks(aux);
axis([variacion_a(1) variacion_a(end) Bm_sobre_Bn(end) Bm_sobre_Bn(1)])
grid on
grid minor;
ax = gca;
ax.GridAlpha = 1;
ax.MinorGridAlpha = 0.5;

%%
% d.	Afectación por un tablero de 30 cm x 40 cm energizado cercanos al bucle generador de campo:

clc;
clear;
close all;

variacion_a = 2:0.5:6;
I = 1; % A
Bm = zeros(1,length(variacion_a));
Bm_sobre_Bn = zeros(1,length(variacion_a));




for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.3,0.4,0,0,variacion_a(i),I,1);
    Bm_sobre_Bn(i) = -1*(B_aux(3)*1e3);
end

figure(1)
plot(variacion_a,Bm_sobre_Bn,'k','LineWidth',1.5)
hold on;
scatter(variacion_a,Bm_sobre_Bn,'b','filled');
title('Campo B generado por un tablero externo de 30 cm x 40 cm','FontSize',14);
xlabel('distancia [m]','FontSize',12);
xticks(variacion_a);
ylabel('campo B [nT] x Amperio','FontSize',12);
aux = sort(Bm_sobre_Bn(1:end-1));
yticks(aux);
axis([variacion_a(1) variacion_a(end) Bm_sobre_Bn(end) Bm_sobre_Bn(1)])
grid on
grid minor;
ax = gca;
ax.GridAlpha = 1;
ax.MinorGridAlpha = 0.5;

