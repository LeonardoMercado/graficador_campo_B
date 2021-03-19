% Script para la sensibilidad del campo B con respecto a la corriente de
% alimentación.


%% Para el XXXXX

clc;
clear;
close all;

sensibilidad_rango_1 = [];
sensibilidad_rango_2 = [];

% Rango 1: 1 A - 3 A
I_rango_1 = 1:0.5:3;
for i=1:1:length(I_rango_1)
    sensibilidad_rango_1(i) = sensibilidad_2(I_rango_1(i),1);
end
% Rango 2: 3 A - 10 A
I_rango_2 = 3:0.5:10;
for i=1:1:length(I_rango_2)
    sensibilidad_rango_2(i) = sensibilidad_2(I_rango_2(i),2);
end


%----Ploting----
figure(1)
plot(I_rango_1,sensibilidad_rango_1,'b','LineWidth',1.5);
grid on;
hold on;
scatter(I_rango_1,sensibilidad_rango_1,25,'k','c','filled');
for i=1:1:length(sensibilidad_rango_1)
    text(I_rango_1(i),sensibilidad_rango_1(i),strcat(num2str(sensibilidad_rango_1(i),3),'%'),'FontSize',14);
end
title("Sensibilidad para Quipo K",'FontSize',14);
xlabel("Corriente [A]",'FontSize',12);
xticks(I_rango_1);
ylabel("sensibilidad [%]",'FontSize',12);
legend("Rango 1 [1 A - 3 A]")

figure(2)
plot(I_rango_2,sensibilidad_rango_2,'m','LineWidth',1.5);
grid on;
hold on;
scatter(I_rango_2,sensibilidad_rango_2,25,'k','c','filled');
for i=1:1:length(sensibilidad_rango_2)
    text(I_rango_2(i),sensibilidad_rango_2(i),strcat(num2str(sensibilidad_rango_2(i),3),'%'),'FontSize',14);
end
title("Sensibilidad para Equipo K",'FontSize',14);
xlabel("Corriente [A]",'FontSize',12);
xticks(I_rango_2);
ylabel("sensibilidad [%]",'FontSize',12);
legend("Rango 2 [3 A - 10 A]")

%----
figure(3)
plot(I_rango_1,sensibilidad_rango_1,'b','LineWidth',1.5);
grid on;
hold on;
plot(I_rango_2,sensibilidad_rango_2,'r','LineWidth',1.5);
title("Sensibilidad para Equipo K",'FontSize',14);
xlabel("Corriente [A]",'FontSize',12);
ylabel("sensibilidad [%]",'FontSize',12);
legend("Rango 1 [1 A - 3 A]","Rango 2 [3 A - 10 A]");



