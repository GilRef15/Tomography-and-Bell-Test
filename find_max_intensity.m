% List of video names
videoNames = {'+45+22.5.mp4', '+45+67.5.mp4', '+45+112.5.mp4', '+45-22.5.mp4', ...
              '-45+22.5.mp4', '-45+67.5.mp4', '-45+112.5.mp4', '-45-22.5.mp4', ...
              '0+22.5.mp4', '0+67.5.mp4', '0+112.5.mp4', '0-22.5.mp4', ...
              '+90+22.5.mp4', '+90+67.5.mp4', '+90+112.5.mp4', '+90-22.5.mp4'};

% Define percentage for threshold calculation
percentageA = 80; % Percentage for Alice's intensity threshold (e.g., 80%)
percentageB = 80; % Percentage for Bob's intensity threshold (e.g., 80%)

% Loop through each video
for j = 1:length(videoNames)
    vidname = videoNames{j};
    filename = vidname(1:end-4); % Extract name without extension

    % Create VideoReader object
    v = VideoReader(vidname);

    % Specify frame range to process
    startFrame = 1;
    endFrame = v.NumFrames;

    % Initialize intensity arrays
    A = []; % Alice's intensity
    B = []; % Bob's intensity

    % Frame counter for array indexing
    frameCounter = 1;

    % Initialize counter for frames where both intensities exceed their respective thresholds
    countSimultaneousExceed = 0; 

    % Main loop to process frames
    for i = startFrame:endFrame
        % Read the current frame
        frame = read(v, i);

        % Calculate intensity for Alice and Bob
        A(frameCounter) = sum(sum(frame(98:317, 494:765, 1))); % Alice's region
        B(frameCounter) = sum(sum(frame(132:289, 971:1176, 1))); % Bob's region

        % Increment the frame counter
        frameCounter = frameCounter + 1;
    end

    % Find the maximum intensity values for Alice and Bob
    maxA = max(A);
    maxB = max(B);

    % Calculate threshold values based on percentages
    thresholdA = (percentageA / 100) * maxA;
    thresholdB = (percentageB / 100) * maxB;

    % Loop through the intensities to count the frames where both exceed their respective thresholds
    for k = 1:length(A)
        % Check if both Alice's and Bob's intensities exceed their respective thresholds simultaneously
        if A(k) > thresholdA && B(k) > thresholdB
            countSimultaneousExceed = countSimultaneousExceed + 1; % Increment counter for simultaneous exceedance
        end
    end

    % Output the results for this video
    fprintf('Video: %s - Frames number: %d\n', ...
            filename, countSimultaneousExceed);

end
