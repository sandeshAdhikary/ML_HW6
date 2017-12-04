clear
load spamdata.mat

%% Implement Adaboost with decision stump
% If you are not familiar with MATLAB machine learning toolbox, refer to
% https://www.mathworks.com/help/stats/framework-for-ensemble-learning.html#bsw8akh
% https://www.mathworks.com/help/stats/ensemble-algorithms.html#bsw8aue
% Hint: there is a solution within 5 lines
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Starts Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Ends Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Refer to 
%https://www.mathworks.com/help/stats/perfcurve.html#inputarg_posclass
%https://www.mathworks.com/help/stats/ensemble-algorithms.html#bsw8aue
%implement myROC function to plot the ROC curve
%Please figure out what is 'testing_set_scores' yourself
myROC(testing_set_label, testing_set_scores, 'Q3 a: ROC curve of Adaboost')

%% Implement random forest with decision trees
% Refer to
% https://www.mathworks.com/help/stats/treebagger.html
% Hint: there is a solution within 5 lines
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Starts Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Ends Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
myROC(testing_set_label, testing_set_scores2, 'Q3 b: ROC curve of random forest')

