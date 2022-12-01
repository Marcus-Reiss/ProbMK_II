%% Projeto de cames

%% Polinomio 3-4-5

% Intervalos e constantes
   dt  = pi/100; % subdivisao
   tis = pi; tfs = 240*pi/180; tid = 300*pi/180; tfd = 2*pi;
   t1  = [0:dt:tis];      % intervalo 1 (repouso em h=0)
   t3  = [tfs:dt:tid-dt]; % intervalo 3 (repouso em h=1cm)
   ts  = [tis:dt:tfs-dt]; % intervalo 2 (subida)
   td  = [tid:dt:tfd];    % intervalo 4 (descida)
   b   = tfs-tis;         % beta
   tts = (t-tis)/b;   ttd = (td-tid)/b;
   T   = [0:dt:tfd];
   h   = 1;

% Posição (s)
   r1 = 0*t1;   r3 = 0*t3+h;
   ss = h*(10*tts.^3-15*tts.^4+6*tts.^5);   % polinomio de subida
   sd = h*(1-10*ttd.^3+15*ttd.^4-6*ttd.^5); % polinomio de descida
   S  = [r1 ss r3 sd];

% Velocidade (v)

% Aceleracao (a)

% Jerk (j)

% Graficos
   % diagrama svaj (vo faze td ainda)
   figure(1)
   svaj = plot(T,S);
   %stylename = {'LineStyle'}; linestyle = {'--',':'}';
   colorname = {'Color'}; color = {'b','b','b','b'}';
   set(svaj,'LineWidth',2,colorname,color);
   axis([0 7 -0.5 1.5])
   grid on

   % desenho do came
   figure(2)
   came = polar(T,S);
   set(came,'LineWidth',2,colorname,{'b'})







