%% sdc_ch01.m  --  MATLAB code collected from the lab notebook sections:
%   - SDC Chapter 1 — Intro MATLAB
%   - SDC Chapter 1 — Exercises
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== SDC Chapter 1 — Intro MATLAB =====

%% 1.2 Entering Commands
532 - 33.9123456

%% 1.3 Preferences & Number Format
1/3

format long

%% 1.4 Using Help
help

%% 1.5 Clearing the Command Window & Workspace
clc

clear

%% 1.6 Unit Conversion Example: Loading a File
load('bearingdata.mat')

%% 1.7 A First Look at Variables
data

data_grams = data * 28.35

%% 1.8 Saving a Variable & Command History
save('bearingdata_grams', 'data_grams')

%% 1.9 Built-in Statistical Functions
min(data_grams)

max(data_grams)
mean(data_grams)
median(data_grams)

[smallest, largest] = bounds(data_grams)

%% 1.10 Terminal Velocity Example: Creating a Script
edit terminal_velocity

% program to calculate terminal velocity
% Vt = terminal velocity
% dia = diameter of sphere (in cm)
% mass = mass of the falling object (65.4710 grams)
% gravity = acceleration due to gravity (about 981 cm/s^2)
% airDensity = density of the medium (0.001225 g/cm^3.)
% area = cross-sectional area of the object (in cm^2),
%        which for a sphere is pi*radius^2
% C = drag coefficient (about 0.47 for a sphere)

dia = 2.5;
area = pi*((dia/2)^2);
mass = 65.4710;
gravity = 981;
airDensity = 0.001225;
C = 0.47;
Vt = sqrt((2*mass*gravity)/(airDensity*C*area))
disp 'cm/s units'

%% 1.11 Running a Script, Saving & Closing
terminal_velocity

%% ===== SDC Chapter 1 — Exercises =====

%% Exercise 1.1
closedGate = 20 * 224.809
openGate = 6 * 224.809

%% Exercise 1.2
load('bearingdata.mat')
format long
data_kg = data * 0.0283495
format short

%% Exercise 1.4
% terminal velocity of the 2.5 cm steel ball on Mars (cgs units)
dia = 2.5;
area = pi*((dia/2)^2);
mass = 65.4710;
gravity = 371.1;          % 3.711 m/s^2 -> cm/s^2
airDensity = 0.000020;    % 0.020 kg/m^3 -> g/cm^3
C = 0.47;
Vt = sqrt((2*mass*gravity)/(airDensity*C*area))
disp 'cm/s units'

terminal_velocity_mars

