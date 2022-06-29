function [t,s] = ang_desloc
    ti = 0; dt = 0.02; tf = 25;
    [t,s] = ode45(@(t,s) ang_vel(t,s),[ti:dt:tf],[0]);      
    