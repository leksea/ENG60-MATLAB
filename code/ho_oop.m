%% ho_oop.m  --  MATLAB code collected from the lab notebook sections:
%   - HO — Object-Oriented Programming in Matlab
%   - HO — Object-Oriented Programming in Matlab — Exercises
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== HO — Object-Oriented Programming in Matlab =====

%% 1.2 Classes: Using a Class
% Call constructor to create frame1 object
frame1 = photoFrame(3, 10);
% Call method to calculate frame1's area
areaFrame1 = frame1.CalcArea()

areaFrame1 = frame1.CalcArea();     % dot notation
areaFrame1 = CalcArea(frame1);      % function syntax: object is the first argument

%% Example : implementation of datatype photoFrame
%| classdef photoFrame
%|
%|     properties
%|         frameWidth;      % Width of a frame
%|         frameHeight;     % Height of a frame
%|     end
%|
%|     methods
%|         % Constructor
%|         function obj = photoFrame(width, height)
%|             if nargin == 2
%|                 obj.frameWidth = width;
%|                 obj.frameHeight = height;
%|             else
%|                 obj.frameWidth = [];
%|                 obj.frameHeight = [];
%|             end
%|         end
%|
%|         % Calculate frame area
%|         function area = CalcArea(obj)
%|             area = obj.frameWidth * obj.frameHeight;
%|         end
%|
%|         % Display property values
%|         function ShowFields(obj)
%|             fprintf('Width = %d, Height = %d\n', ...
%|                     obj.frameWidth, obj.frameHeight);
%|         end
%|     end
%| end

%% Stored vs dependent properties:**
%| classdef photoFrameModified
%|     properties (Access = private)        % Stored properties
%|         frameWidth = 3;
%|         frameHeight = 10;
%|         quantityOrdered = 1;
%|     end
%|     properties (Constant, Access = private)
%|         inchToCmFactor = 2.54;
%|     end
%|     properties (Dependent)               % Dependent property
%|         frameArea;
%|     end
%|
%|     methods
%|         % Get method for frameArea property
%|         function area = get.frameArea(obj)
%|             area = obj.frameWidth * obj.frameHeight;
%|         end
%|
%|         % Change frame dimensions
%|         function obj = SetFrameDimensions(obj, width, height)
%|             obj.frameWidth = width;
%|             obj.frameHeight = height;
%|         end
%|
%|         % Display property values
%|         function ShowFields(obj)
%|             fprintf('Width = %d, Height = %d, Area = %d\n', ...
%|                     obj.frameWidth, obj.frameHeight, obj.frameArea);
%|         end
%|     end
%| end

frame1 = photoFrameModified;
frame1.ShowFields()
frame1 = frame1.SetFrameDimensions(5, 20);
frame1.ShowFields()

Width = 3, Height = 10, Area = 30
Width = 5, Height = 20, Area = 100

frame1.get.frameArea()      % incorrect syntax to get the frameArea

frame1.frameArea()
frame1.frameArea

%% Ordinary methods & method attributes
%| classdef photoFrame
%|     properties (Access = private)
%|         frameWidth;
%|         frameHeight;
%|     end

    methods
        % Constructor
        function obj = photoFrame(width, height)
            % Create, return photoFrame object (code not shown)
        end

        % Change frame dimensions
        function obj = SetFrameDimensions(obj, width, height)
            % Assign user values to frameWidth and frameHeight
            % (code not shown)
        end

        % Display property values
        function ShowFields(obj)
            fprintf('Width = %d, Height = %d\n', ...
                    obj.frameWidth, obj.frameHeight);    % methods can access private members
        end
    end
    methods (Access = private, Hidden = true)
        function CalculateFrameCost(obj)
            % Calculate cost based on dimensions (code not shown)
        end
    end
end

%% Static methods
%| classdef photoFrame
%|     properties (Access = private)
%|         frameWidth;
%|         frameHeight;
%|     end
%| ...
%|     methods (Static)        % Static method
%|         % Converts input argument from inches to cm
%|         function sizeCm = convertInToCm(sizeInches)
%|             sizeCm = sizeInches * 2.54;
%|         end
%|     end
%|

x = photoFrame.convertInToCm(10)

