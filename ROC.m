function [ROC] = ROC(priceSeries)
% Inputs: smoothed price series (best with 3-5period SMA)
%
% Outputs: dp/dt

%% Section 1: Differentiate
dp = diff(priceSeries); %rate of change of price - velocity
s = 0;
dp = vertcat(s,dp);

%% Section 2: output results
ROC = dp;

end