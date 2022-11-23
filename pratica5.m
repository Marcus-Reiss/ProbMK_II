%% Sintese analitica de mecanismos
%% Posições e orientações
   P1 = [ 0.000,0.000]; o1 = 210.0/180*pi;
   P2 = [-1.236,2.138]; o2 = 147.5/180*pi;
   P3 = [-2.500,2.931]; o3 = 110.2/180*pi;
   p21 = norm(P2-P1);
   d2  = atan2((P2(2)-P1(2)),(P2(1)-P1(1)));
   a2  = o2-o1;
   p31 = norm(P3-P1);
   d3  = atan2((P3(2)-P1(2)),(P3(1)-P1(1)));
   a3  = o3-o1;
   b2  = 30/180*pi; g2 = 10/180*pi; b3 = 60/180*pi; g3 = 25/180*pi;

%% Sistemas para determinacao de W1 e Z1
   % Parametros necessarios
   A = cos(b2)-1; B = sin(b2); C = cos(a2)-1; D = sin(a2);
   E = p21*cos(d2); F = cos(b3)-1; G = sin(b3); H = cos(a3)-1;
   K = sin(a3); L = p31*cos(d3); M = p21*sin(d2); N = p31*sin(d3);
   % Matrizes e solucao
   matrix_A = [A -B C -D; F -G H -K; B A D C; G F K H];
   matrix_b = [E; L; M; N];
   X = matrix_A\matrix_b;
   W1x = X(1,1); W1y = X(2,1); Z1x = X(3,1); Z1y = X(4,1);

%% Sistemas para determinacao de U1 e S1
   % Parametros necessarios
   A = cos(g2)-1; B = sin(g2); C = cos(a2)-1; D = sin(a2);
   E = p21*cos(d2); F = cos(g3)-1; G = sin(g3); H = cos(a3)-1;
   K = sin(a3); L = p31*cos(d3); M = p21*sin(d2); N = p31*sin(d3);
   % Matrizes e solucao
   matrix_A = [A -B C -D; F -G H -K; B A D C; G F K H];
   matrix_b = [E; L; M; N];
   X = matrix_A\matrix_b;
   U1x = X(1,1); U1y = X(2,1); S1x = X(3,1); S1y = X(4,1);

%% Comprimento dos vetores W, Z, U e S; angulos t e p
   W = sqrt(W1x^2+W1y^2); Z = sqrt(Z1x^2+Z1y^2);
   U = sqrt(U1x^2+U1y^2); S = sqrt(S1x^2+S1y^2);
   th = acos(W1x/W); p = acos(Z1x/Z); sigma = acos(U1x/U);

%% Traduzindo as variaveis para executar o desenho
   a = W; c = U; d = 5; 
   b = ((d-(abs(W1x)+abs(U1x)))^2+(W1y-U1y)^2)^0.5;
   AP = Z; t3 = atan((U1y-W1y)/d); tAP = p-t3;
   t2i = th; t4 = sigma;

%% Chamando o script de simulacao
   %qbarras_nr_pratica3;


