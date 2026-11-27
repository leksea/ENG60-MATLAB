%% ho_numerical_integration.m  --  MATLAB code collected from the lab notebook sections:
%   - HO — Numerical Integration
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== HO — Numerical Integration =====

a = 3.01*10^9; b = 2.74*10^9;
[trapzApprox, numIntegrate] = PlanetDistance(a,b,1000)

%| function [trapzApprox, numIntegrate] = PlanetDistance(a,b,nPoints)
%|     trapzApprox=TrapzPlanet(a,b,nPoints);
%|     numIntegrate=IntegratePlanet(a,b);
%|     fprintf("Trapezoid integration %f", numIntegrate);
%|     fprintf("Numeric integration %f", numIntegrate);
%| end
%|
%| function trapzApprox=TrapzPlanet(a,b,nPoints)
%|
%|     k = sqrt(a^2 - b^2)/a;
%|     x = linspace(0, pi/2, nPoints);
%|     y = sqrt(1 - (k^2)*sin(x).^2);
%|     trapzApprox = 4*a*trapz(x, y);
%| end
%|
%| function numIntegrate=IntegratePlanet(a,b)
%|
%|     k = sqrt(a^2 - b^2)/a;
%|     fun1 = @(x) sqrt(1 - (k^2)*sin(x).^2);
%|     xmin =0;
%|     xmax = pi/2;
%|     numIntegrate = integral(fun1,xmin,xmax)*4*a;
%| end

a = 3.01*10^9; b = 2.74*10^9;
[trapzApprox, numIntegrate] = PlanetDistance(a,b,1000)