%% 1.6 Class Example: Seat Reservation System
%| classdef seat
%|     properties (Access = private)
%|         firstName;
%|         lastName;
%|         amountPaid;
%|     end
%|
%|     methods
%|         % Constructor
%|         function obj = seat()
%|             obj.firstName = 'empty';
%|             obj.lastName = 'empty';
%|             obj.amountPaid = 0;
%|         end
%|
%|         % Checks if a seat is empty
%|         function isEmpty = CheckSeatEmpty(obj)
%|             isEmpty = strcmp(obj.firstName, 'empty');
%|         end
%|
%|         % Reserve seat
%|         function obj = ReserveSeat(obj, userFirstName, userLastName, ticketPrice)
%|             obj.firstName = userFirstName;
%|             obj.lastName = userLastName;
%|             obj.amountPaid = ticketPrice;
%|         end
%|
%|         % Prints seat information
%|         function PrintSeat(seat)
%|             if strcmp(seat.firstName, 'empty')
%|                 fprintf('empty\n')
%|             else
%|                 fprintf('%s %s, Paid: %d\n', seat.firstName, seat.lastName, seat.amountPaid)
%|             end
%|         end
%|     end
%| end

%| classdef eventInfo
%|     properties (Access = private)
%|         venueName;
%|         showDate;
%|         allSeats = seat;
%|     end
%|
%|     methods
%|         % Constructor
%|         function obj = eventInfo(location, date, numberSeats)
%|             if nargin == 3
%|                 obj.venueName = location;
%|                 obj.showDate = date;
%|                 obj.allSeats(1:numberSeats) = seat();    % Array of seats
%|             else
%|                 obj.venueName = [];
%|                 obj.showDate = [];
%|                 obj.allSeats(1) = [];
%|             end
%|         end
%|
%|         % Reserve seat in venue
%|         function obj = ReserveSeat(obj)
%|             seatNumber = input('Enter seat number: ');   % Get seat number
%|
%|             % If empty, reserve seat
%|             if obj.allSeats(seatNumber).CheckSeatEmpty()
%|                 name1 = input('Enter first name:  ', 's');
%|                 name2 = input('Enter last name:  ', 's');
%|                 cost = input('Enter amount paid:  ');
%|
%|                 obj.allSeats(seatNumber) = obj.allSeats(seatNumber).ReserveSeat(name1, name2, cost);
%|
%|             % If not empty, display error
%|             else
%|                 fprintf('Error: Seat %d is not empty.\n', seatNumber)
%|             end
%|         end
%|
%|         % Print all venue information
%|         function PrintVenueInfo(obj)
%|             fprintf('Venue location: %s\n', obj.venueName);
%|             fprintf('Event date: %s\n', obj.showDate);
%|
%|             for i = 1:length(obj.allSeats)
%|                 fprintf('%d: ', i);
%|                 obj.allSeats(i).PrintSeat();
%|             end
%|         end
%|     end
%| end

% Assign default menu value
userKey = 'go';

% Create an instance of class eventInfo
ticketSystem = eventInfo('Symphony Hall', '05-May-2003', 5);

% Continue to prompt user for menu selection while not quit
while ~strcmp(userKey, 'q')
    userKey = input('Enter command (p/r/q): ', 's');

    if strcmp(userKey, 'p')                  % Print venue info
        ticketSystem.PrintVenueInfo();

    elseif strcmp(userKey, 'r')              % Reserve a seat
        ticketSystem = ticketSystem.ReserveSeat();

    elseif strcmp(userKey, 'q')              % Quit
        disp('Quitting.');

    else
        disp('Invalid command.');            % User did not type p, r, or q
    end

end

%% 1.7 Operator Overloading
%| classdef tripDetails
%|     properties (Access = private)
%|         tripHours;
%|         tripMinutes;
%|     end
%|
%|     methods
%|         % Constructor
%|         function obj = tripDetails(travelHrs, travelMins)
%|             if nargin == 2
%|                 obj.tripHours = travelHrs;
%|                 obj.tripMinutes = travelMins;
%|             else
%|                 obj.tripHours = [];
%|                 obj.tripMinutes = [];
%|             end
%|         end
%|
%|         % Print trip hours and minutes
%|         function printTripDetails(obj)
%|             fprintf('Trip duration: %d hours, %d min\n', ...
%|                     obj.tripHours, obj.tripMinutes);
%|         end

        % Overloads the + operator
        function obj = plus(obj1, obj2)
            totalMinutes = (obj1.tripHours * 60) + obj1.tripMinutes + ...
                           (obj2.tripHours * 60) + obj2.tripMinutes;

            obj = tripDetails(floor(totalMinutes/60), mod(totalMinutes, 60));
        end
    end
end

t1 = tripDetails(3, 22);
t1.printTripDetails();
t2 = tripDetails(2, 50);
t2.printTripDetails();
t3 = t1 + t2;
t3.printTripDetails();

Trip duration: 3 hours, 22 min
Trip duration: 2 hours, 50 min
Trip duration: 6 hours, 12 min

