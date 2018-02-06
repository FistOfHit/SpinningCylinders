
% Define tolerance 
tol = 10^(-9);

% Define array of n values
n = linspace(0.16, 0.01, 30);

% Setting up steps in r
N = 100;
h = 2/N;
% Settung up step in time
k = 0.001;

% checking convergence for num_checked timesteps
num_checked = 500;

% Allocate and define omega vector
w = zeros(N, 1);
% w(1:(N/2)) = 1;
% Alternate initial condition
w(1:(N/2)) = linspace(0, 1, N/2); 
% w(1:0.5*N) = cos(linspace(0, pi, 0.5*N)) + sin(linspace(0, pi, 0.5*N));

% Convergence times array
conv_times = zeros(length(n), 1);

for q = 1:length(n)
    
    % Zero and re-zero a and b for each value of n
    a = zeros(N, num_checked);
    b = zeros(N, num_checked);
    % Initial conditions on a
    a(:, 1) = transpose(linspace(0, 2, N));

    conv_t = 0;
    convergence = 0;
    
    % Continue through time, 5 steps per loop until convergence
    while (~convergence)
        
        % Iteration through num_checked-1 timesteps
        for j = 1:num_checked-1
            % Iteration through space
            r = h;
            for i = 2:N-1

                a(i, j+1) = k*(n(q)*((1/h)*((1/h + 1/(2*r))*a(i+1, j)  ...
                                + (1/h - 1/(2*r))*a(i-1, j))  ...
                                - (2/(h^2) + 1/(r^2))*a(i, j))  ...
                                + w(i)*b(i, j))  ...
                                + a(i, j);

                b(i, j+1) = k*(n(q)*((1/h)*((1/h + 1/(2*r))*b(i+1, j) ...
                                 + (1/h - 1/(2*r))*b(i-1, j))  ...
                                 - (2/h^2 + 1/r^2)*b(i, j))  ...
                                 - w(i)*a(i, j))  ...
                                 + b(i, j);

                r = r + h;
                
            end
        end
        
        % Appending convergence time
        conv_t = conv_t + (num_checked*k);
        % Checking if a(t) at r = 0.5 is not changing significantly anymore
        if (all(abs(diff(a(N/4, :))) <= tol) && all(abs(diff(b(N/4, :))) <= tol))
            convergence = 1;
        end
        
        % Replacing initial condtions with end of previous loops results
        a(:, 1) = a(:, num_checked);
        b(:, 1) = b(:, num_checked);
        
    end
    
    % Setting time to converge per value of n
    conv_times(q) = conv_t;
    
end

% Plotting data with the fitted curve
figure;
plot(n, conv_times, '+');
title('Plot of time taken to converge for varying n');
xlabel('n');
ylabel('Time to converge');

% Linear regression on log-log data
log_y_data = log(conv_times);
log_x_data = [ones(length(n), 1), transpose(log(n))];
grad_incept = log_x_data\log_y_data;
disp(['gradient = ', num2str(grad_incept(2)), ', y-intercept = ', num2str(grad_incept(1))]);

% Plotting Log-Log data
figure;
plot(log_x_data(:, 2), log_y_data, '+');
hold on;
plot(log_x_data(:, 2), log_x_data(:, 2)*grad_incept(2) + grad_incept(1));
hold off;
title('Log-Log plot of time taken to converge for varying n');
xlabel('Log(n)');
ylabel('Log(Time to converge)');
legend('Log-Log data', ['LR fitted line - gradient = ', num2str(grad_incept(2))]);




