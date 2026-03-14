function draw_drone(x,y,z,roll,pitch,yaw,X,Y,Z,t)

L = 0.35;

cla
hold on
grid on

% Ground plane
[Xg,Yg] = meshgrid(-5:1:5,-5:1:5);
Zg = zeros(size(Xg));
mesh(Xg,Yg,Zg,'FaceAlpha',0.1,'EdgeColor',[0.7 0.7 0.7])

% Plot trajectory
plot3(X,Y,Z,'b','LineWidth',2)

% Rotation matrices
Rx=[1 0 0;
    0 cos(roll) -sin(roll);
    0 sin(roll) cos(roll)];

Ry=[cos(pitch) 0 sin(pitch);
    0 1 0;
    -sin(pitch) 0 cos(pitch)];

Rz=[cos(yaw) -sin(yaw) 0;
    sin(yaw) cos(yaw) 0;
    0 0 1];

R = Rz*Ry*Rx;

% Drone frame points
p1 = R*[ L 0 0]';
p2 = R*[-L 0 0]';
p3 = R*[0 L 0]';
p4 = R*[0 -L 0]';

p1=p1+[x;y;z];
p2=p2+[x;y;z];
p3=p3+[x;y;z];
p4=p4+[x;y;z];

% Arms
plot3([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'k','LineWidth',3)
plot3([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'k','LineWidth',3)

% Propeller rotation animation
theta = t*20;
r=0.12;

draw_propeller(p1,theta,r)
draw_propeller(p2,theta,r)
draw_propeller(p3,theta,r)
draw_propeller(p4,theta,r)

% Drone center
scatter3(x,y,z,80,'filled','b')

xlabel('X')
ylabel('Y')
zlabel('Z')

axis([-5 5 -5 5 0 6])
view(45,30)

end


function draw_propeller(p,theta,r)

t=linspace(0,2*pi,40);

xp = p(1)+r*cos(t+theta);
yp = p(2)+r*sin(t+theta);
zp = ones(size(t))*p(3);

plot3(xp,yp,zp,'r','LineWidth',2)

end