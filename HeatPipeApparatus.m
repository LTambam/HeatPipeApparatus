function ArduinoINOUT

%counter
% global n
% n = 1;

%Thermistor calibration constants
global ka;
global kb;
global kc;
ka = 0.0006234;
kb = 0.0002279;
kc = 0.000000069697;

%Timer iteration
global t
t = 0.10;

%Define constants for arduino hardware
pin.T1 = 'A0';
pin.T2 = 'A1';
pin.T3 = 'A2';
pin.T4 = 'A3';
pin.T5 = 'A4';
pin.T6 = 'A5';
pin.T7 = 'A6';
pin.T8 = 'A7';

%build gui for experiment
h = HeatPipeApparatusGUI;

%Create arduino object
a = arduino;

% Set up timer for updating figure
Timer = timer;
Timer.TimerFcn = @(~,~) UpdateFigure(h,a);
Timer.ExecutionMode = 'fixedRate';
Timer.Period = t;

% Store IVs
%Time
initial.Time = 0;

%Temperature
initial.T1 = 0;
initial.T2 = 0;
initial.T3 = 0;
initial.T4 = 0;
initial.T5 = 0;
initial.T6 = 0;
initial.T7 = 0;
initial.T8 = 0;

%Voltages
initial.V1 = 0;
initial.V2 = 0;
initial.V3 = 0;
initial.V4 = 0;
initial.V5 = 0;
initial.V6 = 0;
initial.V7 = 0;
initial.V8 = 0;

%Array for values
initial.X(1,1) = initial.Time;
initial.X(1,2) = initial.T1;
initial.X(1,3) = initial.T2;
initial.X(1,4) = initial.T3;
initial.X(1,5) = initial.T4;
initial.X(1,6) = initial.T5;
initial.X(1,7) = initial.T6;
initial.X(1,8) = initial.T7;
initial.X(1,9) = initial.T8;

%Upload application data
setappdata(h.UIFigure,'handles',h)
setappdata(h.UIFigure,'pins',pin)
setappdata(h.UIFigure,'oldValues',initial)

% Handle closing the figure
h.UIFigure.CloseRequestFcn = @(~,~) CloseFigure(h,Timer);

% Start execution
start(Timer)

function UpdateFigure(h,a)
% global n
global ka
global kb
global kc
global t
if ~h.StopExperimentButton.Value
    
    %iterate the global variable n
%     n = n+1;
    
    %obtain data from the previous iteration
    old = getappdata(h.UIFigure,'oldValues');
    pin = getappdata(h.UIFigure,'pins');
    
%     %update gui plot
%     plot(h.UIAxes,old.X(:,1),old.X(:,2),old.X(:,1),old.X(:,3),...
%         old.X(:,1),old.X(:,4),old.X(:,1),old.X(:,5),old.X(:,1),...
%         old.X(:,6),old.X(:,1),old.X(:,7),old.X(:,1),old.X(:,8),...
%         old.X(:,1),old.X(:,9))
    
    %resize axes
%     if old.Time > 150
%         h.UIAxes.XLim = [(old.Time-150) old.Time];
%     end
    
    %set edit field values for gui
    h.TEF.Value = old.Time;
%     h.T1EF.Value = old.T1;
%     h.T2EF.Value = old.T2;
%     h.T3EF.Value = old.T3;
%     h.T4EF.Value = old.T4;
%     h.T5EF.Value = old.T5;
%     h.T6EF.Value = old.T6;
%     h.T7EF.Value = old.T7;
%     h.T8EF.Value = old.T8;

    %set time
    new.Time = old.Time+t;
    
    %Read Voltages from arduino
    new.V1 = readVoltage(a,pin.T1);
    new.V2 = readVoltage(a,pin.T2);
    new.V3 = readVoltage(a,pin.T3);
    new.V4 = readVoltage(a,pin.T4);
    new.V5 = readVoltage(a,pin.T5);
    new.V6 = readVoltage(a,pin.T6);
    new.V7 = readVoltage(a,pin.T7);
    new.V8 = readVoltage(a,pin.T8);
    
    %Update 
%     new.T1 = (1/(ka+kb*(log((-100000*V1)/(V1-5)))+kc*((log((-100000*V1)/(V1-5))).^3)))-273.15;
%     new.T2 = (1/(ka+kb*(log((-100000*V2)/(V2-5)))+kc*((log((-100000*V2)/(V2-5))).^3)))-273.15;
%     new.T3 = (1/(ka+kb*(log((-100000*V3)/(V3-5)))+kc*((log((-100000*V3)/(V3-5))).^3)))-273.15;
%     new.T4 = (1/(ka+kb*(log((-100000*V4)/(V4-5)))+kc*((log((-100000*V4)/(V4-5))).^3)))-273.15;
%     new.T5 = (1/(ka+kb*(log((-100000*V5)/(V5-5)))+kc*((log((-100000*V5)/(V5-5))).^3)))-273.15;
%     new.T6 = (1/(ka+kb*(log((-100000*V6)/(V6-5)))+kc*((log((-100000*V6)/(V6-5))).^3)))-273.15;
%     new.T7 = (1/(ka+kb*(log((-100000*V7)/(V7-5)))+kc*((log((-100000*V7)/(V7-5))).^3)))-273.15;
%     new.T8 = (1/(ka+kb*(log((-100000*V8)/(V8-5)))+kc*((log((-100000*V8)/(V8-5))).^3)))-273.15;
         
    
    
    %create fresh array
%     new.X = NaN(n,9);
    new.X = [old.X; new.Time new.V1 new.V2 new.V3 new.V4 new.V5 new.V6 new.V7 new.V8];
    
    %update array
%     for i = 1:(n-1)
%         new.X(i,1) = old.X(i,1);
%         new.X(i,2) = old.X(i,2);
%         new.X(i,3) = old.X(i,3);
%         new.X(i,4) = old.X(i,4);
%         new.X(i,5) = old.X(i,5);
%         new.X(i,6) = old.X(i,6);
%         new.X(i,7) = old.X(i,7);
%         new.X(i,8) = old.X(i,8);
%         new.X(i,9) = old.X(i,9);
%     end
    
    %Update next values
%     new.X(n,1) = new.Time;
%     new.X(n,2) = new.T1;
%     new.X(n,3) = new.T2;
%     new.X(n,4) = new.T3;
%     new.X(n,5) = new.T4;
%     new.X(n,6) = new.T5;
%     new.X(n,7) = new.T6;
%     new.X(n,8) = new.T7;
%     new.X(n,9) = new.T8;
    
    %save values to app data
    setappdata(h.UIFigure,'oldValues',new)
    
end

drawnow

function CloseFigure(h,Timer)

var = getappdata(h.UIFigure,'oldValues');
Y = var.X;
disp(Y)
save('luke.mat','Y')

%clearing objects
stop(Timer)
delete(Timer)
delete(h.UIFigure)
clear a
