%% ho_midterm_example.m  --  MATLAB code collected from the lab notebook sections:
%   - HO — Midterm Example
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== HO — Midterm Example =====

%% Part 2 — Run the function, save the data as `spacebee1`
%| function temptable = ctof(tinitial,tfinal)
%| % CTOF : function to convert temperature from C to F
%| % call syntax:
%| %   temptable = ctof(tinitial,tfinal);
%| %----------------
%|     C = [tinitial:tfinal]';     % Create a column vector C
%|     F = (9/5)*C + 32;           % compute corresponding F
%|     temptable = [C F];          % make a 2 column matrix of C & F
%| end

spacebee1 = ctof(0, 100);

%% 3ab. Slope and intercept
p = polyfit((spacebee1(:, 1), (spacebee1(:, 2), 1);
slope = p(1) = 1.8
intercept = p(2) = 32

%% 3c. Anonymous function for the next 4 points
f = @(x) p(1)*x + p(2)
values = [f(101) f(102) f(103) f(104)]

%% 4a. Build the Kelvin column (273.15 to 373.15)
spacebee2 = (273.15:373.15)'
size(spacebee2)

%% 4b. Combine with spacebee1
B = [spacebee1, spacebee2]
size(B)

%% 4c. Plot
plot(B)
title('Comparison of Celsius - Fahrenheit - Kelvin')
xlabel('Degrees from 0 to 104 Celsius')
ylabel('Comparison of Degrees')
legend({'Celcius', 'Farenheight', 'Kevin'})
axis equal

