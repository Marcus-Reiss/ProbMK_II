%% Inputs:
% Angles: t2v, t3v, t4v
% Mechanism lengths: a, b, c, d
% End-effector position: AP, tAP

%% Evaluate positions of points O2,A,B,O4,P
rO2=[ones(length(t2v),1)*rO2x ones(length(t2v),1)*rO2y];
rA=a*[cos(t2v) sin(t2v)]+rO2;
rB=rA+b*[cos(t3v) sin(t3v)];
rO4=[ones(length(t2v),1)*rO4x ones(length(t2v),1)*rO4y];
rP=rA+AP*[cos(t3v+tAP) sin(t3v+tAP)];

%% Show simulation
outvid=0; % if =1 outputs GIF video animation
figure(1), clf, set(1,'position',[0 0 690 650])
if outvid==1
    filename='qbarras_nr.gif';
    frame=getframe(gcf); im=frame2im(frame); [A,map]=rgb2ind(im,256);
    imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',1e-3);
end
rT=[rO2; rA; rB; rO4; rP]; mx=max(max(abs(rT)));
rT=[rO2; rA; rB; rO4]; mx=max(max(abs(rT))); axis([-mx mx -mx mx]),
axis tight, axis equal, axis off,
hAP=line([rA(1,1) rP(1,1)],[rA(1,2) rP(1,2)]); set(hAP,'Color','g','LineStyle','-','Marker','o'),
hPB=line([rP(1,1) rB(1,1)],[rP(1,2) rB(1,2)]); set(hPB,'Color','g','LineStyle','-','Marker','o'),
hO2A=line([rO2(1,1) rA(1,1)],[rO2(1,2) rA(1,2)]); set(hO2A,'Color','k','LineStyle','-','Marker','o'),
hAB=line([rA(1,1) rB(1,1)],[rA(1,2) rB(1,2)]); set(hAB,'Color','k','LineStyle','-','Marker','o'),
hBO4=line([rB(1,1) rO4(1,1)],[rB(1,2) rO4(1,2)]); set(hBO4,'Color','k','LineStyle','-','Marker','o'),
hO4O2=line([rO4(1,1) rO2(1,1)],[rO4(1,2) rO2(1,2)]); set(hO4O2,'Color','k','LineStyle','-','Marker','o'),

hO2Ao=line([rO2(1,1) rA(1,1)],[rO2(1,2) rA(1,2)]); set(hO2Ao,'Color',.7*[1 1 1],'LineStyle',':'),
hABo=line([rA(1,1) rB(1,1)],[rA(1,2) rB(1,2)]); set(hABo,'Color',.7*[1 1 1],'LineStyle',':'),
hBO4o=line([rB(1,1) rO4(1,1)],[rB(1,2) rO4(1,2)]); set(hBO4o,'Color',.7*[1 1 1],'LineStyle',':'),
hO4O2o=line([rO4(1,1) rO2(1,1)],[rO4(1,2) rO2(1,2)]); set(hO4O2o,'Color',.7*[1 1 1],'LineStyle',':'),
text(rO2(1,1)-mx/100,rO2(1,2)-mx/20,'$O_2$')
text(rA(1,1)-mx/100,rA(1,2)+mx/20,'$A$')
text(rB(1,1)-mx/100,rB(1,2)+mx/20,'$B$')
text(rO4(1,1)-mx/100,rO4(1,2)-mx/20,'$O_4$')
text(rP(1,1)-mx/100,rP(1,2)+mx/20,'$P$')

% drawing orientations at positions P1, P2, P3
lp1=line([rA(1,1) rP(1,1)],[rA(1,2) rP(1,2)]); set(lp1,'Color',.1*[1 3 5],'LineStyle','-'),
lp2=line([rA(505,1) rP(505,1)],[rA(505,2) rP(505,2)]); set(lp2,'Color',.1*[1 3 5],'LineStyle','-'),
lp3=line([rA(1000,1) rP(1000,1)],[rA(1000,2) rP(1000,2)]); set(lp3,'Color',.1*[1 3 5],'LineStyle','-'),

% printing points P1, P2, P3
text(rP(1,1)+mx/100,rP(1,2)-mx/20,'$P_1$') % P1
text(rP(505,1)+mx/100,rP(505,2)+mx/20,'$P_2$') % P2
text(rP(1000,1)+mx/100,rP(1000,2)+mx/20,'$P_3$') % P3

if outvid==1 dts=5; else dts=1; end
for n=2:dts:length(t)
    set(hO2A,'xdata',[rO2(n,1) rA(n,1)],'ydata',[rO2(n,2) rA(n,2)]);
    set(hAB,'xdata',[rA(n,1) rB(n,1)],'ydata',[rA(n,2) rB(n,2)]);
    set(hBO4,'xdata',[rB(n,1) rO4(n,1)],'ydata',[rB(n,2) rO4(n,2)]);
    set(hAP,'xdata',[rA(n,1) rP(n,1)],'ydata',[rA(n,2) rP(n,2)]);
    set(hPB,'xdata',[rP(n,1) rB(n,1)],'ydata',[rP(n,2) rB(n,2)]);
    hA=line([rA(n-1,1) rA(n,1)],[rA(n-1,2) rA(n,2)]); set(hA,'Color','r','LineStyle',':');
    hB=line([rB(n-1,1) rB(n,1)],[rB(n-1,2) rB(n,2)]); set(hB,'Color','r','LineStyle',':');
    hP=line([rP(n-1,1) rP(n,1)],[rP(n-1,2) rP(n,2)]); set(hP,'Color','m','LineStyle',':');
    if outvid==1
        frame=getframe(gcf); im=frame2im(frame); [A,map]=rgb2ind(im,256);
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',1e-3);
    else pause(1e-12);
    end
end,
