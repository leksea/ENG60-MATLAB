%% pratap_ch02.m  --  MATLAB code collected from the lab notebook sections:
%   - Pratap Chapter 2 — Tutorial Lessons
%   - Pratap Chapter 2 — Exercises
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== Pratap Chapter 2 — Tutorial Lessons =====

%% 2.2 Lesson 2: Arrays of Numbers
x = [1 2 3]
b = x + y

a = x.*z
b = 2*a
x = linspace(0,10,5)
y = sin(x);
z = sqrt(x).*y

%% 2.3 Lesson 3: Simple Plots
theta = linspace(0,2*pi,100);
x = cos(theta);
y = sin(theta);
plot(x,y)
axis('equal');
xlabel('x')
ylabel('y')
title('Circle of unit radius')
print

%% 2.4 Lesson 4: Script Files
% CIRCLE - A script file to draw a unit circle
% File written by Rudra Pratap. Last modified 5/28/98
% --------------------------
theta=linspace(0,2*pi,100);     % create vector theta
x=cos(theta);                   % generate x-coordinates
y=sin(theta);                   % generate y-coordinates
plot(x,y);                      % plot the circle
axis('equal');                  % set equal scale on axes
title('Circle of unit radius')  % put a title

help circle
circle

 CIRCLE - A script file to draw a unit circle
 File written by Rudra Pratap. Last modified 6/28/98.
 --------------------------

%% 2.5 Lesson 5: Function Files
%| function [x,y] = circlefn(r);
%| % CIRCLEFN - Function to draw a circle of radius r.
%| % File written by Rudra Pratap on 9/17/94. Last modified 7/1/98
%| % Call syntax:   [x,y] = circlefn(r);  or just:  circlefn(r);
%| % Input:         r = specified radius
%| % Output:        [x,y] = the x- and y-coordinates of data points
%| theta=linspace(0,2*pi,100);        % create vector theta
%| x = r*cos(theta);                  % generate x-coordinates
%| y = r*sin(theta);                  % generate y-coordinates
%| plot(x,y);                         % plot the circle
%| axis('equal');                     % set equal scale on axes
%| title(['Circle of radius r =',num2str(r)])

R = 5;
[x,y] = circlefn(R);
[cx,cy] = circlefn(2.5);
circlefn(1);
circlefn(R^2/(R+5*sin(R)));

%% 2.6 Lesson 6: Arrays and Matrices
A = [1 2 3; 4 5 6; 7 8 8]

A(2,3)
A(3,3) = 9
B = A(2:3,1:3)
B = A(2:3,:)
B(:,2) = []

A = [1 2 3; 4 5 6; 7 8 9];
x = A(1,:)'
x'*x
x*x'
A*x
A^2
A.^2

%% 2.7 Lesson 7: Anonymous Functions
f = @(x) x^3 - 3*x^2 + x*log(x-1) + 100
f(0)
f(1)
values = [f(0) f(1) f(2) f(10)]

x = [0 1 2 10];
f(x)

Incorrect dimensions for raising a matrix to a power. Check that the matrix is square and the power is a scalar. To perform elementwise matrix powers, use '.^'.

f = @(x) x.^3 - 3*x.^2 + x.*log(x-1) + 100;
f(x)
x = linspace(-10,10);
plot(x,f(x))

g = @(a,x) a(4)*x.^3 + a(3)*x.^2 + a(2)*x + a(1);
a = [-1 2 1 -1];
fplot(g(a),[-2 2])

Not enough input arguments.

g = @(x) a(4)*x.^3 + a(3)*x.^2 + a(2)*x + a(1);
fplot(g,[-2 2])
g_integral = quad(g,0,1)

%% 2.8 Lesson 8: Symbolic Computation
syms x y
f = (x+y)^3
expand(f)
factor(ans)
z = sin(x+y);
expand(z)
subs(z, y, pi-x)
diff(z,x)
z_xx = diff(z,x,2)
int(z,x,0,pi/2)

syms a b x y
expr1 = a*x + b*y - 3;
expr2 = -x + 2*a*y - 5;
[x,y] = solve(expr1, expr2)
subs(expr1)
simplify(ans)
pretty(subs(expr2))

