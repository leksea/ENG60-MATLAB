%% ho_trend_analysis.m  --  MATLAB code collected from the lab notebook sections:
%   - HO — Trend Analysis and Forecasting (Week 9)
%   - HO — Trend Analysis and Forecasting — Exercises
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== HO — Trend Analysis and Forecasting (Week 9) =====

%% H.1 Forecasting and Trend Projection
t = 1:12;
S = [300 305 315 340 346 352 364 390 397 404 418 445];
p = polyfit(t,S,1);
plot(t,S,'o')
hold on
plot(t,polyval(p,t),'-')
plot(13:14,polyval(p,13:14),'--')
hold off
xlabel('Period number')
ylabel('Sales per quarter (millions)')
title('Trend projection')

%% H.3 Worked Example: Johnson's Engine Plant
x = 2013:2019;
y = [23 18 35 39 35 37 49];
n = numel(x);
Xbar = mean(x)
Ybar = mean(y)
b = sum((x-Xbar).*(y-Ybar))/sum((x-Xbar).^2)
a = Ybar - b*Xbar

yhat = a + b*x
SSE = sum((y - yhat).^2)
err = sqrt(SSE/(n-1))
y2020 = a + b*2020

p = polyfit(x,y,1)

xx = 2013:2021;
yline = a + b*xx;

plot(x, y, 'd')
hold on
plot(xx, yline, 'r-')
plot(xx, yline + err, 'g--')
plot(xx, yline - err, 'g--')
plot(2020, y2020, 'r^')
hold off
xlabel('Year')
ylabel('Sales, $M')
title('Sales Forecast')
legend('Data', 'Regression line', '+/- error', '', 'Forecast 2020', 'Location', 'northwest')
grid on

%% H.4 Stats by Hand and by Excel
X = [30.8 31.7 30.1 31.6 30.3 31.7 32.1];
Y = [60.4 75.2 60.0 72.8 61.2 74.1 81.2];
mean(X)
mean(Y)
std(X)
std(Y)
C = cov(X,Y)
R = corrcoef(X,Y)

%% H.5 My Linear Regression Spreadsheet
x = 2013:2017;
y = [23 27 27 32 30];
p = polyfit(x,y,1);
fprintf('b = %.4f, a = %.2f\n', p(1), p(2))
SSE = sum((y - polyval(p,x)).^2)
err = sqrt(SSE/(numel(x)-1))
f2018 = polyval(p,2018)

b = 1.9000, a = -3800.70

%% ===== HO — Trend Analysis and Forecasting — Exercises =====

clear all
x = 2010:2019;
y = [1273 1332 1412 1498 1609 1819 1714 1729 1811 1892];
n = numel(x);

% least-squares regression line: Yhat = a + b*X
Xbar = mean(x);
Ybar = mean(y);
b = sum((x-Xbar).*(y-Ybar)) / sum((x-Xbar).^2)   % slope, $K per year
a = Ybar - b*Xbar                                % intercept

% 1. estimated sale for 2020
y2020 = a + b*2020                               % 1987.8

% 2. error of the estimate (lecture formula, divide by n-1)
yhat = a + b*x;
SSE = sum((y - yhat).^2)                         % 39631.4
err = sqrt(SSE/(n-1))                            % 66.36
fprintf('Forecast 2020: %.1f +/- %.1f ($K)\n', y2020, err)

% 3. average annual growth rate
growth_cagr = ((y(end)/y(1))^(1/(n-1)) - 1)*100  % 4.50 % per year
growth_mean = mean(diff(y)./y(1:end-1))*100      % 4.61 % per year

% plot
xx = 2010:2020;
yline = a + b*xx;
plot(x, y, 'd')
hold on
plot(xx, yline, 'r-')
plot(xx, yline + err, 'g--')
plot(xx, yline - err, 'g--')
plot(2020, y2020, 'r^')
hold off
xlabel('Year')
ylabel('Sale, $K')
title('John Crowne Clothing Store: Sales Forecast')
legend('Data', 'Regression line', '+/- error', '', 'Forecast 2020', 'Location', 'northwest')
grid on

clear all
price = [150.43 181.41 244.81 208.45 207.89 207.77 240.06 223.30 269.70 242.68 241.70 244.52 222.41];
t = 0:12;                      % month index: 0 = Dec 2018, 1 = Jan 2019, ..., 12 = Dec 2019
n = numel(t);

% least-squares trend line: Yhat = a + b*t
tbar = mean(t);
pbar = mean(price);
b = sum((t-tbar).*(price-pbar)) / sum((t-tbar).^2)   % slope, $ per month (5.37)
a = pbar - b*tbar                                    % intercept (189.73)

% trend line values and error (n-1, as in the lecture)
yhat = a + b*t;
SSE = sum((price - yhat).^2)                         % 6558.6
err = sqrt(SSE/(n-1))                                % 23.38

fprintf('Trend: %.2f $/month (%.2f %% of the average price per month)\n', b, b/pbar*100)
fprintf('Rise over the year: %.2f $\n', b*(n-1))

% plot
plot(t, price, 'o-')
hold on
plot(t, yhat, 'r-', 'LineWidth', 1.5)
plot(t, yhat + err, 'g--')
plot(t, yhat - err, 'g--')
hold off
set(gca, 'XTick', 0:12, 'XTickLabel', {'Dec18','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'})
xlabel('End of month')
ylabel('Tesla stock price, $')
title('Tesla (TSLA) 2019: Price Trend')
legend('Monthly price', 'Regression (trend) line', '+/- error', '', 'Location', 'northwest')
grid on

