function[] = Plot_time(chosen_r, max_t, n)
% Function to solve for a and b to plot values at a given distance over time for comp PDE's CW1 Q3
%
% Input:
% chosen_r = distance r at which a(t) and b(t) will be calculated
% max_t = maximum value of time for which to solve for a and b to
% n = parameter used to calculate a and b (described in CW as eta(?))
%
% Output: 
% None.
%
% Figures:
% Plot of a and b over time at distance chosen_r from origin
%
% Function uses the same methods as Plot_fieldlines function to solve a and b (finite differences)
% and instead plots values of a and b at a given input distance over the range of time input. This
% essentially gives a qualitative view of when the values of a and b (and hence psi) stop changing
% with time, allowing t_infinity to be found (as needed in Q3)

    % Values for spatial discretisation
    N = 100;
    h = 2 / N;
    
    % Values for temporal discretisation
    k = 0.001;
    M = max_t/k;
    
    
    % Storage for values of a, b across R, and up to time T, with initial conditions
    a_old = transpose(linspace(0, 2, N));
    b_old = zeros(N, 1);
   
    a_new = transpose(linspace(0, 2, N));
    b_new = zeros(N, 1);
    
    % Allocate and define omega vector
    w = zeros(N, 1);
    w(1:(N/2)) = 1;
    % Alternate initial condition
    %w(1:(N/2)) = linspace(0, 1, N/2);

    % Arrays for storing a and b over time for Q3
    a_t = zeros(M, 1);
    b_t = zeros(M, 1);
    
    % Iteration through time
    store_point = ceil((chosen_r/2)*N);
    for j = 1:M
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
                         
            % Storing a and b over time for Q3
            a_t(j) = a_old(store_point); 
            b_t(j) = b_old(store_point); 
            
            a_old = a_new;
            b_old = b_new;
            r = r + h;
            
        end
    end
    
    time_arr = linspace(0, max_t, M);
    plot(time_arr, a_t, time_arr, b_t);
    
    title(['Plot of a and b over time for r = ', num2str(chosen_r), ' and n = ', num2str(n)])
    xlabel('time');
    ylabel('y');
    legend('y = a(t)', 'y = b(t)');

end