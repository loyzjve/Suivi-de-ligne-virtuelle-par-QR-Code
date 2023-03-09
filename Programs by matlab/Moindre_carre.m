function Moindre_carre
clear all
close all
load marqueurs.mat
load marqueurs3.mat

n=length(x3);
V = x3.^2 + y3.^2; M = [2*x3 2*y3 -ones(n,1)]; 
theta = pinv(M)*V;
Ve = M * theta; 

x0e = theta(1); y0e = theta(2);
Re = sqrt(-theta(3) + (theta(1))^2 + (theta(2))^2);
s = (0 : pi/20 : 2*pi)';
xe = Re * cos(s) + x0e; ye = Re * sin(s) + y0e;

% J=ones(length(x3),1)
% J=(V-Ve).^2
J=0;
for i=1:length(x3)
    J=J+(V(i)-Ve(i)).^2;
end
J

figure(1), plot(x1,y1,'b*',x3,y3,'r*',xe,ye,'k'), grid on, axis('equal')