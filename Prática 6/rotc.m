function rotc(rot)
if rot==1
% Rotacao #1 - Em z de pi/2, depois em y de pi/2
rotord=321;
phi=[0:pi/100:pi/2]; 
phixv=[0*phi 0*phi]; 
phiyv=[0*phi 4*phi];
phizv=[phi phi(end)+0*phi];  
elseif rot==2
% Rotacao #2 - Em y de pi/2, depois em z de pi/2
rotord=123;
phi=[0:pi/100:pi/2]; 
phixv=[0*phi 0*phi]; 
phiyv=[phi phi(end)+0*phi];
phizv=[0*phi phi];
elseif rot==3
% Rotacao #3 - Em x de pi/2, depois em y de pi/2, depois em z de pi/2
rotord=123;
phi=[0:pi/50:pi/2]; 
phixv=[phi phi(end)+0*phi phi(end)+0*phi]; 
phiyv=[0*phi phi phi(end)+0*phi];
phizv=[0*phi 0*phi phi];
elseif rot==4
% Rotacao #4 - Em x, y e z simult?neo de pi/2 (123)
rotord=123;
phi=[0:pi/100:pi/2]; 
phixv=[phi];
phiyv=[phi];
phizv=[phi]; 
else return;
end

for id=1:length(phiyv)
    phix=phixv(id); phiy=phiyv(id); phiz=phizv(id);
    Rx = [1 0 0;0 cos(phix) -sin(phix);0 sin(phix) cos(phix)];
    Ry = [cos(phiy) 0 sin(phiy);0 1 0;-sin(phiy) 0 cos(phiy)];
    Rz = [cos(phiz) -sin(phiz) 0;sin(phiz) cos(phiz) 0;0 0 1];
    if rotord==321 R(:,:,id)=Rz*Ry*Rx; 
    elseif rotord==123 R(:,:,id)=Rx*Ry*Rz; 
    end
end

fcnrot3d(R)
