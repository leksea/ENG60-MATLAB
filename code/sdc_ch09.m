%% sdc_ch09.m  --  MATLAB code collected from the lab notebook sections:
%   - SDC Chapter 9 — Plotting and Data Visualization
%   - SDC Chapter 9 — Exercises
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== SDC Chapter 9 — Plotting and Data Visualization =====

%% 9.1 2D Plots and the Plot Window
x = 1:10;
y = x/2

x = 0:10;
y = x/2;
plot(x,y)

%% 9.4 Plots Tab, Multiple Series, Generate Code
x = 1:10;
y = sin(x);

x = 1:0.01:10;
y = sin(x);
z = cos(x);

plot(x,y,'DisplayName','y'); hold on; plot(x,z,'DisplayName','z'); hold off;

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(X1,YMatrix1);
set(plot1(1),'DisplayName','y');
set(plot1(2),'DisplayName','z');
box(axes1,'on');

% Create legend
legend(axes1,'show');

%% 9.6 Pie Charts
pie(Percentage)

explode = [0 0 1 0 0 0 0]

%% ===== SDC Chapter 9 — Exercises =====

%% Exercise 9.1
x = -3:0.1:3;
y = x.^2;
plot(x,y)

%% Exercise 9.2
x = -2:0.01:4;
y = 2*x - x.^2;
plot(x,y)

%% Exercise 9.3
x = 1:0.01:10;
y = sqrt(x - 1);
plot(x,y)

%% Exercise 9.4
x = -4:0.01:4;
y = x.^3 - 12*x;
plot(x,y)

%% Exercise 9.5
years = 2000:2015;
finland = finland(:)';        % name from the Import Tool, make it a row
plot(years, finland)
title('Mortality data for Finland')
xlabel('Year')
ylabel('Value from Mortality-1.xlsx')

