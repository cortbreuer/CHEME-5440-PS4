%Plot thetab, x*, and y* vs 1/kd
    %xS using quadratic equation with + and yS using quadartic equation - were
    %chosen as the positive terms
k_low = .1;
k_high = 10;
kd = [.001:.01:10000];
kd_inv = 1./kd;

%k = .1
thetaB_low = 1 ./ (kd + 1);

xA = 5.*thetaB_low - 1;
xB = (5*thetaB_low*k_low) - (5*thetaB_low) + 1 + k_low;
xC = -5.*thetaB_low*k_low;

xS_low = (-xB + sqrt(xB.^2 - (4.*xA.*xC))) ./ (2.*xA);

yA = 1 - (10.*xS_low);
yB = (10.*xS_low) - k_low.*(10.*xS_low) - 1 - k_low;
yC = k_low.*10.*xS_low;

yS_low = (-yB - sqrt(yB.^2 - (4.*yA.*yC))) ./ (2.*yA);

%k = 10
thetaB_high = 1 ./ (kd + 1);

xA = 5.*thetaB_high - 1;
xB = (5*thetaB_high*k_high) - (5*thetaB_high) + 1 + k_high;
xC = -5.*thetaB_high*k_high;

xS_high = (-xB + sqrt(xB.^2 - (4.*xA.*xC))) ./ (2.*xA);

yA = 1 - (10.*xS_high);
yB = (10.*xS_high) - k_high.*(10.*xS_high) - 1 - k_high;
yC = k_high.*10.*xS_high;

yS_high = (-yB - sqrt(yB.^2 - (4.*yA.*yC))) ./ (2.*yA);

subplot(2,1,1)
semilogx(1./kd, thetaB_low, 1./kd, xS_low, 1./kd, yS_low);
legend('thetaB', 'x*', 'y*');
title('Variable vs. 1/kD for k = .1')
xlabel('1/kD')

subplot(2,1,2)
semilogx(1./kd, thetaB_high, 1./kd, xS_high, 1./kd, yS_high);
legend('thetaB', 'x*', 'y*');
title('Variable vs. 1/kD for k = 10')
xlabel('1/kD')

%Calculate hill coefficient for thetaB, x*, and y* at different k's

upperInput = 0.9*ones(1, length(kd));
lowerInput = 0.1*ones(1, length(kd));

%Theta k=.1
[c, index] = min(abs(upperInput-thetaB_low));
thetaInput_09_low = kd_inv(index);
[d, index] = min(abs(lowerInput-thetaB_low));
thetaInput_01_low = kd_inv(index);

thetaP_low = thetaInput_09_low/thetaInput_01_low;
thetaN_low = log10(81) / log10(thetaP_low);

%Theta k=10
[c, index] = min(abs(upperInput-thetaB_high));
thetaInput_09_high = kd_inv(index);
[d, index] = min(abs(lowerInput-thetaB_high));
thetaInput_01_high = kd_inv(index);

thetaP_high = thetaInput_09_high/thetaInput_01_high;
thetaN_high = log10(81) / log10(thetaP_high);

%xS k=.1
[c, index] = min(abs(upperInput-xS_low));
xSInput_09_low = kd_inv(index);
[d, index] = min(abs(lowerInput-xS_low));
xSInput_01_low = kd_inv(index);

xSP_low = xSInput_09_low/xSInput_01_low;
xSN_low = log10(81) / log10(xSP_low);

%xS k=10
[c, index] = min(abs(upperInput-xS_high));
xSInput_09_high = kd_inv(index);
[d, index] = min(abs(lowerInput-xS_high));
xSInput_01_high = kd_inv(index);

xSP_high = xSInput_09_high/xSInput_01_high;
xSN_high = log10(81) / log10(xSP_high);

%yS k=.1
[c, index] = min(abs(upperInput-yS_low));
ySInput_09_low = kd_inv(index);
[d, index] = min(abs(lowerInput-yS_low));
ySInput_01_low = kd_inv(index);

ySP_low = ySInput_09_low/ySInput_01_low;
ySN_low = log10(81) / log10(ySP_low);

%yS k=10
[c, index] = min(abs(upperInput-yS_high));
ySInput_09_high = kd_inv(index);
[d, index] = min(abs(lowerInput-yS_high));
ySInput_01_high = kd_inv(index);

ySP_high = ySInput_09_high/ySInput_01_high;
ySN_high = log10(81) / log10(ySP_high);

