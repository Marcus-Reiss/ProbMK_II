function u = deslocs (F)
  for i = 1:10
    kk(i) = 10 + 92*exp(-0.2*i);    
  endfor
  k = [kk 0];
  K = zeros(10);
  for i = 1:10
    for j = 1:10
      if j == i
        K(i,j) = k(i) + k(i+1);
      elseif j == i + 1
        K(i,j) = (-1)*k(j);
        K(j,i) = K(i,j);
      endif
    endfor
  endfor
  k
  K
  u = (K\F)';  
  