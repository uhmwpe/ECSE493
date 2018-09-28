k = 1;
p = [k*1 k*1];
q = [1 5 6 0];
tp = tf(p, q);
leadnum = [0.088 1];
leadden = [0.022 1];
tp_lead = tf(leadnum, leadden);
lagnum = [10 1];
lagden = [100 1];
tp_lag = tf(lagnum, lagden);
tp_lead = tp * tp_lead
tp_lag = tp*tp_lag
%Uncomment one of the below to get the plot desired
%bode(tp)
%step(tp/(1+tp))
%bode(tp_lead)
%step(tp_lead/(1+tp_lead))
%bode(tp_lag)
%step(tp_lag/(1+tp_lag))
%bode(tp_lead*tp_lag)
step(tp_lead*tp_lag/(1+tp_lead*tp_lag))