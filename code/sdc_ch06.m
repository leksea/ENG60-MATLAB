%% sdc_ch06.m  --  MATLAB code collected from the lab notebook sections:
%   - SDC Chapter 6 — Functions & Scripts
%   - SDC Chapter 6 — Exercises
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== SDC Chapter 6 — Functions & Scripts =====

%% 6.1 Comment Statements
% This is a comment
% The following equation will not be executed:
% x = 100 / sin(52)

%% 6.2 Scripts
f = 15;
ft = 8.2021;
rads = 0.7854;
d = ft * 0.3048;
theta = rad2deg(rads);
tau = f * d * sind(theta)

%% 6.3 Creating & Editing a Script
disp('in Newton-meters')

f = 12.5;
ft = 4.0056;
rads = 0.5236;
Torque

d = ft * 0.3048;
theta = rad2deg(rads);
tau = f * d * sind(theta)
disp('in Newton-meters')

%% 6.4 Making a Script Interactive
f = input('Enter force in Newtons: ');
ft = input('Enter distance from the axis in feet: ');
rads = input('Enter angle of force in radians: ');

f = input('Enter force in Newtons: ');
ft = input('Enter distance from the axis in feet: ');
rads = input('Enter angle of force in radians: ');
d = ft * 0.3048;
theta = rad2deg(rads);
tau = f * d * sind(theta)
disp('in Newton-meters')

Torque

Enter force in Newtons: 15
Enter distance from the axis in feet: 8.2021
Enter angle of force in radians: 0.7854

%% 6.5 Functions: Built-in & Custom
which blkdiag

%% 6.6 Function File Format
%| function toast()
%| function toast
%| function toe = tic_tac(first_square)
%| function [x, y, z] = angry_cat(meow, hiss)

%% 6.7 From Algorithm to Code
edit matrixMax

%| function biggie = matrixMax(A)
%|     % Variables
%|     biggie = A(1,1);

    rows = size(A,1);
    columns = size(A,2);

    % Walk the matrix
    for r = 1:rows
        for c = 1:columns
        end
    end

%| function biggie = matrixMax(A)
%|     % Variables
%|     biggie = A(1,1);
%|     rows = size(A,1);
%|     columns = size(A,2);
%|
%|     % Walk the matrix
%|     for r = 1:rows
%|         for c = 1:columns
%|             if A(r,c) > biggie   % Is A(r,c) the largest yet?
%|                 biggie = A(r,c);
%|             end
%|         end
%|     end
%| end

rng('default')
T = randi(15,5,7);
matrixMax(T)

    % Walk the matrix
    for r = 1:rows
        for c = 1:columns
            fprintf('r = %d, c = %d \n', r, c);
            if A(r,c) > biggie   % Is A(r,c) the largest yet?
                biggie = A(r,c);
            end
        end
    end

matrixMax(T)

r = 1, c = 1
r = 1, c = 2
r = 1, c = 3
r = 1, c = 4
r = 1, c = 5
r = 1, c = 6
r = 1, c = 7
r = 2, c = 1
...
r = 5, c = 7

%% 6.8 Return Values
%| function [x, y, Z] = manyRetVals()

[a, b, C] = manyRetVals();

[a, b] = manyRetVals();    % gets x, y — Z lost
[a] = manyRetVals();       % gets x only

%| function [ output_args ] = untitled3( input_args )
%| %UNTITLED3 Summary of this function goes here
%| %   Detailed explanation goes here
%|
%| end

%| function [dimensions, rows, columns, maxval] = matrix_facts(A)
%| % Accepts a matrix and returns
%| %   - number of dimensions
%| %   - number of rows
%| %   - number of columns
%| %   - highest value in the matrix
%|
%|     dimensions = ndims(A);
%|     rows = size(A,1);
%|     columns = size(A,2);
%|     maxval = matrixMax(A);
%| end

clear
rng('default')
A = randi(15, 5, 7);
[dim, r, c, mx] = matrix_facts(A)

%% 6.9 Local Functions
maxval = matrixMax(A);

maxval = myMax(A);

%| function [dimensions, rows, columns, maxval] = matrix_facts(A)
%| % Accepts a matrix and returns
%| %   - number of dimensions
%| %   - number of rows
%| %   - number of columns
%| %   - highest value in the matrix
%|
%|     dimensions = ndims(A);
%|     rows = size(A,1);
%|     columns = size(A,2);
%|     maxval = myMax(A);
%| end
%|
%| function max_value = myMax(M)
%| % Finds the largest value in a matrix
%|
%|     v = max(M);
%|     max_value = max(v);
%| end