%Calculate percent change when 1/kd shifts from .1 to .15 for k=.1 and 10

%Parameter setup
kd_low = 1/.1;      %1/kd = .1
kd_high = 1/.15;    %1/kd = .15

k_low = .1;
k_high = 10;

%1/kd=.1 and k=.1
thetaB_lowkd_lowk = 1 ./ (kd_low + 1);

xA = 5*thetaB_lowkd_lowk - 1;
xB = (5*thetaB_lowkd_lowk*k_low) - (5*thetaB_lowkd_lowk) + 1 + k_low;
xC = -5*thetaB_lowkd_lowk*k_low;

xS_lowkd_lowk = (-xB + sqrt(xB.^2 - (4.*xA.*xC))) ./ (2.*xA);

yA = 1 - (10.*xS_lowkd_lowk);
yB = (10.*xS_lowkd_lowk) - k_low.*(10.*xS_lowkd_lowk) - 1 - k_low;
yC = k_low.*10.*xS_lowkd_lowk;

yS_lowkd_lowk = (-yB - sqrt(yB.^2 - (4.*yA.*yC))) ./ (2.*yA);

%1/kd=.15 and k=.1
thetaB_highkd_lowk = 1 ./ (kd_high + 1);

xA = 5*thetaB_highkd_lowk - 1;
xB = (5*thetaB_highkd_lowk*k_low) - (5*thetaB_highkd_lowk) + 1 + k_low;
xC = -5*thetaB_highkd_lowk*k_low;

xS_highkd_lowk = (-xB + sqrt(xB.^2 - (4.*xA.*xC))) ./ (2.*xA);

yA = 1 - (10.*xS_highkd_lowk);
yB = (10.*xS_highkd_lowk) - k_low.*(10.*xS_highkd_lowk) - 1 - k_low;
yC = k_low.*10.*xS_highkd_lowk;

yS_highkd_lowk = (-yB - sqrt(yB.^2 - (4.*yA.*yC))) ./ (2.*yA);

thetaB_lowk_change = 100 * abs(((thetaB_lowkd_lowk - thetaB_highkd_lowk) / thetaB_lowkd_lowk));
xS_lowk_change = 100 * abs(((xS_lowkd_lowk - xS_highkd_lowk) / xS_lowkd_lowk));
yS_lowk_change = 100 * abs(((yS_lowkd_lowk - yS_highkd_lowk) / yS_lowkd_lowk));

%1/kd=.1 and k=10
thetaB_lowkd_highk = 1 ./ (kd_low + 1);

xA = 5*thetaB_lowkd_highk - 1;
xB = (5*thetaB_lowkd_highk*k_high) - (5*thetaB_lowkd_highk) + 1 + k_high;
xC = -5*thetaB_lowkd_highk*k_high;

xS_lowkd_highk = (-xB + sqrt(xB.^2 - (4.*xA.*xC))) ./ (2.*xA);

yA = 1 - (10.*xS_lowkd_highk);
yB = (10.*xS_lowkd_highk) - k_high.*(10.*xS_lowkd_highk) - 1 - k_high;
yC = k_low.*10.*xS_lowkd_highk;

yS_lowkd_highk = (-yB - sqrt(yB.^2 - (4.*yA.*yC))) ./ (2.*yA);

%1/kd=.15 and k=10
thetaB_highkd_highk = 1 ./ (kd_high + 1);

xA = 5*thetaB_highkd_highk - 1;
xB = (5*thetaB_highkd_highk*k_high) - (5*thetaB_highkd_highk) + 1 + k_high;
xC = -5*thetaB_highkd_highk*k_high;

xS_highkd_highk = (-xB + sqrt(xB.^2 - (4.*xA.*xC))) ./ (2.*xA);

yA = 1 - (10.*xS_highkd_highk);
yB = (10.*xS_highkd_highk) - k_high.*(10.*xS_highkd_highk) - 1 - k_high;
yC = k_low.*10.*xS_highkd_highk;

yS_highkd_highk = (-yB - sqrt(yB.^2 - (4.*yA.*yC))) ./ (2.*yA);

thetaB_highk_change = 100 * abs(((thetaB_lowkd_highk - thetaB_highkd_highk) / thetaB_lowkd_highk));
xS_highk_change = 100 * abs(((xS_lowkd_highk - xS_highkd_highk) / xS_lowkd_highk));
yS_highk_change = 100 * abs(((yS_lowkd_highk - yS_highkd_highk) / yS_lowkd_highk));
