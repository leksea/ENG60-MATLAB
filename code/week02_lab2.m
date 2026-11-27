%% week02_lab2.m  --  MATLAB code collected from the lab notebook sections:
%   - Week 2 — Lab 2
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== Week 2 — Lab 2 =====

%% T1-1 (repeated, parts c & d)
6*(10/13) + 18/(5*7) + 5*(9^2)

6*(35^(1/4)) + 14^0.35

%% Cylinder Problem
r = 8;
h = 15;
V = pi*(r^2)*h;
V = V + 0.2*V;
r = sqrt(V/(pi*h))

%% T1-2: Test Your Understanding
x = -5 + 9*i;
y = 6 - 2*i;
x + y
x*y
x/y

%% Arrays (Chapter 2)
u = [0:0.1:10];
w = 5*sin(u);
u(7)
w(7)
m = length(w)

%% T3-1: 25th Element
a = [cos(0):0.02:log10(100)];
m = length(a)
a(25)

%% Polynomial Roots
a = [1, -7, 40, -34];
roots(a)

%% T3-2: Polynomial 290 − 11x + 6x² + x³
a = [1, 6, -11, 290];
roots(a)

%% Plotting with MATLAB (Chapter 5)
x = 0:0.01:10;
y = sin(2*x);
plot(x, y, linewidth=2)
xlabel('x')
ylabel('y')
legend('y = sin2x')
grid on
title('Function y = sin2x')

%% T3-3: Plot $s = 2sin(3t+2) + \sqrt {(5t+1)}$ for $0 \le t \le 5$
t = 0:0.01:5;
s = 2*sin(3*t + 2) + sqrt(5*t + 1);
plot(t,s, linewidth=2, LineStyle="--", Color= 'r')
xlabel('t: time (seconds)')
ylabel('s: speed (feet per second)')
title('The function of s = 2sin(3t+2)+sqrt(5t+1)')
legend('y = s = 2sin(3t+2)+sqrt(5t+1)')
grid on

%% T3-4: $y = 4* \sqrt {6x+1}$ and $z = 5e^{0.3x} − 2x$ for $0 \le x \le 1.5$
x = 0:0.01:1.5;
y = 4*sqrt(6*x+1);
z = 5*exp(0.3*x) - 2*x;
plot(x,y, linestyle='-.')
xlabel('x: distance (meters)')
ylabel('y: force (newtons)'), ...
title('The function of y = 4sqrt(6x+1)')
grid on;
legend('y = 4sqrt(6x+1)')

plot(x,z, '--*', 'MarkerSize', 3, 'MarkerEdgeColor', 'y')
xlabel('x: distance (meters)'), ylabel('z: force (newtons)'), ...
title('The function of $z = 5e^{(0.3x)}-2x$', 'Interpreter', 'latex')
legend('$z = 5e^{(0.3x)}-2x$', 'Interpreter', 'latex')
grid on

x = 0:0.1:52;
y = 0.4*sqrt(1.8*x);
x = 0:0.1:52;
plot(x,y, 'vr')
xlabel('Distance (miles)')
ylabel('Height (miles)')
title('Rocket Height as a Function of Downrange Distance')
legend('Rocket!', 'Box', 'off', 'fontsize', 20, 'FontAngle', 'italic')

%% Script Files
% Example of a script file
% This program calculates the square root of the numbers 1 through 10.
% It displays a vector x with the numbers 1 through 10
% and the vector y with the square root.
x = 1:10
y = sqrt(x)

Sample_SQRT

% Example of a script file (PopTable.m)
% This program will display the population along with years.
yr = [1984 1986 1988 1990 1992 1994 1996];
pop = [127 130 136 145 158 178 211];
tableYP(:,1) = yr';
tableYP(:,2) = pop';
disp('        YEAR      POPULATION')
disp('                  (MILLIONS)')
disp('')
disp(tableYP)

PopTable

% Example of a script file (Power3input.m)
% This program will display "the power (cube or exponent) of 3" of the
% number entered by user.
n = 1:10;
c = n.^3;
number1 = input('Enter the points scored in the first game: ');
if number1 < 0
    display('Warning! Input invalid')
else
    number2 = number1^3
    disp(number2)
end

Power3input
Power3input
Power3input

% Example of a script file (sampleAVG.m)
% This program will display the values of the points from 3 games.
game1 = 75;
game2 = 93;
game3 = 68;
ave_points = (game1 + game2 + game3) / 3

sampleAVG

% Example of a script file (sampleGameInput.m)
% This script file calculates the average of points scored in 3 games.
% The points from each game are assigned to the variables by using the
% input command.
game1 = input('Enter the points scored in the first game: ');
game2 = input('Enter the points scored in the second game: ');
game3 = input('Enter the points scored in the third game: ');
ave_points = (game1 + game2 + game3) / 3
disp('')
disp('The average of points scored in a game is: ')
disp('')
disp(ave_points)

sampleGameInput

%% Narrative — Projectile Motion
% Example of a script file (ProjectileMotion.m)
% This script file calculates the horizontal velocity, vertical velocity,
% time in flight, horizontal distance of an object in projectile motion.
angle = pi/4;
speed = 50;
startingHeight = 0;
gravity = -9.81;
HorizontalVelocity = speed*cos(angle)
VerticalVelocity = speed*sin(angle)
TimeInFlight = VerticalVelocity/(abs(gravity/2))
HorizontalDistance = TimeInFlight*HorizontalVelocity

ProjectileMotion

