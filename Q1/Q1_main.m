load Q1.mat

%% Implement part a
% with the variance matrix S, you can solve 
%the true first principle componenet v_real
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Starts Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Do SVD of S, and pick the first column

% %Possibly only works with Positive Semi Definite matrices

%get all eigenvalues and eigenvectors
[V_s,D_s] = eig(S);

%find the column number of the max eigenvalue
[val maxCol_s] = max(max(D_s));
% 
% %pick the eigenvector corresponding to the max eigenvalue
v_real = V_s(:,maxCol_s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Ends Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% disp('The ground truth PC is')
% disp(v_real)

% %% Implement part b
% % with data X, you can solve 
% %the empirical first principle componenet v_est
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%         Your Code Starts Here         %%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%create the centered matrix
% [n,d] = size(X);
% X_cent = X;
% % X_cent = X - (1/n)*ones(n,n)*X;
% %get all eigenvalues and eigenvectors
% [U_cent,D_cent,Vt_cent] = svd(X_cent); %SVD decomposition of centered data matrix
% % UD_est = U_cent*D_cent;
% v_est = transpose(Vt_cent(1,:)); %First column of UD is the 1st principal comp.

S_est = cov(X);

%get all eigenvalues and eigenvectors
[V_Sest,D_Sest] = eig(S_est);

%find the column number of the max eigenvalue
[val maxCol_Sest] = max(max(D_Sest));
% 
% %pick the eigenvector corresponding to the max eigenvalue
v_est = V_Sest(:,maxCol_Sest);


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%         Your Code Ends Here         %%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% disp('The empirical PC is')
% disp(v_est)
% %% Power Iteration
% % you should implement this part in power_method.m
batchsize = length(X);
pass = 20;
% power_method(X, batchsize, pass ,v_real, v_est);
[v1, lambda1,loss_real1, loss_est1] = power_method(X, batchsize, pass ,v_real, v_est);
myplot('Q1 c: Optimization error',loss_real1)
myplot('Q1 c: Estimation error',loss_est1)
% 
% %% Oja Iteration
% % you should implement this part in oja_method.m
% batchsize = 2;
% pass = 1;
% eta = 0.1;
% [v2, lambda2,loss_real2, loss_est2] = oja_method(X, eta, batchsize, pass ,v_real, v_est);
% myplot('Q1 d: Optimization error',loss_real2)
% myplot('Q1 d: Estimation error',loss_est2)
% 
% 
function myplot(mytitle,y,x)
    figure
    if (nargin == 2)
        plot(y,'LineWidth',2,'MarkerSize',20);
    else
        plot(x,y,'LineWidth',2,'MarkerSize',20);
    end
    title(mytitle)
    set(gca,'FontSize',20)
end
