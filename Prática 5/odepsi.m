% Preparação do sistema de EDOs de 1a ordem
function dpsi = odepsi(t,psi)
    g = 9.81; r = 1.84; c = 0.5; m = 1;
    dpsi = zeros(2,1);
    dpsi(1) = psi(2);
    dpsi(2) = -(g/r)*sin(psi(1))-(c/m)*psi(2);
    