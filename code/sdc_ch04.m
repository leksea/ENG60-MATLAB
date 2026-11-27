%% sdc_ch04.m  --  MATLAB code collected from the lab notebook sections:
%   - SDC Chapter 4 — Looping & Conditionals
%   - SDC Chapter 4 — Exercises
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== SDC Chapter 4 — Looping & Conditionals =====

%% 4.1 Using the MATLAB Editor
edit loops

%| function loops()
%|
%| end

%% 4.3 while Loops
%| function loops()
%|     x = 0;
%|     while x < 6
%|         x = x + 1;
%|         fprintf('x = %d\n',x);
%|     end
%| end

loops

x = 1
x = 2
x = 3
x = 4
x = 5
x = 6

%| function loops()
%|     x = 0;
%|     while x < 6
%|         x = x + 1;
%|         fprintf('x = %d\n',x);
%|     end
%|
%|     count = 0;
%|     runningSum = 0;
%|     evenNum = 0;
%|     while count < 1000000
%|         evenNum = evenNum + 2;
%|         runningSum = runningSum + evenNum;
%|         count = count + 1;
%|     end
%|     fprintf('The sum is %d\n', runningSum);
%| end

loops

x = 1
x = 2
x = 3
x = 4
x = 5
x = 6
The sum is 1000001000000

%% 4.4 for Loops
index = 1:4

num = 12;
firstValue = 2;
lastValue = 8;
index = firstValue : lastValue
index = ceil(-2.4) : 5
index = 3/8 + num : 2*7.5

%| function forloops()
%|     x = 10;
%|     loopCounter = 1;
%|     for i = 1:3
%|         fprintf("Entering loop #" + loopCounter);
%|
%|         loopCounter = loopCounter + 1;
%|
%|         fprintf("\n\ti (loop index) = " + i);
%|         fprintf("\n\tx (on entry) = " + x);
%|
%|         x = x + i;
%|
%|         fprintf("\n\tx (on exit) = " + x);
%|         fprintf("\n");
%|     end
%| end

i
j


forloops

Entering loop #1
	i (loop index) = 1
	x (on entry) = 10
	x (on exit) = 11
Entering loop #2
	i (loop index) = 2
	x (on entry) = 11
	x (on exit) = 13
Entering loop #3
	i (loop index) = 3
	x (on entry) = 13
	x (on exit) = 16

%% 4.5 Step Values & Index Arrays
for i = 1 : 0.3 : 3

forloops

Entering loop #1
	i (loop index) = 1
	x (on entry) = 10
	x (on exit) = 11
Entering loop #2
	i (loop index) = 1.3
	x (on entry) = 11
	x (on exit) = 12.3
Entering loop #3
	i (loop index) = 1.6
	x (on entry) = 12.3
	x (on exit) = 13.9
Entering loop #4
	i (loop index) = 1.9
	x (on entry) = 13.9
	x (on exit) = 15.8
Entering loop #5
	i (loop index) = 2.2
	x (on entry) = 15.8
	x (on exit) = 18
Entering loop #6
	i (loop index) = 2.5
	x (on entry) = 18
	x (on exit) = 20.5
Entering loop #7
	i (loop index) = 2.8
	x (on entry) = 20.5
	x (on exit) = 23.3

i = 1 : 0.3 : 3

x = 10
for i = 2 : -0.4 : 1
    x = x + 1;
end
x

for i = [1, 1.3, 1.6, 1.9, 2.2, 2.5, 2.8]

indexArray = 1:200;
for i = indexArray

%% 4.6 if & if-else Statements
if (strcmp(planet, 'Mars'))
    gravity = 3.711;
    atmosphericDensity = 0.020;
end

edit branches

%| function branches()
%|     planet = 'Earth';
%|     if strcmp(planet, 'Mars')
%|         gravity = 3.711;
%|         atmosphericDensity = 0.020;
%|     else
%|         gravity = 9.798;
%|         atmosphericDensity = 1.2170;
%|     end
%|     disp("Gravity = " + gravity);
%| end

branches

Gravity = 9.798

branches

Gravity = 3.711

%% 4.8 Terminal Velocity with Conditionals
%| function terminalVelocityConditionals(planet)
%|
%| % program to calculate terminal velocity
%| % Vt = terminal velocity
%| % dia = diameter of sphere (in cm)
%| % mass = mass of the falling object(65.4710 grams)
%| % gravity = acceleration due to gravity (in cm/sec^2)
%| % atmosphericDensity = density of the medium through which the object is
%| % falling (in g/cm^3)
%| % area = cross-sectional area of the object,
%| %        for a sphere it is pi*radius^2
%| % C = drag coefficient (sphere is approx 0.47)
%| %
%| % Set planet in the Command Window before running, e.g.
%| %   planet = 'Neptune'
%| % planet = 'Mars'
%|
%|     if ~nargin
%|         planet  = 'Neptune';
%|     end
%|
%|     switch planet
%|         case 'Mars'
%|             gravity = 371;
%|             atmosphericDensity = 0.000020;
%|         case 'Saturn'
%|             gravity = 1044;
%|             atmosphericDensity = 0.00019;
%|         case 'Neptune'
%|             gravity = 1115;
%|             atmosphericDensity = 0.00045;
%|         otherwise   % Earth
%|             gravity = 981;
%|             atmosphericDensity = 0.001217;
%|     end % end switch
%|     dia = 2.5;
%|     area = pi*((dia/2)^2);
%|     mass = 65.4710;
%|     C = 0.47;
%|     Vt = sqrt((2*mass*gravity)/(atmosphericDensity*area*C));
%|     fprintf('For %s, terminal velocity is %.4f cm/s units \n', planet, Vt);
%| end % end of function

