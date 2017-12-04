%Load data
load Q2.mat;

%Set parameters
K=4; %You should do K=2, 3, 4
max_iter = 100;

%Do clustering
[C, I, Loss] = myKmeans(X, K, max_iter);
%%
%Plot your result
figure
scatter(X(:,1),X(:,2),[],I);
hold on
plot(C(:,1),C(:,2),'xk','LineWidth',5,'MarkerSize',20);
title(strcat("Scatter of K=",int2str(K)))
set(gca,'FontSize',20)

figure
plot(Loss,'LineWidth',2);
title(strcat("Plot of K=",int2str(K)))
set(gca,'FontSize',20)