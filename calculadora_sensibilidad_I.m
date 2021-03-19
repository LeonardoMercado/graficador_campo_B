% Script para la sensibilidad del campo B con respecto a la corriente de
% alimentación.


%% Para el Fluke 189
clc;
clear;
close all;

sensibilidad_rango_1 = [];
sensibilidad_rango_2 = [];
sensibilidad_rango_3 = [];
sensibilidad_rango_4 = [];
sensibilidad_rango_5 = [];
sensibilidad_rango_6 = [];
% Rango 1: 500 µA; Resolución: 0.01 µA; Exactitud: 0.75% + 20.
I_rango_1 = [50*1e-6 100*1e-6 150*1e-6 200*1e-6 250*1e-6 300*1e-6 350*1e-6 400*1e-6 450*1e-6 500*1e-6];
for i=1:1:length(I_rango_1)
    sensibilidad_rango_1(i) = sensibilidad(I_rango_1(i),0.01*1e-6,0.75,20);
end
% Rango 2: 5000 µA; Resolución: 0.1 µA.; Exactitud: 0.75% + 5.
I_rango_2 = [500*1e-6 1000*1e-6 2000*1e-6 3000*1e-6 4000*1e-6 5000*1e-6];
for i=1:1:length(I_rango_2)
    sensibilidad_rango_2(i) = sensibilidad(I_rango_2(i),0.1*1e-6,0.75,5);
end
% Rango 3: 50 mA; Resolución: 0.001 mA.; Exactitud: 0.75% + 20.
I_rango_3 = [5*1e-3 10*1e-3 20*1e-3 30*1e-3 40*1e-3 50*1e-3];
for i=1:1:length(I_rango_3)
    sensibilidad_rango_3(i) = sensibilidad(I_rango_3(i),0.001*1e-3,0.75,20);
end
% Rango 4: 400 mA; Resolución: 0.01 mA.; Exactitud: 0.75% + 5.
I_rango_4 = [50*1e-3 100*1e-3 150*1e-3 200*1e-3 250*1e-3 300*1e-3 350*1e-3 400*1e-3];
for i=1:1:length(I_rango_4)
    sensibilidad_rango_4(i) = sensibilidad(I_rango_4(i),0.01*1e-3,0.75,5);
end
% Rango 5: 5 A; Resolución: 0.0001 A.; Exactitud: 1.5% + 20.
I_rango_5 = [400*1e-3 600*1e-3 800*1e-3 1 2 3 5];
for i=1:1:length(I_rango_5)
    sensibilidad_rango_5(i) = sensibilidad(I_rango_5(i),0.0001,1.5,20);
end
% Rango 6: 10 A; Resolución: 0.001 A.; Exactitud: 1.5% + 5.
I_rango_6 = [5 6 7 8 9 10];
%-----
for i=1:1:length(I_rango_6)
    sensibilidad_rango_6(i) = sensibilidad(I_rango_6(i),0.001,1.5,5);
end
%-----

%----Ploting----
figure(1)
plot(I_rango_1,sensibilidad_rango_1,'c','LineWidth',1.5);
grid on;
hold on;
scatter(I_rango_1,sensibilidad_rango_1,25,'k','c','filled');
for i=1:1:length(sensibilidad_rango_1)
    text(I_rango_1(i),sensibilidad_rango_1(i),strcat(num2str(sensibilidad_rango_1(i),3),'%'),'FontSize',14);
end
title("Sensibilidad para Fluke 189",'FontSize',14);
xlabel("Corriente [A]",'FontSize',12);
xticks(I_rango_1);
ylabel("sensibilidad [%]",'FontSize',12);
legend("Rango 1 [50 µA - 500 µA]")

figure(2)
plot(I_rango_2,sensibilidad_rango_2,'m','LineWidth',1.5);
grid on;
hold on;
scatter(I_rango_2,sensibilidad_rango_2,25,'k','c','filled');
for i=1:1:length(sensibilidad_rango_2)
    text(I_rango_2(i),sensibilidad_rango_2(i),strcat(num2str(sensibilidad_rango_2(i),3),'%'),'FontSize',14);
end
title("Sensibilidad para Fluke 189",'FontSize',14);
xlabel("Corriente [A]",'FontSize',12);
xticks(I_rango_2);
ylabel("sensibilidad [%]",'FontSize',12);
legend("Rango 2 [500 µA - 5000 µA]")

figure(3)
plot(I_rango_3,sensibilidad_rango_3,'g','LineWidth',1.5);
grid on;
hold on;
scatter(I_rango_3,sensibilidad_rango_3,25,'k','c','filled');
for i=1:1:length(sensibilidad_rango_3)
    text(I_rango_3(i),sensibilidad_rango_3(i),strcat(num2str(sensibilidad_rango_3(i),3),'%'),'FontSize',14);
