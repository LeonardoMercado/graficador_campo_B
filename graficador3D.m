function graficador3D(a,b,x,y,z,I,n,lim_calcular,delta)

% Función encargada de graficar las cobles conductores y la nube de puntos.

%--------------------------------------------------------------------------
%---Parameters settings---
%taget point size:
f = waitbar(0,'Graficando, por favor espere...');
circle_size = 25;
point_cloud_limits = [-lim_calcular lim_calcular];
discretization_cloud = delta;

%---------------
if a>b
    lim = a*1.3;
elseif a<b
    lim = b*1.3;
else
    lim = a*1.3;
end
%---------------
waitbar(0.2,f,'Definiendo los cables, por favor espere...');
%Lines definitions:
line_1_start = [a,-b,0];
line_1_end = [a,b,0];
line_1 = [line_1_start;line_1_end];
line_2_end = [-a,b,0];
line_2 = [line_1_end;line_2_end];
line_3_end = [-a,-b,0];
line_3 = [line_2_end;line_3_end];
line_4_end = [a,-b,0];
line_4 = [line_3_end;line_4_end];

%surrounding space:
data_point = point_cloud_limits(1):discretization_cloud:point_cloud_limits(2);
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%---Plot---
waitbar(0.5,f,'Realizando la gráfica en 3D...');
frames = java.awt.Frame.getFrames();
frames(end).setAlwaysOnTop(1);
%3D:
figure(1)
plot3(line_1(:,1),line_1(:,2),line_1(:,3),'r','LineWidth',1.5);
grid minor;
xlabel('x');
ylabel('y');
zlabel('z');
hold on;
plot3(line_2(:,1),line_2(:,2),line_2(:,3),'r','LineWidth',1.5);
plot3(line_3(:,1),line_3(:,2),line_3(:,3),'r','LineWidth',1.5);
plot3(line_4(:,1),line_4(:,2),line_4(:,3),'r','LineWidth',1.5);
scatter3(x,y,z,circle_size,'b','filled');
waitbar(0.7,f,'Estamos trabajando, por favor espere...');
for k = data_point    
    for j = data_point
        for i = data_point                       
            B = calcularBdelLoop(a,b,i,j,k,I,n);
            quiver3(i,j,k,B(1),B(2),B(3),1e-3,'k');
        end
    end
end
axis([-lim lim -lim lim -lim lim]);

%2D:
waitbar(0.8,f,'Realizando la gráfica en 2D...')
figure(2)
plot(line_1(:,1),line_1(:,2),'r','LineWidth',1.5);
xlabel('x');
ylabel('y');
hold on;
plot(line_2(:,1),line_2(:,2),'r','LineWidth',1.5);
plot(line_3(:,1),line_3(:,2),'r','LineWidth',1.5);
plot(line_4(:,1),line_4(:,2),'r','LineWidth',1.5);
scatter(x,y,circle_size,'b','filled');
for j=data_point
    for i=data_point
        scatter(i,j,15,'k','.');
    end
end
grid minor;
axis([-lim lim -lim lim]);
waitbar(0.9,f,'Ya casi terminamos...')
%--------------------------------------------------------------------------
close(f);
end

