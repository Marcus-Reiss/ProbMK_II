%% Simulacao de mecanismo de quatro barras

%% Setup of input
% Number of steps
N=1000;
% Vector of time instants
t=linspace(0,1,N)';
% Vector of values for t2 (for imposed t2 in constant steps)
  t2v=t2i+linspace(0,b3,N)';
  
%% Newton-Raphson algorithm for the evaluation of t3 and t4 given t2
tol=0.01;
disp('    it2   Iterations')
for it2=1:length(t2v)
   t2=t2v(it2); B=tol+1; iconv=0;
   while norm(B)>tol
       iconv=iconv+1;
       A=[-b*sin(t3) c*sin(t4);b*cos(t3) -c*cos(t4)];
       B=[a*cos(t2)+b*cos(t3)-c*cos(t4)-d*cos(t1); a*sin(t2)+b*sin(t3)-c*sin(t4)-d*sin(t1)];
       Dt=-A\B;
       t3=t3+Dt(1); t4=t4+Dt(2);
   end
   if iconv>2 disp([it2 iconv]), end % Show number of iterations required to converge
   t3v(it2,1)=t3; t4v(it2,1)=t4;
end

%% Show simulation
qbarras_nr_simulation

%% Post-processing for velocities and accelerations
qbarras_nr_velacel

