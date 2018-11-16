%Part 1
%Create Plant model
p = 1;
a1 = 0.3072;
a2 = 4.4516;
q = [a1 a2 0];
G = tf(p,q); %open loop plant model from lab 2
%Create frequency space
d1 = -3;
d2 = 3;
W = 10^d1;
for idx = d1:d2
W = [W (2:10)*10^idx];
end
%Plant Bode Plot
[G_mag, G_phase] = bode(G,W);
bode(G)
grid on
title('Simulated Frequency Response of Cart Model')
%Design Parameter settings
phi = 80; %phase margin (deg)
ws = 0.1; %sensitivity threshold freq (rad/sec)
sigma = 0.01; %sensitivity
wco = 8; %crossover freq (rad/sec)
%Design PID controller
i = find(W==wco); %find index in W vector
G_magnitude = G_mag(i);
disp(G_magnitude)
G_phi = G_phase(i); %phase of plant at wco
theta = -180 + phi - G_phi;
disp(theta)
tau_h = tan(theta*pi/180)/wco;
%disp(tau_h)
K_mag_wco = 1/G_mag(i); %Controller magnitude at wco
k = K_mag_wco/(sqrt((tau_h*wco)^2+1)); %lead gain
%figure;
%Lead_G = tf([k*tau_h k],q); %lead controller convolved with
%plant G
%bode(Lead_G,W)
%grid on
G_mag_ws = G_mag(find(W==ws)); %plant magnitude at ws
K_mag_ws = 1/(sigma*G_mag_ws); %controller mag at ws
tau_l = k/(ws*sqrt(K_mag_ws^2-k^2));
%test = 1/(k*sigma*G_mag(28));
%disp(test)
%Final PID gains
Kd = k*tau_h;
disp(Kd)
Kp = k*(1+tau_h/tau_l);
disp(Kp)
Ki = k/tau_l;
disp(Ki)
%Step and Frequency response plots
%figure
PID_G = tf([Kd Kp Ki],[q 0]);
%bode(PID_G,W)
%title('Frquency Response of L = KG')
%figure
%step(PID_G)
%grid on
%title('Step Response')
%Sensitivity
ps = [1 a1/a2 0 0];
qs = [1 (a1 + Kd)/a2 Kp/a2 Ki/a2];
S = tf(ps,qs);
%figure
%bode(S,W)
%grid on
%title('Sensitvity Frequency Response')
%figure
SYS = tf([Kd Kp Ki],[a1 (a2+Kd) Kp Ki]);
%step(SYS, 15)
%title('Step Response of L/(1+L)')