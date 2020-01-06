ncarbons = [2
4
6
8
10
12
14
16
18
20
22
24
30
40
50];

MP_celcius = [-183
-140
-95
-57
-30
-10
5
18
30
37
42
52
65.8
84
93];

close all
plot(ncarbons, MP_celcius, 'o', 'LineWidth', 1.5)
xlabel('Number of Carbon Atoms')
ylabel('Melting Point (^{\circ}C)')
set(gca,'XLim',[0 60],'YLim',[-150 150],'FontSize',16,'LineWidth',2)
set(gcf,'Position',[404.0000  464.5000  643.5000  345.5000])