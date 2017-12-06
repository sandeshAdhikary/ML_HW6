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

minVal = min(scores);
maxVal = max(scores);

%if the scores have negative values(e.g. adaboost), shift negative values
%to positive
if(minVal < 0)
    scores = scores - minVal;
end

%if the scores have values greater than 1 (e.g. adaboost), scale by max 
% value
if(maxVal > 1)
    scores = scores/maxVal;
end


[FPR,TPR,AUC] = perfcurve(label,scores,1); %get true and false positive rates

plot(FPR,FPR,'r--')
hold on
plot(FPR,TPR,'b-o')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Ends Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xlabel('False positive rate')
ylabel('True positive rate')
title(mytitle);
set(gca,'FontSize',18)  % sets FontSize to 18

end