clc
clear all
close all

%% RF pulse 
A = dlmread('NEW_sinc.txt');
w1=A(:,1);
phi=A(:,2);
rfdata=w1.*cos(phi);
figure(1)
plot(1:400,rfdata)
title('RF pulse')
grid on


%% Mx by eulers
h=0.002/400; % step's size
N=400; % number of steps
Mx=zeros(400,1);
Mx(1,1)=0;
t=1;
Mz=1;
for n=1:N
Mx(n+1,1)=Mx(n)+h*(w1(t)*sin(phi(t))*Mz);
t=n;
end
% figure(2)
% plot(1:401,Mx(:,1))


%% My by eulers
My=zeros(400,1);
My(1,1)=0;
t=1;
Mz=1;
for n=1:N
My(n+1,1)=My(n)+h*((2000*w1(t)*cos(phi(t))*Mz));
t=n;
end

figure(3)
plot(1:401,My(:,1))
 hold on
plot(1:401,Mx(:,1))


%% absolute Mxy
Mxy=Mx+i.*(My);
figure(4)
plot(1:401,abs(Mxy))
title('absolute Mxy')


%% Mz by eulers
Mz=zeros(400,1);
Mz(1,1)=1;
t=1;

for n=1:N
Mz(n+1,1)=Mz(n,1)+h*(-2000*w1(t)*((sin(phi(t))*2000*Mx(t,1))+(cos(phi(t))*My(t,1))));
t=n;
end

figure(5)
plot(1:401,Mz(:,1))
title('Mz')


%delta_w=3141.59265; % for 500Hz
delta_w=6283.19; % for 1000 Hz


%% Mx at off resonance by eulers 
Mx=zeros(400,1);
Mx(1,1)=0;
t=1;
 Mz=1;
for n=1:N
Mx(n+1,1)=Mx(n,1)+h*(delta_w*My(t,1)+(w1(t)*sin(phi(t))*Mz));
t=n;
end
figure(6)
plot(1:401,Mx(:,1))


%% My at off resonance by eulers 
My=zeros(400,1);
My(1,1)=0;
t=1;
Mz=1;
for n=1:N
My(n+1,1)=My(n)+h*(-delta_w*Mx(t,1)+(2000*w1(t)*cos(phi(t))*Mz));
t=n;
end

figure(7)
plot(1:245,My(1:245,1))
 hold on
plot(1:245,Mx(1:245,1))

%% Mz at off resonance by eulers 
Mz=zeros(400,1);
Mz(1,1)=1;
t=1;

for n=1:N
Mz(n+1,1)=Mz(n,1)+h*(-2000*w1(t)*((sin(phi(t))*Mx(t,1))+(cos(phi(t))*My(t,1))));
t=n;
end


plot(1:245,Mz(1:245,1))
legend('My','Mx','Mz')
title('At delta_w=1000Hz')

