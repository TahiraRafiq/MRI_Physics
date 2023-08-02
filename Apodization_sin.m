clc
clear all
close all 

t=[-0.0005:0.00001:0.0005]   %% 0.0005 %% 0.001
N=3;
delta_f=4000;
alpha=0.5;
alpha2=0.46;
si=sin(3.142*delta_f*t)./(3.142*delta_f*t);

figure,
plot(t,si)
grid on
title('sinc pulse without apodization')

apodized=si-(alpha.*si)+(alpha.*cos(pi*delta_f*t./N).*si);
figure,
plot(t,apodized)
grid on 
title('sinc pulse with apodization (alpha=0.5) ')

apodized2=si-(alpha2.*si)+(alpha2.*cos(pi*delta_f*t./N).*si);

figure,
plot(t,apodized2)
grid on 
title('sinc pulse with apodization (alpha=0.46) ')

figure,
plot(t,si)
hold on
plot(t,apodized)
hold on
plot(t,apodized2)
grid on 
title('comparison ')

