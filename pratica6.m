%% Projeto de cames

%% Trechos em repouso
t1 = [0:pi/100:pi];
r1 = 0*t1;
t2 = [240*pi/180:pi/100:300*pi/180-pi/100];
r2 = 0*t2+1;

%% Polinômio de subida
% 3-4-5 poly 
h = 1; ti = pi; tf = 240*pi/180;
b = (tf-ti);
t = [ti:pi/100:tf-pi/100]; tt = (t-ti)/b;
s = h*(10*tt.^3-15*tt.^4+6*tt.^5);

%% Polinômio de descida
% 3-4-5 poly
tid = 300*pi/180; tf = 2*pi;
td = [tid:pi/100:tf]; ttd = (td-tid)/b;
sd = h*(1-10*ttd.^3+15*ttd.^4-6*ttd.^5);

figure(1)
hp = plot(t1,r1,t,s,t2,r2,td,sd);
%stylename = {'LineStyle'}; linestyle = {'--',':'}'; 
colorname = {'Color'}; color = {'b','b','b','b'}';
set(hp,'LineWidth',2,colorname,color);
axis([0 7 -0.5 1.5])
grid on

% figure(2)
% theta = 0:0.01:2*pi;
% rho = sin(2*theta).*cos(2*theta);
% polar(theta,rho)
% theta1 = 0:pi/100:pi;
% theta2 = pi:pi/100:2*pi;
% rho1 = 0*theta1+2;
% rho2 = 0*theta2+1;
% tv=[theta1 theta2]; rv=[rho1 rho2];
% polar(tv,rv)

figure(2)
tv = [0:pi/100:2*pi]; rv = [r1 s r2 sd];
pp = polar(tv,rv);
set(pp,'LineWidth',2,colorname,{'b'});





