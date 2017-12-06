function [ v, lambda, loss_real, loss_est] = oja_method ( X, eta, batchsize, pass ,real_w, est_w)
%This is a function that performs stochastic oja iteration
%The input is X: N*d, all the input data
%             eta: float, the step size
%             batchsize: integer, number of data for a covariance matrix
%             pass: integer, number of passes through data
%             real_w: d, the ground truth PC, to help you record the loss
%             est_w: d, the empirical PC, to help you record the loss
%         
%The output is v: d, the PC
%              lambda: float, largest eigenvalue
%              loss_real, loss_est: maxIter*1, record the loss path,
%              in order to generate the plot. Note you need to calculate
%              maxIter yourself

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Starts Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Use batchsize to reduce size of X
% X = X(batchsize,:);
Sigma = cov(X);

%initialize
    [n,d] = size(X);
    %1 pass = N/batchsize iterations so max_iter = pass * N/batchsize
    max_iter = pass * n/batchsize;
%     max_iter = 3;

    v = (1/sqrt(d))*ones(d,1);
    loss_real = zeros(max_iter,1);
    loss_est = zeros(max_iter,1);
    v_dist = zeros(max_iter,1);


%iterate oja method
    for i = 1:max_iter

        %create covariance matrix for iteration
            %randomly sample 2 data points without replacement
            sampled = datasample(X,2,'Replace',false); 
            x_i = transpose(sampled(1,:));
            x_j = transpose(sampled(2,:));
            %build A
            a_k = (1/2)*(x_i - x_j)*transpose((x_i - x_j));
            %update v
            v_new = (v + eta*a_k*v)/norm((v + eta*a_k*v));
            v = v_new;

            %update losses
            loss_real(i,:) = log(norm(real_w - v)^2) ;
            loss_est(i,:) = log(norm(est_w - v)^2) ;
            
    end

%calculate lambda
    lambda = (transpose(v)*Sigma*v)/(transpose(v)*v); %Using Rayleigh Formula


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Ends Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end