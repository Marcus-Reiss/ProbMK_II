function dsdt = ang_vel(t,s)
    dsdt = 0.92*(100-t)./(20*(13-12*cos(s)).^(1/2));
    