%% 2.9 Lesson 9: Importing and Exporting Data
theta = linspace(0,2*pi,201);
r = sqrt(abs(2*sin(4*theta)));
x = r.*cos(theta);
y = r.*sin(theta);
f = char('sqrt(abs(2*sin(4*theta)))');
save xydata x y f
whos
clear all
whos
load xydata
whos
plot(x,y), axis('square');
f
clear all
load xydata x y
whos
clear all
size(x)

% TempData: Script file containing data on monthly maximum temperature
Sl_No = [1:12]';
Month = char('January','February','March','April','May','June',...
   'July','August','September','October','November','December');
Ave_Tmax = [22 25 30 34 36 30 29 27 24 23 21 20]';

clear all
TempData
whos
Month

  Name         Size            Bytes  Class     Attributes

  Ave_Tmax    12x1                96  double
  Month       12x9               216  char
  Sl_No       12x1                96  double

[A,txt,raw] = xlsread('TempData.xls');
raw
sn = cell2mat(raw(2:13,1));
months = char(raw{2:13,2});
T = cell2mat(raw(2:13,3));
bar(sn,T)

%% 2.11 Lesson 11: Publishing Reports
%% Publishing Reports - A Simple Example
%% A Spiral Plot
% Let us plot a spiral given by
% r(t) = exp(-theta/10), 0<=theta<=10*pi

%% Create vectors theta and r
theta = linspace(0,10*pi,200);   % 200 linearly spaced points between 0 and 10*pi
r = exp(-theta/10);              % compute r

%% Now plot theta vs r using polar plot
polar(theta,r)

publish('spiralplot','html')
cd html; open spiralplot.html

%% ===== Pratap Chapter 2 — Exercises =====

%% Exercise 1.1
2^5/(2^5-1)
(1-1/2^5)^-1
3*(sqrt(5)-1)/(sqrt(5)+1)^2 - 1
area = pi*(pi^(1/3)-1)^2

%% Exercise 1.2
exp(3)
log(exp(3))
log10(exp(3))
log10(10^5)
exp(pi*sqrt(163))
x = log(17)/log(3)
3^x

%% Exercise 1.3
sin(pi/6)
cos(pi)
tan(pi/2)
(sin(pi/6))^2 + (cos(pi/6))^2
x = 32*pi; y = (cosh(x))^2 - (sinh(x))^2

%% Exercise 1.4
(1+3i)/(1-3i)
exp(i*pi/4)
cos(pi/4) + i*sin(pi/4)
exp(pi/2*i)
exp(pi/2i)

%% Exercise 2.1
x = [0 1.5 3 4 5 7 9 10];
y = 0.5*x - 2

%% Exercise 2.2
t = 1:10;
x = t.*sin(t)
y = (t-1)./(t+1)
z = sin(t.^2)./(t.^2)

%% Exercise 2.3
theta = [0; pi/4; pi/2; 3*pi/4; pi; 5*pi/4];
r = 2;
x = r*cos(theta);
y = r*sin(theta);
x.^2 + y.^2
sqrt(x.^2 + y.^2)

%% Exercise 2.4
r = 0.5;
n = 0:10; x = r.^n; s1 = sum(x)
n = 0:50; x = r.^n; s2 = sum(x)
n = 0:100; x = r.^n; s3 = sum(x)
limit = 1/(1-r)

%% Exercise 2.5
v = 0:0.2:12;
M = [sin(v); cos(v)];
size(v)
size(M)
M(:,1:10)'

%% Exercise 3.1
x = linspace(0,2*pi,100);
plot(x,sin(x))
xlabel('x'), ylabel('sin(x)')
title('Plot created by Alexandra Yakovleva')

%% Exercise 3.2
x = linspace(0,2*pi,100);
y = sin(x);
plot(x,y,'o')
xlabel('x'), ylabel('sin(x)')
figure
plot(x,y,x,y,'o')
xlabel('x'), ylabel('sin(x)')

