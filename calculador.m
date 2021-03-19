% Script para graficar las variaciones del campo B en función del parametro
% a mover.


%% Distancia de a. con a entre ±1 mm, ±3 mm, ±5 mm ±10 mm, ±15 mm, ±20 mm.
clc;
clear;
close all;

variacion_a = [-0.020 -0.015 -0.010 -0.005 -0.003 -0.001 0 0.001 0.003 0.005 0.010 0.015 0.020];
%Bm = calcularBdelLoop(0.5,0.5,0,0,0,5,43);
%Bn = BporNorma(5,43,0.5);
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(5,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label = 0.00025;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5+variacion_a(i),0.5,0,0,0,5,43);
    Bm(i) = B_aux(3);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;
    text(variacion_a(i),Bm_sobre_Bn(i),num2str(diferencia_porcentual(i)));
end

scatter(variacion_a,Bm_sobre_Bn,'filled');

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-3
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label,Bm_sobre_Bn(i)+distancia_label,strcat(diferencia,'%'));
end

xlabel('variación de a [m]','FontSize',12);
ylabel('Bm/Bn','FontSize',12);
grid on;


%% Distancia de b. con b entre ±1 mm, ±3 mm, ±5 mm ±10 mm, ±15 mm, ±20 mm.
clc;
clear;
close all;

variacion_a = [-0.020 -0.015 -0.010 -0.005 -0.003 -0.001 0 0.001 0.003 0.005 0.010 0.015 0.020];
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(5,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label = 0.00025;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5+variacion_a(i),0,0,0,5,43);
    Bm(i) = B_aux(3);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;
    text(variacion_a(i),Bm_sobre_Bn(i),num2str(diferencia_porcentual(i)));
end

scatter(variacion_a,Bm_sobre_Bn,'filled');

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-3
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label,Bm_sobre_Bn(i)+distancia_label,strcat(diferencia,'%'));
end

xlabel('variación de b [m]','FontSize',12);
ylabel('Bm/Bn','FontSize',12);
grid on;

%% Distancia de a y b. con a=b entre ±1 mm, ±3 mm, ±5 mm ±10 mm, ±15 mm, ±20 mm.
clc;
clear;
close all;

variacion_a = [-0.020 -0.015 -0.010 -0.005 -0.003 -0.001 0 0.001 0.003 0.005 0.010 0.015 0.020];
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(5,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label = 0.00025;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5+variacion_a(i),0.5+variacion_a(i),0,0,0,5,43);
    Bm(i) = B_aux(3);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;
    text(variacion_a(i),Bm_sobre_Bn(i),num2str(diferencia_porcentual(i)));
end

scatter(variacion_a,Bm_sobre_Bn,'filled');

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-3
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label,Bm_sobre_Bn(i)+distancia_label,strcat(diferencia,'%'));
end

xlabel('variación de a y b [m]','FontSize',12);
ylabel('Bm/Bn','FontSize',12);
grid on;
%% Distancia de x. con x entre ±75 mm cada 5 mm.
clc;
clear;
close all;

variacion_a = [-0.075 -0.070 -0.065 -0.060 -0.055 -0.050 -0.045 -0.040 -0.035 -0.030 -0.025 -0.020 -0.015 -0.010 -0.005 0 0.005 0.010 0.015 0.020 0.025 0.030 0.035 0.040 0.045 0.050 0.055 0.060 0.065 0.070 0.075];
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(5,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label = 0.00005;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0+variacion_a(i),0,0,5,43);
    Bm(i) = B_aux(3);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;
    text(variacion_a(i),Bm_sobre_Bn(i),num2str(diferencia_porcentual(i)));
end

scatter(variacion_a,Bm_sobre_Bn,'filled');

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-3
        diferencia = "0%";
    else        
        diferencia = strcat(num2str(diferencia_porcentual(i),2),'%');
    end    
    text(variacion_a(i)+distancia_label,Bm_sobre_Bn(i)+distancia_label,diferencia);
end

xlabel('variación de x [m]','FontSize',12);
ylabel('Bm/Bn','FontSize',12);
grid on;

%% Distancia de y. con y entre ±75 mm cada 5 mm.
clc;
clear;
close all;

variacion_a = [-0.075 -0.070 -0.065 -0.060 -0.055 -0.050 -0.045 -0.040 -0.035 -0.030 -0.025 -0.020 -0.015 -0.010 -0.005 0 0.005 0.010 0.015 0.020 0.025 0.030 0.035 0.040 0.045 0.050 0.055 0.060 0.065 0.070 0.075];
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(5,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label = 0.0002;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0,0+variacion_a(i),0,5,43);
    Bm(i) = B_aux(3);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;
    text(variacion_a(i),Bm_sobre_Bn(i),num2str(diferencia_porcentual(i)));
