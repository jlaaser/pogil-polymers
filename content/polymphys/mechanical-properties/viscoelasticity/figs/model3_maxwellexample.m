% plot a maxwell element response

clear all

tau = 10^(3);
omega_log10 = -5:0.1:1;
omega = 10.^omega_log10;
G0 = 100;

wt = omega*tau;
w2t2 = wt.^2;

Gp = w2t2./(w2t2+1);
Gpp = wt./(w2t2+1);

figure(1)
clf

loglog(omega,Gp,'o')
hold on
loglog(omega,Gpp,'x')
set(gca,'XLim',[min(omega) max(omega)])
xlabel('\omega (s^{-1})')
ylabel('G/G_0 (a.u.)')
legend('G''','G''''')

LogLogDecadesEqual(gca)
set(gca,'LineWidth',2,'TickLength',2*[0.01,0.025])