%% Exercise 3.3
for N = [10 50 100]
    x = linspace(0,4*pi,N);
    y = exp(-0.4*x).*sin(x);
    figure
    plot(x,y)
    title(['N = ' num2str(N) ' points'])
end

%% Exercise 3.4
t = linspace(0,20,100);
plot3(sin(t),cos(t),t)
grid on
xlabel('x'), ylabel('y'), zlabel('z')

%% Exercise 3.5
more on
help plot

%% Exercise 3.6
x = 0:10:1000;
y = x.^3;
semilogx(x,y)
figure, semilogy(x,y)
figure, loglog(x,y)

%% Exercise 3.7
x = linspace(0,pi,100);
y = cos(x);
z = 1 - x.^2/2 + x.^4/24;
plot(x,y,x,z,'--')
legend('cos(x)','z')

% same thing with hold on
figure
plot(x,y)
hold on
plot(x,z,'--')
hold off

%% Exercise 3.8
x = 1:5;
h = [3 7 4 9 2];
subplot(2,2,1), bar(x,h), title('bar')
subplot(2,2,2), stairs(x,h), title('stairs')
subplot(2,2,3), stem(x,h), title('stem')
subplot(2,2,4), pie(h), title('pie')

%% Exercise 3.9
figure, axis([0 10 0 10]), hold on
[px,py] = ginput(15);              % click the outline of your lizard, Enter to stop
t  = 1:numel(px);
tt = linspace(1,numel(px),400);
plot(spline(t,px,tt), spline(t,py,tt))
axis equal

%% Exercise 4.1
% CIRCLE - script file to draw a unit circle with its center marked
% File written by Alexandra Yakovleva
% -----------------------------------
theta = linspace(0,2*pi,100);   % create vector theta
x = cos(theta);                 % generate x-coordinates
y = sin(theta);                 % generate y-coordinates
plot(x,y,0,0,'+');              % plot the circle and its center
axis('equal');                  % set equal scale on axes
title('Circle of unit radius')  % put a title

%% Exercise 4.2
% CIRCLE - script file to draw a unit circle
% File written by Alexandra Yakovleva
% -----------------------------------
r = input('Enter the radius of the circle: ');
theta = linspace(0,2*pi,100);   % create vector theta
x = r*cos(theta);               % generate x-coordinates
y = r*sin(theta);               % generate y-coordinates
plot(x,y,0,0,'+');              % plot the circle and its center
axis('equal');                  % set equal scale on axes
title('Circle of given radius r')

circle

Enter the radius of the circle: 3

