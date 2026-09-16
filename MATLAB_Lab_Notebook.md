# MATLAB Lab Notebook

**Course:** ENGR60 — Programming & Problem-Solving in MATLAB
**Name:** Alexandra Yakovleva
**Started:** September 7 4, 2026

---

## Table of Contents

- [Lesson 1 Slides: About MATLAB](#lesson-1-slides-about-matlab)
- [Week 1 — Lab 1](#week-1--lab-1)
- [Week 2 — Lab 2](#week-2--lab-2)
  - [Arrays (Chapter 2)](#arrays-chapter-2)
  - [Polynomial Roots](#polynomial-roots)
  - [Plotting with MATLAB (Chapter 5)](#plotting-with-matlab-chapter-5)
  - [Script Files](#script-files)
  - [Narrative — Projectile Motion](#narrative--projectile-motion)
- [SDC Chapter 2 — Operators, Variables & Data Types](#sdc-chapter-2--operators-variables--data-types)
  - [2.1 Operators](#21-operators)
  - [2.2 Variables & Precedence](#22-variables--precedence)
  - [2.3 Variable Naming & Classes](#23-variable-naming--classes)
  - [2.4 Integer & Floating-Point Types](#24-integer--floating-point-types)
  - [2.5 Numerical Functions & Rounding](#25-numerical-functions--rounding)
  - [2.6 Strings & Character Arrays](#26-strings--character-arrays)
  - [2.7 Importing Data (VCF Files)](#27-importing-data-vcf-files)
- [SDC Chapter 2 — Exercises](#sdc-chapter-2--exercises) 
---

## Lesson 1 Slides: About MATLAB

*Source: Matlab_WVC-Lesson1-1 (Lecture 1 slides)*

### Textbooks

- **Required:** *An Engineer's Introduction to Programming with MATLAB 2019*, by Shawna Lockhart & Eric Tilleson
- **Optional:** *Getting Started with MATLAB 5*, by Rudra Pratap
- **Optional:** *Introduction to MATLAB 7 for Engineers*, by Palm

### Purchasing MATLAB Software

- MathWorks website: [mathworks.com](http://www.mathworks.com) — The only option now available for individual student purchase is the $119 per year, a Standard Student Suite, which bundles MATLAB, Simulink, and 11 add-on toolboxes into a single annual subscription-based service
- **Alternative:** Octave (free), available as a PC download or online.

### Outline

1. About MATLAB
2. Basics
3. Computing with MATLAB
4. Arrays and Matrices Operations

### About MATLAB

MATLAB is:
- A computer programming language
- A software environment for using that language effectively

**Two modes of operation:**
- **Interactive calculator mode** — commands typed and executed one at a time
- **Script mode** — execution of complete programs (script files)

Running MATLAB opens one or more windows. The primary one is the **MATLAB Desktop**, the main graphical user interface, which contains and manages all other MATLAB windows. Depending on configuration, some windows may or may not be visible — check the **View** menu.

![MATLAB Desktop](media/matlab_desktop.png)

**MATLAB Desktop windows:**

| Window | Purpose |
|---|---|
| **Command Window** | Primary place to interact with MATLAB; the `>>` prompt is where commands are issued (type `quit` or `exit` to close) |
| **Command History** | Running history of prior commands issued in the Command Window |
| **Workspace** | GUI for viewing, loading, and saving MATLAB variables |
| **Launch Pad** | Tree layout for accessing tools, demos, and documentation |
| **Current Directory** | GUI for directory and file manipulation |
| **Help** | GUI for finding and viewing online documentation |
| **Array Editor** | GUI for modifying the contents of MATLAB variables |
| **Editor/Debugger** | Text editor and debugger for MATLAB `.m` files |

### Basics: Basic Operations

| Symbol | Operation | MATLAB form |
|---|---|---|
| `^` | exponentiation: aᵇ | `a^b` |
| `*` | multiplication: ab | `a*b` |
| `/` | right division: a/b | `a/b` |
| `\` | left division: b/a | `a\b` |
| `+` | addition: a + b | `a+b` |
| `-` | subtraction: a − b | `a-b` |

**Examples:**
```matlab
>> 5^2
ans =
    25

>> cos(pi)
ans =
    -1
```

### Basics: Rules of Precedence

| Precedence | Operation |
|---|---|
| First | Parentheses, evaluated starting with the innermost pair |
| Second | Exponentiation, evaluated left to right |
| Third | Multiplication and division (equal precedence), left to right |
| Fourth | Addition and subtraction (equal precedence), left to right |

**Precedence examples:**
```
8 + 3 * 5 = 23            → (8 + (3 * 5))
4 ^ 2 – 12 – 8 / 4 * 2 = 0 → ((4^2) – 12 – ((8/4) * 2))
3 * 4 ^ 2 + 5 = 53         → ((3 * (4^2)) + 5)
27 ^ 1 / 3 + 32 ^ 0.2 = 11 → (((27^1) / 3) + (32^0.2))
```
*Text reference: page 10*

---

## Week 1 — Lab 1

*Source: Lab1-1 assignment notes*

Your first exercise using MATLAB begins with calculations.

**What is MATLAB?** A numerical computation computer application that basically performs symbolic algebra — computations done in terms of symbols and variables instead of pure numbers.

As shown in the slides, typing into the Command Window:
```matlab
>> 5^2
```
should return `25`.

Once comfortable with the basic operations from the slides, the lab moves on to computations and symbolic algebra in MATLAB (or Octave, if MATLAB isn't installed).

![Basic operators & command reference](media/lab1_operators_ref.png)

Useful commands to memorize (used frequently throughout the course):

| Command | Action |
|---|---|
| `clc` | Clears the Command Window |
| `clear` | Removes all variables from memory |
| `clear var1 var2` | Removes the variables `var1` and `var2` from memory |
| `exist('name')` | Determines if a file or variable named `'name'` exists |
| `quit` | Stops MATLAB |
| `who` | Lists variables currently in memory |
| `whos` | Lists variables, sizes, and whether they have imaginary parts |
| `:` | Colon — generates an array of regularly spaced elements |
| `,` | Comma — separates elements of an array |
| `;` | Semicolon — suppresses screen printing; also denotes a new row in an array |
| `...` | Ellipsis — continues a line |

### T1-1 — Use MATLAB to compute the following

**a.** 6(10/13) + 18/(5·7) + 5(9²)
```matlab
>> 6*(10/13) + 18/(5*7) + 5*(9^2)
ans =
   410.1297
```

**b.** 6(35^(1/4)) + 14^0.35
```matlab
>> 6*(35^(1/4)) + 14^0.35
ans =
   17.1123
```

---
## Week 2 — Lab 2

### T1-1 (repeated, parts c & d)

**c.** 6(10/13) + 18/(5·7) + 5(9²)
```matlab
>> 6*(10/13) + 18/(5*7) + 5*(9^2)
ans =
   410.1297
```

**d.** 6(35^(1/4)) + 14^0.35
```matlab
>> 6*(35^(1/4)) + 14^0.35
ans =
   17.1123
```

### Cylinder Problem

The volume of a circular cylinder of height *h* and radius *r* is V = πr²h. A cylindrical tank is 15 m tall with a radius of 8 m. Construct another tank with 20% greater volume but the same height — how large must its radius be?

**Solution:** r = √(V / πh)

```matlab
>> r = 8;
>> h = 15;
>> V = pi*(r^2)*h;
>> V = V + 0.2*V;
>> r = sqrt(V/(pi*h))
ans =
    r = 8.7636
```

**Answer:** The new cylinder must have a radius of **8.7636 m**.

### T1-2: Test Your Understanding

Given x = -5 + 9i and y = 6 - 2i, show that x+y = 1 + 7i, xy = -12 + 64i, and x/y = -1.2 + 1.1i.

```matlab
>> x = -5 + 9*i;
>> y = 6 - 2*i;
>> x + y
ans =
   1.0000 + 7.0000i

>> x*y
ans =
  -12.0000 +64.0000i

>> x/y
ans =
  -1.2000 + 1.1000i
```

### Arrays (Chapter 2)
```matlab
>> u = [0:0.1:10];
>> w = 5*sin(u);
>> u(7)
ans =
    0.6000

>> w(7)
ans =
    2.8232

>> m = length(w)
m =
   101
```

### T3-1: 25th Element

Determine how many elements are in the array `[cos(0):0.02:log10(100)]`, and find the 25th element.

```matlab
>> a = [cos(0):0.02:log10(100)];
>> m = length(a)
m =
    51

>> a(25)
ans =
    1.4800
```

**Answer:** There are 51 elements in the array, and the 25th element is 1.48.

### Polynomial Roots

**Example)** Find the roots of x³ − 7x² + 40x − 34 = 0.

```matlab
>> a = [1, -7, 40, -34];
>> roots(a)
ans =
   3.0000 + 5.0000i
   3.0000 - 5.0000i
   1.0000 + 0.0000i
```

**Answer:** The roots are x = 1 and x = 3 ± 5i.

### T3-2: Polynomial 290 − 11x + 6x² + x³

```matlab
>> a = [1, 6, -11, 290];
>> roots(a)
ans =
  -10.0000 + 0.0000i
    2.0000 + 5.0000i
    2.0000 - 5.0000i
```

**Answer:** The roots are x = -10 and x = 2 ± 5i.

### Plotting with MATLAB (Chapter 5)
**Example)** Plot $y = sin(2x)$ for $0 \le x \le 10$.

```matlab
>> x = 0:0.01:10;
>> y = sin(2*x);
>> plot(x, y, linewidth=2) 
>> xlabel('x')
>> ylabel('y')
>> legend('y = sin2x') 
>> grid on
>> title('Function y = sin2x') 
```

![y = sin(2x)](media/plot_sin2x.png)

### T3-3: Plot $s = 2sin(3t+2) + \sqrt {(5t+1)}$ for $0 \le t \le 5$:

```matlab
>> t = 0:0.01:5;
>> s = 2*sin(3*t + 2) + sqrt(5*t + 1);
>> plot(t,s, linewidth=2, LineStyle="--", Color= 'r')
>> xlabel('t: time (seconds)')
>> ylabel('s: speed (feet per second)')
>> title('The function of s = 2sin(3t+2)+sqrt(5t+1)')
>> legend('y = s = 2sin(3t+2)+sqrt(5t+1)') 
>> grid on

```

![s = 2sin(3t+2) + sqrt(5t+1)](media/plot_s2sin.png)

### T3-4: $y = 4* \sqrt {6x+1}$ and $z = 5e^{0.3x} − 2x$ for $0 \le x \le 1.5$:

```matlab
>> x = 0:0.01:1.5;
>> y = 4*sqrt(6*x+1);
>> z = 5*exp(0.3*x) - 2*x;
>> plot(x,y, linestyle='-.')
>> xlabel('x: distance (meters)')
>> ylabel('y: force (newtons)'), ...
>> title('The function of y = 4sqrt(6x+1)')
>> grid on;
>> legend('y = 4sqrt(6x+1)')
```

![y = 4sqrt(6x+1)](media/plot_y4sqrt.png)

```matlab
>> plot(x,z, '--*', 'MarkerSize', 3, 'MarkerEdgeColor', 'y') 
>> xlabel('x: distance (meters)'), ylabel('z: force (newtons)'), ...
>> title('The function of $z = 5e^{(0.3x)}-2x$', 'Interpreter', 'latex')
>> legend('$z = 5e^{(0.3x)}-2x$', 'Interpreter', 'latex')
>> grid on

```

![z = 5exp(0.3x) - 2x](media/plot_z5exp.png)

**Example) Plot of rocket height**

```matlab
>> x = 0:0.1:52;
>> y = 0.4*sqrt(1.8*x);
>> x = 0:0.1:52;
>> plot(x,y, 'vr')
>> xlabel('Distance (miles)')
>> ylabel('Height (miles)')
>> title('Rocket Height as a Function of Downrange Distance')
>> legend('Rocket!', 'Box', 'off', 'fontsize', 20, 'FontAngle', 'italic')
```

![Rocket Height vs. Downrange Distance](media/plot_rocket.png)

### Script Files

**Sample SQRT)** Example #1 of a script file (`Sample_SQRT.m`):

```matlab
% Example of a script file
% This program calculates the square root of the numbers 1 through 10.
% It displays a vector x with the numbers 1 through 10
% and the vector y with the square root.
x = 1:10
y = sqrt(x)
```

```matlab
>> Sample_SQRT
x =
    1   2   3   4   5   6   7   8   9   10
y =
   1.0000  1.4142  1.7321  2.0000  2.2361  2.4495  2.6458  2.8284  3.0000  3.1623
```

**Population Table)** Example #2 of a script file (`PopTable.m`):

```matlab
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
```

```matlab
>> PopTable
    YEAR   POPULATION
           (MILLIONS)
    1984      127
    1986      130
    1988      136
    1990      145
    1992      158
    1994      178
    1996      211
```

**Power of 3 by User Input)** Example #3 of a script file (`Power3input.m`):

```matlab
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
```

```matlab
>> Power3input
Enter the points scored in the first game: 3
number2 =
   27
   27

>> Power3input
Enter the points scored in the first game: 6
number2 =
   216
   216

>> Power3input
Enter the points scored in the first game: -5
Warning! Input invalid
```

**Average points per game)** Example #4 of a script file (`sampleAVG.m`):

```matlab
% Example of a script file (sampleAVG.m)
% This program will display the values of the points from 3 games.
game1 = 75;
game2 = 93;
game3 = 68;
ave_points = (game1 + game2 + game3) / 3
```

```matlab
>> sampleAVG
ave_points =
   78.6667
```

**Average points by User Input)** Example #5 of a script file (`sampleGameInput.m`):

```matlab
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
```

```matlab
>> sampleGameInput
Enter the points scored in the first game: 61
Enter the points scored in the second game: 74
Enter the points scored in the third game: 101
ave_points =
   78.6667
The average of points scored in a game is:
   78.6667
```

### Narrative — Projectile Motion

**Predict landing distance of an object in projectile motion.** The object is launched at 45 degrees from ground level at 50 meters per second. Ignore air drag and wind.

**Variables:**
- Angle: 45° (= 45° × π/180° rad = π/4 rad = 0.7854 rad)
- Speed: 50 (m/s)
- Starting height: 0 (m)
- Gravity: -9.81 (m/s²)

**MATLAB coding (`ProjectileMotion.m`):**

```matlab
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
```

```matlab
>> ProjectileMotion
HorizontalVelocity =
   35.3553
VerticalVelocity =
   35.3553
TimeInFlight =
   7.2080
HorizontalDistance =
   254.8420
```

**Answer:**
- Horizontal starting velocity = 35.3553 m/s
- Vertical starting velocity = 35.3553 m/s
- Time in flight: 7.2080 s
- Horizontal distance from start: 254.8420 m

*(EOF)*

---

## SDC Chapter 2 — Operators, Variables & Data Types

*Self-directed coursework notes*

### Chapter 2 Objectives

1. Understand and apply operator precedence.
2. Assign a value to a variable.
3. Understand the minimum and maximum value of various numeric variable types.
4. Understand the difference between string and character arrays.
5. Work with data from an imported file.

### 2.1 Operators

**Arithmetic Operators (p.15)**
**Relational Operators (p.15)**
**Logical Operators (p.16)**

### 2.2 Variables & Precedence
**Operator precedence (p.18-19)**
**Order of Operations (p.19)**
**Variable Naming Rules (p.19)**

### 2.3 Variable Naming & Classes

**Invalid variable names:**
**Classes / types (p.21):**

### 2.4 Integer & Floating-Point Types
**Integer Types (p.21)**
**Floating Point Types (p.22)**
**Constants — `Inf` and `NaN` (p.22)**
**Overflow behavior (p.22-23)**

### 2.5 Numerical Functions & Rounding
**Precision loss on conversion (p.24)**

### 2.6 Strings & Character Arrays
**Character arrays vs. string arrays (p.26)**
**Character/string test functions (p.27-28)**
**Comparing strings — `strcmp` (p.28)**
**Finding & modifying substrings (p.28-29)**
**Type coercion (p.29-30)**

### 2.7 Importing Data (VCF Files)
**Definition of VCF**
**Steps to Import Data (p.32-34)**
**Sorting imported data (p.34)**


## SDC Chapter 2 — Exercises

*(p.36-38) Exercises 2.1 – 2.8*

### 2.1
### 2.2
### 2.3
### 2.4
### 2.5
### 2.6
### 2.7
### 2.8
