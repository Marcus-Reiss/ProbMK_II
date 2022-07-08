function tracao
  [t,theta] = odetheta;
  m = 1; r = 1.84; g = 9.81;
  Tr = m*((theta(:,2).^2)*r + g*cos(theta(:,1)));
  
  i = 'Interpreter'; l = 'latex';
  figure(6)  % Gráfico de tração vs t
  plot(t,Tr), grid
  title('Grafico $T_r$ vs $t$',i,l)
  xlabel('$t \,(s)$',i,l), ylabel('$T_r \,(N)$',i,l)
  