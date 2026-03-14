clc
clear
close all

dt = 0.05;
T = 20;
t = 0:dt:T;

X=[]; Y=[]; Z=[];

figure

for i=1:length(t)

    % Spiral trajectory
    r = 0.15*t(i);
    x = r*cos(t(i));
    y = r*sin(t(i));
    z = 1 + 0.1*t(i);

    % Drone orientation
    roll  = 0.2*sin(0.5*t(i));
    pitch = 0.2*cos(0.5*t(i));
    yaw   = t(i)*0.5;

    % Store path
    X(end+1)=x;
    Y(end+1)=y;
    Z(end+1)=z;

    draw_drone(x,y,z,roll,pitch,yaw,X,Y,Z,t(i))

    pause(0.02)

end