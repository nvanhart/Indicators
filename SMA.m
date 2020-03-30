function [sma] = SMA(price, period)
%simple moving average, price = vector, period = lookback range. See matlab
%help guide on trailing moving average of a vector

sma = movmean(price,[period-1 0]);

end

