function dxdt = ODE3(t,x,Kf,L,Kr,Ke,Vs,Ker,Kdeg,Krec);

dxdt = zeros(4,1);

dxdt(1) = -Kf*L*x(1)+Kr*x(2)-Ke*x(1)+Vs + (Krec*x(3)-Krec*x(4));

dxdt(2) = Kf*L*x(1)-Kr*x(2)-Ker*x(2) + Krec*x(4);

dxdt(3) = Ke*x(1)+Ker*x(2)-Kdeg*x(3) - Krec*x(3);

dxdt(4) = Ker*x(2)-Kdeg*x(4) - Krec*x(4);
