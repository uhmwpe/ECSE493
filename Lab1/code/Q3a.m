k = 150;
p = [k*1 k*1];
q = [1 5 6 0];
tp = tf(p,q);
bode(tp)
tp = tp/(1+tp);
step(tp)