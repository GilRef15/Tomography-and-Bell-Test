% Input the N values in the following format:
% Each row represents a set of N values for one measurement
% Format: [N(a,b), N(a_perpendicular,b_perpendicular), N(a,b_perpendicular), N(a_perpendicular,b)]
N_values = [
    1, 2, 5, 11;   % Row 1: N(a,b), N(a_perpendicular,b_perpendicular), N(a,b_perpendicular), N(a_perpendicular,b)
    11, 5, 2, 1;  % Row 2: Another set of N values
    5, 11, 1, 2;    % Row 3: Add more rows for your 16 combinations
    2, 1, 11, 5;  % Row 4: etc.
    4, 0, 4, 3;  % Row 5
    3, 4, 0, 4;  % Row 6
    4, 3, 4, 0;  % Row 7
    0, 4, 3, 4;  % Row 8
    6, 4, 0, 0;  % Row 9
    0, 0, 4, 6;  % Row 10
    0, 0, 6, 4;  % Row 11
    4, 6, 0, 0;  % Row 12
    5, 3, 0, 0;  % Row 13
    0, 0, 3, 5;  % Row 14
    0, 0, 5, 3;  % Row 15
    3, 5, 0, 0   % Row 16
];

% Calculate 16 E values based on the formula
E_values = zeros(16, 1);  % Array to store E values

for i = 1:16
    N1 = N_values(i, 1);  % N(a,b)
    N2 = N_values(i, 2);  % N(a_perpendicular,b_perpendicular)
    N3 = N_values(i, 3);  % N(a,b_perpendicular)
    N4 = N_values(i, 4);  % N(a_perpendicular,b)
    
    % Calculate E(a,b) using the given formula
    E_values(i) = (N1 + N2 - N3 - N4) / (N1 + N2 + N3 + N4);
end

% Calculate 4 S values (one for each combination)
S_values = zeros(4, 1);

S_values(1) = E_values(1) - E_values(2) + E_values(3) + E_values(4);   % Combination 1
S_values(2) = E_values(5) - E_values(6) + E_values(7) + E_values(8);   % Combination 2
S_values(3) = E_values(9) - E_values(10) + E_values(11) + E_values(12); % Combination 3
S_values(4) = E_values(13) - E_values(14) + E_values(15) + E_values(16); % Combination 4

% Uncertainty calculation for S based on the uncertainties of E
sigma_N = sqrt(N_values);  % Standard deviation for N values (sqrt(N))

% Calculate uncertainty for each S value
delta_S = zeros(4, 1);

for i = 1:4
    % Get the E values that contribute to the current S value
    if i == 1
        idx = 1:4; % Indices for first S combination
    elseif i == 2
        idx = 5:8; % Indices for second S combination
    elseif i == 3
        idx = 9:12; % Indices for third S combination
    else
        idx = 13:16; % Indices for fourth S combination
    end
    
    % Calculate uncertainty for each S based on the uncertainties of E
    % Use element-wise multiplication and summing of squared uncertainties
    error_contributions = sum(sigma_N(idx, :).^2, 2);  % Sum of squared uncertainties for each row
    total_sum = sum(N_values(idx, :), 2);  % Sum of N values for each row
    
    % Error propagation formula
    delta_S(i) = sqrt(sum(error_contributions .* (1 ./ total_sum).^2));
end

% Display results
disp('E values for each measurement:');
disp(E_values);

disp('S values for each combination of angles:');
disp(S_values);

disp('Uncertainty for each S value:');
disp(delta_S);






