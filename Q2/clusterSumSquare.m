%calculate the sum of within cluster sum of square distances to the centers
function [squareSum] = clusterSumSquare(X,C,I,K,N)
    squareSum = 0;
    for k = 1:K
        for i = 1:N
            if I(i) == k %if the point is in the cluster
                mu = C(I(i),:); %Pick the mean
                squareSum = squareSum + norm(mu - X(i,:))^2; %add to squareSum
            end
        end
    end
end
