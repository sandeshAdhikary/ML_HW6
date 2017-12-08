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

templ = templateTree('MaxNumSplits',1); %use decision stumps
ens = fitcensemble(testing_set,testing_set_label,'Method','AdaBoostM1','Learners',templ);
[test_predictions,testing_set_scores] = predict(ens,testing_set);

%only keep single column from testing_set_scores.
%the first column is the confidence for '0' classification
%which is just the negative of '1' classification here
testing_set_scores = testing_set_scores(:,2);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%         Your Code Ends Here         %%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Refer to 
% %https://www.mathworks.com/help/stats/perfcurve.html#inputarg_posclass
% %https://www.mathworks.com/help/stats/ensemble-algorithms.html#bsw8aue
% %implement myROC function to plot the ROC curve
% %Please figure out what is 'testing_set_scores' yourself
myROC(testing_set_label, testing_set_scores, 'Q3 a: ROC curve of Adaboost');
% 
% %% Implement random forest with decision trees
% % Refer to
% % https://www.mathworks.com/help/stats/treebagger.html
% % Hint: there is a solution within 5 lines
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%         Your Code Starts Here         %%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  mdl = TreeBagger(100,training_set,training_set_label);
 [test_predictions2,testing_set_scores2] = predict(mdl,testing_set);
 testing_set_scores2 = testing_set_scores2(:,2);
 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%         Your Code Ends Here         %%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
myROC(testing_set_label, testing_set_scores2, 'Q3 b: ROC curve of random forest')

