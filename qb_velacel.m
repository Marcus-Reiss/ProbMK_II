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

%% Gráficos de velocidade angular:
figure(1)
h = plot(t,w3v,t,w4v);
stylename = {'LineStyle'}; linestyle = {'--',':'}'; 
colorname = {'Color'}; color = {'b','g'}';
set(h,'LineWidth',2,stylename,linestyle,colorname,color);
grid on
title('Velocidades angulares no tempo')
xlabel('$t\,(s)$'), ylabel('$\omega \,(rad/s)$')
legend(h,'$\,\omega _3$','$\,\omega _4$')

%% Gráficos de velocidade linear
va_abs = abs(va); vb_abs = abs(vb); % módulo dos vetores velocidade
figure(2)
h = plot(t,va_abs,t,vb_abs);
set(h,'LineWidth',2,stylename,linestyle,colorname,color);
grid on
title('Velocidades lineares no tempo')
xlabel('$t\,(s)$'), ylabel('$v\,(m/s)$')
legend(h,'$\,v_A$','$\,v_B$')

%% Gráficos de aceleração angular:
figure(3)
h = plot(t,alpha3,t,alpha4);
set(h,'LineWidth',2,stylename,linestyle,colorname,color);
grid on
title('Aceleracoes angulares no tempo')
xlabel('$t\,(s)$'), ylabel('$\alpha \,(rad/s^2)$')
legend(h,'$\,\alpha _3$','$\,\alpha _4$')

%% Gráficos de aceleração linear:
aA_abs = abs(aA); aB_abs = abs(aB); % módulos dos vetores aceleração
figure(4)
h = plot(t,aA_abs,t,aB_abs);
set(h,'LineWidth',2,stylename,linestyle,colorname,color);
grid on
title('Aceleracoes lineares no tempo')
xlabel('$t\,(s)$'), ylabel('$a\,(m/s^2)$')
legend(h,'$\,a_A$','$\,a_B$')

%% Valores máximos e mínimos:
w3max = max(w3v), w4max = max(w4v)
vAmax = max(va_abs), vBmax = max(vb_abs)
alpha3max = max(alpha3), alpha4max = max(alpha4)
aAmax = max(aA_abs), aBmax = max(aB_abs)

w3min = min(w3v), w4min = min(w4v)
vAmin = min(va_abs), vBmin = min(vb_abs)
alpha3min = min(alpha3), alpha4min = min(alpha4)
aAmin = min(aA_abs), aBmin = min(aB_abs)
