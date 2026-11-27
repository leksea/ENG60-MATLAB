%% ho_midterm.m  --  MATLAB code collected from the lab notebook sections:
%   - HO — Midterm
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== HO — Midterm =====

%% (1) Log History
diary('midterm_ay_log.txt')
diary on

%% (2) Third Sensor $\rightarrow$ MATLAB
[A]*([B]+[C])
[40 56]
[60 84]

[A]*[B]+[A]*[C]
[40 56]
[60 84]

A = numpy.array([[2,6],[3,9]])
B = numpy.array([[1,2],[3,4]])
C = numpy.array([[-5,5],[5,3]])

A * (B + C)
array([[-8, 42],
       [24, 63]])

A*B + A*C
array([[-8, 42],
       [24, 63]])

A = [2 6; 3 9];
B = [1 2; 3 4];
C = [-5 5; 5 3];

% true matrix multiplication -- MATLAB's default *
A*(B+C)
A*B + A*C

% elementwise multiplication -- MATLAB's .*
A.*(B+C)
A.*B + A.*C

%% (3) Altitude Vector D
D = 0:1000:30000;
disp(D)

%% (4) falt Function File
%| function temptable = falt(tinitial,inc,tfinal)
%| 	% FALT : function to convert temperature from altitude
%| 	% call syntax:
%| 	% temptable = falt(tinitial,inc,tfinal);
%| 	%--------------------
%|
%| 	A = (tinitial:inc:tfinal)';   % column vector A
%| 	F = 105 - (3.5*(A/1000));     % corresponding F
%| 	temptable = [A F];            % 2-column matrix of A & F
%| end

temptable = falt(0,1000,30000);
disp(round(temptable,1))

%% (5) Stats on Fahrenheit Column
Fcol = temptable(:,2);
Fmin = min(Fcol)
Fmax = max(Fcol)
Frange = range(Fcol)
Fmean = mean(Fcol)
Fmedian = median(Fcol)

%% (6) Add Celsius Column
Ccol = round((Fcol - 32) * 5/9, 2);
temptable = [temptable Ccol];
fprintf('%8.0f %8.1f %8.2f\n', temptable.')

%% (7) Plot
plot(D, Fcol, D, Ccol, 'LineWidth', 1.5)
title('Altitude vs Temperature', 'FontSize', 25)
xlabel('Altitude (feet)', 'FontAngle', 'italic', 'FontSize', 20)
ylabel('Temperature (degrees)', 'FontAngle', 'italic', 'FontSize', 20)
legend({'Fahrenheit','Celsius'}, 'FontAngle', 'italic', 'FontSize', 10, 'Box', 'off')
grid on;

diary off

