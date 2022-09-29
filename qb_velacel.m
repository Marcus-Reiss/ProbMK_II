%% Inputs:
% Angles: t2v, t3v, t4v
% Mechanism lengths: a, b, c, d
% Angular velocity w2: w2v

%% Velocidades angulares:
w3v = (a*w2v/b).*sin(t4v-t2v)./sin(t3v-t4v);
w4v = (a*w2v/c).*sin(t2v-t3v)./sin(t4v-t3v);

%% Velocidades lineares (pontos A e B):
va = i*a*w2v.*exp(i*t2v);
vb = i*c*w4v.*exp(i*t4v);

%% Acelerações angulares:
alpha2 = 0;
A = c*sin(t4v); B = b*sin(t3v); D = c*cos(t4v); E = b*cos(t3v);
C = a*alpha2.*sin(t2v) + a*(w2v.^2).*cos(t2v) + b*(w3v.^2).*cos(t3v) -c*(w4v.^2).*cos(t4v);
F = a*alpha2.*cos(t2v) -a*(w2v.^2).*sin(t2v) -b*(w3v.^2).*sin(t3v) + c*(w4v.^2).*sin(t4v);

alpha3 = (C.*D-A.*F)./(A.*E-B.*D);
alpha4 = (C.*E-B.*F)./(A.*E-B.*D);

%% Acelerações lineares (pontos A e B):
aA = (i*alpha2-w2v.^2)*a.*exp(i*t2v);
aB = (i*alpha4-w4v.^2)*c.*exp(i*t4v);

%% Gráficos de velocidade:
figure(1)
h = plot(t,w3v,t,w4v);
stylename = {'LineStyle'}; linestyle = {'--',':'}'; 
colorname = {'Color'}; color = {'b','g'}';
set(h,'LineWidth',2,stylename,linestyle,colorname,color);
grid on
title('Velocidades angulares no tempo')
xlabel('$t\,(s)$'), ylabel('$\omega \,(rad/s)$')
legend(h,'$\,\omega _3$','$\,\omega _4$')

