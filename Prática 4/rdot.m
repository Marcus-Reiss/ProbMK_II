function drdt = rdot(t,dt,vs,ds)
kf = t(end)/dt + 1;
    for k = 1:kf
        drdt(k) = 40*sin(vs(k))*ds(k);
    end
    
