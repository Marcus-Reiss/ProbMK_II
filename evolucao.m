% Script utilizado para graficar as evolu��es desejadas

% Integra��o num�rica para obter evolu��o de theta(t)
[t,theta] = ang_desloc; 
dt = t(2) - t(1);  % passo

% Chamando as fun��es para obter theta', r, r', v
v = vel(t,dt);
r = rad_desloc(t,dt,theta);
theta_pt = ang_vel(t,theta);
r_pt = rdot(t,dt,theta,theta_pt);

% Constru��o dos gr�ficos de evolu��o
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
