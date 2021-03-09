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
waitbar(0.15,f,'Definiendo los cables, por favor espere...');
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
waitbar(0.4,f,'Realizando la gráfica en 2D...');
frames = java.awt.Frame.getFrames();
frames(end).setAlwaysOnTop(1);

% 2D XY:
waitbar(0.6,f,'Trabajando...')
figure(1)
plot3(line_1(:,1),line_1(:,2),line_1(:,3),'r','LineWidth',1.5);
grid minor;
xlabel('x [m]','FontSize',12);
ylabel('y [m]','FontSize',12);
zlabel('z [m]','FontSize',12);
title('Campo \bf B esperado','FontSize',14);
hold on;
box on;
plot3(line_2(:,1),line_2(:,2),line_2(:,3),'r','LineWidth',1.5);
plot3(line_3(:,1),line_3(:,2),line_3(:,3),'r','LineWidth',1.5);
plot3(line_4(:,1),line_4(:,2),line_4(:,3),'r','LineWidth',1.5);
scatter3(x,y,z,circle_size,'b','filled');
waitbar(0.65,f,'Estamos trabajando, por favor espere...');
for k = data_point    
    for j = data_point
        for i = data_point                       
            B = calcularBdelLoop(a,b,i,j,k,I,n);
            if k==data_point(1)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'k','LineWidth',1);
            elseif k==data_point(2)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'y','LineWidth',1);
            elseif k==data_point(3)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'m','LineWidth',1);
            elseif k==data_point(4)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'c','LineWidth',1);
            elseif k==data_point(5)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'r','LineWidth',1);
            elseif k==data_point(6)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'g','LineWidth',1);
            elseif k==data_point(7)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'b','LineWidth',1);
            else
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'k','LineWidth',1);
            end            
        end
    end
end
axis([-lim lim -lim lim -lim lim]);
view(0,90);


%3D isometrico:
waitbar(0.75,f,'Realizando la gráfica en 3D...')
figure(2)
plot3(line_1(:,1),line_1(:,2),line_1(:,3),'r','LineWidth',1.5);
grid minor;
xlabel('x [m]','FontSize',12);
ylabel('y [m]','FontSize',12);
zlabel('z [m]','FontSize',12);
title('Campo \bf B esperado','FontSize',14);
hold on;
box on;
plot3(line_2(:,1),line_2(:,2),line_2(:,3),'r','LineWidth',1.5);
plot3(line_3(:,1),line_3(:,2),line_3(:,3),'r','LineWidth',1.5);
plot3(line_4(:,1),line_4(:,2),line_4(:,3),'r','LineWidth',1.5);
scatter3(x,y,z,circle_size,'b','filled');
waitbar(0.85,f,'Estamos trabajando, por favor espere...');
for k = data_point    
    for j = data_point
        for i = data_point                       
            B = calcularBdelLoop(a,b,i,j,k,I,n);
            if k==data_point(1)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'k','LineWidth',1);
            elseif k==data_point(2)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'y','LineWidth',1);
            elseif k==data_point(3)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'m','LineWidth',1);
            elseif k==data_point(4)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'c','LineWidth',1);
            elseif k==data_point(5)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'r','LineWidth',1);
            elseif k==data_point(6)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'g','LineWidth',1);
            elseif k==data_point(7)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'b','LineWidth',1);
            else
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'k','LineWidth',1);
            end            
        end
    end
end
axis([-lim lim -lim lim -lim lim]);


%3D Eje XZ:
waitbar(0.8,f,'Realizando la gráfica en 3D corte ZX...')
figure(3)
plot3(line_1(:,1),line_1(:,2),line_1(:,3),'r','LineWidth',1.5);
grid minor;
xlabel('x [m]','FontSize',12);
ylabel('y [m]','FontSize',12);
zlabel('z [m]','FontSize',12);
title('Campo \bf B esperado','FontSize',14);
hold on;
box on;
plot3(line_2(:,1),line_2(:,2),line_2(:,3),'r','LineWidth',1.5);
plot3(line_3(:,1),line_3(:,2),line_3(:,3),'r','LineWidth',1.5);
plot3(line_4(:,1),line_4(:,2),line_4(:,3),'r','LineWidth',1.5);
scatter3(x,y,z,circle_size,'b','filled');
waitbar(0.85,f,'Estamos trabajando, por favor espere...');
for k = data_point    
    for j = data_point
        for i = data_point                       
            B = calcularBdelLoop(a,b,i,j,k,I,n);
            if k==data_point(1)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'k','LineWidth',1);
            elseif k==data_point(2)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'y','LineWidth',1);
            elseif k==data_point(3)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'m','LineWidth',1);
            elseif k==data_point(4)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'c','LineWidth',1);
            elseif k==data_point(5)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'r','LineWidth',1);
            elseif k==data_point(6)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'g','LineWidth',1);
            elseif k==data_point(7)
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'b','LineWidth',1);
            else
                quiver3(i,j,k,B(1),B(2),B(3),1e-4,'k','LineWidth',1);
            end            
        end
    end
end
axis([-lim lim -lim lim -lim lim]);
view(0,0);

waitbar(0.95,f,'Ya casi terminamos...')
%--------------------------------------------------------------------------
close(f);
end