[dim, r, c, mx] = matrix_facts(A)

%% 6.10 Variable Scope
clc
clear
local_var = 1000;
a = logical(1);
b = 57;
c = 'autumn leaves';
X = magic(4);

%| function scope()
%|     local_var = 20;
%|     local_var = local_var + 10;
%| end

scope

2       local_var = 20;
K>>

local_var

global b;

global b;
b = randi(2000, 13, 22);

global b;    % Bring the variable into the function
var1 = b;    % Use the variable
b = var2;    % Set the variable

%% 6.11 Recursion
%| function fact = recurse(n)
%|     if n == 1
%|         fact = 1;
%|     else
%|         fact = n * recurse(n-1);
%|     end
%| end

recurse(4)

%% 6.12 Persistent Variables
%| function f = fthw(x)
%|     persistent y;
%|     if x == 1
%|         y = 1;
%|     else
%|         y = y * x;
%|     end
%|     f = y;
%| end

fthw(1)
fthw(2)
fthw(3)
fthw(4)

%% ===== SDC Chapter 6 — Exercises =====

%% Exercise 6.1
%| function Vt = terminalVelocity(planet)
%| % Terminal velocity (cm/s) of a 2.5 cm, 65.4710 g sphere on a given planet
%|     switch lower(planet)
%|         case 'mars'
%|             gravity = 371;
%|             atmosphericDensity = 0.000020;
%|         case 'saturn'
%|             gravity = 1044;
%|             atmosphericDensity = 0.00019;
%|         case 'neptune'
%|             gravity = 1115;
%|             atmosphericDensity = 0.00045;
%|         otherwise
%|             gravity = 981;
%|             atmosphericDensity = 0.001217;
%|     end
%|     dia = 2.5;
%|     area = pi*((dia/2)^2);
%|     mass = 65.4710;
%|     C = 0.47;
%|     Vt = sqrt((2*mass*gravity)/(atmosphericDensity*area*C));
%| end

terminalVelocity('NEPTUNE')
terminalVelocity('mars')

%% Exercise 6.2
%| function [biggie, loc] = matrixMax(A)
%|     % Variables
%|     biggie = A(1,1);
%|     loc = [1 1];
%|     rows = size(A,1);
%|     columns = size(A,2);
%|
%|     % Walk the matrix
%|     for r = 1:rows
%|         for c = 1:columns
%|             if A(r,c) >= biggie   % >= keeps the LAST max
%|                 biggie = A(r,c);
%|                 loc = [r c];
%|             end
%|         end
%|     end
%| end

T = [3 9 1; 9 2 9; 4 5 6];
[mx, where] = matrixMax(T)

%% Exercise 6.3
%| function tau = torque1(f, d, dUnit, theta, aUnit)
%| % Torque in N-m. dUnit: 'f' feet / 'm' meters. aUnit: 'r' radians / 'd' degrees
%|     if dUnit == 'f'
%|         d = d * 0.3048;      % feet -> meters
%|     end
%|     if aUnit == 'd'
%|         tau = f * d * sind(theta);
%|     else
%|         tau = f * d * sin(theta);
%|     end
%| end

torque1(15, 8.2021, 'f', 0.7854, 'r')
torque1(15, 2.5, 'm', 45, 'd')

%% Exercise 6.4
%| function tau = torque2(M, dUnit, aUnit)
%| % M = [force, distance, angle] per row. Returns a column of torques (N-m)
%|     f = M(:,1);
%|     d = M(:,2);
%|     theta = M(:,3);
%|     if dUnit == 'f'
%|         d = d * 0.3048;
%|     end
%|     if aUnit == 'd'
%|         tau = f .* d .* sind(theta);
%|     else
%|         tau = f .* d .* sin(theta);
%|     end
%| end

M = [15 8.2021 0.7854; 12.5 4.0056 0.5236];
torque2(M, 'f', 'r')

%% Exercise 6.5
%| function out = reversed(s)
%| % Recursively reverses a character array
%|     n = length(s);
%|     if n <= 1
%|         out = s;
%|     else
%|         rest = extractBetween(s, 1, n-1);   % 1x1 cell
%|         out = [s(n), reversed(rest{1})];
%|     end
%| end

reversed('autumn leaves')

