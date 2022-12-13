omega = 10.^( linspace(-5, 1, 50 ));
tau = 1000;
Gp = (omega.^2*tau^2)./(omega.^2*tau^2 + 1);
Gpp = (omega*tau)./(omega.^2*tau^2 + 1);

figure(1)
clf
loglog(omega,Gp,'k-','LineWidth',1.5)
hold on
loglog(omega,Gpp,'r--','LineWidth',1.5)

LogLogDecadesEqual(gca,[1e-5 1e1],[1e-4 1e1])
xlabel("\omega (s^{-1})")
ylabel("G/G_0 (a.u.)")
set(gca,'FontSize',12,'LineWidth',1.5,'XTick',10.^(-5:1),'YTick',10.^(-5:1))
legend("G'","G''")