%% 1.8 Mutators, Accessors & Private Helpers
%| classdef GameInfo
%|     properties (Access = private)
%|         game1Score;
%|         game2Score;
%|     end
%|
%|     methods
%|         % Mutator methods
%|         function obj = SetGame1Score(obj, gameScore)
%|             obj.game1Score = gameScore;
%|         end
%|
%|         function obj = SetGame2Score(obj, gameScore)
%|             obj.game2Score = gameScore;
%|         end
%|
%|         % Accessor methods
%|         function gameScore = GetGame1Score(obj)
%|             gameScore = obj.game1Score;
%|         end
%|
%|         function gameScore = GetGame2Score(obj)
%|             gameScore = obj.game2Score;
%|         end
%|
%|         function returnValue = FindHighScore(obj)
%|             returnValue = max(obj.game1Score, obj.game2Score);
%|         end
%|     end
%| end

cardGame = GameInfo;

cardGame = cardGame.SetGame1Score(88);
cardGame = cardGame.SetGame2Score(135);

fprintf('Game 1: %d\n', cardGame.GetGame1Score);
fprintf('Game 2: %d\n', cardGame.GetGame2Score);
fprintf('Highest score: %d\n', cardGame.FindHighScore);

Game 1: 88
Game 2: 135
Highest score: 135

%| classdef GameInfo
%|     properties (Access = private)
%|         game1Score;
%|         game2Score;
%|     end
%|
%|     properties (Dependent, Access = private)
%|         highScore;
%|     end
%|
%|     methods
%|         % Public mutator and accessor methods
%|         function obj = SetGame1Score(obj, gameScore)
%|             obj.game1Score = gameScore;
%|         end
%|
%|         function obj = SetGame2Score(obj, gameScore)
%|             obj.game2Score = gameScore;
%|         end
%|
%|         function gameScore = GetGame1Score(obj)
%|             gameScore = obj.game1Score;
%|         end
%|
%|         function gameScore = GetGame2Score(obj)
%|             gameScore = obj.game2Score;
%|         end
%|
%|         function returnValue = FindHighScore(obj)
%|             returnValue = obj.highScore;
%|         end
%|     end
%|
%|     methods
%|         % The set and get methods are automatically called
%|         % when a property is accessed
%|         function obj = set.game1Score(obj, gameScore)
%|             if (gameScore < 0)
%|                 obj.game1Score = 0;
%|             elseif (gameScore > 100)
%|                 obj.game1Score = 100;
%|             else
%|                 obj.game1Score = gameScore;
%|             end
%|         end
%|
%|         function obj = set.game2Score(obj, gameScore)
%|             if (gameScore < 0)
%|                 obj.game2Score = 0;
%|             elseif (gameScore > 100)
%|                 obj.game2Score = 100;
%|             else
%|                 obj.game2Score = gameScore;
%|             end
%|         end
%|
%|         function highScore = get.highScore(obj)
%|             highScore = max(obj.game1Score, obj.game2Score);
%|         end
%|     end
%| end

%| classdef GameInfo
%|     properties (Access = private)
%|         game1Score;
%|         game2Score;
%|     end
%|
%|     methods
%|         % Public mutator and accessor methods
%|         % ...
%|     end
%|
%|     methods
%|         % The set and get methods are automatically called
%|         % when a property is accessed
%|         function obj = set.game1Score(obj, gameScore)
%|             obj.game1Score = obj.CheckSetValue(gameScore);
%|         end
%|
%|         function obj = set.game2Score(obj, gameScore)
%|             obj.game2Score = obj.CheckSetValue(gameScore);
%|         end
%|
%|         % ...
%|     end
%|
%|     methods (Static, Access = private)
%|         % Helper method
%|         function boundedScore = CheckSetValue(gameScore)
%|             if (gameScore < 0)
%|                 boundedScore = 0;
%|             elseif (gameScore > 100)
%|                 boundedScore = 100;
%|             else
%|                 boundedScore = gameScore;
%|             end
%|         end
%|     end
%| end

%% 1.9 Handle Classes
tripA = tripDetails(1, 30);      % value class
tripB = tripA;

tripA.tripHours = 5;

tripA.printTripDetails();
tripB.printTripDetails();

Trip duration: 5 hours, 30 min
Trip duration: 1 hours, 30 min

tripA = tripDetailH(1, 30);      % handle class
tripB = tripA;

tripA.tripHours = 5;

tripA.printTripDetails();
tripB.printTripDetails();

Trip duration: 5 hours, 30 min
Trip duration: 5 hours, 30 min

