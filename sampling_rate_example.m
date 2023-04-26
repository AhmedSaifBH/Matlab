%----------------------------------------------------------------------
% Sampling Rate Demonstration Using MATLAB 
% Created by Ahmed Saif
% Instagram: https://www.instagram.com/digital.bh/
% YouTube: https://www.youtube.com/@AhmedSaif_BH
%----------------------------------------------------------------------
clear
clc
close all
%---------------------- User defined parameters------------------------
x =@(t) sin(2*pi*t);    % Define the signal x(t) as Anonymous Function (change it to signal you want and modify the required below **)
Num_0f_periods = 2;     % Number of periods to be plotted 
Fs = [1 2 4 6 10 20];   % Sampling rates
%----------------------------------------------------------------------
t = 0:1e-3:Num_0f_periods;              % Define the time vector **(adjust this based on signal frequancy)
figure('Position',[10 50 1200 600])     % create new figure
Wd = 1.5;                               % Width of the line

for idx = Fs
    subplot(2,1,1)
    plot(t,x(t),'LineWidth',Wd)             % plot the signal (continuous graph)
    grid on
    hold on
    Ts = 1/idx;                             % Sampling Period
    nTs = 0:Ts:Num_0f_periods;              % Timing of taken samples
    n = 0:length(nTs)-1;                    % order of taken samples
    plot(nTs,x(nTs),'--o','LineWidth',Wd)   % plot the signal based on taken samples  
    xlabel('Time')
    hold off
    subplot(2,1,2)
    stem(n,x(nTs),'LineWidth',Wd)           % Draw the disecreat signal
    xlabel('Points')
    ylim([min(x(t)) max(x(t))])
    xlim([0 max(n)])
    xticks(n)
    text(0.8,0.8,[num2str(idx) ' Samples / s'],'Units','normalized','FontSize',14);
    text(0.8,0.7,['x[n] = ' 'sin(2\pin/' num2str(idx) ')'],'Units','normalized','FontSize',14); % **(Modify this line when defined signal change)
%     saveas(gcf,['fig' num2str(idx) '.png'])   % Uncommend this line to save the graphs

    pause(1)
end

