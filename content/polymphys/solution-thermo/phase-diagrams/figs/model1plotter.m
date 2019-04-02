phi1 = 0:0.0001:1;
phi2 = 1-phi1;

figure(1)
plot(phi1, phi1.*phi2,'LineWidth',2)
xlabel('\phi_1','FontSize',20,'Position',[0.55 -0.5 1])
ylabel('\Delta G/kT','FontSize',20)
title('\phi_1 \phi_2','FontSize',20)
set(gca,'YLim',[-0.4 0.4],'XAxisLocation','origin','LineWidth',2,...
    'FontSize',16,'XTick',[0 0.2 0.4 0.6 0.8 1],'YTick',[-0.4 -0.2 0 0.2 0.4])

figure(2)
plot(phi1, phi1.*log(phi1),'LineWidth',2)
xlabel('\phi_1','FontSize',20,'Position',[0.55 -0.5 1])
ylabel('\Delta G/kT','FontSize',20)
title('\phi_1 ln \phi_1','FontSize',20)
set(gca,'YLim',[-0.4 0.4],'XAxisLocation','origin','LineWidth',2,...
    'FontSize',16,'XTick',[0 0.2 0.4 0.6 0.8 1],'YTick',[-0.4 -0.2 0 0.2 0.4])

figure(3)
plot(phi1, phi2.*log(phi2),'LineWidth',2)
xlabel('\phi_1','FontSize',20,'Position',[0.55 -0.5 1])
ylabel('\Delta G/kT','FontSize',20)
title('\phi_2 ln \phi_2','FontSize',20)
set(gca,'YLim',[-0.4 0.4],'XAxisLocation','origin','LineWidth',2,...
    'FontSize',16,'XTick',[0 0.2 0.4 0.6 0.8 1],'YTick',[-0.4 -0.2 0 0.2 0.4])