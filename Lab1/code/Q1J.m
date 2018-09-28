k = 0.063;
num = 0.002*k;
denom = [0.01 0.00104 k*0.002];
step(tf(num, denom))