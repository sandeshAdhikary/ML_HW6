function myROC (label, scores, mytitle)

%This is a function that plots ROC curve
%You should also plot the classifier with no power for comparison
%The input is label: N*1, ground truth class
%             scores: N*1, ...(figure it out yourself)
%             mytitle: str, the title of plot 
%         
%No output is required.
% Hint: there is a solution within 5 lines

figure  % Creates a figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Starts Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

scores = (scores - min(scores(:,1))); %shift to non-zero values
scores = scores/max(scores); %divide by the max confidence value

[FPR,TPR,AUC] = perfcurve(label,scores,1); %get true and false positive rates

plot(FPR,FPR,'--')
hold on
plot(FPR,TPR)
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Ends Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xlabel('False positive rate')
ylabel('True positive rate')
title(mytitle);
set(gca,'FontSize',18)  % sets FontSize to 18

end