function [C, I, Loss] = myKmeans(X, K, maxIter)

%This is a function that performs K-means clustering
%The input is X: N*d, the input data
%             K: integer, number of clusters
%             maxIter: integer, number of iterations
%         
%The output is C: K*d the center of clusters
%              I: N*1 the label of data
%              Loss: maxIter*1 within-cluster sum of squares (WCSS) in each
%              step

% number of vectors in X
[N, d] = size(X);

% construct indicator matrix (each entry corresponds to the cluster
% of each point in X)
I = zeros(N, 1);

% construct centers matrix
C = zeros(K, d);

% the list to record error
Loss = zeros(maxIter,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Starts Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I = ones(N, 1);

C = datasample(X,K); %initialize centers to be random K points
% C = X(1:K,:); %initialize centers to be first K points

for iter = 1:maxIter
    
    %update the cluster assignment for each point
    for i = 1:N
        minClusterLoss = realmax;
        for k = 1:K
            newClusterLoss = norm(C(k,:) - X(i,:))^2;
            if newClusterLoss < minClusterLoss
                minClusterLoss = newClusterLoss;
                I(i) = k; %Update the label assigment for point i               
            end
        end
    end
    
    %update the centers for each cluster
    for k = 1:K
        mu = [0,0];
        clusterSize = 1;
        for i = 1:N
            if I(i) == k %If point i is in the kth cluster
                clusterSize = clusterSize + 1; %increment cluster size
                mu = mu + X(i,:); % add point i to mean calculation
            end
        end
        C(k,:) = mu/clusterSize;
    end
    
    %update the loss
    squareSum = 0;
    for k = 1:K
        for i = 1:N
            if I(i) == k %if the point is in the cluster
                mu = C(I(i),:); %Pick the mean
                squareSum = squareSum + norm(mu - X(i,:))^2; %add to squareSum
            end
        end
    end    
    Loss(iter) = squareSum;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Ends Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

