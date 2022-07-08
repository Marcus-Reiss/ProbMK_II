% Integração numérica do sistema de EDOs de 1a ordem
function [t,theta] = odetheta
  ti = 0; dt = 0.1; tf = 20;
  [t,theta] = ode45(@(t,theta) odepsi(t,theta),[ti:dt:tf],[0 15]);  
      
  % Construção dos gráficos
  
  i = 'Interpreter'; l = 'latex';
  
  figure(1)  % theta vs t
  plot(t,theta(:,1)), grid
  title('Grafico $\theta (t)$ vs $t$',i,l)
  xlabel('$t \,(s)$',i,l), ylabel('$\theta \,(rad)$',i,l)
  
  figure(2)  % dot theta vs t
  plot(t,theta(:,2)), grid
  title('Grafico $\dot \theta (t)$ vs $t$',i,l)
  xlabel('$t \,(s)$',i,l), ylabel('$\dot \theta \,(rad/s)$',i,l)
  
  figure(3)  % dot theta vs theta
  plot(theta(:,1),theta(:,2)), grid
  title('Grafico $\dot \theta (t)$ vs $\theta (t)$',i,l)
  xlabel('$\theta \,(rad)$',i,l), ylabel('$\dot \theta \,(rad/s)$',i,l)
  
  figure(4)  % theta vs t e dot theta vs t
  plot(t,theta(:,1),'-.',t,theta(:,2),'.'); grid
  title('Graficos $\theta (t)$ vs $t$ e $\dot \theta (t)$ vs $t$',i,l)
  legend({'Deslocamento angular','Velocidade angular'},'Position',[0.65 0.45 0.1 0.2])
  xlabel('$t \,(s)$',i,l)
  ylabel('$\theta \,(rad)$ e $\dot \theta \,(rad/s)$',i,l)
  