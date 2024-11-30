% Insert Video Name Below
vidname = '-45+67.5.mp4';
filename = vidname(2:9);

% Create VideoReader object
v = VideoReader(vidname);

% Specify frame range to process
startFrame = 1;   % Replace with the desired starting frame
endFrame = v.NumFrames;    % Replace with the desired ending frame
%Instead of specifying endFrame manually, use the property 
%v.NumFrames to automatically set it to the total number of frames in the video.

% Initialize intensity arrays
A = []; % Alice's intensity
B = []; % Bob's intensity

% Frame counter for array indexing
frameCounter = 1;

% Main loop to process specified frame range
for i = startFrame:endFrame
    % Read the current frame
    frame = read(v, i);

    % Calculate intensity for Alice and Bob
    A(frameCounter) = sum(sum(frame(98:317, 494:765, 1)));
    B(frameCounter) = sum(sum(frame(132:289, 971:1176, 1)));

    % Increment the frame counter
    frameCounter = frameCounter + 1;
end

% Plot the intensity data
fig = figure;
plot(A, 'DisplayName', 'Alice');
hold on;
plot(B, 'DisplayName', 'Bob');
hold off;

% Add plot labels and legend
xlabel('Frame Index');
ylabel('Sum of Pixels');
title('Intensity of Frames');
legend('show');

% Save the plot as PNG
filename = strcat(filename, '.png');
saveas(fig, filename, 'png');
