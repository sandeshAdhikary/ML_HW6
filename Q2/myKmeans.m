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




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Ends Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

