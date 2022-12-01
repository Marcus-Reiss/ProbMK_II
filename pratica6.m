%% Projeto de cames

%% Intervalos e constantes
   dt  = pi/100; % subdivisao
   tis = pi; tfs = 240*pi/180; tid = 300*pi/180; tfd = 2*pi;
   t1  = [0:dt:tis];      % intervalo 1 (repouso em h=0)
   t3  = [tfs:dt:tid]; % intervalo 3 (repouso em h=1cm)
   ts  = [tis:dt:tfs]; % intervalo 2 (subida)
   td  = [tid:dt:tfd-2*dt];    % intervalo 4 (descida)
   b   = tfs-tis;         % beta
   tts = (ts-tis)/b;   ttd = (td-tid)/b;
   T   = [0:dt:tfd];
   h   = 1;

%% Polinomio 3-4-5
% Posicao (s)
   r1 = 0*t1;   r3 = 0*t3+h;
   ss = h*(10*tts.^3-15*tts.^4+6*tts.^5);   % polinomio de subida
   sd = h*(1-10*ttd.^3+15*ttd.^4-6*ttd.^5); % polinomio de descida
   S1 = [r1 ss r3 sd];

% Velocidade (v)
    v1 = 0*t1;  v3 = 0*t3;
    vs = (h/b)*(30*tts.^2-60*tts.^3+30*tts.^4);
    vd = (h/b)*(-30*ttd.^2+60*ttd.^3-30*ttd.^4);
    V  = [v1 vs v3 vd];
    
% Aceleracao (a)
    a1 = 0*t1;  a3 = 0*t3;
    as = (h/(b^2))*(60*tts-180*tts.^2+120*tts.^3);
    ad = (h/(b^2))*(-60*ttd+180*ttd.^2-120*ttd.^3);
    A  = [a1 as a3 ad];

% Jerk (j)
    j1 = 0*t1;  j3 = 0*t3;
    js = (h/(b^3))*(60-360*tts+360*tts.^2);
    jd = (h/(b^3))*(-60+360*ttd-360*ttd.^2);
    J  = [j1 js j3 jd];
    
% Graficos
   % diagrama svaj
   figure(1)
   subplot(4,1,1)   
   svaj = plot(T,S1);
   set(svaj,'LineWidth',2,'LineStyle','-.','Color','b');
   grid on
   title('Diagrama SVAJ (Polinomio 3-4-5)'),   ylabel('(S)')
   
   subplot(4,1,2)
   svaj = plot(T,V);
   set(svaj,'LineWidth',2,'LineStyle',':','Color','g');
   grid on
   ylabel('(V)')
   
   subplot(4,1,3)
   svaj = plot(T,A);
   set(svaj,'LineWidth',2,'LineStyle',':','Color','b');
   grid on
   ylabel('(A)')
   
   subplot(4,1,4)
   svaj = plot(T,J);
   set(svaj,'LineWidth',2,'LineStyle','-.','Color','g');
   grid on
   xlabel('$\theta\,(rad)$'), ylabel('(J)')   

%% Deslocamento cicloidal

% Posicao (s)
   r1 = 0*t1;   r3 = 0*t3+h;
   ss = h*(tts-(1/(2*pi))*sin(2*pi*tts));
   sd = h*(1-ttd+(1/(2*pi))*sin(2*pi*ttd));
   S2 = [r1 ss r3 sd];

% Velocidade (v)
   v1 = 0*t1;   v3 = 0*t3;
   vs = (h/b)*(1-cos(2*pi*tts));
   vd = (h/b)*(-1+cos(2*pi*ttd));
   V  = [v1 vs v3 vd];

% Aceleracao (a)
   a1 = 0*t1;   a3 = 0*t3;
   as = 2*pi*(h/(b^2))*sin(2*pi*tts);
   ad = -2*pi*(h/(b^2))*sin(2*pi*ttd);
   A  = [a1 as a3 ad];

