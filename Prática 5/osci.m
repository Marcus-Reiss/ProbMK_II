function osci
[t,theta] = odetheta;
tam = length(theta(:,1));  
  prod = 1;
  for k = 1:tam
    prod = prod*theta(k,2);
    if prod < 0
        pos = k;
        break
    end
    prod = theta(k,2);
  end
  
  d = theta(pos,1);  % deslocamento ap�s as voltas completas
  voltas = floor(d/(2*pi))  % voltas completas
  
  dotheta = theta(pos:tam,2);  % Prepara��o do gr�fico 
  T = t(pos:tam);              % de evolu��o da frequ�ncia
  
  i = 'Interpreter'; l = 'latex';
  figure(5)
  plot(T,dotheta), grid
  title('Grafico $f$ vs $t$',i,l)
  xlabel('$t \,(s)$',i,l), ylabel('$f \,(1/s)$',i,l)
  