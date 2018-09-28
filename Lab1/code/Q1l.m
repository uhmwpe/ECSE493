k = 2;
num = k*0.002;
den = [0.01 0.00104 0.002*k];
step(tf(num, den))