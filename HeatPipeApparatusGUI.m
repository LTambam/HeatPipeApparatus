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
        T6Label                      matlab.ui.control.Label
        T7Label                       matlab.ui.control.Label
        T8Label                       matlab.ui.control.Label
        T9Label                       matlab.ui.control.Label
        T10Label                      matlab.ui.control.Label
%         T1CB                          matlab.ui.control.CheckBox
%         T2CB                          matlab.ui.control.CheckBox
%         T3CB                          matlab.ui.control.CheckBox
%         T4CB                          matlab.ui.control.CheckBox
%         T5CB                          matlab.ui.control.CheckBox
%         T6CB                          matlab.ui.control.CheckBox
%         T7CB                          matlab.ui.control.CheckBox
%         T8CB                          matlab.ui.control.CheckBox
%         T9CB                          matlab.ui.control.CheckBox
%         T10CB                         matlab.ui.control.CheckBox
        T1EF                          matlab.ui.control.NumericEditField
        T2EF                          matlab.ui.control.NumericEditField
        T3EF                          matlab.ui.control.NumericEditField
        T4EF                          matlab.ui.control.NumericEditField
        T5EF                          matlab.ui.control.NumericEditField
        T6EF                          matlab.ui.control.NumericEditField
        T7EF                          matlab.ui.control.NumericEditField
        T8EF                          matlab.ui.control.NumericEditField
        T9EF                          matlab.ui.control.NumericEditField
        T10EF                         matlab.ui.control.NumericEditField
        WaterJacketLabel              matlab.ui.control.Label
        TInletKLabel                  matlab.ui.control.Label
        TOutletKLabel                 matlab.ui.control.Label
        FlowRateLmLabel               matlab.ui.control.Label
        HeaterLabel                   matlab.ui.control.Label
        HeatOutWLabel                 matlab.ui.control.Label
        VoltageVLabel                 matlab.ui.control.Label
        CurrentALabel                 matlab.ui.control.Label
        HeatInWLabel                  matlab.ui.control.Label
        FREF                          matlab.ui.control.NumericEditField
        EditField_2                   matlab.ui.control.NumericEditField
        EditField_3                   matlab.ui.control.NumericEditField
        EditField_4                   matlab.ui.control.NumericEditField
        GeometryLabel                 matlab.ui.control.Label
        LengthmmLabel                 matlab.ui.control.Label
        DiametermmLabel               matlab.ui.control.Label
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
        TEF                  matlab.ui.control.NumericEditField
        TOEF                          matlab.ui.control.NumericEditField
        TIEF                          matlab.ui.control.NumericEditField
        ExperimentControlButtonGroup  matlab.ui.container.ButtonGroup
        StartExperimentButton         matlab.ui.control.ToggleButton
        StopExperimentButton          matlab.ui.control.ToggleButton
        LiveTemperaturePlotTab        matlab.ui.container.Tab
        UIAxes                        matlab.ui.control.UIAxes
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

            % Create T9Label
            app.T9Label = uilabel(app.MainTab);
            app.T9Label.Position = [70 130 25 15];
            app.T9Label.Text = 'T9:';

            % Create T10Label
            app.T10Label = uilabel(app.MainTab);
            app.T10Label.Position = [70 100 29 15];
            app.T10Label.Text = 'T10:';
            
%             % Create CheckBox
%             app.T1CB = uicheckbox(app.MainTab);
%             app.T1CB.Text = '';
%             app.T1CB.Position = [70 370 15 15];
%             app.T1CB.Value = true;
% 
%             % Create T2CB
%             app.T2CB = uicheckbox(app.MainTab);
%             app.T2CB.Text = '';
%             app.T2CB.Position = [70 340 15 15];
%             app.T2CB.Value = true;
% 
%             % Create T2CB
%             app.T3CB = uicheckbox(app.MainTab);
%             app.T3CB.Text = '';
%             app.T3CB.Position = [70 310 15 15];
%             app.T3CB.Value = true;
% 
%             % Create T4CB
%             app.T4CB = uicheckbox(app.MainTab);
%             app.T4CB.Text = '';
%             app.T4CB.Position = [70 280 15 15];
%             app.T4CB.Value = true;
% 
%             % Create T5CB
%             app.T5CB = uicheckbox(app.MainTab);
%             app.T5CB.Text = '';
%             app.T5CB.Position = [70 250 15 15];
%             app.T5CB.Value = true;
% 
%             % Create T6CB
%             app.T6CB = uicheckbox(app.MainTab);
%             app.T6CB.Text = '';
%             app.T6CB.Position = [70 220 15 15];
%             app.T6CB.Value = true;
% 
%             % Create T7CB
%             app.T7CB = uicheckbox(app.MainTab);
%             app.T7CB.Text = '';
%             app.T7CB.Position = [70 190 27 15];
%             app.T7CB.Value = true;
% 
%             % Create T8CB
%             app.T8CB = uicheckbox(app.MainTab);
%             app.T8CB.Text = '';
%             app.T8CB.Position = [70 160 15 15];
%             app.T8CB.Value = true;
% 
%             % Create T9CB
%             app.T9CB = uicheckbox(app.MainTab);
%             app.T9CB.Text = '';
%             app.T9CB.Position = [70 130 15 15];
%             app.T9CB.Value = true;
% 
%             % Create T10CB
%             app.T10CB = uicheckbox(app.MainTab);
%             app.T10CB.Text = '';
%             app.T10CB.Position = [70 100 15 15];
%             app.T10CB.Value = true;
            
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

            % Create EditField_T9
            app.T9EF = uieditfield(app.MainTab, 'numeric');
            app.T9EF.Limits = [-2000 2000];
            app.T9EF.ValueDisplayFormat = '%.1f';
            app.T9EF.Editable = 'off';
            app.T9EF.Position = [100 126 38 22];

            % Create EditField_T10
            app.T10EF = uieditfield(app.MainTab, 'numeric');
            app.T10EF.Limits = [-2000 2000];
            app.T10EF.ValueDisplayFormat = '%.1f';
            app.T10EF.Editable = 'off';
            app.T10EF.Position = [100 96 38 22];
            
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
            app.FREF = uieditfield(app.MainTab, 'numeric');
            app.FREF.Limits = [0 20];
            app.FREF.ValueDisplayFormat = '%.0f';
            app.FREF.Position = [330 366 38 22];
            
            % Create EditField TO
            app.TOEF = uieditfield(app.MainTab, 'numeric');
            app.TOEF.Limits = [-200 200];
            app.TOEF.ValueDisplayFormat = '%.0f';
            app.TOEF.Editable = 'off';
            app.TOEF.Position = [330 336 38 22];
            
            % Create EditField TI
            app.TIEF = uieditfield(app.MainTab, 'numeric');
            app.TIEF.Limits = [-200 200];
            app.TIEF.ValueDisplayFormat = '%.0f';
            app.TIEF.Editable = 'off';
            app.TIEF.Position = [330 306 38 22];
            
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

            % Create TEF
            app.TEF = uieditfield(app.MainTab, 'numeric');
            app.TEF.Limits = [0 10000];
            app.TEF.ValueDisplayFormat = '%.2f';
            app.TEF.Editable = 'off';
            app.TEF.Position = [500 36 38 22];
            %%%%%%%%%%%%%%%%%%%%%%%%

            %Start of Control Button UI
            % Create ExperimentControlButtonGroup
            app.ExperimentControlButtonGroup = uibuttongroup(app.MainTab);
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