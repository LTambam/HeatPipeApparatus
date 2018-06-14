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
        WaterJacketLabel              matlab.ui.control.Label
        TInletKLabel                  matlab.ui.control.Label
        TOutletKLabel                 matlab.ui.control.Label
        FlowRateLmLabel               matlab.ui.control.Label
        HeaterLabel                   matlab.ui.control.Label
        HeatOutWLabel                 matlab.ui.control.Label
        VoltageVLabel                 matlab.ui.control.Label
        CurrentALabel                 matlab.ui.control.Label
        HeatInWLabel                  matlab.ui.control.Label
        T6Label                       matlab.ui.control.Label
        T7Label                       matlab.ui.control.Label
        T8Label                       matlab.ui.control.Label
        T9Label                       matlab.ui.control.Label
        T10Label                      matlab.ui.control.Label
        EditField                     matlab.ui.control.NumericEditField
        EditField_2                   matlab.ui.control.NumericEditField
        EditField_3                   matlab.ui.control.NumericEditField
        EditField_4                   matlab.ui.control.NumericEditField
        CheckBox                      matlab.ui.control.CheckBox
        CheckBox_2                    matlab.ui.control.CheckBox
        CheckBox_3                    matlab.ui.control.CheckBox
        CheckBox_4                    matlab.ui.control.CheckBox
        CheckBox_5                    matlab.ui.control.CheckBox
        CheckBox_6                    matlab.ui.control.CheckBox
        CheckBox_7                    matlab.ui.control.CheckBox
        CheckBox_8                    matlab.ui.control.CheckBox
        CheckBox_9                    matlab.ui.control.CheckBox
        CheckBox_10                   matlab.ui.control.CheckBox
        EditField_5                   matlab.ui.control.NumericEditField
        GeometryLabel                 matlab.ui.control.Label
        LengthmmLabel                 matlab.ui.control.Label
        DiametermmLabel               matlab.ui.control.Label
        EditField_20                  matlab.ui.control.NumericEditField
        EditField_21                  matlab.ui.control.NumericEditField
        EditField_22                  matlab.ui.control.NumericEditField
        EditField_23                  matlab.ui.control.NumericEditField
        EditField_24                  matlab.ui.control.NumericEditField
        EditField_25                  matlab.ui.control.NumericEditField
        EditField_26                  matlab.ui.control.NumericEditField
        EditField_27                  matlab.ui.control.NumericEditField
        EditField_28                  matlab.ui.control.NumericEditField
        EditField_29                  matlab.ui.control.NumericEditField
        EditField_30                  matlab.ui.control.NumericEditField
        EditField_31                  matlab.ui.control.NumericEditField
        EditField_32                  matlab.ui.control.NumericEditField
        EditField_33                  matlab.ui.control.NumericEditField
        CalculatedDataLabel           matlab.ui.control.Label
        HeatFluxInLabel               matlab.ui.control.Label
        HeatFluxOutLabel              matlab.ui.control.Label
        EditField_34                  matlab.ui.control.NumericEditField
        EditField_35                  matlab.ui.control.NumericEditField
        TimesLabel                    matlab.ui.control.Label
        EditField_36                  matlab.ui.control.NumericEditField
        EditField_TO                  matlab.ui.control.NumericEditField
        EditField_TI                  matlab.ui.control.NumericEditField
        ExperimentControlButtonGroup  matlab.ui.container.ButtonGroup
        StartExperimentButton         matlab.ui.control.ToggleButton
        StopExperimentButton          matlab.ui.control.ToggleButton
        LiveTemperaturePlotTab        matlab.ui.container.Tab
        UIAxes                        matlab.ui.control.UIAxes
        T1 = 0                          
        T2 = 0
        T3 = 0
        T4 = 0
        T5 = 0
        T6 = 0
        T7 = 0
        T8 = 0
        T9 = 0
        T10 = 0
        CB1 = 1
        CB2 = 1
        CB3 = 1
        CB4 = 1
        CB5 = 1
        CB6 = 1
        CB7 = 1
        CB8 = 1
        CB9 = 1
        CB10 = 1
        FR = 0
        Tin = 0
        Tout = 0
        L = 0
        D = 0
        Qin = 0
        Qout = 0
        qin = 0
        qout = 0
        V = 0
        C = 0
        T = 0
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
            app.TemperatureKLabel.Text = 'Temperature (K)';

            % Create T1Label
            app.T1Label = uilabel(app.MainTab);
            app.T1Label.Position = [100 370 25 15];
            app.T1Label.Text = 'T1:';

            % Create T2Label
            app.T2Label = uilabel(app.MainTab);
            app.T2Label.Position = [100 340 25 15];
            app.T2Label.Text = 'T2:';

            % Create T3Label
            app.T3Label = uilabel(app.MainTab);
            app.T3Label.Position = [100 310 25 15];
            app.T3Label.Text = 'T3:';

            % Create T4Label
            app.T4Label = uilabel(app.MainTab);
            app.T4Label.Position = [100 280 25 15];
            app.T4Label.Text = 'T4:';

            % Create T5Label
            app.T5Label = uilabel(app.MainTab);
            app.T5Label.Position = [100 250 25 15];
            app.T5Label.Text = 'T5:';
            
             % Create T6Label
            app.T6Label = uilabel(app.MainTab);
            app.T6Label.Position = [100 220 25 15];
            app.T6Label.Text = 'T6:';

            % Create T7Label
            app.T7Label = uilabel(app.MainTab);
            app.T7Label.Position = [100 190 25 15];
            app.T7Label.Text = 'T7:';

            % Create T8Label
            app.T8Label = uilabel(app.MainTab);
            app.T8Label.Position = [100 160 25 15];
            app.T8Label.Text = 'T8:';

            % Create T9Label
            app.T9Label = uilabel(app.MainTab);
            app.T9Label.Position = [100 130 25 15];
            app.T9Label.Text = 'T9:';

            % Create T10Label
            app.T10Label = uilabel(app.MainTab);
            app.T10Label.Position = [100 100 29 15];
            app.T10Label.Text = 'T10:';
            
            % Create CheckBox
            app.CheckBox = uicheckbox(app.MainTab);
            app.CheckBox.Text = '';
            app.CheckBox.Position = [70 370 15 15];
            app.CheckBox.Value = true;

            % Create CheckBox_2
            app.CheckBox_2 = uicheckbox(app.MainTab);
            app.CheckBox_2.Text = '';
            app.CheckBox_2.Position = [70 340 15 15];
            app.CheckBox_2.Value = true;

            % Create CheckBox_3
            app.CheckBox_3 = uicheckbox(app.MainTab);
            app.CheckBox_3.Text = '';
            app.CheckBox_3.Position = [70 310 15 15];
            app.CheckBox_3.Value = true;

            % Create CheckBox_4
            app.CheckBox_4 = uicheckbox(app.MainTab);
            app.CheckBox_4.Text = '';
            app.CheckBox_4.Position = [70 280 15 15];
            app.CheckBox_4.Value = true;

            % Create CheckBox_5
            app.CheckBox_5 = uicheckbox(app.MainTab);
            app.CheckBox_5.Text = '';
            app.CheckBox_5.Position = [70 250 15 15];
            app.CheckBox_5.Value = true;

            % Create CheckBox_6
            app.CheckBox_6 = uicheckbox(app.MainTab);
            app.CheckBox_6.Text = '';
            app.CheckBox_6.Position = [70 220 15 15];
            app.CheckBox_6.Value = true;

            % Create CheckBox_7
            app.CheckBox_7 = uicheckbox(app.MainTab);
            app.CheckBox_7.Text = '';
            app.CheckBox_7.Position = [70 190 27 15];
            app.CheckBox_7.Value = true;

            % Create CheckBox_8
            app.CheckBox_8 = uicheckbox(app.MainTab);
            app.CheckBox_8.Text = '';
            app.CheckBox_8.Position = [70 160 15 15];
            app.CheckBox_8.Value = true;

            % Create CheckBox_9
            app.CheckBox_9 = uicheckbox(app.MainTab);
            app.CheckBox_9.Text = '';
            app.CheckBox_9.Position = [70 130 15 15];
            app.CheckBox_9.Value = true;

            % Create CheckBox_10
            app.CheckBox_10 = uicheckbox(app.MainTab);
            app.CheckBox_10.Text = '';
            app.CheckBox_10.Position = [70 100 15 15];
            app.CheckBox_10.Value = true;
            
            % Create EditField_T1
            app.EditField_5 = uieditfield(app.MainTab, 'numeric');
            app.EditField_5.Limits = [0 2000];
            app.EditField_5.ValueDisplayFormat = '%.1f';
            app.EditField_5.Editable = 'off';
            app.EditField_5.Position = [130 366 38 22];
            
             % Create EditField_T2
            app.EditField_20 = uieditfield(app.MainTab, 'numeric');
            app.EditField_20.Limits = [0 2000];
            app.EditField_20.ValueDisplayFormat = '%.1f';
            app.EditField_20.Editable = 'off';
            app.EditField_20.Position = [130 336 38 22];

            % Create EditField_T3
            app.EditField_21 = uieditfield(app.MainTab, 'numeric');
            app.EditField_21.Limits = [0 2000];
            app.EditField_21.ValueDisplayFormat = '%.1f';
            app.EditField_21.Editable = 'off';
            app.EditField_21.Position = [130 306 38 22];

            % Create EditField_T4
            app.EditField_22 = uieditfield(app.MainTab, 'numeric');
            app.EditField_22.Limits = [0 2000];
            app.EditField_22.ValueDisplayFormat = '%.1f';
            app.EditField_22.Editable = 'off';
            app.EditField_22.Position = [130 276 38 22];

            % Create EditField_T5
            app.EditField_23 = uieditfield(app.MainTab, 'numeric');
            app.EditField_23.Limits = [0 2000];
            app.EditField_23.ValueDisplayFormat = '%.1f';
            app.EditField_23.Editable = 'off';
            app.EditField_23.Position = [130 246 38 22];

            % Create EditField_T6
            app.EditField_24 = uieditfield(app.MainTab, 'numeric');
            app.EditField_24.Limits = [0 2000];
            app.EditField_24.ValueDisplayFormat = '%.1f';
            app.EditField_24.Editable = 'off';
            app.EditField_24.Position = [130 216 38 22];

            % Create EditField_T7
            app.EditField_25 = uieditfield(app.MainTab, 'numeric');
            app.EditField_25.Limits = [0 2000];
            app.EditField_25.ValueDisplayFormat = '%.1f';
            app.EditField_25.Editable = 'off';
            app.EditField_25.Position = [130 186 38 22];

            % Create EditField_T8
            app.EditField_26 = uieditfield(app.MainTab, 'numeric');
            app.EditField_26.Limits = [0 2000];
            app.EditField_26.ValueDisplayFormat = '%.1f';
            app.EditField_26.Editable = 'off';
            app.EditField_26.Position = [130 156 38 22];

            % Create EditField_T9
            app.EditField_27 = uieditfield(app.MainTab, 'numeric');
            app.EditField_27.Limits = [0 2000];
            app.EditField_27.ValueDisplayFormat = '%.1f';
            app.EditField_27.Editable = 'off';
            app.EditField_27.Position = [130 126 38 22];

            % Create EditField_T10
            app.EditField_28 = uieditfield(app.MainTab, 'numeric');
            app.EditField_28.Limits = [0 2000];
            app.EditField_28.ValueDisplayFormat = '%.1f';
            app.EditField_28.Editable = 'off';
            app.EditField_28.Position = [130 96 38 22];
            
            %%%%%%%%%%%%%%%%%%%%%
            
            %Start of Water Jacket UI
            % Create WaterJacketLabel
            app.WaterJacketLabel = uilabel(app.MainTab);
            app.WaterJacketLabel.FontWeight = 'bold';
            app.WaterJacketLabel.Position = [230 400 81 15];
            app.WaterJacketLabel.Text = 'Water Jacket';
            
            % Create FlowRateLmLabel
            app.FlowRateLmLabel = uilabel(app.MainTab);
            app.FlowRateLmLabel.Position = [230 370 94 15];
            app.FlowRateLmLabel.Text = 'Flow Rate (L/m):';
            
            % Create TInletKLabel
            app.TInletKLabel = uilabel(app.MainTab);
            app.TInletKLabel.Position = [230 340 63 15];
            app.TInletKLabel.Text = 'T Inlet: (K):';

            % Create TOutletKLabel
            app.TOutletKLabel = uilabel(app.MainTab);
            app.TOutletKLabel.Position = [230 310 69 15];
            app.TOutletKLabel.Text = 'T Outlet (K):';
            
            % Create HeatOutWLabel
            app.HeatOutWLabel = uilabel(app.MainTab);
            app.HeatOutWLabel.Position = [230 280 81 15];
            app.HeatOutWLabel.Text = 'Heat Out (W): ';
            
            % Create EditField FR
            app.EditField = uieditfield(app.MainTab, 'numeric');
            app.EditField.Limits = [0 20];
            app.EditField.ValueDisplayFormat = '%.0f';
            app.EditField.Position = [330 366 38 22];
            
            % Create EditField 37
            app.EditField_TO = uieditfield(app.MainTab, 'numeric');
            app.EditField_TO.Limits = [0 20];
            app.EditField_TO.ValueDisplayFormat = '%.0f';
            app.EditField_TO.Editable = 'off';
            app.EditField_TO.Position = [330 336 38 22];
            
            % Create EditField 38
            app.EditField_TI = uieditfield(app.MainTab, 'numeric');
            app.EditField_TI.Limits = [0 20];
            app.EditField_TI.ValueDisplayFormat = '%.0f';
            app.EditField_TI.Editable = 'off';
            app.EditField_TI.Position = [330 306 38 22];
            
            % Create EditField_33
            app.EditField_33 = uieditfield(app.MainTab, 'numeric');
            app.EditField_33.Limits = [0 2000];
            app.EditField_33.ValueDisplayFormat = '%.1f';
            app.EditField_33.Editable = 'off';
            app.EditField_33.Position = [330 276 38 22];
            
            %%%%%%%%%%%%%%%%%            
            
            %Start of Heater UI
            % Create HeaterLabel
            app.HeaterLabel = uilabel(app.MainTab);
            app.HeaterLabel.FontWeight = 'bold';
            app.HeaterLabel.Position = [230 250 62 15];
            app.HeaterLabel.Text = 'Heater';

            % Create VoltageVLabel
            app.VoltageVLabel = uilabel(app.MainTab);
            app.VoltageVLabel.Position = [230 220 72 15];
            app.VoltageVLabel.Text = 'Voltage (V): ';

            % Create CurrentALabel
            app.CurrentALabel = uilabel(app.MainTab);
            app.CurrentALabel.Position = [230 190 68 15];
            app.CurrentALabel.Text = 'Current (A):';

            % Create HeatInWLabel
            app.HeatInWLabel = uilabel(app.MainTab);
            app.HeatInWLabel.Position = [230 160 72 15];
            app.HeatInWLabel.Text = 'Heat In (W): ';

            % Create EditField_2
            app.EditField_2 = uieditfield(app.MainTab, 'numeric');
            app.EditField_2.Limits = [0 100];
            app.EditField_2.ValueDisplayFormat = '%.1f';
            app.EditField_2.Position = [330 216 38 22];

            % Create EditField_3
            app.EditField_3 = uieditfield(app.MainTab, 'numeric');
            app.EditField_3.Limits = [0 100];
            app.EditField_3.ValueDisplayFormat = '%.1f';
            app.EditField_3.Position = [330 186 38 22];

            % Create EditField_4
            app.EditField_4 = uieditfield(app.MainTab, 'numeric');
            app.EditField_4.Limits = [0 200];
            app.EditField_4.ValueDisplayFormat = '%.2f';
            app.EditField_4.Editable = 'off';
            app.EditField_4.Position = [330 156 38 22];
            
            %%%%%%%%%%%%%%%%%%
            
            %Start of Geometry UI
            % Create GeometryLabel
            app.GeometryLabel = uilabel(app.MainTab);
            app.GeometryLabel.FontWeight = 'bold';
            app.GeometryLabel.Position = [430 400 62 15];
            app.GeometryLabel.Text = 'Geometry';

            % Create LengthmmLabel
            app.LengthmmLabel = uilabel(app.MainTab);
            app.LengthmmLabel.Position = [430 370 77 15];
            app.LengthmmLabel.Text = 'Length (mm):';

            % Create DiametermmLabel
            app.DiametermmLabel = uilabel(app.MainTab);
            app.DiametermmLabel.Position = [430 340 89 15];
            app.DiametermmLabel.Text = 'Diameter (mm):';

            % Create EditField_29
            app.EditField_29 = uieditfield(app.MainTab, 'numeric');
            app.EditField_29.Limits = [0 2000];
            app.EditField_29.ValueDisplayFormat = '%.0f';
            app.EditField_29.Editable = 'off';
            app.EditField_29.Position = [530 366 38 22];

            % Create EditField_30
            app.EditField_30 = uieditfield(app.MainTab, 'numeric');
            app.EditField_30.Limits = [0 30];
            app.EditField_30.ValueDisplayFormat = '%.0f';
            app.EditField_30.Editable = 'off';
            app.EditField_30.Position = [530 336 38 22];            
            %%%%%%%%%%%%%%%%%%%%

            %Start of Calculated Data UI
            % Create CalculatedDataLabel
            app.CalculatedDataLabel = uilabel(app.MainTab);
            app.CalculatedDataLabel.FontWeight = 'bold';
            app.CalculatedDataLabel.Position = [430 310 96 15];
            app.CalculatedDataLabel.Text = 'Calculated Data';

            % Create HeatFluxInLabel
            app.HeatFluxInLabel = uilabel(app.MainTab);
            app.HeatFluxInLabel.Position = [430 280 73 15];
            app.HeatFluxInLabel.Text = 'Heat Flux In:';

            % Create HeatFluxOutLabel
            app.HeatFluxOutLabel = uilabel(app.MainTab);
            app.HeatFluxOutLabel.Position = [430 250 82 15];
            app.HeatFluxOutLabel.Text = 'Heat Flux Out:';

            % Create EditField_34
            app.EditField_34 = uieditfield(app.MainTab, 'numeric');
            app.EditField_34.Limits = [0 2000];
            app.EditField_34.ValueDisplayFormat = '%.1f';
            app.EditField_34.Editable = 'off';
            app.EditField_34.Position = [530 276 38 22];

            % Create EditField_35
            app.EditField_35 = uieditfield(app.MainTab, 'numeric');
            app.EditField_35.Limits = [0 2000];
            app.EditField_35.ValueDisplayFormat = '%.1f';
            app.EditField_35.Editable = 'off';
            app.EditField_35.Position = [530 246 38 22];

            %Start of Time UI
            % Create TimesLabel
            app.TimesLabel = uilabel(app.MainTab);
            app.TimesLabel.FontWeight = 'bold';
            app.TimesLabel.Position = [430 40 58 15];
            app.TimesLabel.Text = 'Time (s): ';

            % Create EditField_36
            app.EditField_36 = uieditfield(app.MainTab, 'numeric');
            app.EditField_36.Limits = [0 200];
            app.EditField_36.ValueDisplayFormat = '%.2f';
            app.EditField_36.Editable = 'off';
            app.EditField_36.Position = [500 36 38 22];
            %%%%%%%%%%%%%%%%%%%%%%%%

            %Start of Control Button UI
            % Create ExperimentControlButtonGroup
            app.ExperimentControlButtonGroup = uibuttongroup(app.MainTab);
            app.ExperimentControlButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @StartStopExperiment, true);
            app.ExperimentControlButtonGroup.Title = 'Experiment Control';
            app.ExperimentControlButtonGroup.Position = [430 70 123 93];

            % Create StartExperimentButton
            app.StartExperimentButton = uitogglebutton(app.ExperimentControlButtonGroup);
            app.StartExperimentButton.Text = 'Start Experiment';
            app.StartExperimentButton.BackgroundColor = [0 1 0];
            app.StartExperimentButton.Position = [8.5 40 105 22];

            % Create StopExperimentButton
            app.StopExperimentButton = uitogglebutton(app.ExperimentControlButtonGroup);
            app.StopExperimentButton.Text = 'Stop Experiment';
            app.StopExperimentButton.BackgroundColor = [1 0 0];
            app.StopExperimentButton.Position = [8.5 8 105 22];
            app.StopExperimentButton.Value = true;
            %%%%%%%%%%%%%%%%%%%%%%%%

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
        
        function checkBox1_Callback(source,eventdata)
            
            
        end
    end
end