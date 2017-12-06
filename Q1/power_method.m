function [ v, lambda, loss_real, loss_est] = power_method ( X, batchsize, pass,real_w, est_w)

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
[n,d] = size(X);

d_o = (1/sqrt(d))*ones(n);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Ends Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end