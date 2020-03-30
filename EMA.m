function [EMA] = EMA(priceSeries, period)
%exponential moving average, priceSeries = vector, period = lookback 

%%

%create vector for SMA portion
s = priceSeries(1:period); %truncates first N terms
sp = SMA(s,period); %calculates SMA over first N terms
e = priceSeries(1+period:end); %truncates last terms for EMA

%iv = mean(s) %simple average of first n values to create initial value (iv) for EMA calcs
%priceSeries = priceSeries(period+1:end)' %edits priceSeries to clear values to be replaced w 0s and IV starting point
%priceSeries = [s iv priceSeries]' %creates vector for loop

empty = zeros(size(e)); %empty vector to fill
ema = vertcat(sp,empty); %joins vectors
a = 2/(period + 1);

for i = period:length(ema) 
    ema(i) = a*(priceSeries(i) - ema(i-1)) + ema(i-1); %EMA = a*(priceSeries - EMA prev day) + EMA prev day  
end

EMA = ema;

end

