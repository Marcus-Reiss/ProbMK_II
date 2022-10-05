%% Caracteristicas de inercia
rho = 3; % densidade linear (kg/m)
m2 = rho*a; m3 = rho*b; m4 = rho*c;
Ig2 = (1/12)*m2*a^2; Ig3 = (1/12)*m3*b^2; Ig4 = (1/12)*m4*c^2;

%% Componentes dos vetores posicao
R12x = -(a/2)*cos(t2v); R12y = -(a/2)*sin(t2v);
R32x = -R12x; R32y = -R12y;
R23x = -(b/2)*cos(t3v); R23y = -(b/2)*sin(t3v);
R43x = -R23x; R43y = -R23y;
R14x = -(c/2)*cos(t4v); R14y = -(c/2)*sin(t4v);
R34x = -R14x; R34y = -R14y;

%% Resolucao do sistema linear
% F12x F12y F32x F32y (F23x F23y) (F43x F43y) F14x F14y F34x F34y T12
%                     (=-F32x)    (=-F34x)                
for id = 1:length(t2v) + 1
    % matriz de coeficientes
    A = [1 0 1 0 0 0 0 0 0;
         0 1 0 1 0 0 0 0 0;
         -R12y(id) R12x(id) -R32y(id) R32x(id) 0 0 0 0 1;
         0 0 -1 0 0 0 -1 0 0;
         0 0 0 -1 0 0 0 -1 0;
         0 0 R23y(id) -R23x(id) 0 0 R43y(id) -R43x(id) 0;
         0 0 0 0 1 0 1 0 0;
         0 0 0 0 0 1 0 1 0;
         0 0 0 0 -R14y(id) R14x(id) -R34y(id) R34x(id) 0 0];
    % matriz de termos independentes
    b = [m2*aG2x; m2*aG2y; Ig2*alpha2; 
         m3*aG3x; m3*aG3y; Ig3*alpha3(id);
         m4*aG4x; m4*aG4y; Ig4*alpha4(id)];
    % vetor incógnita
    F(:,id) = A\b;
end

%% Resultados importantes
T12 = F(9,:); % [kg.mm^2/s^2 == 10^-6 x kg.m^2/s^2 = 10^-6 x N.m]
F12 = sqrt((F(1,:))^2+(F(2,:))^2);
F14 = sqrt((F(5,:))^2+(F(6,:))^2);

%% Gráficos de torque e força
figure(8)
h = plot(t,T12);
set(h,'LineWidth',2,'Color','b');
grid on
title('Torque $T_{12}$ no tempo')
xlabel('$t\,(s)$'), ylabel('$T_{12} \,(10^{-6}\,Nm)$')

figure(9)

subplot(2,1,1)
h = plot(t,F12);
set(h,'LineWidth',2,stylename,'--',colorname,'b');
grid on
title('Força no suporte ($F_{12}$)')
xlabel('$t\,(s)$'), ylabel('$F_{12}\,(10^{-3}\,N)$')

subplot(2,1,2)
h = plot(t,F14);
set(h,'LineWidth',2,stylename,':',colorname,'g');
grid on
title('Força no suporte ($F_{14}$)')
xlabel('$t\,(s)$'), ylabel('$F_{14}\,(10^{-3}\,N)$')

%% Valores máximos e mínimos
T12min = min(T12); T12max = max(T12);
F12min = min(F12); F12max = max(F12);
F14min = min(F14); F14max = max(F14);