% Jerk (j)
   j1 = 0*t1;   j3 = 0*t3;
   js = ((2*pi)^2)*(h/(b^3))*cos(2*pi*tts);
   jd = -((2*pi)^2)*(h/(b^3))*cos(2*pi*ttd);
   J  = [j1 js a3 ad];

% Graficos
   % diagrama svaj
   figure(2)
   subplot(4,1,1)   
   svaj = plot(T,S2);
   set(svaj,'LineWidth',2,'LineStyle','-.','Color','b');
   grid on
   title('Diagrama SVAJ (Deslocamento cicloidal)'),   ylabel('(S)')
   
   subplot(4,1,2)
   svaj = plot(T,V);
   set(svaj,'LineWidth',2,'LineStyle',':','Color','g');
   grid on
   ylabel('(V)')
   
   subplot(4,1,3)
   svaj = plot(T,A);
   set(svaj,'LineWidth',2,'LineStyle',':','Color','b');
   grid on
   ylabel('(A)')
   
   subplot(4,1,4)
   svaj = plot(T,J);
   set(svaj,'LineWidth',2,'LineStyle','-.','Color','g');
   grid on
   xlabel('$\theta\,(rad)$'), ylabel('(J)')
   
   %% Movimento Harmonico Simples
   
% Posicao (s)
   r1 = 0*t1;   r3 = 0*t3+h;  
   sso = (h/2)*(1-cos(pi*tts));  
   sd = h-(h/2)*(1-cos(pi*ttd));
   S3 = [r1 sso r3 sd];

% Velocidade (v)
   v1 = 0*t1;   v3 = 0*t3;
   vs = (pi*h/(2*b))*sin(pi*tts);
   vd = -(pi*h/(2*b))*sin(pi*ttd);
   V  = [v1 vs v3 vd];

% Aceleracao (a)
   a1 = 0*t1;   a3 = 0*t3;
   as = ((h*pi^2)/(2*b^2))*cos(pi*tts);
   ad = -((h*pi^2)/(2*b^2))*cos(pi*ttd);
   A  = [a1 as a3 ad];

% Jerk (j)
   j1 = 0*t1;   j3 = 0*t3;
   js = -((h*pi^3)/(2*b^3))*sin(pi*tts);
   jd = ((h*pi^3)/(2*b^3))*sin(pi*ttd);
   J  = [j1 js a3 ad];

% Graficos
   % diagrama svaj
   figure(3)
   subplot(4,1,1)   
   svaj = plot(T,S3);
   set(svaj,'LineWidth',2,'LineStyle','-.','Color','b');
   grid on
   title('Diagrama SVAJ (MHS)'),   ylabel('(S)')
   
   subplot(4,1,2)
   svaj = plot(T,V);
   set(svaj,'LineWidth',2,'LineStyle',':','Color','g');
   grid on
   ylabel('(V)')
   
   subplot(4,1,3)
   svaj = plot(T,A);
   set(svaj,'LineWidth',2,'LineStyle',':','Color','b');
   grid on
   ylabel('(A)')
   
   subplot(4,1,4)
   svaj = plot(T,J);
   set(svaj,'LineWidth',2,'LineStyle','-.','Color','g');
   grid on
   xlabel('$\theta\,(rad)$'), ylabel('(J)')
   
%% Formato dos cames
   figure(4) 
   subplot(2,2,1)
   came = polar(T,S1);
   set(came,'LineWidth',1,'Color','r');
   title('Came (poly 3-4-5)')   
   grid on
   
   subplot(2,2,2)
   came = polar(T,S2);
   set(came,'LineWidth',1,'Color','r');
   title('Came (desloc. cicloidal)')
   grid on
   
   subplot(2,2,3)
   came = polar(T,S3);
   set(came,'LineWidth',1,'Color','r');
   title('Came (MHS)')
   grid on
