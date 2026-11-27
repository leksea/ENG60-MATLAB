%% sdc_ch08.m  --  MATLAB code collected from the lab notebook sections:
%   - SDC Chapter 8 — Importing & Exporting Data
%   - SDC Chapter 8 — Exercises
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== SDC Chapter 8 — Importing & Exporting Data =====

%% 8.1 Navigating the File System
curr_dir = pwd

%% 8.2 File System Functions
copyfile('*', '~/Documents/Matlab2')   % everything in current folder (files + folders)
copyfile('*.txt', '../Matlab2')                      % all .txt -> sibling folder Matlab2

cd /Users/alexandrayakovleva
cd ..

contents = ls('~/Matlab/Week7')
files = ls

status = mkdir('../NewFolder')

[status, msg, error] = mkdir('../NewFolder?')

[status, msg, error] = rmdir('../NewFolder')

home = ' /MATLAB Drive'
cd(home)                 % Start from the default working directory
pwd                      % Assure yourself you're in the right place
ls                       % List the files in this directory
edit testfile1           % Make some files to play with
edit testfile2
edit testfile3.txt
mkdir ..\matlab2         % Create a new sibling directory
cd ..
pwd                      % Where you are now
ls                       % Notice that matlab2 exists here
cd matlab2               % Move into that directory
ls                       % Nothing here yet
copyfile('..\matlab\testfile*.m')          % Copy files to this folder
ls                       % And there they are
movefile('testfile1.m', 'testfile4.m')     % Rename a file
dir                      % Verify the name change
cd(home)
pwd                      % And you're back
%rmdir('..\matlab2')     % Can't do it - the directory isn't empty
delete('..\matlab2\*.*') % Delete the copied files
rmdir('..\matlab2')      % Works now
delete('testfile*')      % Clean up

%% 8.3 Working with .mat Files
clear      % Start with an empty Workspace
a = 1
b = 2
save

clear
load

Loading from: matlab.mat

delete matlab.mat
load

a = 1; b = 2; save
c = 3
save

d = 4
save vars.mat

d = 1
load vars.mat
d

clear
load vars.mat a c

b = 2
d = 6
save vars2.mat c d
clear
load vars2

%% 8.4 Importing Delimited Text: readmatrix
readmatrix  midterm_ay_log.txt

M = readmatrix midterm_ay_log.txt
M = readmatrix('midterm_ay_log.txt')

2^5

%% 8.5 Import Options: detectImportOptions
opts = detectImportOptions('midterm_ay_log.txt')

readmatrix midterm_ay_log.txt

opts = detectImportOptions('midterm_ay_log.txt')

opts.Delimiter = {',' ':'}
readmatrix('ImportExample11.txt', opts)

opts.ConsecutiveDelimitersRule = 'join'
readmatrix('importexample11.txt', opts)

opts.DataLines = [3 3; 5 7]
readmatrix('importexample11.txt', opts)

opts.SelectedVariableNames = {'Duck', 'Cat'}
readmatrix('ImportExample11.txt', opts)

%% 8.6 readmatrix with Excel Spreadsheets
readmatrix('IOExample.xlsx')

opts = detectImportOptions('IOExample.xlsx')

readmatrix('IOExample.xlsx', opts)

opts.VariableTypes

opts.VariableTypes(1) = {'double'}
opts.VariableTypes(5) = {'double'}
opts.VariableTypes
readmatrix('IOExample.xlsx', opts)

opts.DataRange = '4:7'
readmatrix('IOExample.xlsx', opts)

%% 8.7 Name/Value Pairs
M = readmatrix('IOExample.xlsx', 'Sheet', 'Sheet2', 'Range', 'B2:E8')

%% 8.8 readvars & readcell
[items, store1prices] = readvars('IOExample.xlsx');

opts = detectImportOptions('IOExample.xlsx')
opts.SelectedVariableNames = [1 3 5];
opts.DataRange = '2:10';
[items, Store2, Store4] = readvars('IOExample.xlsx', opts);

c = readcell('MixedDataExample.csv')

%% 8.10 Exporting: writematrix & writecell
Goals = readmatrix('ImportExample7.txt')
writematrix(Goals)

Goals = readmatrix('ImportExample7.txt')
writematrix(Goals, '../goals.xlsx')
writematrix(Goals, '../goals.dat')

M = readmatrix('ImportExample1.txt')
writematrix(M, 'IOExample.xlsx', 'Sheet', 'New Sheet', 'Range', 'D4')

%% 8.11 Exporting Formatted Text: fopen, fprintf, fclose
fileID = fopen('MyNewFile.txt', 'wt+')

name = 'Ada';
fprintf('My name is %s.\n', name);

My name is Ada.

fprintf('%.2f\n', pi)

fprintf('This isn't a good place for a quote');

fprintf('This isn''t a good place for a quote\n');

This isn't a good place for a quote

ids = fopen('all')

fclose(fileID)

fclose('all')

%% ===== SDC Chapter 8 — Exercises =====

%% Exercise 8.1
p = pwd
folders = strsplit(p, filesep)

%% Exercise 8.2
p = path;                              % char row vector
fid = fopen('mypath.txt', 'wt');
if fid > 0
    fprintf(fid, '%s\n', strrep(p, pathsep, newline));   % one folder per line
    fclose(fid);
end
C = readcell('mypath.txt', 'Delimiter', '\');
size(C)

%% Exercise 8.3
% List files (not folders) in the current folder, sorted A-Z
d = dir;
d = d(~[d.isdir]);          % drop folders, '.' and '..'
names = sort({d.name})'     % column cell array, alphabetical

%% Exercise 8.4
M = readmatrix('HeatTreatData.xlsx');
[V1, V2] = readvars('HeatTreatData.xlsx');
save heattreat.mat M V1 V2
whos M V1 V2

%% Exercise 8.5
opts = detectImportOptions('HeatTreatData.xlsx');
opts.MissingRule = 'omitrow';        % empty cells -> drop row
opts.ImportErrorRule = 'omitrow';    % text in a numeric cell -> drop row
M = readmatrix('HeatTreatData.xlsx', opts);
M = M(~any(isnan(M), 2), :);
writematrix(M, 'HeatTreatClean.xlsx', 'Sheet', 1)

%% Exercise 8.6
V = [V1 V2];
V = V(~any(isnan(V), 2), :);         % same rows as sheet 1
writematrix(V(:,1), 'HeatTreatClean.xlsx', 'Sheet', 2, 'Range', 'A1')
writematrix(V(:,2), 'HeatTreatClean.xlsx', 'Sheet', 2, 'Range', 'B1')

isequal(readmatrix('HeatTreatClean.xlsx', 'Sheet', 1), ...
        readmatrix('HeatTreatClean.xlsx', 'Sheet', 2))

%% Exercise 8.7
C = readcell('Mortality-1.xlsx');
hdr  = C(1,:);
body = C(2:end,:);

isNum  = all(cellfun(@(x) isnumeric(x) || ismissing(x), body), 1);   % numeric columns
isCtry = contains(string(hdr), "country", 'IgnoreCase', true);        % country-name column

keep = isNum | isCtry;
out  = C(:, keep);                  % keeps header row too
writecell(out, 'MortalityClean.xlsx')

