%function works for plotting purposes if bands are shifted by defined
%period. Function seems to yield odd zero value for upper band. Will try to
%correct.



function [ lower , middle, upper ] = Bollinger(data,period,numstd,dates) 
%data = price series vector
%period = desired historic period
%numstd = number of standard deviations
%dates = optional date vector for plotting purposes

lower = zeros(size(data)); % creates empty vector size of data
middle = zeros(size(data)); 
upper = zeros(size(data)); 

% middle 
for ii = period:length(middle) 
    tmp = data(ii-period+1:ii); 
    middle(ii) = sum(tmp) / period; 
    middle = transpose(middle); 
end 

% lower 
for ii = period:length(lower) 
    tmp = data(ii-period+1:ii); 
    lower(ii) = middle(ii) - std(tmp) * numstd; 
end 

% upper 
for ii = period:length(upper) 
    tmp = data(ii-period+1:ii); 
    upper(ii) = middle(ii) + std(tmp) * numstd; 
end 

t1 = table(lower,upper,middle);

if  (nargin==4)
    plot(dates,dates,'color',rgb('black'))
    hold on
    plot(dates+period,lower,'color',rgb('red'))
    plot(dates+period,middle,'color',rgb('red orange'))
    plot(dates+period,upper,'color',rgb('orange'))
     
 end
   
 end 