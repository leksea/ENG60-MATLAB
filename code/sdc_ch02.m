%% sdc_ch02.m  --  MATLAB code collected from the lab notebook sections:
%   - SDC Chapter 2 — Operators, Variables & Data Types
%   - SDC Chapter 2 — Exercises
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== SDC Chapter 2 — Operators, Variables & Data Types =====

%% 2.2 Variables & Precedence
x=3
y=2
z=2
x==y
y==z
x==y & y==z
x==y | y==z
~(x==y) & y==z

x=1;
y=logical(1);      % assigned y to be logical 1
class(x)            % asks the class of the variable x
class(y)             % asks the class of the variable y
islogical(x)          % returned false(0) because not assigned logical
islogical(y)           % returned true(1) because assigned logical

3+2*6
(3+2)*6

%% 2.3 Variable Naming & Classes
a=5
A=15
a+3
A+3
A+a
win_win=3
2win=3
win-win=3
win.win=3

x=666
class(x)

x=int8(666);
class(x)

%% 2.4 Integer & Floating-Point Types
3/0
inf-inf

format long
pi
pi+7

x=128 +2
y=int8(128)+2
z=int8(128)

%% 2.5 Numerical Functions & Rounding
ceil(3.4)
ceil(-3.4)
floor(3.4)
floor(-3.4)
fix(3.4)
fix(-3.4)
round(3.4)
round(-3.4)
mod(5, 2)
rem(5, 2)
mod(5, -2)
rem(5, -2)
mod(-5, 2)
rem(-5, 2)

x=uint8(255)
y=int8(x)

%% 2.6 Strings & Character Arrays
st='Carpe diem.'
size(st)
length(st)
st(4)
st(4)='9'
st(4)=33

clc
sc='This is a character array'
st="This is a string array"
class(sc)
class(st)
size(sc)
length(sc)
size(st)
length(st)
sc(1)
st(1)
sc(2)='H';
sc
st(2)="And this is the second dtring in the array";
st

charArray='This is a character array.'
stringArray="This is a string array."
ischar(charArray)
ischar(stringArray)
isstring(stringArray)
isletter(charArray)
isspace(charArray)
upper(stringArray)
stringArray=upper(stringArray)

text1='Four score an seven years ago'
text2='87 years ago'
text3='Four score and seven years ago'
strcmp(text1, text2)
strcmp(text1, text3)
text1==text3

contains(text1, 'seven')
strfind(text1, 'seven')
insertBefore(text1, strfind(text1, 'seven'), 'fifty-')

x=3
class(x)
x='I am some text'
class(x)

x=3
y=single(5)
z=x+y
class(z)
x=int16(5)+int8(3)

x=3
y='I am a string'
z=x+y
class(z)
char(z)

%% 2.7 Importing Data (VCF Files)
tblIDs=sortrows(ChromeExport2, 'ID')

%% ===== SDC Chapter 2 — Exercises =====

%% 2.1
5+2*8/2-(3*2+10)/-1

%% 2.2
x=1
y=5
z=~(x<y||~(y<x)&&islogical(x))

x=1
y=5
z=~(x<y||~(y<x)&&islogical(x))

%% 2.3
x=55+uint32(-22)+pi

%% 2.4
int8(ceil(127.1))
int8(floor(127.9))
int8(fix(127.5))
int8(round(127.7))
int8(ceil(rem(-528.6,200)))

int8(ceil(127.1))
int8(floor(127.9))
int8(fix(127.5))
int8(round(127.7))
int8(ceil(rem(-528.6,200)))

%% 2.5
x='small kittens'
y="small kittens"
3+x
3+y

x='small kittens'
y="small kittens"
3+x
3+y

%% 2.7
(((12*8)-(8*11))/(12*8))*100
12*8*1.69
(((12*12)-(14*9))/(12*12))*100
12*12*1.69
144*102
14688/144
102*1.69
(((12*20)-(18*13))/(12*20))*100
12*20*1.69

%% 2.8
m_grams=79000*1000000
avg_m_grams=(m_grams)/(1.8*10^12)

(0.621371)^2
A_sqmi=(1.6*10^6)*(0.3861)
piece_sqmi=(1.8*10^12)/(A_sqmi)

m_grams=79000*1000000
V_cm3=(m_grams)/(1.20)
(91.44)^3
V_yd3=(V_cm3)/(ans)