%% Exercise 4.3
circle
who
whos
ans = [theta' x' y'];
ans(1:5,:)

Your variables are:

r      theta  x      y

  Name       Size            Bytes  Class     Attributes

  r          1x1                 8  double
  theta      1x100             800  double
  x          1x100             800  double
  y          1x100             800  double

%% Exercise 4.4
type circle.m

%% Exercise 4.5
lookfor unit

circle        - CIRCLE - script file to draw a unit circle
(plus many built-in functions with 'unit' in their H1 line)

%% Exercise 4.6
% HI_THERE - script file to begin your day
% To execute, just type Hi_there
% File written by Alexandra Yakovleva
% -----------------------------------
disp('Hello Sasha, how is life?')
disp(' ')                          % display a blank line
disp('Today is...')
disp(date)                         % display date
time = fix(clock);                 % get time as integers
hourstr = int2str(time(4));        % get the hour
minstr = int2str(time(5));         % get the minute
if time(5) < 10                    % if minute is, say 5,
    minstr = ['0',minstr];         % write it as 05
end
timex = [hourstr ':' minstr];      % create the time string
disp(' ')
disp('And the time is..')
disp(timex)                        % display the time

Hello Sasha, how is life?

Today is...
18-Nov-2026

And the time is..
16:45

%% Exercise 5.1
help function

%% Exercise 5.2
%| function temptable = ctof(tinitial,tfinal)
%| % CTOF - function to convert temperature from C to F
%| % call syntax:
%| %     temptable = ctof(tinitial,tfinal);
%| % -----------------------------------
%| C = [tinitial:tfinal]';        % create a column vector C
%| F = (9/5)*C + 32;              % compute corresponding F
%| temptable = [C F];             % make a 2-column matrix of C and F
%|
%| ctof(0,5)
%|
%| ans =
%|
%|          0   32.0000
%|     1.0000   33.8000
%|     2.0000   35.6000
%|     3.0000   37.4000
%|     4.0000   39.2000
%|     5.0000   41.0000

%% Exercise 5.3
%| function factn = factorial_loop(n)
%| % FACTORIAL_LOOP - function to compute factorial n!
%| % call syntax:
%| %     factn = factorial_loop(n);
%| % -----------------------------------
%| if n < 0 || n ~= fix(n)         % check for negative or non-integer input
%|     error('n must be a nonnegative integer.')
%| end
%| factn = 1;                      % initialize, also 0! = 1
%| for k = n:-1:1                  % go from n down to 1
%|     factn = factn*k;            % multiply n by n-1, n-2, etc.
%| end
%|
%| factorial_loop(5)
%| factorial_loop(0)
%|
%| ans =
%|
%|    120
%|
%| ans =
%|
%|      1

%% Exercise 5.4
%| function w = crossprod(u,v)
%| % CROSSPROD - function to compute w = u x v for vectors u and v
%| % call syntax:
%| %     w = crossprod(u,v);
%| % -----------------------------------
%| if length(u) > 3 || length(v) > 3    % check if u OR v has more than 3 elements
%|     error('Cross product needs vectors with 2 or 3 elements.')
%| end
%| u = [u(:); zeros(3-length(u),1)];    % 2-D vector: set 3rd component to 0
%| v = [v(:); zeros(3-length(v),1)];
%| w = [u(2)*v(3) - u(3)*v(2);          % first element of w
%|      u(3)*v(1) - u(1)*v(3);          % second element of w
%|      u(1)*v(2) - u(2)*v(1)];         % third element of w
%|
%| i = [1 0 0]; j = [0 1 0]; k = [0 0 1];
%| crossprod(i,j)
%| crossprod(j,k)
%| crossprod(k,i)
%| crossprod(j,i)
%|
%| ans =
%|
%|      0
%|      0
%|      1
%|
%| ans =
%|
%|      1
%|      0
%|      0
%|
%| ans =
%|
%|      0
%|      1
%|      0
%|
%| ans =
%|
%|      0
%|      0
%|     -1

%% Exercise 5.5
%| function s = gseriessum(r,n)
%| % GSERIESSUM - function to calculate the sum of a geometric series
%| % The series is 1+r+r^2+r^3+...+r^n (up to the nth power).
%| % call syntax:
%| %     s = gseriessum(r,n);
%| % -----------------------------------
%| nvector = 0:n;                  % create a vector from 0 to n
%| series = r.^nvector;            % create a vector of terms in the series
%| s = sum(series);                % sum all elements of the vector 'series'
%|
%| gseriessum(0.5,10)
%| gseriessum(0.5,50)
%| gseriessum(0.5,100)
%|
%| ans =
%|
%|     1.9990
%|
%| ans =
%|
%|     2.0000
%|
%| ans =
%|
%|      2

%% Exercise 5.6
%| function [capital,interest] = compound(capital,years,rate,timescomp)
%| % COMPOUND - function to compute the compounded capital and the interest
%| % call syntax:
%| %     [capital,interest] = compound(capital,years,rate,timescomp);
%| % -----------------------------------
%| x0 = capital; n = years; r = rate; k = timescomp;
%| if r > 1                        % check for common mistake
%|     disp('check your interest rate. For 8% enter .08, not 8.')
%| end
%| capital = x0*(1+r/k)^(k*n);
%| interest = capital - x0;
%|
%| format bank
%| [X,I4] = compound(1000,5,0.06,4)
%| [X,I365] = compound(1000,5,0.06,365)
%| I365 - I4
%| format short
%|
%| X =
%|
%|         1346.86
%|
%| I4 =
%|
%|          346.86
%|
%| X =
%|
%|         1349.83
%|
%| I365 =
%|
%|          349.83
%|
%| ans =
%|
%|            2.97

