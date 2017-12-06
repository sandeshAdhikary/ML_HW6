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
I = ones(N, 1); %easier if indicator matrix initialized as ones

C = datasample(X,K); %initialize centers to be random K points

for iter = 1:maxIter
    
    %update the cluster assignment for each point
    for i = 1:N %loop through all points
        minClusterLoss = realmax; %highest possible value
        for k = 1:K %loop through all clusters
            newClusterLoss = norm(C(k,:) - X(i,:))^2;
            if newClusterLoss < minClusterLoss
                minClusterLoss = newClusterLoss;
                I(i) = k; %Update the label assigment for point i               
            end
        end
    end
    
    %update the centers for each cluster
    for k = 1:K %loop through all clusters
        mu = [0,0]; %initialize at 0, since we'll add to this
        clusterSize = 1; 
        for i = 1:N %loop through all data points
            if I(i) == k %If point i is in the kth cluster
                clusterSize = clusterSize + 1; %increment cluster size
                mu = mu + X(i,:); % add point i to mean calculation
            end
        end
        C(k,:) = mu/clusterSize; %set new cluster centers
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
    Loss(iter) = squareSum; %add to loss list
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Ends Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

