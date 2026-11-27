%% sdc_ch05.m  --  MATLAB code collected from the lab notebook sections:
%   - SDC Chapter 5 — Matrices
%   - SDC Chapter 5 — Exercises
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== SDC Chapter 5 — Matrices =====

%% 5.1 What Is a Matrix?
[1 2 3; 4 5 6]

A = [1 2 3; 4 5 6]
size(A)

%% 5.2 Special Matrices: Diagonal, Identity, Magic
V = [1:4];
A = diag(V)

X = diag(A)

eye(4)

magic(5)

%% 5.3 Creating Test Matrices & Random Numbers
randi(10,1,10)
randi(10,1,10)

rng(0)
randi(10,1,10)
rng(0)
randi(10,1,10)

%% 5.4 Array Math: Addition & Subtraction
rng('default')
A = randi(10,3,5)
B = randn(3,5);
C = rand(3,5);
D = [1 2 3; 4 5 6; 7 8 9]
E = A + B + C;
F = A - C;

G = A - D

Arrays have incompatible sizes for this operation.

%% 5.6 Scalar Math Operations
A = ones(5)
A + 6

B = rand(1,3)
x = 1
B + x

A = magic(3)
n = 5
A / n
A ./ n
n ./ A

n / A

%% 5.7 Transposition
A = [1:2:6; 3:5:15; 10:10:30]
A'
A.'

format short
A = [1 3 10; 3 sqrt(-2) 20; 5 13 30]
A'
A.'

A = [1:6; 3:8; 4:9]
B = [2 4 6]

B .* A

Arrays have incompatible sizes for this operation.

B .* A'

%% 5.8 Powers & Logical Operations
A = [1 2 3 4 5 6; 3 4 5 6 7 8; 4 5 6 7 8 9]
B = A <= 5

%% 5.9 Matrix Multiplication
A = [1 2; 3 4; 5 6];
B = [7 8; 9 10];
A * B

%% 5.11 Examples: Solving Linear Systems
A = [3 3; 2 -5]
B = [16; -4]

C = inv(A)
D = C * B

3*D(1) + 3*D(2)
2*D(1) - 5*D(2)

A = [800 300 200; 700 400 200; 300 500 100]
C = [8900; 9400; 7700]

B = inv(A)*C

%% ===== SDC Chapter 5 — Exercises =====

%% Exercise 5.1
A = [1 2; 3 4];
A .* A
A * A

%% Exercise 5.2
A = [500 300 200; 1000 100 300; 200 200 0];
C = [7100; 8300; 3400];
B = inv(A)*C

%% Exercise 5.3
A = [2 1 3; 0 1 4; 5 6 0]
Ainv = inv(A)

A * Ainv

%% Exercise 5.4
A = [23 18 12; 25 20 16; 18 9 20];
C = [76.5; 85.5; 55];
B = inv(A)*C

%% Exercise 5.5
D = A .* B'

%% Exercise 5.6
D(:,4) = sum(D,2)

%% Exercise 5.7
D(4,:) = sum(D,1)

%% Exercise 5.8
E = D ./ 2

%% Exercise 5.9
F = E(4,1:3) ./ sum(A)

%% Exercise 5.10
A = [8 3 6; 3 5 7; 9 1 4];
C = [44; 48; 31];
Ainv = inv(A)

B = Ainv * C

