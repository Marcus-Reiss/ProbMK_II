%% Simulacao de mecanismo de quatro barras
%clear all, close all, clc,

%% Dados do mecanismo
velacel=1;
% Lengths of links
%   N = 84;
%   delta = N/4;
%   a=40-delta; b=120+delta; c=80-delta; d=100+delta; % Grashof Crank-Rocker
% % End-effector P
%    AP=1.2*b; tAP=14*(pi/180);

%% Setup of input
% Initial t2
% t2i=50*(pi/180);
% Number of steps
N=1000;
% Vector of time instants
t=linspace(0,1,N)';
% Vector of values for t2 (for imposed t2 in constant steps)
  %t2v=t2i+linspace(0,4*pi,N)';
  % Vector of values for t2 (for imposed w2 constant)
   w2=4*pi; t2v=t2i+w2*t; w2v=w2*ones(size(t)); a2v=zeros(size(t));
    % Vector of values for t2 (for imposed a2 constant)
    % a2=8*pi; t2v=t2i+a2/2*t.^2; a2v=a2*ones(size(t)); w2v=a2*t;

%% Newton-Raphson algorithm for the evaluation of t3 and t4 given t2
tol=100;
% Initial guesses for t3 and t4
  %t3=15*(pi/180); t4=44*(pi/180); % Circuito aberto: 44°; fechado: 179° 
disp('    it2   Iterations')
for it2=1:length(t2v)
   t2=t2v(it2); B=tol+1; iconv=0;
   while norm(B)>tol
       iconv=iconv+1;
       A=[-b*sin(t3) c*sin(t4);b*cos(t3) -c*cos(t4)];
       B=[a*cos(t2)+b*cos(t3)-c*cos(t4)-d; a*sin(t2)+b*sin(t3)-c*sin(t4)];
       Dt=-A\B;
       t3=t3+Dt(1); t4=t4+Dt(2);
   end
   if iconv>2 disp([it2 iconv]), end % Show number of iterations required to converge
   t3v(it2,1)=t3; t4v(it2,1)=t4;
end

%% Show simulation
 qbarras_nr_simulation

%% Post-processing for velocities and accelerations
% if velacel==1
%     qbarras_nr_velacel
% end