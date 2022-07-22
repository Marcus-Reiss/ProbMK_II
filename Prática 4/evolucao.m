% Script utilizado para graficar as evoluções desejadas

% Integração numérica para obter evolução de theta(t)
[t,theta] = ang_desloc; 
dt = t(2) - t(1);  % passo

% Chamando as funções para obter theta', r, r', v
v = vel(t,dt);
r = rad_desloc(t,dt,theta);
theta_pt = ang_vel(t,theta);
r_pt = rdot(t,dt,theta,theta_pt);

% Construção dos gráficos de evolução
i = 'Interpreter'; l = 'latex';

figure(1)  % v x t
plot(t,v), grid
title('Grafico $v(t)$ vs $t$',i,l)
xlabel('$t \,(s)$',i,l), ylabel('$v(t) \,(cm/s)$',i,l)

figure(2)  % r x theta
plot(r,theta), grid
title('Grafico $r$ vs $\theta$',i,l)
xlabel('$\theta \,(rad)$',i,l), ylabel('$r \,(cm)$',i,l)

figure(3)  % theta vs t
plot(t,theta), grid
title('Grafico $\theta$ vs $t$',i,l)
xlabel('$t \,(s)$',i,l), ylabel('$\theta \,(rad)$',i,l)

figure(4)  % r x t
plot(t,r), grid
title('Grafico $r$ vs $t$',i,l)
xlabel('$t \,(s)$',i,l), ylabel('$r \,(cm)$',i,l)

figure(5)  % theta_pt vs t
plot(t,theta_pt), grid
title('Grafico $\dot \theta$ vs $t$',i,l)
xlabel('$t \,(s)$',i,l), ylabel('$\dot \theta \,(rad/s)$',i,l)

figure(6)  % r_pt vs t
plot(t,r_pt), grid
title('Grafico $\dot r$ vs $t$',i,l)
xlabel('$t \,(s)$',i,l), ylabel('$\dot r (cm/s)$',i,l)

figure(7)  % theta_pt vs theta
plot(theta,theta_pt), grid
title('Grafico $\dot \theta$ vs $\theta$',i,l)
xlabel('$\theta \,(rad)$',i,l), ylabel('$\dot \theta \,(rad/s)$',i,l)

figure(8)  % r_pt vs theta
plot(theta,r_pt), grid
title('Grafico $\dot r$ vs $\theta$',i,l)
xlabel('$\theta \,(rad)$',i,l), ylabel('$\dot r \,(cm/s)$',i,l)
