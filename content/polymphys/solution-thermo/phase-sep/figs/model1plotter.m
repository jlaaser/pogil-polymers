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

%%

Ns = [1 2 4];
Xs = [0 2 4];

for i = 1:length(Ns)
    for j = 1:length(Xs)
        theX = Xs(j);
        theN = Ns(i);
        
        figure(i*10+j)
        delG = theX.*phi1.*phi2 + phi1.*log(phi1) + (1/theN)*phi2.*log(phi2);
        maxG = ceil(max(abs(delG))*10+1)/10;
        plot(phi1,delG,'LineWidth',2)
        xlabel('\phi_1','FontSize',14,'Position',[0.55 -0.2 1])
        ylabel('\Delta G/kT','FontSize',14)
        title(sprintf('\\chi = %d, N = %d',theX,theN),'FontSize',14)
        set(gca,'XAxisLocation','origin','LineWidth',2,'YLim',[-maxG maxG],...
            'FontSize',12,'XTick',[0 0.2 0.4 0.6 0.8 1])
        
        fname_out = sprintf('rawfigs/X%d_N%d',theX,theN);
        printwidth = 3.25;
        set(gcf,'Units','Inches');
        pos = get(gcf,'Position');
        pos2 = [1 3 3.25 2.25];
        set(gcf,'Units','Inches','Position',pos2)
        set(gcf,'PaperPositionMode','auto')
        print(gcf, '-dpdf', strcat(fname_out,'.pdf'));
    end
end