function [t,theta] = odetheta
  ti = 0; dt = 0.1; tf = 20;
  [t,theta] = ode45(@(t,theta) odepsi(t,theta),[ti:dt:tf],[0 15]);
  
  i = 'Interpreter'; l = 'latex';
  
  figure(1)
  plot(t,theta(:,1)), grid
  title('Grafico $\theta (t)$ vs $t$',i,l)
  xlabel('$t \,(s)$',i,l), ylabel('$\theta \,(rad)$',i,l)
  
  figure(2)
  plot(t,theta(:,2)), grid
  title('Grafico $\dot \theta (t)$ vs $t$',i,l)
  xlabel('$t \,(s)$',i,l), ylabel('$\dot \theta \,(rad/s)$',i,l)
  
  figure(3)
  plot(theta(:,1),theta(:,2)), grid
  title('Grafico $\dot \theta (t)$ vs $\theta (t)$',i,l)
  xlabel('$\theta \,(rad)$',i,l), ylabel('$\dot \theta \,(rad/s)$',i,l)
  
  figure(4)
  plot(theta(:,2),theta(:,1)), grid
  title('Grafico $\theta (t)$ vs $\dot \theta (t)$',i,l)
  xlabel('$\dot \theta \,(rad/s)$',i,l), ylabel('$\theta \,(rad)$',i,l)
  
  figure(5)
  h = plot(t,theta(:,1),'-.',t,theta(:,2),'.'); grid
  title('Graficos $\theta (t)$ vs $t$ e $\dot \theta (t)$ vs $t$',i,l)
  legend(h,'$\theta (t)$','$\dot \theta (t)$',i,l)
  