clear
clc
close all
%---------------------- User defined parameters------------------------
Vi = 10;                % Initial Velocity
ang = 60;               % Initial Angle

Num_of_samples = 100;    % Number of samples
ball_size = 20;         % Size of the ball in the plot
%----------------------------------------------
figure('Position',[100 50 1000 600]);  % create new figure

Vxi = Vi.*cosd(ang);    % initial horizontal velocity
Vyi = Vi.*sind(ang);    % initial vertical velocity
g = -9.8;               % gravitational acceleration  

tf = -2*Vyi/g;          % Time required to back to ground, Vf = Vi + a*t (Vfinal = -Vintial)
mxx = tf.*Vxi;          % Total Horizontal travaled distance
mxy = 0.5*tf.*Vyi + 0.5*g*(0.5*tf).^2; % Maximum Height


t = linspace(0,tf,Num_of_samples); % Defined time samples 

Vx = Vxi;               % instantaneous horizontal velocity
Vy = Vyi - 9.8*t;       % instantaneous vertical velocity

dx = Vx.*t;             % instantaneous horizontal distance 
dy = (Vy.^2 - Vyi^2)/(2*g); % instantaneous vertical distance (Height)

ax = gca;               % get the current axis
axis equal              % use same length per unit for x & y axes
axis([0 max([1.1*mxx mxy]) 0 max([1.5*mxy mxx])]) % set the limit of x & y axes
ax.NextPlot = 'replaceChildren'; % for next plot, old plotted data is removed without changing figure properties

for i=1:Num_of_samples
    plot(dx(1:i),dy(1:i),'--O','MarkerIndices',i,'LineWidth',0.5,'MarkerSize',ball_size,'MarkerFaceColor','b');
    text(0.05,0.9,{['Angle = ' num2str(ang) ' Deg']},'FontSize',16,'Unit','normalized');
    text(0.05,0.95,{['Initial Velocity = ' num2str(Vi) ' m/s']},'FontSize',16,'Unit','normalized');
    xlabel('Distance (m)')
    ylabel('Height (m)')
    pause(0.1)
end


