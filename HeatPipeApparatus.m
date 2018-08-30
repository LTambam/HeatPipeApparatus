function HeatPipeApparatus

%counter for timer1
global n
n = 1;

%counter for timer2
global n2
n2 = 1;

%Timer period constants
global t
t = 5;
global t2
t2 = 1;

%Thermistor calibration constants using Steinhart-Hart Method
global ka;
global kb;
global kc;
ka = 0.0006234;
kb = 0.0002279;
kc = 0.000000069697;

%plot scale constant, must be same as scale in gui file
global sc;
sc = 150;

%Define pin constants for arduino hardware
pin.T1 = 'A0';
pin.T2 = 'A1';
pin.T3 = 'A2';
pin.T4 = 'A3';
pin.T5 = 'A4';
pin.T6 = 'A5';
pin.T7 = 'A6';
pin.T8 = 'A7';

%create gui object
h = HeatPipeApparatusGUI;

%create arduino object
a = arduino;

%set up timer for updating figure
Timer = timer;
Timer.TimerFcn = @(~,~) UpdateFigure(h);
Timer.ExecutionMode = 'fixedRate';
Timer.Period = t;

%set up timer for acquiring data
Timer2 = timer;
Timer2.TimerFcn = @(~,~) AcquireData(h,a);
Timer2.ExecutionMode = 'fixedRate';
Timer2.Period = t2;

%store IVs
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

%initialize array for experimental values
initial.X(1,1) = initial.Time;
initial.X(1,2) = initial.T1;
initial.X(1,3) = initial.T2;
initial.X(1,4) = initial.T3;
initial.X(1,5) = initial.T4;
initial.X(1,6) = initial.T5;
initial.X(1,7) = initial.T6;
initial.X(1,8) = initial.T7;
initial.X(1,9) = initial.T8;

%upload data onto gui object
setappdata(h.UIFigure,'handles',h)
setappdata(h.UIFigure,'pins',pin)
setappdata(h.UIFigure,'oldValues',initial)

%handle closing the figure
h.UIFigure.CloseRequestFcn = @(~,~,~) CloseFigure(h,Timer,Timer2);

%start execution
start(Timer)
start(Timer2)

function UpdateFigure(h)
%allow use of global variable within function
global n
global sc
%if start button is pressed
if h.StartExperimentButton.Value
   
    %iterate n
    n = n+1;
    
    %obtain data from the previous iteration
    old = getappdata(h.UIFigure,'oldValues');
    
    
    %update plot
    plot(h.UIAxes,old.X(:,1),old.X(:,2),old.X(:,1),old.X(:,3),...
        old.X(:,1),old.X(:,4),old.X(:,1),old.X(:,5),old.X(:,1),...
        old.X(:,6),old.X(:,1),old.X(:,7),old.X(:,1),old.X(:,8),...
        old.X(:,1),old.X(:,9))
    
    %resize axes so it follows plot
    if old.Time > sc
        h.UIAxes.XLim = [(old.Time-sc) old.Time];
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
    
    %calculate values for heat in and heat out
    %Specific Heat C = 4.8186 j/gC
    %mass flow rate g/s = mL/min/60 
    %m = (str2num(h.FREF.Value)/6000);
    
%when the start button isn't pressed
else
    %if the reset button is pressed
    if h.ResetExperimentButton.Value
        
        %reset n
        n = 1;
        
        %obtain data from the previous iteration
        old = getappdata(h.UIFigure,'oldValues');
        
        %update gui plot
        plot(h.UIAxes,old.X(:,1),old.X(:,2),old.X(:,1),old.X(:,3),...
            old.X(:,1),old.X(:,4),old.X(:,1),old.X(:,5),old.X(:,1),...
            old.X(:,6),old.X(:,1),old.X(:,7),old.X(:,1),old.X(:,8),...
            old.X(:,1),old.X(:,9))
        
        %reset plot scale
        h.UIAxes.XLim = [0 sc];
        
        %reset edit fields to 0
        h.TEF.Value = 0;
        h.T1EF.Value = 0;
        h.T2EF.Value = 0;
        h.T3EF.Value = 0;
        h.T4EF.Value = 0;
        h.T5EF.Value = 0;
        h.T6EF.Value = 0;
        h.T7EF.Value = 0;
        h.T8EF.Value = 0;
    end
end
%update gui
drawnow

function AcquireData(h,a)
%allow use of global variables
global n2
global t2
global ka
global kb
global kc
%if start button is pressed
if h.StartExperimentButton.Value