%% 1.10 Handle Class Example: Ball Drop
%| classdef BallDrop < handle
%|     properties (Access = private)
%|         xPos;               % Starting ball position, x-coordinate
%|         yPos;               % Starting ball position, y-coordinate
%|         yVelocity;          % Ball falling velocity, y component
%|         ballRadius;         % Ball radius
%|         ballColor;          % Ball color
%|     end
%|
%|     properties (Constant)
%|         minyVelocity = -10; % Minimum y velocity
%|     end
%|
%|     methods
%|         % Constructor
%|         function obj = BallDrop()
%|             % Assign randomized starting location
%|             obj.xPos = 18 * rand(1) - 9;              % -9 < random number < 9
%|             obj.yPos = 9;                             % Starts at the top
%|
%|             % Assign random falling velocity of ball
%|             obj.yVelocity = -0.5 * rand(1) - 0.1;     % -0.6 < random number < -0.1
%|
%|             % Assign random ball radius and color
%|             obj.ballRadius = rand(1) * .9;            % 0 < random number < 0.9
%|             obj.ballColor = [randi(2) - 1, ...
%|                              randi(2) - 1, randi(2) - 1];   % R, G, B is 0 or 1
%|         end
%|
%|         % Moves ball instance from top of screen to bottom
%|         function MoveBall(obj)
%|             obj.yPos = obj.yPos + obj.yVelocity;
%|
%|             % If ball hits bottom, then stops falling
%|             if ((obj.yPos - 1 * obj.ballRadius) <= obj.minyVelocity)
%|                 obj.yVelocity = 0;
%|                 obj.yPos = -10 + obj.ballRadius;
%|             end
%|         end
%|
%|         % Creates a rounded rectangle (i.e. ball) on 2-D line plot
%|         function PlotBall(obj)
%|             ballSize = obj.ballRadius * 2;
%|             pos = [obj.xPos, obj.yPos, ballSize, ballSize];   % Specifies location and size
%|             curv = [1, 1];                                     % Adds curvature to the sides of the rectangle
%|             rectangle('Position', pos, 'Curvature', curv, 'FaceColor', obj.ballColor);
%|         end
%|     end
%| end

% The main script creates a 100 balls and
% an animation that drops the balls onto a surface.
rng('default')                  % added so your balls match the figures

numberBalls = 100;              % Defines number of balls
figure(1);                      % Creates a figure window

for b = 1:numberBalls           % Create 100 instances of BallDrop
    balls(b) = BallDrop;
end

for j = 1:200
    hold on;                    % Clear balls in the
    clf;                        % current graph
    finish = false;

    for b = 1:numberBalls       % Re-position each ball to a lower
        balls(b).MoveBall;      % y position (i.e. make ball fall)
        balls(b).PlotBall;
    end

    axis([-12, 12, -12, 12]);   % Sets graphics
    rectangle('Position', [-11, -11, 22, 22]);
    set(gca, 'visible', 'off', 'DataAspectRatio', [1, 1, 1]);
    pause(.03)                  % Pause before next iteration of loop
end

%% ===== HO — Object-Oriented Programming in Matlab — Exercises =====

%% Exercise 1.3
officeFrame.CalcArea()

%% Exercise 1.4
%| classdef employeeData                                  % A: classdef
%|     properties
%|         name;
%|         currentSalary;                                 % B: currentSalary;
%|     end                                                % C: end
%|
%|     methods
%|         function obj = employeeData(name, currentSalary)   % D: constructor
%|             obj.name = name;
%|             obj.currentSalary = currentSalary;
%|         end
%|
%|         function obj = SetSalary(obj, newSalary)
%|             obj.currentSalary = newSalary;             % E: obj.currentSalary
%|         end
%|     end
%| end

%% Exercise 1.5
properties
    model = 'GT40';
    year = 1966;
end

%% Exercise 1.6
properties (Access = private)
    model = 'GT40';
    year = 1966;
end

%% Exercise 1.7
properties (Constant)
    milesToKilometers = 1.60934;
end

%% Exercise 1.9
properties (Access = protected)
    mpg = 16.5;
    tankCapacity;
end

%% Exercise 1.12
_____
    function obj = ResetSalary(obj)
        % Re-assign an object's relevant salary
        % properties to default values
    end
end

%% Exercise 1.13
%| function otPay = OvertimePay(______)
%|     otPay = (obj.hoursWorked - 40) * 1.5 * hourlyRate;
%| end

%% Exercise 1.14
%| function ______
%|     % Creates and returns an employeeData object
%| end

%% Exercise 1.20
totalFlightTime = flightA + flightB;

%% Exercise 1.21
mondayDrive = tripDetails(4, 15);
weddayDrive = tripDetails(6, 34);
weeklyDrive = mondayDrive + weddayDrive;

%% Exercise 1.22
saturdayDrive = tripDetails(1, 45);
sundayDrive = tripDetails(1, 30);
weekendDrive = saturdayDrive + sundayDrive;

%% Exercise 1.23
%| function obj = ____(obj1, obj2)

%% Exercise 1.27
tripA = tripDetails(3, 27);
tripB = tripA;

tripA.tripHours = 1;
tripB.tripMinutes = 48;

%% Exercise 1.30
rng('default')
c = [randi(2) - 1, randi(2) - 1, randi(2) - 1]

