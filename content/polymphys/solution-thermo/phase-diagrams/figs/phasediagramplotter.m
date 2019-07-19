phi1 = 0:0.0001:1;
phi2 = 1-phi1;
G =@(X,N) X*phi1.*phi2 + phi1.*log(phi1) + phi2.*log(phi2)/N;
NN = 4;
Xs = [0 0.5 1 1.5 2 2.5 3 3.5 4];

figure(1)
clf
hold on
for i = 1:length(Xs)
plot(phi1,G(Xs(i),8))
end