% start timer for testing time elapsed of this section
%    tic

    %iterate the global variable n2
    n2 = n2+1;
    
    %obtain data from the previous iteration
    old = getappdata(h.UIFigure,'oldValues');
    
    %obtain arduino pin data
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
    
    %calculate temperature data from voltages using voltage divider and
    %Steinhart-Hart equation
    new.T1 = (1/(ka+kb*(log((-100000*V1)/(V1-5)))+kc*((log((-100000*V1)/(V1-5))).^3)))-273.15;
    new.T2 = (1/(ka+kb*(log((-100000*V2)/(V2-5)))+kc*((log((-100000*V2)/(V2-5))).^3)))-273.15;
    new.T3 = (1/(ka+kb*(log((-100000*V3)/(V3-5)))+kc*((log((-100000*V3)/(V3-5))).^3)))-273.15;
    new.T4 = (1/(ka+kb*(log((-100000*V4)/(V4-5)))+kc*((log((-100000*V4)/(V4-5))).^3)))-273.15;
    new.T5 = (1/(ka+kb*(log((-100000*V5)/(V5-5)))+kc*((log((-100000*V5)/(V5-5))).^3)))-273.15;
    new.T6 = (1/(ka+kb*(log((-100000*V6)/(V6-5)))+kc*((log((-100000*V6)/(V6-5))).^3)))-273.15;
    new.T7 = (1/(ka+kb*(log((-100000*V7)/(V7-5)))+kc*((log((-100000*V7)/(V7-5))).^3)))-273.15;
    new.T8 = (1/(ka+kb*(log((-100000*V8)/(V8-5)))+kc*((log((-100000*V8)/(V8-5))).^3)))-273.15;

    %add a row of data to the array using new values
    new.X = [old.X; new.Time new.T1 new.T2 new.T3 new.T4 new.T5 new.T6 new.T7 new.T8];
    
    %save values to app data
    setappdata(h.UIFigure,'oldValues',new)

% stop timer for testing time elapsed of this section
%     timeval = toc;
%     disp(timeval)

%start button not pressed
else
    %if reset button pressed
    if h.ResetExperimentButton.Value
        
        %reset n2
        n2 = 1;
        
        %reset values
        new.Time = 0;
        new.T1 = 0;
        new.T2 = 0;
        new.T3 = 0;
        new.T4 = 0;
        new.T5 = 0;
        new.T6 = 0;
        new.T7 = 0;
        new.T8 = 0;
        
        %restart array with 0 values
        new.X = [new.Time new.T1 new.T2 new.T3 new.T4 new.T5 new.T6 new.T7 new.T8];
        
        %save reset values to app data
        setappdata(h.UIFigure,'oldValues',new)
    end
    %if save button is pressed
    if h.SaveButton.Value
        
        %obtain data from gui object
        old = getappdata(h.UIFigure,'oldValues');
        
        %char strings for text file
        FRtxt = 'Flow Rate [mL/min]: ';
        Ltxt = ' Length [mm]: ';
        IDtxt = ' Inner Diameter [mm]: ';
        ODtxt = ' OuterDiameter [mm]: ';
        
        %obtain edit field inputs from gui object
        FR = h.FREF.Value;
        L = h.LEF.Value;
        ID = h.IDEF.Value;
        OD = h.ODEF.Value;
        
        %join char strings together with edit field values
        textFile = strcat(FRtxt,FR,Ltxt,L,IDtxt,ID,ODtxt,OD);
        
        %obtain input file name
        fileName = h.FNEF.Value;
        
        %strings for file types
        txt = '.txt';
        mat = '.mat';
        
        %append file types to the file name
        fntxt = strcat(fileName,txt);
        fnmat = strcat(fileName,mat);
        
        %make Y variable of data array
        Y = old.X;
        %Take off the first row of data, the zero row
        Y = Y(2:end,:);
           
        %diplay data on terminal
        disp(textFile)
        disp(Y)
        
        %save the string to filename.txt
        dlmwrite(fntxt,textFile,'delimiter','')
        
        %save matrix to filename.mat
        save(fnmat,'Y')
        
        %unpress the save button
        h.SaveButton.Value = false;
    end
end

function CloseFigure(h,Timer,Timer2)

%stop and delete timer objects
stop(Timer)
delete(Timer)
stop(Timer2)
delete(Timer2)

%delete gui object
delete(h.UIFigure)

%clear objects
clear obj

