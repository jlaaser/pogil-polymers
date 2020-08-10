Ns = [10 100 1000];
alpha = 175;

figure(1)
clf
hold on

colors = 'krb';

for i = 1:length(Ns)
    theN = Ns(i);
    thecolor = colors(i)
    
    [ss,bb] = FHPhaseDiagram( theN );
    
    phi1 = ss.phi1;
    T = alpha./ss.X;
    critpt = find(T == max(T));
    crit_phi = mean(phi1(critpt));
    crit_T = mean(T(critpt));
    
    plot(ss.phi1, alpha./ss.X, 'LineWidth',1,'Color',thecolor)
    plot(crit_phi,crit_T,'o', 'LineWidth',1,'Color',thecolor)
    legendlist{i} = sprintf('N = %d',theN);
end

legend(legendlist,'Location','NorthWest')
set(gca,'XLim',[0.5 1],'YLim',[100 400],'LineWidth',2,'TickLength',[0.01 0.05],'FontSize',16)
box on
xlabel('\phi_1')
ylabel('T (K)')