end

scatter(variacion_a,Bm_sobre_Bn,'filled');

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-1
        diferencia = " ";
    else        
        diferencia = strcat(num2str(diferencia_porcentual(i),2),'%');
    end    
    text(variacion_a(i)+distancia_label,Bm_sobre_Bn(i)+distancia_label,diferencia);
end

xlabel('variación de y [m]','FontSize',12);
ylabel('Bm/Bn','FontSize',12);
grid on;
%% Distancia de z. con z entre ±75 mm cada 5 mm.
clc;
clear;
close all;

variacion_a = [-0.075 -0.070 -0.065 -0.060 -0.055 -0.050 -0.045 -0.040 -0.035 -0.030 -0.025 -0.020 -0.015 -0.010 -0.005 0 0.005 0.010 0.015 0.020 0.025 0.030 0.035 0.040 0.045 0.050 0.055 0.060 0.065 0.070 0.075];
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(5,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label = 0.00005;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0,0,0+variacion_a(i),5,43);
    Bm(i) = B_aux(3);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;
    text(variacion_a(i),Bm_sobre_Bn(i),num2str(diferencia_porcentual(i)));
end

scatter(variacion_a,Bm_sobre_Bn,'filled');

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-1
        diferencia = " ";
    else        
        diferencia = strcat(num2str(diferencia_porcentual(i),2),'%');
    end    
    text(variacion_a(i)+distancia_label,Bm_sobre_Bn(i)+distancia_label,diferencia);
end

xlabel('variación de z [m]','FontSize',12);
ylabel('Bm/Bn','FontSize',12);
grid on;
%% Distancia de x y y. con x=y entre ±75 mm cada 5 mm.
clc;
clear;
close all;

variacion_a = [-0.075 -0.070 -0.065 -0.060 -0.055 -0.050 -0.045 -0.040 -0.035 -0.030 -0.025 -0.020 -0.015 -0.010 -0.005 0 0.005 0.010 0.015 0.020 0.025 0.030 0.035 0.040 0.045 0.050 0.055 0.060 0.065 0.070 0.075];
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(5,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label = 0.000005;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0+variacion_a(i),0+variacion_a(i),0+variacion_a(i),5,43);
    Bm(i) = B_aux(3);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;
    text(variacion_a(i),Bm_sobre_Bn(i),num2str(diferencia_porcentual(i)));
end

scatter(variacion_a,Bm_sobre_Bn,'filled');

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-3
        diferencia = "0%";
    else        
        diferencia = strcat(num2str(diferencia_porcentual(i),2),'%');
    end    
    text(variacion_a(i)+distancia_label,Bm_sobre_Bn(i)+distancia_label,diferencia);
end

xlabel('variación de x, y , z [m]','FontSize',12);
ylabel('Bm/Bn','FontSize',12);
grid on;
%% Distancia de x, y , z. con x=y=z entre ±75 mm cada 5 mm.
clc;
clear;
close all;

variacion_a = [-0.075 -0.070 -0.065 -0.060 -0.055 -0.050 -0.045 -0.040 -0.035 -0.030 -0.025 -0.020 -0.015 -0.010 -0.005 0 0.005 0.010 0.015 0.020 0.025 0.030 0.035 0.040 0.045 0.050 0.055 0.060 0.065 0.070 0.075];
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(5,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label = 0.000005;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0+variacion_a(i),0+variacion_a(i),0+variacion_a(i),5,43);
    Bm(i) = B_aux(3);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;
    text(variacion_a(i),Bm_sobre_Bn(i),num2str(diferencia_porcentual(i)));
end

scatter(variacion_a,Bm_sobre_Bn,'filled');

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-3
        diferencia = "0%";
    else        
        diferencia = strcat(num2str(diferencia_porcentual(i),2),'%');
    end    
    text(variacion_a(i)+distancia_label,Bm_sobre_Bn(i)+distancia_label,diferencia);
end

xlabel('variación de x, y, z [m]','FontSize',12);
ylabel('Bm/Bn','FontSize',12);
grid on;

%% Corriente de alimentación I. con I ± 0.100 A. cada 0.010 A

clc;
clear;
close all;

