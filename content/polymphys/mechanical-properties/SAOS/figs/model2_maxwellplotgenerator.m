logomegatau = -4:0.1:4;
omegatau = 10.^(logomegatau);

Gp = omegatau.^2./(omegatau.^2 + 1);
logGp = log10(Gp);

Gpp = omegatau./(omegatau.^2 + 1);
logGpp = log10(Gpp);

figure(1)
clf
loglog(omegatau,Gp,'Marker','s','MarkerFaceColor','white','Color','black')
hold on
loglog(omegatau,Gpp,'Marker','o','MarkerFaceColor','black','Color','black')

legend('G''', 'G''''')
set(gca,'YLim',[1e-9 10])
LogLogDecadesEqual(gca)

xlabel('\omega\tau','FontSize',16)
ylabel('G/G_0','FontSize',16)

set(gca,'LineWidth',2,'TickLength',2*[0.01,0.025])