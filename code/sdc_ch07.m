%% sdc_ch07.m  --  MATLAB code collected from the lab notebook sections:
%   - SDC Chapter 7 — Debugging & Error Handling
%   - SDC Chapter 7 — Exercises
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== SDC Chapter 7 — Debugging & Error Handling =====

%% 7.1 Syntactic Errors
clear
a * 5

cos(sin(0.45))

%% 7.2 Semantic Errors
%| function x = addSeven(num)
%|     x = num + 7;
%|     x = 10;
%| end

%% 7.3 Using the Debugger: Fixing the Obvious Errors
terminalVelocityDebug('Mars')

dia = 2.5;          % Diameter of the sphere, in cm

v = terminalVelocityDebug('Mars')

v = terminalVelocityDebug('Mars')

%% 7.4 Breakpoints
terminalVelocityDebug('Pluto')

%| function Vt = terminalVelocityDebug(planet)      % line 6
%|     % Constant Values
%|     dia = 2.5                 % Diameter of the sphere, in cm
%|     area = pi*((dia/2)^2)     % Cross-sectional area of the falling object,
%|                               % which for a sphere is pi*radius^2
%|     mass = 65.4710;           % Mass of the sphere, in grams
%|     C = 0.47;                 % Drag coefficient of a sphere

%% 7.6 Walking a Function
terminalVelocityDebug('Jupiter')

%% 7.7 Error Handling: Standardizing & Verifying Input
if x < 10 || x > 20
    disp('Invalid input, must be between 10 and 20');
    return;   % No point in continuing, so exit the function
end

if ~isscalar(x)
    disp('Invalid input, scalar value required');
    return;
end

if ~ischar(planet)
    disp('Invalid input, character array required');
    return;
end

terminalVelocityDebug('mars')

% Standardize input
planet = lower(planet);

if ischar(planet) || isstring(planet)
    % Standardize text input
    planet = lower(planet);
end

terminalVelocityDebug('NepTunE')

    case 'uranus'
        gravity = 887;
        atmosphericDensity = 0.00042;
    otherwise
        disp('Invalid input, not a planet in our solar system')
        return;
end

%% 7.8 Try/Catch Blocks
terminalVelocityDebug('mercury')

try
    % Code that could generate an error
catch
    % Code to handle the error, if one occurs
end

try
    Vt = sqrt((2 * mass * gravity) / (atmosphericDensity * C * area));
catch
    disp("Error - function terminated");
    return;
end

%% 7.9 Manual Debugging Techniques
x = x + 77;
%{
    z = cos(88.4);
    A = magic(3);
%}
plot(x);

while 1
    x = 1;
end

%% ===== SDC Chapter 7 — Exercises =====

%% Exercise 7.1
%| function ok = checkZodiac(Z)
%| % Verifies a 3x4 string matrix of zodiac signs: valid names, no duplicates
%|     chinese = ["rat" "ox" "tiger" "rabbit" "dragon" "snake" ...
%|                "horse" "goat" "monkey" "rooster" "dog" "pig"];
%|     western = ["aries" "taurus" "gemini" "cancer" "leo" "virgo" ...
%|                "libra" "scorpio" "sagittarius" "capricorn" "aquarius" "pisces"];
%|     allowed = [chinese western];
%|     ok = false;
%|
%|     if ~isstring(Z)
%|         disp('Invalid input, string matrix required');
%|         return;
%|     end
%|     if ~isequal(size(Z), [3 4])
%|         disp('Invalid input, must be 3 x 4');
%|         return;
%|     end
%|
%|     Z = lower(Z);                           % standardize
%|     bad = Z(~ismember(Z, allowed));
%|     if ~isempty(bad)
%|         disp("Unknown sign(s): " + strjoin(bad(:)', ", "));
%|         return;
%|     end
%|     if numel(unique(Z)) < numel(Z)
%|         disp('Duplicate signs found');
%|         return;
%|     end
%|     ok = true;
%| end

Z = ["Rat" "Ox" "Tiger" "Rabbit"; "Leo" "Virgo" "Libra" "Scorpio"; "Dog" "Pig" "Aries" "Pisces"];
checkZodiac(Z)
Z(3,4) = "Rat";
checkZodiac(Z)
Z(3,4) = "Unicorn";
checkZodiac(Z)

%% Exercise 7.3
secretMessage('6')

