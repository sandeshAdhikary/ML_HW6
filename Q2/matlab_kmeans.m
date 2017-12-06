load Q2.mat;
K = 3;

[I, C] = kmeans(X,K);


figure
scatter(X(:,1),X(:,2),[],I);
hold on
plot(C(:,1),C(:,2),'xk','LineWidth',5,'MarkerSize',20);
title(strcat('Matlab K means: K=',int2str(K)))
set(gca,'FontSize',20)