variacion_a = [-0.100 -0.090 -0.080 -0.070 -0.060 -0.050 -0.040 -0.030 -0.020 -0.010 0 0.010 0.020 0.030 0.040 0.050 0.060 0.070 0.080 0.090 0.100];
%Bm = calcularBdelLoop(0.5,0.5,0,0,0,5,43);
%Bn = BporNorma(5,43,0.5);
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(5,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label = 0.0005;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0,0,0,5+variacion_a(i),43);
    Bm(i) = B_aux(3);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;
    text(variacion_a(i),Bm_sobre_Bn(i),num2str(diferencia_porcentual(i)));
end

scatter(variacion_a,Bm_sobre_Bn,'filled');

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-3
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label,Bm_sobre_Bn(i)+distancia_label,strcat(diferencia,'%'));
end

xlabel('variación de I [A]','FontSize',12);
ylabel('Bm/Bn','FontSize',12);
grid on;

%% Corriente de alimentación I. con I ± 0.500 A. cada 0.050 A

clc;
clear;
close all;

variacion_a = [-0.500 -0.450 -0.400 -0.350 -0.300 -0.250 -0.200 -0.150 -0.100 -0.050 0 0.050 0.100 0.150 0.200 0.250 0.300 0.350 0.400 0.450 0.500];
%Bm = calcularBdelLoop(0.5,0.5,0,0,0,5,43);
%Bn = BporNorma(5,43,0.5);
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(5,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label = 0.0025;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0,0,0,5+variacion_a(i),43);
    Bm(i) = B_aux(3);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;
    text(variacion_a(i),Bm_sobre_Bn(i),num2str(diferencia_porcentual(i)));
end

scatter(variacion_a,Bm_sobre_Bn,'filled');

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-3
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label,Bm_sobre_Bn(i)+distancia_label,strcat(diferencia,'%'));
end

xlabel('variación de I [A]','FontSize',12);
ylabel('Bm/Bn','FontSize',12);
grid on;

%% Número de espiras en el loop. Con n entre ±1 , ±2, ±3.


clc;
clear;
close all;

variacion_a = [-3 -2 -1 0 1 2 3];
%Bm = calcularBdelLoop(0.5,0.5,0,0,0,5,43);
%Bn = BporNorma(5,43,0.5);
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(5,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label = 0.0025;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0,0,0,5,43+variacion_a(i));
    Bm(i) = B_aux(3);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;
    text(variacion_a(i),Bm_sobre_Bn(i),num2str(diferencia_porcentual(i)));
end

scatter(variacion_a,Bm_sobre_Bn,'filled');

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-3
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label,Bm_sobre_Bn(i)+distancia_label,strcat(diferencia,'%'));
end

xlabel('variación de n [vueltas]','FontSize',12);
ylabel('Bm/Bn','FontSize',12);
grid on;

%% Estudio del ruido ambiente para el campo generado B - Caso 1a


clc;
clear;
close all;

I_1 = 18.2*2;
variacion_a = [-25 -20 -18.2 -15 -10 -5 0 5 10 15 18.2 20 25];
%Bm = calcularBdelLoop(0.5,0.5,0,0,0,5,43);
%Bn = BporNorma(5,43,0.5);
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(5,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label_x = 0.3;
distancia_label_y = 0.0001;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0,0,0,5,43);
    Bm(i) = B_aux(3)+ruidoB_caso1(0.5,variacion_a(i));
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;
    
end

scatter(variacion_a,Bm_sobre_Bn,'filled');

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-3
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label_x,Bm_sobre_Bn(i)+distancia_label_y,strcat(diferencia,'%'));
end

xlabel('Corriente cable externo [A]','FontSize',12);
xticks(variacion_a);
ylabel('Bm/Bn','FontSize',12);
grid on;
%% Estudio del ruido ambiente para el campo generado B - Caso 1b


clc;
clear;
close all;


variacion_a = [-30 -25 -20 -15 -10 -5 0 5 10 15 20 25 30];
%Bm = calcularBdelLoop(0.5,0.5,0,0,0,5,43);
%Bn = BporNorma(5,43,0.5);
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(5,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label_x = 0.3;
distancia_label_y = 0.00001;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0,0,0,5,43);
    B_aux(1) = ruidoB_caso1b(variacion_a(i));
    Bm(i) = -1*norm(B_aux);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;
    
end

scatter(variacion_a,Bm_sobre_Bn,'filled');

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-4
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label_x,Bm_sobre_Bn(i)+distancia_label_y,strcat(diferencia,'%'));
end

xlabel('Corriente cable externo [A]','FontSize',12);
xticks(variacion_a);
ylabel('Bm/Bn','FontSize',12);
grid on;
%% Estudio del ruido ambiente caso 2 para 3 mts


