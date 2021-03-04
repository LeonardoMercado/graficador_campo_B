function graficador3D(x,y,z)

% Función encargada de graficar las cobles conductores y la nube de puntos.

%--------------------------------------------------------------------------
%---Parameters settings---
%taget point size:
circle_size = 25;
point_cloud_limits = [-0.03 0.03];
discretization_cloud = 0.01;

%Lines definition:
line_1_start = [0.5,-0.5,0];
line_1_end = [0.5,0.5,0];
line_1 = [line_1_start;line_1_end];
line_2_end = [-0.5,0.5,0];
line_2 = [line_1_end;line_2_end];
line_3_end = [-0.5,-0.5,0];
line_3 = [line_2_end;line_3_end];
line_4_end = [0.5,-0.5,0];
line_4 = [line_3_end;line_4_end];

%surrounding space:
cross_z = point_cloud_limits(1):discretization_cloud:point_cloud_limits(2);
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%---Plot---
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
for j = 1:1:length(cross_z)
    for i = 1:1:length(cross_z)    
        aux_x = ones(size(cross_z))*cross_z(i);
        aux_y = ones(size(cross_z))*cross_z(j);
        scatter3(aux_x,aux_y,cross_z,15,'k','x');
    end    
end
lim = 0.8;
axis([-lim lim -lim lim -lim lim]);

%2D:
figure(2)
plot(line_1(:,1),line_1(:,2),'r','LineWidth',1.5);
xlabel('x');
ylabel('y');
hold on;
plot(line_2(:,1),line_2(:,2),'r','LineWidth',1.5);
plot(line_3(:,1),line_3(:,2),'r','LineWidth',1.5);
plot(line_4(:,1),line_4(:,2),'r','LineWidth',1.5);
scatter(x,y,circle_size,'b','filled');
for i = 1:1:length(cross_z)
    aux_z = ones(size(cross_z))*cross_z(i);    
    scatter(cross_z,aux_z,15,'k','x');
end
grid minor;
lim = 0.8;
axis([-lim lim -lim lim]);
%--------------------------------------------------------------------------





end

