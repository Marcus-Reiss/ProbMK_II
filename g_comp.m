%% Gráficos comparativos (circuitos aberto e cruzado):
% Velocidades angulares
figure(5)

subplot(2,1,1)
h = plot(t,w3v_open,t,w3v);
set(h,'LineWidth',2,stylename,linestyle,colorname,color);
grid on
title('Velocidades angulares $\omega _3$ (aberto e cruzado)')
xlabel('$t\,(s)$'), ylabel('$\omega _3\,(rad/s)$')
legend(h,'aberto','fechado')

subplot(2,1,2)
h = plot(t,w4v_open,t,w4v);
set(h,'LineWidth',2,stylename,linestyle,colorname,color);
grid on
title('Velocidades angulares $\omega _4$ (aberto e cruzado)')
xlabel('$t\,(s)$'), ylabel('$\omega _4\,(rad/s)$')
legend(h,'aberto','fechado')

% Velocidade linear vb e aceleração linear aB
figure(6)

subplot(2,1,1)
h = plot(t,vb_abs_open,t,vb_abs);
set(h,'LineWidth',2,stylename,linestyle,colorname,color);
grid on
title('Velocidades lineares (aberto e cruzado)')
xlabel('$t\,(s)$'), ylabel('$v_B\,(m/s)$')
legend(h,'aberto','fechado')

subplot(2,1,2)
h = plot(t,aB_abs_open,t,aB_abs);
set(h,'LineWidth',2,stylename,linestyle,colorname,color);
grid on
title('Aceleracoes lineares (aberto e cruzado)')
xlabel('$t\,(s)$'), ylabel('$a_B\,(m/s^2)$')
legend(h,'aberto','fechado')

% Acelerações angulares
figure(7)

subplot(2,1,1)
h = plot(t,alpha3_open,t,alpha3);
set(h,'LineWidth',2,stylename,linestyle,colorname,color);
grid on
title('Aceleracoes angulares $\alpha _3$ (aberto e cruzado)')
xlabel('$t\,(s)$'), ylabel('$\alpha _3\,(rad/s^2)$')
legend(h,'aberto','fechado')

subplot(2,1,2)
h = plot(t,alpha4_open,t,alpha4);
set(h,'LineWidth',2,stylename,linestyle,colorname,color);
grid on
title('Aceleracoes angulares $\alpha _4$ (aberto e cruzado)')
xlabel('$t\,(s)$'), ylabel('$\alpha _4\,(rad/s^2)$')
legend(h,'aberto','fechado')
