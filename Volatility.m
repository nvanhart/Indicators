function [volatility] = Volatility(priceSeries)
%% Volatility calculator
%  The indicator takes the average of the price series of interest, then 
%  calculates the standard deviation over the given date range.  
%
%
%
%% 
avg = mean(priceSeries);
dev_squared = zeros(size(priceSeries));
for i =1:length(dev_squared)
dev_squared(i) = (priceSeries(i)-avg)^2;
end
dev_var = sum(dev_squared)/length(priceSeries);

volatility = zeros(size(priceSeries));


end