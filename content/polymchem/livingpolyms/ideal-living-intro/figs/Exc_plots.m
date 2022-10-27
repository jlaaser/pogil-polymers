%% plot for exercise 1
poisson =@(i,vbar) vbar.^(i-1).*exp(-vbar)./factorial(i-1)

i = 1:200;

figure(1)
clf
plot(i,poisson(i,10),'LineWidth',1.5)
hold on
plot(i,poisson(i,20),'LineWidth',1.5)
plot(i,poisson(i,50),'LineWidth',1.5)
plot(i,poisson(i,100),'LineWidth',1.5)
legend('v = 10','v = 20','v = 50', 'v = 100')
xlabel('i')
ylabel('x_i')
set(gca,'FontSize',16,'LineWidth',2)