end
title("Sensibilidad para Fluke 189",'FontSize',14);
xlabel("Corriente [A]",'FontSize',12);
xticks(I_rango_3);
ylabel("sensibilidad [%]",'FontSize',12);
legend("Rango 3 [5000 µA - 50 mA]")

figure(4)
plot(I_rango_4,sensibilidad_rango_4,'b','LineWidth',1.5);
grid on;
hold on;
scatter(I_rango_4,sensibilidad_rango_4,25,'k','c','filled');
for i=1:1:length(sensibilidad_rango_4)
    text(I_rango_4(i),sensibilidad_rango_4(i),strcat(num2str(sensibilidad_rango_4(i),3),'%'),'FontSize',14);
end
title("Sensibilidad para Fluke 189",'FontSize',14);
xlabel("Corriente [A]",'FontSize',12);
xticks(I_rango_4);
ylabel("sensibilidad [%]",'FontSize',12);
legend("Rango 4 [50 mA - 400 mA]");

figure(5)
plot(I_rango_5,sensibilidad_rango_5,'r','LineWidth',1.5);
grid on;
hold on;
scatter(I_rango_5,sensibilidad_rango_5,25,'k','c','filled');
for i=1:1:length(sensibilidad_rango_5)
    text(I_rango_5(i),sensibilidad_rango_5(i),strcat(num2str(sensibilidad_rango_5(i),3),'%'),'FontSize',14);
end
title("Sensibilidad para Fluke 189",'FontSize',14);
xlabel("Corriente [A]",'FontSize',12);
xticks(I_rango_5);
ylabel("sensibilidad [%]",'FontSize',12);
legend("Rango 5 [400 mA - 5 A]");

figure(6)
plot(I_rango_6,sensibilidad_rango_6,'k','LineWidth',1.5);
grid on;
hold on;
scatter(I_rango_6,sensibilidad_rango_6,25,'r','c','filled');
for i=1:1:length(sensibilidad_rango_6)
    text(I_rango_6(i),sensibilidad_rango_6(i),strcat(num2str(sensibilidad_rango_6(i),3),'%'),'FontSize',14);
end
title("Sensibilidad para Fluke 189",'FontSize',14);
xlabel("Corriente [A]",'FontSize',12);
xticks(I_rango_6);
ylabel("sensibilidad [%]",'FontSize',12);
legend("Rango 6 [5 A - 10 A]");

%-----
figure(7)
plot(I_rango_1,sensibilidad_rango_1,'c','LineWidth',1.5);
grid on;
hold on;
plot(I_rango_2,sensibilidad_rango_2,'m','LineWidth',1.5);
title("Sensibilidad para Fluke 189",'FontSize',14);
xlabel("Corriente [A]",'FontSize',12);
ylabel("sensibilidad [%]",'FontSize',12);
legend("Rango 1 [50 µA - 500 µA]","Rango 2 [500 µA - 5000 µA]");


figure(8)
plot(I_rango_3,sensibilidad_rango_3,'g','LineWidth',1.5);
hold on;
grid on;
plot(I_rango_4,sensibilidad_rango_4,'b','LineWidth',1.5);
title("Sensibilidad para Fluke 189",'FontSize',14);
xlabel("Corriente [A]",'FontSize',12);
ylabel("sensibilidad [%]",'FontSize',12);
legend("Rango 3 [5000 µA - 50 mA]","Rango 4 [50 mA - 400 mA]");



figure(9)
plot(I_rango_5,sensibilidad_rango_5,'r','LineWidth',1.5);
grid on;
hold on;
plot(I_rango_6,sensibilidad_rango_6,'k','LineWidth',1.5);
title("Sensibilidad para Fluke 189",'FontSize',14);
xlabel("Corriente [A]",'FontSize',12);
ylabel("sensibilidad [%]",'FontSize',12);
legend("Rango 5 [400 mA - 5 A]","Rango 6 [5 A - 10 A]");



figure(10)
plot(I_rango_1,sensibilidad_rango_1,'c','LineWidth',1.5);
grid on;
hold on;
plot(I_rango_2,sensibilidad_rango_2,'m','LineWidth',1.5);
plot(I_rango_3,sensibilidad_rango_3,'g','LineWidth',1.5);
plot(I_rango_4,sensibilidad_rango_4,'b','LineWidth',1.5);
plot(I_rango_5,sensibilidad_rango_5,'r','LineWidth',1.5);
plot(I_rango_6,sensibilidad_rango_6,'k','LineWidth',1.5);
title("Sensibilidad para Fluke 189",'FontSize',14);
xlabel("Corriente [A]",'FontSize',12);
ylabel("sensibilidad [%]",'FontSize',12);
legend("Rango 1 [50 µA - 500 µA]","Rango 2 [500 µA - 5000 µA]","Rango 3 [5000 µA - 50 mA]","Rango 4 [50 mA - 400 mA]","Rango 5 [400 mA - 5 A]","Rango 6 [5 A - 10 A]");










%%
