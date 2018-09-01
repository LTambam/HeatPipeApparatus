classdef HeatPipeApparatusGUI < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                      matlab.ui.Figure
        TabGroup                      matlab.ui.container.TabGroup
        MainTab                       matlab.ui.container.Tab
        TemperatureKLabel             matlab.ui.control.Label
        T1Label                       matlab.ui.control.Label
        T2Label                       matlab.ui.control.Label
        T3Label                       matlab.ui.control.Label
        T4Label                       matlab.ui.control.Label
        T5Label                       matlab.ui.control.Label
        T6Label                       matlab.ui.control.Label
        T7Label                       matlab.ui.control.Label
        T8Label                       matlab.ui.control.Label
        T1EF                          matlab.ui.control.NumericEditField
        T2EF                          matlab.ui.control.NumericEditField
        T3EF                          matlab.ui.control.NumericEditField
        T4EF                          matlab.ui.control.NumericEditField
        T5EF                          matlab.ui.control.NumericEditField
        T6EF                          matlab.ui.control.NumericEditField
        T7EF                          matlab.ui.control.NumericEditField
        T8EF                          matlab.ui.control.NumericEditField
        WaterJacketLabel              matlab.ui.control.Label
        FlowRateLmLabel               matlab.ui.control.Label
        HeaterLabel                   matlab.ui.control.Label
        HeatOutWLabel                 matlab.ui.control.Label
        VoltageVLabel                 matlab.ui.control.Label
        CurrentALabel                 matlab.ui.control.Label
        HeatInWLabel                  matlab.ui.control.Label
        FREF                          matlab.ui.control.EditField
        VEF                           matlab.ui.control.EditField
        IEF                           matlab.ui.control.EditField
        HeatInEF                      matlab.ui.control.NumericEditField
        GeometryLabel                 matlab.ui.control.Label
        LengthmmLabel                 matlab.ui.control.Label
        ODLabel                       matlab.ui.control.Label
        IDLabel                       matlab.ui.control.Label
        LEF                           matlab.ui.control.EditField
        ODEF                          matlab.ui.control.EditField
        IDEF                          matlab.ui.control.EditField
        HeatOutEF                     matlab.ui.control.NumericEditField
        TimesLabel                    matlab.ui.control.Label
        TEF                           matlab.ui.control.NumericEditField
        ExperimentControlButtonGroup  matlab.ui.container.ButtonGroup
        StartExperimentButton         matlab.ui.control.ToggleButton
        StopExperimentButton          matlab.ui.control.ToggleButton
        ResetExperimentButton         matlab.ui.control.ToggleButton
        LiveTemperaturePlotTab        matlab.ui.container.Tab
        UIAxes                        matlab.ui.control.UIAxes
        SaveButton                    matlab.ui.control.StateButton
        FNEF                          matlab.ui.control.EditField
        FNLabel                       matlab.ui.control.Label
        EILabel                       matlab.ui.control.Label
        EIEF                          matlab.ui.control.EditField
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'UI Figure';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 1 640 480];

            % Create MainTab
            app.MainTab = uitab(app.TabGroup);
            app.MainTab.Title = 'Main';

            %Start of Temperature UI
            % Create TemperatureKLabel
            app.TemperatureKLabel = uilabel(app.MainTab);
            app.TemperatureKLabel.FontWeight = 'bold';
            app.TemperatureKLabel.Position = [70 400 99 15];
            app.TemperatureKLabel.Text = 'Temperature (C)';

            % Create T1Label
            app.T1Label = uilabel(app.MainTab);
            app.T1Label.Position = [70 370 25 15];
            app.T1Label.Text = 'T1:';

            % Create T2Label
            app.T2Label = uilabel(app.MainTab);
            app.T2Label.Position = [70 340 25 15];
            app.T2Label.Text = 'T2:';

            % Create T3Label
            app.T3Label = uilabel(app.MainTab);
            app.T3Label.Position = [70 310 25 15];
            app.T3Label.Text = 'T3:';

            % Create T4Label
            app.T4Label = uilabel(app.MainTab);
            app.T4Label.Position = [70 280 25 15];
            app.T4Label.Text = 'T4:';

            % Create T5Label
            app.T5Label = uilabel(app.MainTab);
            app.T5Label.Position = [70 250 25 15];
            app.T5Label.Text = 'T5:';
            
             % Create T6Label
            app.T6Label = uilabel(app.MainTab);
            app.T6Label.Position = [70 220 25 15];
            app.T6Label.Text = 'T6:';

            % Create T7Label
            app.T7Label = uilabel(app.MainTab);
            app.T7Label.Position = [70 190 25 15];
            app.T7Label.Text = 'T7:';

            % Create T8Label
            app.T8Label = uilabel(app.MainTab);
            app.T8Label.Position = [70 160 25 15];
            app.T8Label.Text = 'T8:';
                   
            % Create EditField_T1
            app.T1EF = uieditfield(app.MainTab, 'numeric');
            app.T1EF.Limits = [-2000 2000];
            app.T1EF.ValueDisplayFormat = '%.1f';
            app.T1EF.Editable = 'off';
            app.T1EF.Position = [100 366 38 22];
            
             % Create EditField_T2
            app.T2EF = uieditfield(app.MainTab, 'numeric');
            app.T2EF.Limits = [-2000 2000];
            app.T2EF.ValueDisplayFormat = '%.1f';
            app.T2EF.Editable = 'off';
            app.T2EF.Position = [100 336 38 22];

            % Create EditField_T3
            app.T3EF = uieditfield(app.MainTab, 'numeric');
            app.T3EF.Limits = [-2000 2000];
            app.T3EF.ValueDisplayFormat = '%.1f';
            app.T3EF.Editable = 'off';
            app.T3EF.Position = [100 306 38 22];

            % Create EditField_T4
            app.T4EF = uieditfield(app.MainTab, 'numeric');
            app.T4EF.Limits = [-2000 2000];
            app.T4EF.ValueDisplayFormat = '%.1f';
            app.T4EF.Editable = 'off';
            app.T4EF.Position = [100 276 38 22];

            % Create EditField_T5
            app.T5EF = uieditfield(app.MainTab, 'numeric');
            app.T5EF.Limits = [-2000 2000];
            app.T5EF.ValueDisplayFormat = '%.1f';
            app.T5EF.Editable = 'off';
            app.T5EF.Position = [100 246 38 22];

            % Create EditField_T6
            app.T6EF = uieditfield(app.MainTab, 'numeric');
            app.T6EF.Limits = [-2000 2000];
            app.T6EF.ValueDisplayFormat = '%.1f';
            app.T6EF.Editable = 'off';
            app.T6EF.Position = [100 216 38 22];

            % Create EditField_T7
            app.T7EF = uieditfield(app.MainTab, 'numeric');
            app.T7EF.Limits = [-2000 2000];
            app.T7EF.ValueDisplayFormat = '%.1f';
            app.T7EF.Editable = 'off';
            app.T7EF.Position = [100 186 38 22];

            % Create EditField_T8
            app.T8EF = uieditfield(app.MainTab, 'numeric');
            app.T8EF.Limits = [-2000 2000];
            app.T8EF.ValueDisplayFormat = '%.1f';
            app.T8EF.Editable = 'off';
            app.T8EF.Position = [100 156 38 22];

            %%%%%%%%%%%%%%%%%%%%%
            
            %Start of Water Jacket UI
            % Create WaterJacketLabel
            app.WaterJacketLabel = uilabel(app.MainTab);
            app.WaterJacketLabel.FontWeight = 'bold';
            app.WaterJacketLabel.Position = [430 400 81 15];
            app.WaterJacketLabel.Text = 'Water Jacket';
            
            % Create FlowRateLmLabel
            app.FlowRateLmLabel = uilabel(app.MainTab);
            app.FlowRateLmLabel.Position = [430 370 94 15];
            app.FlowRateLmLabel.Text = 'Flow Rate(mL/min):';
            
            % Create EditField FR
            app.FREF = uieditfield(app.MainTab, 'text');
