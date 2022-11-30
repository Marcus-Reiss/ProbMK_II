%% Projeto de cames

%% Trechos em repouso
t1 = [0:.01:pi];
r1 = 0*t1;
t2 = [240*pi/180:.01:300*pi/180];
r2 = 0*t2+1;

%% Polinômio de subida
% 3-4-5 poly 
h = 1; ti = pi; tf = 240*pi/180;
b = (tf-ti);
t = [ti:.01:tf]; tt = (t-ti)/b;
s = h*(10*tt.^3-15*tt.^4+6*tt.^5);

%% Polinômio de descida
% 3-4-5 poly
tid = 300*pi/180; tf = 2*pi;
td = [tid:.01:tf]; ttd = (td-tid)/b;
sd = h*(1-10*ttd.^3+15*ttd.^4-6*ttd.^5);

figure(1)
hp = plot(t1,r1,t,s,t2,r2,td,sd);
%stylename = {'LineStyle'}; linestyle = {'--',':'}'; 
colorname = {'Color'}; color = {'b','b','b','b'}';
set(hp,'LineWidth',2,colorname,color);
axis([0 7 -0.5 1.5])
grid on

% figure(2)
% hp = plot(t1,r1,t2,r2);
% set(hp,'LineWidth',2);
% axis([0 6 -0.5 1.5])
% grid on
% 
% figure(3)
% hpp = plot(ttt,ss);
% set(hpp,'LineWidth',2);
% axis([0 6 -0.5 1.5])
% grid on

