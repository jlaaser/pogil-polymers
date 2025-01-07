N = 33.33;
b_nm = 1.53;
b_m = b_nm/10^9;

kB = 1.380e-23;
T = 298;

f_nN = 0:0.0001:10;
f_N = f_nN/(10^9);

fbkT = f_N*b_m/(kB * T);

L=@(x) (exp(x) + exp(-x))./(exp(x)-exp(-x)) - 1./x;

h_m = N*b_m*L(fbkT);
h_nm = h_m*10^9;

plot(h_nm, f_nN, 'LineWidth',2)
ylabel('Force (nN)')
xlabel('End-to-End Distance (nm)')
set(gca,'LineWidth',2)