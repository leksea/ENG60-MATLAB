%% sdc_ch03.m  --  MATLAB code collected from the lab notebook sections:
%   - SDC Chapter 3 — Programming Basics: Arrays, Structures & Tables
%   - SDC Chapter 3 — Exercises
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== SDC Chapter 3 — Programming Basics: Arrays, Structures & Tables =====

%% 3.1 Arrays, Matrices, Vectors & Scalars
isscalar(57)
isvector(57)
ismatrix(57)

%% 3.2 Growing Arrays & the Empty Array
A = randi(10, 2)
A(4,3) = 54

clear
A(3,4) = 16

A = []
size(A)
isempty(A)

%% 3.3 Matrix Basics & Size
aScalar = int16(345);
string1 = 'To be or not to be';
string2 = "that is the question";
aVector = 1:5;
class(aScalar)
class(string1)
class(string2)
class(aVector)

size(aScalar)
size(string1)
size(string2)
size(aVector)

%% 3.4 Strings as Matrices
string2 == 'b'
strcmp(string2, 'b')
string1 == 'b'
strcmp(string1, 'b')

%% 3.5 The Colon Operator
1:5
1:2:5
1:2:6

%% 3.6 Indexing with Colon & End
rng('default')
V = 1:5
M = randi(10, 4)
A = randi(15, 4, 5, 2)

sub = V(3:5)

M(2, 4)

M(1:2, 1:2)

M(1:4, 1)
M(:, 1)

A1 = randi(15, 8, 10)
A2 = A1(1:2:8, 1:2:10)

A2 = A1(1:2:8, :)
A3 = A2(:, 1:2:10)

A1(1:2:8, 1:2:10) = 0

S = ones(10, 4)
T = randi(100, 2)
S(2:3, 2:3) = T

X = ones(3, 7)
X(2, [1 3]) = 2
X(2, 1:3) = 3
X([2 1], 2) = 4
X(end, 2) = 5
X(end, end) = 6
X([1 end], 4) = 7
X(1:end, 5) = 8
X(1, end-1) = 9
X(1:end, 5:6) = 10
X(1:end, 2:3) = [11 11; 12 12; 13 13]
X(:) = X(1, end)

X = magic(5)
X(end:-1:1, 1:end)

%% 3.7 Reshaping & Array Functions
M(:)
V(:)
A(:)

sum(M(:))

clear; clc
rng('default')
V  = 1:5;
A1 = randi(15, 8, 10);
A2 = A1(1:2:8, :);
A3 = A2(:, 1:2:10);
workspace
openvar('A1')

length(A)
size(A)
ndims(A)
numel(A)
isrow(V)
iscolumn(V)
diag([1 2 3])
horzcat([1; 2], [3; 4])
vertcat([1 2], [3 4])

%% 3.8 Cell Arrays
a = cell(4)
b = cell(4, 5)
c = cell(4, 5, 2);
size(c)
A = [4 5 2];
d = cell(A);
size(d)

b{2,2} = 4.2;
b{1,1} = 'Good morning';     % char
b{1,2} = "Bonjour";          % string
b{3,4} = cos(45);            % 45 is in radians
b{4,1} = int16(432);
b
b{3,4}
iscell(b)
cell2mat({1 2; 3 4})

%% 3.9 Structures
rocket = struct
rocket.manufacturer = "SpaceX"
rocket.model = "Falcon9";
rocket.height = 70;
rocket.diameter = 3.7;
rocket.stages = 2

person = struct('name', "Ludwig", 'age', 20, 'height', 6.1)

enginesStage1.quantity = 9;
enginesStage1.burnTime = 162;
enginesStage1.totalThrustAtSeaLevel = 7600;
enginesStage1.totalThrustInVacuum = 8227;
rocket.engines = enginesStage1
time = rocket.engines.burnTime
rocket.engines.totalThrustAtSeaLevel = 7607;
rocket.engines

%% 3.10 Structure Arrays
enginesStage2.quantity = 1;
enginesStage2.burnTime = 397;
enginesStage2.totalThrustAtSeaLevel = "N/A";
enginesStage2.totalThrustInVacuum = 934;
rocket.engines(2) = enginesStage2;
rocket.engines
rocket.engines(2)
time = rocket.engines(1).burnTime

engine3 = struct;
engine3.burnTime = 250;
rocket.engines(3) = engine3

Subscripted assignment between dissimilar structures.

rocket(2).model = "Gemini"
rocket(2)
rocket(1).engines(2).type = "Merlin";
rocket(1).engines(1)
fieldnames(person)
person = rmfield(person, 'height')

%% 3.11 Creating Tables
table([1;2;3], [4;5;6], [7;8;9])
Var1 = [1;2;3];
Var2 = [4 7; 5 8; 6 9];
table(Var1, Var2)

diameter = [4879.40; 12103.60; 12742; 6779; 139822; 116464; 50724; 49244];
rotational_period = [1407.50; 5832.43; 23.93; 24.62; 9.92; 10.66; 17.23; 16.10];
orbital_period = [0.24; 0.62; 1.00; 1.88; 11.86; 29.45; 84.02; 164.79];
rings = {'No'; 'No'; 'No'; 'No'; 'Yes'; 'Yes'; 'Yes'};
atmosphere = {'None'; 'Carbon Dioxide, Nitrogen'; 'Nitrogen, Oxygen'; ...
       'Carbon Dioxide, Nitrogen, Argon'; 'Hydrogen, Helium'; ...
       'Hydrogen, Helium'; 'Hydrogen, Helium, Methane'; ...
       'Hydrogen, Helium, Methane'};
