%% ho_week10.m  --  MATLAB code collected from the lab notebook sections:
%   - HO — Week 10
% Prompts (>>) and printed results are removed. Lines starting with %| are file contents
% (functions / classes): save them as separate files with the name shown in the notebook.

%% ===== HO — Week 10 =====

clear all
x = 0:0.5:30;                  % hours after the B737 leaves LAX (LAX time)

jet = 500*x;                   % B737 Max 8: distance from LAX, 500 mph west
fighter = 600*x - (2500 + 0.5*600);   % fighter: 600 mph, 2500 mi away, leaves 0.5 h later

% intercept: 500x = 600x - 2800
xi = 2800/100                  % hours
di = 500*xi                    % miles from LAX

plot(x, jet, 'b-', x, fighter, 'r-', 'LineWidth', 1.5)
hold on
plot(xi, di, 'ko', 'MarkerFaceColor', 'k')
text(xi-9, di+600, sprintf('Intercept: %.0f h, %.0f mi', xi, di))
hold off
title('B737 Max 8 and Fighter Jet Intercept')
xlabel('time, hours (LAX time)'); ylabel('distance from LAX, miles')
legend('B737 Max 8: y = 500x', 'Fighter jet: z = 600x - 2800', 'Location', 'northwest')
grid on

clear all
x = 0:20;                      % time, seconds

y = 2/7*x + 6;                 % Elizabeth: 2 m in 7 s, 6 m head start
z = 3/5*x + 2;                 % Kim: 3 m in 5 s, 2 m head start
w = 1*x;                       % Jill: 1 m in 1 s, starts on time

% crossing points: m1*x + b1 = m2*x + b2  ->  x = (b2-b1)/(m1-m2)
m = [2/7 3/5 1];  b = [6 2 0];
xEK = (b(2)-b(1))/(m(1)-m(2));   yEK = m(1)*xEK + b(1);   % Elizabeth and Kim
xEJ = (b(3)-b(1))/(m(1)-m(3));   yEJ = m(1)*xEJ + b(1);   % Elizabeth and Jill
xKJ = (b(3)-b(2))/(m(2)-m(3));   yKJ = m(2)*xKJ + b(2);   % Kim and Jill

fprintf('Kim passes Elizabeth at t = %.2f s, d = %.2f m\n', xEK, yEK)
fprintf('Jill passes Elizabeth at t = %.2f s, d = %.2f m\n', xEJ, yEJ)
fprintf('Jill passes Kim at t = %.2f s, d = %.2f m\n', xKJ, yKJ)

plot(x,y,'b-', x,z,'r-', x,w,'g-', 'LineWidth', 1.5)
hold on
plot([xEK xEJ xKJ], [yEK yEJ yKJ], 'ko', 'MarkerFaceColor', 'k')
text(xEK+0.3, yEK-0.8, sprintf('(%.1f s, %.1f m)', xEK, yEK))
text(xEJ+0.3, yEJ-0.8, sprintf('(%.1f s, %.1f m)', xEJ, yEJ))
text(xKJ+0.3, yKJ-0.8, sprintf('(%.1f s, %.1f m)', xKJ, yKJ))
hold off
title('The Great Bike Race')
xlabel('seconds'); ylabel('distance in meters')
legend('Elizabeth (2/7 m/s, +6 m)', 'Kim (3/5 m/s, +2 m)', 'Jill (1 m/s)', 'Location', 'northwest')
grid on

