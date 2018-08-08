function ArduinoINOUT

%counter
global n
n = 1;
global n2
n2 = 1;

%Thermistor calibration constants
global ka;
global kb;
global kc;
ka = 0.0006234;
kb = 0.0002279;
kc = 0.000000069697;

%Timer iteration
global t
t = 5;
global t2
t2 = 0.05;

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
Timer.TimerFcn = @(~,~) UpdateFigure(h);
Timer.ExecutionMode = 'fixedRate';
Timer.Period = t;

%Set up timer for acquiring data
Timer2 = timer;
Timer2.TimerFcn = @(~,~) AcquireData(h,a);
Timer2.ExecutionMode = 'fixedRate';
Timer2.Period = t2;

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
h.UIFigure.CloseRequestFcn = @(~,~,~) CloseFigure(h,Timer,Timer2);

% Start execution
start(Timer)
start(Timer2)

function UpdateFigure(h)
global n
if ~h.StopExperimentButton.Value
   
    %iterate the global variable n
    n = n+1;
    
    %obtain data from the previous iteration
    old = getappdata(h.UIFigure,'oldValues');
    
    %update gui plot
    plot(h.UIAxes,old.X(:,1),old.X(:,2),old.X(:,1),old.X(:,3),...
        old.X(:,1),old.X(:,4),old.X(:,1),old.X(:,5),old.X(:,1),...
        old.X(:,6),old.X(:,1),old.X(:,7),old.X(:,1),old.X(:,8),...
        old.X(:,1),old.X(:,9))
    
    %resize axes
    if old.Time > 150
        h.UIAxes.XLim = [(old.Time-150) old.Time];
    end
    
    %set edit field values for gui
    h.TEF.Value = old.Time;
    h.T1EF.Value = old.T1;
    h.T2EF.Value = old.T2;
    h.T3EF.Value = old.T3;
    h.T4EF.Value = old.T4;
    h.T5EF.Value = old.T5;
    h.T6EF.Value = old.T6;
    h.T7EF.Value = old.T7;
    h.T8EF.Value = old.T8;
    
end
drawnow

function AcquireData(h)
global n2
global t2
global ka
global kb
global kc
if ~h.StopExperimentButton.Value
    
%     tic
    
    %iterate the global variable n
    n2 = n2+1;
    
    %obtain data from the previous iteration
    old = getappdata(h.UIFigure,'oldValues');
    
    pin = getappdata(h.UIFigure,'pins');
    

    %set time
    new.Time = old.Time+t2;
    
    %Read Voltages from arduino
    V1 = readVoltage(a,pin.T1);
    V2 = readVoltage(a,pin.T2);
    V3 = readVoltage(a,pin.T3);
    V4 = readVoltage(a,pin.T4);
    V5 = readVoltage(a,pin.T5);
    V6 = readVoltage(a,pin.T6);
    V7 = readVoltage(a,pin.T7);
    V8 = readVoltage(a,pin.T8);

    %Update
    new.T1 = (1/(ka+kb*(log((-100000*V1)/(V1-5)))+kc*((log((-100000*V1)/(V1-5))).^3)))-273.15;
    new.T2 = (1/(ka+kb*(log((-100000*V2)/(V2-5)))+kc*((log((-100000*V2)/(V2-5))).^3)))-273.15;
    new.T3 = (1/(ka+kb*(log((-100000*V3)/(V3-5)))+kc*((log((-100000*V3)/(V3-5))).^3)))-273.15;
    new.T4 = (1/(ka+kb*(log((-100000*V4)/(V4-5)))+kc*((log((-100000*V4)/(V4-5))).^3)))-273.15;
    new.T5 = (1/(ka+kb*(log((-100000*V5)/(V5-5)))+kc*((log((-100000*V5)/(V5-5))).^3)))-273.15;
    new.T6 = (1/(ka+kb*(log((-100000*V6)/(V6-5)))+kc*((log((-100000*V6)/(V6-5))).^3)))-273.15;
    new.T7 = (1/(ka+kb*(log((-100000*V7)/(V7-5)))+kc*((log((-100000*V7)/(V7-5))).^3)))-273.15;
    new.T8 = (1/(ka+kb*(log((-100000*V8)/(V8-5)))+kc*((log((-100000*V8)/(V8-5))).^3)))-273.15;
         
    new.X = [old.X; new.Time new.T1 new.T2 new.T3 new.T4 new.T5 new.T6 new.T7 new.T8];
    
    %save values to app data
    setappdata(h.UIFigure,'oldValues',new)
    
%     timeval = toc;
%     disp(timeval)
    
end

function CloseFigure(h,Timer,Timer2)

var = getappdata(h.UIFigure,'oldValues');
Y = var.X;
disp(Y)
save('luke.mat','Y')

%clearing objects
stop(Timer)
delete(Timer)
stop(Timer2)
delete(Timer2)

delete(h.UIFigure)

clear obj

