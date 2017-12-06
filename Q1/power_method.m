function [v, lambda, loss_real, loss_est] = power_method ( X, batchsize, pass,real_w, est_w)

%This is a function that performs stochastic power iteration
%The input is X: N*d, all the input data
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
% X = X(1:batchsize,:);

%Set max_iter using passes
%1 pass = N/batchsize iterations
%so max_iter = pass * N/batchsize


%initialize
[n,d] = size(X);
max_iter = pass * n/batchsize

v = (1/sqrt(d))*ones(d,1);
loss_real = zeros(max_iter,1);
loss_est = zeros(max_iter,1);
% v_dist = zeros(max_iter,1);
Sigma = cov(X); %calculate covariance matrix

%iterate power method
for i = 1:max_iter
    X_new = datasample(X,batchsize,'Replace',false); 
    Sigma_new = cov(X_new);
    v_new = Sigma_new*v/norm(Sigma_new*v);
    v = v_new;
    loss_real(i,:) = log(norm(real_w - v)^2) ;
    loss_est(i,:) = log(norm(est_w - v)^2) ;
end

%calculate lambda
lambda = (transpose(v)*Sigma*v)/(transpose(v)*v); %Using Rayleigh Formula

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Ends Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end