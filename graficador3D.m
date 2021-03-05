function graficador3D(a,b,x,y,z)

% Función encargada de graficar las cobles conductores y la nube de puntos.

%--------------------------------------------------------------------------
%---Parameters settings---
%taget point size:
circle_size = 25;
point_cloud_limits = [-0.03 0.03];
discretization_cloud = 0.01;

%---------------
if a>b
    lim = a*1.3;
elseif a<b
    lim = b*1.3;
else
    lim = a*1.3;
end
%---------------

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
for k = data_point
    for j = data_point
        for i = data_point
            scatter3(i,j,k,15,'k','.');
        end
    end
end
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
for j=data_point
    for i=data_point
        scatter(i,j,15,'k','.');
    end
end
grid minor;
axis([-lim lim -lim lim]);
%--------------------------------------------------------------------------
end

