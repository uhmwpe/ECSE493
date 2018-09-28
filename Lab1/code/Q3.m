p = [1 1];
q = [1 5 6 0];
sys = tf(p,q);
bode(sys)
grid on
hold on