terminalVelocityConditionals

if strcmp (planet, 'Mars')
    gravity = 371;
    atmosphericDensity = 0.000020;
elseif strcmp (planet, 'Saturn')
    gravity = 1044;
    atmosphericDensity = 0.00019;
elseif strcmp (planet, 'Neptune')
    gravity = 1115;
    atmosphericDensity = 0.00045;
else
    gravity = 981;
    atmosphericDensity = 0.001217;
end

%% 4.9 Loops & Conditionals: Make a Negative
edit negative

%|   function negative()
%|       % Specify the image file
%|
%|       imageFile = fullfile('Users', 'alexandrayakovleva', 'Documents', 'WVC', 'Matlab', 'Week4', 'submission', 'media',  'pretty.png');
%|       % Read the pixel information into an array
%|       ImageMap = imread(imageFile);
%|       % Get the height and width of the image
%|       rows = size(ImageMap,1);
%|       columns = size(ImageMap,2);
%|       % Ensure that the image is valid
%|       if (rows > 0 && columns > 0)
%|           y = 1;
%|           % Process one row at a time
%|           while y <= rows
%|               % Look at each column in that row
%|               for x = 1:columns
%|                   % Get each red, green, and blue value
%|                   % and change the value to its opposite
%|                   for i = 1:3
%|                       ImageMap(y, x, i) = 255 - ImageMap(y, x, i);
%|                   end
%|               end
%|               % Go to the next row and do it all over again
%|               y = y + 1;
%|           end
%|           % Write the information back to the image file
%|           imwrite(ImageMap, imageFile);
%|       else
%|           disp("The image is invalid");
%|       end
%|   end

negative

%% 4.10 Exiting a Loop
edit loops2

%| function loops2()
%|     for x=1:10
%|         disp(x);
%|     end
%| end

loops2

%| function loops2()
%|     for x=1:10
%|         if x == 6
%|             break;
%|         end
%|         disp(x);
%|     end
%| end

loops2

%| function loops2()
%|     for x=1:10
%|         if x == 6
%|             continue;
%|         end
%|         disp(x);
%|     end
%| end

loops2

%% 4.11 Stopping an Infinite Loop
%| function loops3()
%|     while 1
%|         disp("All work and no play makes Jack a dull boy");
%|     end
%| end

loops3

All work and no play makes Jack a dull boy
All work and no play makes Jack a dull boy
All work and no play makes Jack a dull boy
...

%% ===== SDC Chapter 4 — Exercises =====

%% Exercise 4.1
for x = 1 : -2 : 10
    disp(x);
end

1 : -2 : 10

%% Exercise 4.2
x = 1;
while x <= 10
    disp(x);
    x = x + 1;
end

for x = 1:10
    disp(x);
end

%% Exercise 4.3
if strcmp(hero, 'Superman')
    villain = 'Bizarro';
elseif strcmp(hero, 'The Thing')
    villain = 'Fin Fang Foom';
elseif strcmp(hero, 'Hellboy')
    villain = 'Baba Yaga';
else
    villain = 'Dracula';
end

switch hero
    case 'Superman'
        villain = 'Bizarro';
    case 'The Thing'
        villain = 'Fin Fang Foom';
    case 'Hellboy'
        villain = 'Baba Yaga';
    otherwise
        villain = 'Dracula';
end

hero = 'Hellboy';
switch hero
    case 'Superman'
        villain = 'Bizarro';
    case 'The Thing'
        villain = 'Fin Fang Foom';
    case 'Hellboy'
        villain = 'Baba Yaga';
    otherwise
        villain = 'Dracula';
end
villain

%% Exercise 4.4
% factorial150.m
n = 150;
if n < 0
    disp("Factorial is undefined for negative numbers");
else
    result = 1;
    for k = 2:n
        result = result * k;
    end
    result
    factorial(n)
end

factorial150

%% Exercise 4.5
x = 0;
while x ~= 3
    x = x + 2;
end

x = 0;
while x ~= 3
    x = x + 2;
    if x > 100
        disp("x skipped past 3 — stopping");
        break;
    end
end
x

x skipped past 3 — stopping

