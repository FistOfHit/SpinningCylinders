function[psi] = Solve_fieldlines(N, M, k, n, plot)
% Function to solve for a and b to find contours of a B-field perpendicular to axis of rotation.
%
% Inputs:
% N = number of steps between r = 0 and r = 2 
% M = number of steps from t = 0 up to end of time T
% k = size of time step
% n = parameter used to calculate a and b
% plot = boolean, 1 for showing plot, 0 to not show plot
% 
% Outputs:
% psi = solution over all space at the final time T = M*k
%
% Figures:
% Polar contour plot of magnetic field
%
% Function uses finite difference methods to solve the system of PDE's describing the change in
% magnetic field strength/direction over time. The forward euler method is applied to time 
% derivatives and the centered difference method is applied to the spatial deriatives in the 
% coupled system of PDE's. a and b are calculated by iterating through M timesteps (or up to time
% T = M*k) and by discretising space into N points over the interval 0 <= r <= 2. As a and b are
% independent of theta, the problem is a 1-D parabolic PDE.
%
% Once the calculations are done, psi is calulated as psi = a*cos(theta) - b*sin(theta) and the
% contours of this function are plotted in polar coordinates. 


    % Ensure N is even for later
    if mod(N, 2) == 1
        N = N + 1;
    end

    % Size of step in r
    h = 2 / N;
    
    % Storage for values of a, b across R, and up to time T, with initial conditions
    a_old = transpose(linspace(0, 2, N));
    b_old = zeros(N, 1);
   
    a_new = transpose(linspace(0, 2, N));
    b_new = zeros(N, 1);
    
    % Allocate and define omega vector
    w = zeros(N, 1);
    w(1:(N/2)) = 1;
    % Alternate initial condition
    % w(1:(N/2)) = linspace(0, 1, N/2); 
    
    % Iteration through time
    for j = 1:M
        % Iteration through space
        r = h;
        for i = 2:N-1
            
            a_new(i) = k*(n*((1/h)*((1/h + 1/(2*r))*a_old(i+1)  ...
                            + (1/h - 1/(2*r))*a_old(i-1))  ...
                            - (2/(h^2) + 1/(r^2))*a_old(i))  ...
                            + w(i)*b_old(i))  ...
                            + a_old(i);
                       
            b_new(i) = k*(n*((1/h)*((1/h + 1/(2*r))*b_old(i+1) ...
                             + (1/h - 1/(2*r))*b_old(i-1))  ...
                             - (2/h^2 + 1/r^2)*b_old(i))  ...
                             - w(i)*a_old(i))  ...
                             + b_old(i);
                         
            a_old = a_new;
            b_old = b_new;
            r = r + h;
            
        end
    end
    
    % Create data arrays for output   
    r = transpose(linspace(0, 2, N));
    theta = linspace(0, 2*pi, N);
    psi = (a_new*cos(theta)) - (b_new*sin(theta));
        
    if (plot == 1) 
        % Convert r, theta to Cartesian
        x = r.*cos(theta);
        y = r.*sin(theta);

        % Polar plot
        figure('rend', 'painters', 'pos',[300, 0, 700, 500])
        h = polar(x, y);
        hold on;
        
        % Contour plot
        contourf(x, y, psi, 30);
        set(h, 'Visible', 'off');
        axis off;

        title(['Plot of contours \psi up to time T = ', num2str(M*k), ' and n = ', num2str(n)]);
    end

end 