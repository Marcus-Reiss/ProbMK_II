function r = rad_desloc (t,dt,vs)
kf = t(end)/dt + 1;
    for k = 1:kf
        r(k) = 20*(3-2*cos(vs(k)));
    end
    