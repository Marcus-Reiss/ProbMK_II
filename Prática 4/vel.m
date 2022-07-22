function v = vel (t,dt)
kf = t(end)/dt + 1;
    for k = 1:kf
        v(k) = 0.92*(100 - t(k));
    end
    
