f1 = 0:0.01:1;
f2 = 1-f1;

r1 = 0.33;
r2 = 0.67;

F1 = (r1*f1.^2 + f1.*f2)./(r1*f1.^2 + 2*f1.*f2+r2*f2.^2);

plot(f1,F1,'LineWidth',2)
xlabel('f_1')
ylabel('F_1')
set(gca,'LineWidth',2,'DataAspectRatio',[1 1 1],'FontSize',16,...
    'XTick',[0 0.25 0.5 0.75 1],'YTick',[0 0.25 0.5 0.75 1])