%             app.FREF.Limits = [0 1000];
%             app.FREF.ValueDisplayFormat = '%.0f';
            app.FREF.Position = [530 366 38 22];
            app.FREF.Value = '0';
                        
            % Create HeatOutWLabel
            app.HeatOutWLabel = uilabel(app.MainTab);
            app.HeatOutWLabel.Position = [430 340 81 15];
            app.HeatOutWLabel.Text = 'Heat Out (W): ';
                                    
            % Create HeatOutEF
            app.HeatOutEF = uieditfield(app.MainTab, 'numeric');
            app.HeatOutEF.Limits = [-2000 2000];
            app.HeatOutEF.ValueDisplayFormat = '%.1f';
            app.HeatOutEF.Editable = 'off';
            app.HeatOutEF.Position = [530 336 38 22];
            
            %%%%%%%%%%%%%%%%%            
            
            %Start of Heater UI
            % Create HeaterLabel
            app.HeaterLabel = uilabel(app.MainTab);
            app.HeaterLabel.FontWeight = 'bold';
            app.HeaterLabel.Position = [230 280 62 15];
            app.HeaterLabel.Text = 'Heater';
            
            % Create VoltageVLabel
            app.VoltageVLabel = uilabel(app.MainTab);
            app.VoltageVLabel.Position = [230 250 72 15];
            app.VoltageVLabel.Text = 'Voltage (V): ';
            
            % Create VEF
            app.VEF = uieditfield(app.MainTab, 'text');
            app.VEF.Position = [330 246 38 22];
            app.VEF.Value = '0';

            % Create CurrentALabel
            app.CurrentALabel = uilabel(app.MainTab);
            app.CurrentALabel.Position = [230 220 68 15];
            app.CurrentALabel.Text = 'Current (A):';
            
            % Create IEF
            app.IEF = uieditfield(app.MainTab, 'text');
            app.IEF.Position = [330 216 38 22];
            app.IEF.Value = '0';
            
            % Create HeatInWLabel
            app.HeatInWLabel = uilabel(app.MainTab);
            app.HeatInWLabel.Position = [230 190 72 15];
            app.HeatInWLabel.Text = 'Heat In (W): ';
            
            % Create HeatInEF
            app.HeatInEF = uieditfield(app.MainTab, 'numeric');
            app.HeatInEF.Limits = [0 200];
            app.HeatInEF.ValueDisplayFormat = '%.1f';
            app.HeatInEF.Editable = 'off';
            app.HeatInEF.Position = [330 186 38 22];
    
            %%%%%%%%%%%%%%%%%%
            
            %Start of Geometry UI
            % Create GeometryLabel
            app.GeometryLabel = uilabel(app.MainTab);
            app.GeometryLabel.FontWeight = 'bold';
            app.GeometryLabel.Position = [230 400 62 15];
            app.GeometryLabel.Text = 'Geometry';

            % Create LengthmmLabel
            app.LengthmmLabel = uilabel(app.MainTab);
            app.LengthmmLabel.Position = [230 370 77 15];
            app.LengthmmLabel.Text = 'L [mm]:';
            
            % Create LEF
            app.LEF = uieditfield(app.MainTab, 'text');
            app.LEF.Position = [330 366 38 22];
            app.LEF.Value = '0';

            % Create Outer Diameter Label
            app.ODLabel = uilabel(app.MainTab);
            app.ODLabel.Position = [230 340 89 15];
            app.ODLabel.Text = 'OD [mm]:';
           
            % Create ODEF
            app.ODEF = uieditfield(app.MainTab, 'text');
            app.ODEF.Position = [330 336 38 22];    
            app.ODEF.Value = '0';
            
            % Create Inner Diameter Label
            app.IDLabel = uilabel(app.MainTab);
            app.IDLabel.Position = [230 310 89 15];
            app.IDLabel.Text = 'ID [mm]:';   
            
            % Create IDEF
            app.IDEF = uieditfield(app.MainTab, 'text');          
            app.IDEF.Position = [330 306 38 22]; 
            app.IDEF.Value = '0';
           
            %%%%%%%%%%%%%%%%%%%%

            %Start of Time UI
            % Create TimesLabel
            app.TimesLabel = uilabel(app.MainTab);
            app.TimesLabel.FontWeight = 'bold';
            app.TimesLabel.Position = [430 157 58 15];
            app.TimesLabel.Text = 'Time (s): ';

            % Create TEF
            app.TEF = uieditfield(app.MainTab, 'numeric');
            app.TEF.Limits = [0 10000];
            app.TEF.ValueDisplayFormat = '%.2f';
            app.TEF.Editable = 'off';
            app.TEF.Position = [500 153 38 22];
            %%%%%%%%%%%%%%%%%%%%%%%%

            %Start of Control Button UI
            % Create ExperimentControlButtonGroup
            app.ExperimentControlButtonGroup = uibuttongroup(app.MainTab);
            app.ExperimentControlButtonGroup.Title = 'Experiment Control';
            app.ExperimentControlButtonGroup.Position = [430 187 123 115];

            % Create StartExperimentButton
            app.StartExperimentButton = uitogglebutton(app.ExperimentControlButtonGroup);
            app.StartExperimentButton.Text = 'Start Experiment';
            app.StartExperimentButton.BackgroundColor = [0 1 0];
            app.StartExperimentButton.Position = [8.5 72 105 22];

            % Create StopExperimentButton
            app.StopExperimentButton = uitogglebutton(app.ExperimentControlButtonGroup);
            app.StopExperimentButton.Text = 'Stop Experiment';
            app.StopExperimentButton.BackgroundColor = [1 0 0];
            app.StopExperimentButton.Position = [8.5 40 105 22];
            app.StopExperimentButton.Value = true;
            
            % Create ResetExperimentButton
            app.ResetExperimentButton = uitogglebutton(app.ExperimentControlButtonGroup);
            app.ResetExperimentButton.Text = 'Reset';
            app.ResetExperimentButton.BackgroundColor = [1 1 1];
            app.ResetExperimentButton.Position = [8.5 8 105 22];
                        
            %%%%%%%%%%%%%%%%%%%%%%%%
            
            % Create FilenameLabel
            app.FNLabel = uilabel(app.MainTab);
            app.FNLabel.Position = [70 60 77 15];
            app.FNLabel.Text = 'Filename:';
            
            %edit field for writing file name
            app.FNEF = uieditfield(app.MainTab, 'text');
            app.FNEF.Position = [130 56 150 22];
            
            %button for saving data
            app.SaveButton = uibutton(app.MainTab,'state');
            app.SaveButton.Text = 'Save Data';
            app.SaveButton.Position = [293 56 85 22];
            
            %label for experiement information
            app.EILabel = uilabel(app.MainTab);
            app.EILabel.Text = 'Experiment Information: ';
            app.EILabel.Position = [70 100 150 15];
            
            %edit field for experiment information
            app.EIEF = uieditfield(app.MainTab, 'text');
            app.EIEF.Position = [220 96 350 22];
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            %Start of Live Plot UI
            % Create LiveTemperaturePlotTab
            app.LiveTemperaturePlotTab = uitab(app.TabGroup);
            app.LiveTemperaturePlotTab.Title = 'Live Temperature Plot';

            % Create UIAxes
            app.UIAxes = uiaxes(app.LiveTemperaturePlotTab);
            title(app.UIAxes, 'Live Temperature Plot')
            xlabel(app.UIAxes, 'Time (s)')
            ylabel(app.UIAxes, 'Temperature (K)')
            app.UIAxes.Box = 'on';
            app.UIAxes.XGrid = 'on';
            app.UIAxes.YGrid = 'on';
            app.UIAxes.XLim = [0 150];
            app.UIAxes.YLim = [0 120];
            app.UIAxes.Position = [1 0 639 456];
            
            %%%%%%%%%%%%%%%%%%%%%%%%%
                       
        end
    end
    
    methods (Access = public)

        % Construct app
        function app = HeatPipeApparatusGUI

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end