clc;
clear;
close all;


variacion_a = [-30 -20 -10 -5 0 5 10 20 30];
%Bm = calcularBdelLoop(0.5,0.5,0,0,0,5,43);
%Bn = BporNorma(5,43,0.5);
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(5,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label = 0.00000025;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0,0,0,5,43);
    B_aux_2 = calcularBdelLoop(2,1,0,0,3,variacion_a(i),1);
    Bm(i) = -1*norm([B_aux_2(3) B_aux(3)]);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;
    text(variacion_a(i),Bm_sobre_Bn(i),num2str(diferencia_porcentual(i)));
end

scatter(variacion_a,Bm_sobre_Bn,'filled');

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-9
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label,Bm_sobre_Bn(i)+distancia_label,strcat(diferencia,'%'));
end

xlabel('Corriente loop panel [A]','FontSize',12);
ylabel('Bm/Bn','FontSize',12);
grid on;

%% Estudio del ruido ambiente caso 2 para 4 mts


clc;
clear;
close all;


variacion_a = [-30 -20 -10 -5 0 5 10 20 30];
%Bm = calcularBdelLoop(0.5,0.5,0,0,0,5,43);
%Bn = BporNorma(5,43,0.5);
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(5,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label = 0.0000001;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0,0,0,5,43);
    B_aux_2 = calcularBdelLoop(2,1,0,0,4,variacion_a(i),1);
    Bm(i) = -1*norm([B_aux_2(3) B_aux(3)]);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;
    text(variacion_a(i),Bm_sobre_Bn(i),num2str(diferencia_porcentual(i)));
end

scatter(variacion_a,Bm_sobre_Bn,'filled');

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-9
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label,Bm_sobre_Bn(i)+distancia_label,strcat(diferencia,'%'));
end

xlabel('Corriente loop panel [A]','FontSize',12);
ylabel('Bm/Bn','FontSize',12);
grid on;
%% Estudio del ruido ambiente caso 3a 


clc;
clear;
close all;


variacion_a = 2:0.2:6;
%Bm = calcularBdelLoop(0.5,0.5,0,0,0,5,43);
%Bn = BporNorma(5,43,0.5);
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(5,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label = 0.0005;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0,0,0,5,43);    
    Bm(i) = B_aux(3)+ruidoB_caso3(variacion_a(i));
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;
    text(variacion_a(i),Bm_sobre_Bn(i),num2str(diferencia_porcentual(i)));
end

scatter(variacion_a,Bm_sobre_Bn,'filled');

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-3
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label,Bm_sobre_Bn(i)+distancia_label,strcat(diferencia,'%'));
end

xlabel('Distancia cable externo [m]','FontSize',12);
ylabel('Bm/Bn','FontSize',12);
xticks(variacion_a);
grid on;

%% Estudio del ruido ambiente caso 3b 


clc;
clear;
close all;


variacion_a = 5:5:80;
%Bm = calcularBdelLoop(0.5,0.5,0,0,0,5,43);
%Bn = BporNorma(5,43,0.5);
Bm = zeros(1,length(variacion_a));
Bn = ones(1,length(variacion_a))*BporNorma(5,43,0.5);
Bm_sobre_Bn = zeros(1,length(variacion_a));
diferencia_porcentual = zeros(1,length(variacion_a));
distancia_label = 0.00000000003;


for i=1:1:length(variacion_a)
    B_aux = calcularBdelLoop(0.5,0.5,0,0,0,5,43);
    B_aux(1) = ruidoBcaso3b(variacion_a(i));
    Bm(i) = -norm(B_aux);
    Bm_sobre_Bn(i) = Bm(i)/Bn(i);
    diferencia_porcentual(i) = (Bm_sobre_Bn(i) - 1)*100;
    text(variacion_a(i),Bm_sobre_Bn(i),num2str(diferencia_porcentual(i)));
end

scatter(variacion_a,Bm_sobre_Bn,'filled');

for i=1:1:length(variacion_a)  
    if abs(diferencia_porcentual(i))<1e-9
        diferencia = "0";
    else
        diferencia = num2str(diferencia_porcentual(i),2);        
    end    
    text(variacion_a(i)+distancia_label,Bm_sobre_Bn(i)+distancia_label,strcat(diferencia,'%'));
end

xlabel('Corriente en par de cables externos [A]','FontSize',12);
ylabel('Bm/Bn','FontSize',12);
xticks(variacion_a);
grid on;