planetary_data = table(diameter, rotational_period, orbital_period, rings, atmosphere);

rings(8) = {'Yes'};
planetary_data = table(diameter, rotational_period, orbital_period, rings, atmosphere)

varNames = {'Key', 'Name', 'Age'};
rowNames = {'Tunisia', 'France', 'Japan'};

table(var1, var2, var3, 'VariableNames', varNames);
table(var1, var2, var3, 'RowNames', rowNames);
table(var1, var2, var3, 'VariableNames', varNames, 'RowNames', rowNames);
table(var1, var2, var3, 'RowNames', rowNames, 'VariableNames', {'Key', 'Name', 'Age'});

%% 3.12 Table Properties
planetary_data.Properties

planets = {'Mercury'; 'Venus'; 'Earth'; 'Mars'; 'Jupiter'; 'Saturn'; 'Uranus'; 'Neptune'};
planetary_data.Properties.RowNames = planets;
planetary_data.Properties.VariableNames(1) = {'Diameter'};
planetary_data.Properties.VariableNames(2) = {'Rotational_Period'};
planetary_data.Properties.VariableNames(3) = {'Orbital_Period'};
planetary_data.Properties.VariableNames(4) = {'Rings'};
planetary_data.Properties.VariableNames(5) = {'Atmosphere'}

planetary_data.Properties.VariableNames(2) = {'Rotational Period'}

planetary_data.Properties.VariableNames(2) = {'Rotational_Period'};

planetary_data.Properties.VariableUnits = {'km', 'hours', 'Earth years', '', ''};
planetary_data.Properties.DimensionNames = {'Planet', 'Data'};
planetary_data.Properties.VariableUnits

planetary_data.Properties.Description = 'Planets of the solar system';
summary(planetary_data)

Description:  Planets of the solar system
Variables:
    Diameter: 8×1 double
        Properties:
            Units:  km
        Values:
            Min          4879.4
            Median        30993
            Max      1.3982e+05
    Rotational_Period: 8×1 double
        Properties:
            Units:  hours
        Values:
            Min          9.92
            Median      20.58
            Max        5832.4
    Orbital_Period: 8×1 double
        Properties:
            Units:  Earth years
        Values:
            Min          0.24
            Median       6.87
            Max        164.79
    Rings: 8×1 cell array of character vectors
    Atmosphere: 8×1 cell array of character vectors

%% 3.13 Accessing & Adding Table Data
mars = planetary_data(4, :)
mars = planetary_data('Mars', :);
mars_rotation = planetary_data('Mars', 'Rotational_Period')

planets = {'Mercury', 'Jupiter', 'Neptune'};
facts = {'Diameter', 'Rotational_Period'};
planetary_data(planets, facts)
planetary_data{planets, facts}

planetary_data.Rotational_Period('Saturn')
planetary_data.(2)(6)

small_planets = planetary_data.Diameter < planetary_data.Diameter('Earth')
small_planet_table = planetary_data(small_planets, :)

planetary_data.Known_Life = {'No'; 'No'; 'Yes'; 'No'; 'No'; 'No'; 'No'; 'No'};
planetary_data(:, {'Diameter', 'Known_Life'})

%% 3.14 Table Conversion Functions
planet_struct = table2struct(planetary_data);
size(planet_struct)
planet_struct(4)
planet_table = struct2table(planet_struct);
planet_table.Properties.RowNames

rowNames = {'Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'}
planet_table = struct2table(planet_struct, 'RowNames', rowNames);
planet_table('Mars', {'Diameter', 'Known_Life'})

%% ===== SDC Chapter 3 — Exercises =====

%% Exercise 3.1
[1:2:9, 2:2:10]

%% Exercise 3.2
rng('default')
R = randi(10, 6)
corner = R(1:3, 1:3)

%% Exercise 3.3
rng('default')
R = randi(10, 8)
everyOther = R(1:2:end, 1:2:end)

%% Exercise 3.4
student = struct('name', 'Ada', 'age', int8(20), 'GPA', 3.85, 'major', "Physics")
c = struct2cell(student)
c{2} = c{2} * 3
class(c{2})

%% Exercise 3.5
bedroom.sq_ft = 200;
bedroom.furniture = {'bed', 'dresser', 'nightstand'};
kitchen.sq_ft = 100;
kitchen.appliances = {'stove', 'refrigerator', 'dishwasher'};
cave.sq_ft = 300;
cave.gaming_systems = {'Xbox', 'Playstation'};
garage.sq_ft = 1000;
rooms.bedroom = bedroom;
rooms.kitchen = kitchen;
rooms.man_woman_cave = cave;
rooms.garage = garage;
cars(1).make = "Toyota";
cars(1).model = "Camry";
cars(1).year = 2020;
cars(2).make = "Tesla";
cars(2).model = "Model 3";
cars(2).year = 2023;
house.address = "123 Main St";
house.year_built = 1998;
house.rooms = rooms;
house.cars = cars
house.rooms
house.rooms.kitchen
house.cars(2)

%% Exercise 3.6
roomNames = {'bedroom'; 'kitchen'; 'man_woman_cave'; 'garage'};
sq_ft = [200; 100; 300; 1000];
contents = {{'bed', 'dresser', 'nightstand'}; ...
               {'stove', 'refrigerator', 'dishwasher'}; ...
               {'Xbox', 'Playstation'}; {}};
rooms_table = table(sq_ft, contents, 'RowNames', roomNames)
cars_table = struct2table(house.cars)

