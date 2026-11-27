%% pratap_ch03.m  --  MATLAB code collected from the lab notebook sections:
%   - Pratap Chapter 3 — Interactive Computation
%   - Pratap Chapter 3 — Exercises
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== Pratap Chapter 3 — Interactive Computation =====

%% 3.1.1 Input
A = [1 2 3; 4 5 6; 7 8 9];
u = [1 3 9]        % row vector
v = [1; 3; 9]      % column vector
g = 9.81;          % scalar

%% 3.1.2 Indexing
A = [1 2 3; 4 5 6; 7 8 9];
A(2,3)
A(3,3) = 9
B = A(2:3,1:3)
B = A(2:3,:)
B(:,2) = []
size(A)
[m,n] = size(A)
D(2,3) = 5

%% 3.1.3 Manipulation
B = [];
for k = 1:3, B = [B; k k+1 k+2]; end
B

%% Utility matrices
eye(3)
B = [ones(3) zeros(3,2); zeros(2,3) 4*eye(2)]
diag(B)'
diag(B,1)'
d = [2 4 6 8]; d1 = [-3 -3 -3]; d2 = [-1 -1];
D = diag(d) + diag(d1,1) + diag(d2,-2)

%% 3.1.4 Creating Vectors
a = 0:10:100
b = 0:pi/50:2*pi;
u = linspace(0,20,5)
v = logspace(0,3,4)

%% 3.2.1 Arithmetic operations
A = [1 2 3; 4 5 6; 7 8 9];
x = A(1,:)'
x'*x
x*x'
A*x
A^2
A.^2

%% 3.2.2 Relational operations
x = [1 5 3 7]; y = [0 2 8 7];
k = x < y
k = x == y
k = x ~= y
v = x(x > 4)

%% 3.2.3 Logical operations
x = [0 2 5 7];
find(x)
i = find(x > 5)

%% 3.2.4 Elementary math functions
q = [0 pi/2 pi]; x = [1 -1 -1 1]; y = [1 1 -1 -1];
sin(q)
atan(y./x)
atan2(y,x)
fix([-2.33 2.66])
floor([-2.33 2.66])
ceil([-2.33 2.66])
round([-2.33 2.66])
rem([-1.5 7],[2 3])

%% 3.2.5 Matrix functions
A = [1 2; 3 4];
Asqrt = sqrt(A)
Asqrt = sqrtm(A)
exp_A = exp(A)
exp_A = expm(A)

%% 3.2.6 Character strings
names = char('John','Ravi','Mary','Xiao');
howdy = char('Hi','Hello','Namaste');
c = [howdy(2,:) names(3,:)]
n = 10;
title(['Variance study with sample size n = ',int2str(n)])
for k = 1:3
    outputfile = ['result',int2str(k)];
    x = k; y = k^2;
    eval(['save ',outputfile,' x y'])
end

%% 3.3 Using Built-in Functions and On-line Help
lookfor determinant
help det
A = rand(10);
det(A)
lookfor eigenvalue
A = [5 -3 2; -3 8 4; 4 2 -9];
eig(A)
[eigvec,eigval] = eig(A)

%% 3.5 Plotting simple graphs
x = 0:0.2:20;
y = exp(0.1*x).*sin(x);
plot(x,y)
xlabel('Time (t) in Seconds')
ylabel('The Response Amplitude in mm')
title('A Simple 2-D Plot')
print resp_amp.eps -deps
fplot('exp(-.1*x).*sin(x)',[0, 20])
xlabel('x'), ylabel('f(x) = e^{x/10} sin(x)')
title('A function plotted with fplot')
ezplot('exp(-.1*x).*cos(x)',0,20)

%% ===== Pratap Chapter 3 — Exercises =====

%% Exercise 1
A = [2 6; 3 9]
B = [1 2; 3 4]
C = [-5 5; 5 3]

%% Exercise 2
A+B
B+A
(A+B)+C
A+(B+C)
5*(A+B)
5*A + 5*B
A*(B+C)
A*B + A*C
A*B
A*C
B*A

%% Exercise 3
D = zeros(2,3)
E = 5*eye(3)
F = 3*ones(2)

%% Exercise 4
G = [A zeros(2,4); zeros(2,2) B zeros(2,2); zeros(2,4) C]

G = blkdiag(A,B,C);

G = zeros(6);
G(1:2,1:2) = A;
G(3:4,3:4) = B;
G(5:6,5:6) = C;
G

%% Exercise 5
H = G;
H(end,:) = [];
H(:,end) = [];
H

%% Exercise 6
A = ones(20);
A(6:15,6:15) = 0;
spy(A)
A(1:5,16:20) = 0;
A(16:20,1:5) = 0;
figure
spy(A)

%% Exercise 7
A = diag(1:6) + diag(7:11,1) + diag(12:15,2)
A = A + triu(A,1)'

%% Exercise 8
A = rand(10);
A = 100*A;
A = fix(A);
A(A < 10) = 0;
A(A > 90) = inf;
b = A(A >= 30 & A <= 50);

