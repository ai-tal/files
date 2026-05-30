classdef PatternAnalyzerApp_v3_1 < matlab.apps.AppBase
% PatternAnalyzerApp_v3
% Single-file GUI + parser + processor + exporter for antenna patterns.
% Load -> auto-process -> plot/update/export.
%
% Supported formats:
%   .ffd, .out, .ffs, .ffe, .fz, .uan, .csv, .txt

properties (Access = public)
    UIFigure matlab.ui.Figure
    MainGrid matlab.ui.container.GridLayout

    ControlPanel matlab.ui.container.Panel
    ControlGrid matlab.ui.container.GridLayout
    PlotPanel matlab.ui.container.Panel
    PlotGrid matlab.ui.container.GridLayout
    ResultPanel matlab.ui.container.Panel
    ResultGrid matlab.ui.container.GridLayout

    LoadButton matlab.ui.control.Button
    ProcessButton matlab.ui.control.Button
    ExportButton matlab.ui.control.Button

    FileLabel matlab.ui.control.Label
    FileField matlab.ui.control.EditField

    PatternLabel matlab.ui.control.Label
    PatternDropDown matlab.ui.control.DropDown

    ComponentLabel matlab.ui.control.Label
    ComponentDropDown matlab.ui.control.DropDown

    LossLabel matlab.ui.control.Label
    LossField matlab.ui.control.NumericEditField

    TxPowerLabel matlab.ui.control.Label
    TxPowerField matlab.ui.control.NumericEditField

    DistanceLabel matlab.ui.control.Label
    DistanceField matlab.ui.control.NumericEditField

    RxModeLabel matlab.ui.control.Label
    RxModeDropDown matlab.ui.control.DropDown

    RxARLabel matlab.ui.control.Label
    RxARField matlab.ui.control.NumericEditField

    TauLabel matlab.ui.control.Label
    TauField matlab.ui.control.NumericEditField

    ContourAxes matlab.ui.control.UIAxes
    ThreeDAxes matlab.ui.control.UIAxes

    DataTable matlab.ui.control.Table
    MetaTable matlab.ui.control.Table

    StatusLabel matlab.ui.control.Label
end

properties (Access = private)
    RawOut struct = struct()
    ProcOut struct = struct()
    Updating logical = false
end

methods (Access = public)
    function app = PatternAnalyzerApp_v3_1
        createComponents(app);
        configure(app);
    end

    function delete(app)
        if ~isempty(app.UIFigure) && isvalid(app.UIFigure)
            delete(app.UIFigure);
        end
    end
end

methods (Access = private)

    function configure(app)
        app.UIFigure.Colormap = jet(256);

        app.ComponentDropDown.Items = PatternAnalyzerApp_v3_1.componentItems();
        app.ComponentDropDown.Value = 'E_total';

        app.PatternDropDown.Items = {'1'};
        app.PatternDropDown.Value = '1';
        app.PatternDropDown.Enable = 'off';

        app.LossField.Value = 0;
        app.TxPowerField.Value = 0;
        app.DistanceField.Value = 1;
        app.RxModeDropDown.Value = 'Auto';
        app.RxARField.Value = 6;
        app.TauField.Value = 90;

        app.FileField.Value = "";
        app.StatusLabel.Text = 'Ready. Load a pattern file.';
        app.clearView();
    end

    function createComponents(app)
        app.UIFigure = uifigure('Name','Pattern Analyzer v3', ...
            'Color','w', ...
            'Position',[80 60 1560 980]);

        app.MainGrid = uigridlayout(app.UIFigure, [3 1]);
        app.MainGrid.RowHeight = {132,'1x',300};
        app.MainGrid.ColumnWidth = {'1x'};
        app.MainGrid.Padding = [8 8 8 8];
        app.MainGrid.RowSpacing = 8;

        % ---------- Controls ----------
        app.ControlPanel = uipanel(app.MainGrid, 'Title','Controls');
        app.ControlPanel.Layout.Row = 1;
        app.ControlPanel.Layout.Column = 1;

        app.ControlGrid = uigridlayout(app.ControlPanel, [2 12]);
        app.ControlGrid.RowHeight = {36,36};
        app.ControlGrid.ColumnWidth = {70,90,95,70,'1x',80,95,80,95,80,90,90};
        app.ControlGrid.Padding = [8 8 8 8];
        app.ControlGrid.RowSpacing = 8;
        app.ControlGrid.ColumnSpacing = 8;

        app.LoadButton = uibutton(app.ControlGrid, 'push', 'Text', 'Load', ...
            'ButtonPushedFcn', @(~,~)onLoad(app));
        app.LoadButton.Layout.Row = 1; app.LoadButton.Layout.Column = 1;

        app.ProcessButton = uibutton(app.ControlGrid, 'push', 'Text', 'Process', ...
            'ButtonPushedFcn', @(~,~)onProcess(app));
        app.ProcessButton.Layout.Row = 1; app.ProcessButton.Layout.Column = 2;

        app.ExportButton = uibutton(app.ControlGrid, 'push', 'Text', 'Export UAN', ...
            'ButtonPushedFcn', @(~,~)onExport(app));
        app.ExportButton.Layout.Row = 1; app.ExportButton.Layout.Column = 3;

        app.FileLabel = uilabel(app.ControlGrid, 'Text', 'File');
        app.FileLabel.Layout.Row = 1; app.FileLabel.Layout.Column = 4;
        app.FileField = uieditfield(app.ControlGrid, 'text', 'Editable','off');
        app.FileField.Layout.Row = 1; app.FileField.Layout.Column = 5;

        app.PatternLabel = uilabel(app.ControlGrid, 'Text', 'Pattern');
        app.PatternLabel.Layout.Row = 1; app.PatternLabel.Layout.Column = 6;
        app.PatternDropDown = uidropdown(app.ControlGrid, ...
            'ValueChangedFcn', @(~,~)refreshView(app));
        app.PatternDropDown.Layout.Row = 1; app.PatternDropDown.Layout.Column = 7;

        app.ComponentLabel = uilabel(app.ControlGrid, 'Text', 'Component');
        app.ComponentLabel.Layout.Row = 1; app.ComponentLabel.Layout.Column = 8;
        app.ComponentDropDown = uidropdown(app.ControlGrid, ...
            'ValueChangedFcn', @(~,~)refreshView(app));
        app.ComponentDropDown.Layout.Row = 1; app.ComponentDropDown.Layout.Column = 9;

        app.LossLabel = uilabel(app.ControlGrid, 'Text', 'Loss dB');
        app.LossLabel.Layout.Row = 1; app.LossLabel.Layout.Column = 10;
        app.LossField = uieditfield(app.ControlGrid, 'numeric', ...
            'RoundFractionalValues','off', ...
            'ValueChangedFcn', @(~,~)onProcess(app));
        app.LossField.Layout.Row = 1; app.LossField.Layout.Column = 11;

        app.RxModeLabel = uilabel(app.ControlGrid, 'Text', 'Rx mode');
        app.RxModeLabel.Layout.Row = 1; app.RxModeLabel.Layout.Column = 12;

        app.TxPowerLabel = uilabel(app.ControlGrid, 'Text', 'Tx Pwr');
        app.TxPowerLabel.Layout.Row = 2; app.TxPowerLabel.Layout.Column = 1;
        app.TxPowerField = uieditfield(app.ControlGrid, 'numeric', ...
            'RoundFractionalValues','off', ...
            'ValueChangedFcn', @(~,~)onProcess(app));
        app.TxPowerField.Layout.Row = 2; app.TxPowerField.Layout.Column = 2;

        app.DistanceLabel = uilabel(app.ControlGrid, 'Text', 'Range m');
        app.DistanceLabel.Layout.Row = 2; app.DistanceLabel.Layout.Column = 3;
        app.DistanceField = uieditfield(app.ControlGrid, 'numeric', ...
            'RoundFractionalValues','off', ...
            'ValueChangedFcn', @(~,~)onProcess(app));
        app.DistanceField.Layout.Row = 2; app.DistanceField.Layout.Column = 4;

        app.RxModeDropDown = uidropdown(app.ControlGrid, ...
            'Items', {'Auto','Linear','RHCP','LHCP'}, ...
            'ValueChangedFcn', @(~,~)onProcess(app));
        app.RxModeDropDown.Layout.Row = 2; app.RxModeDropDown.Layout.Column = 5;

        app.RxARLabel = uilabel(app.ControlGrid, 'Text', 'Rx AR dB');
        app.RxARLabel.Layout.Row = 2; app.RxARLabel.Layout.Column = 6;
        app.RxARField = uieditfield(app.ControlGrid, 'numeric', ...
            'RoundFractionalValues','off', ...
            'ValueChangedFcn', @(~,~)onProcess(app));
        app.RxARField.Layout.Row = 2; app.RxARField.Layout.Column = 7;

        app.TauLabel = uilabel(app.ControlGrid, 'Text', 'Tau deg');
        app.TauLabel.Layout.Row = 2; app.TauLabel.Layout.Column = 8;
        app.TauField = uieditfield(app.ControlGrid, 'numeric', ...
            'RoundFractionalValues','off', ...
            'ValueChangedFcn', @(~,~)onProcess(app));
        app.TauField.Layout.Row = 2; app.TauField.Layout.Column = 9;

        app.StatusLabel = uilabel(app.ControlGrid, 'Text', 'Ready.', ...
            'FontWeight', 'bold');
        app.StatusLabel.Layout.Row = 2; app.StatusLabel.Layout.Column = [10 12];

        % ---------- Plots ----------
        app.PlotPanel = uipanel(app.MainGrid, 'Title','Plots');
        app.PlotPanel.Layout.Row = 2;
        app.PlotPanel.Layout.Column = 1;

        app.PlotGrid = uigridlayout(app.PlotPanel, [1 2]);
        app.PlotGrid.ColumnWidth = {'1x','1x'};
        app.PlotGrid.RowHeight = {'1x'};
        app.PlotGrid.Padding = [6 6 6 6];
        app.PlotGrid.ColumnSpacing = 8;

        app.ContourAxes = uiaxes(app.PlotGrid);
        app.ContourAxes.Layout.Row = 1;
        app.ContourAxes.Layout.Column = 1;

        app.ThreeDAxes = uiaxes(app.PlotGrid);
        app.ThreeDAxes.Layout.Row = 1;
        app.ThreeDAxes.Layout.Column = 2;

        % ---------- Results ----------
        app.ResultPanel = uipanel(app.MainGrid, 'Title','Results');
        app.ResultPanel.Layout.Row = 3;
        app.ResultPanel.Layout.Column = 1;

        app.ResultGrid = uigridlayout(app.ResultPanel, [1 2]);
        app.ResultGrid.ColumnWidth = {'1x', 360};
        app.ResultGrid.RowHeight = {'1x'};
        app.ResultGrid.Padding = [6 6 6 6];
        app.ResultGrid.ColumnSpacing = 8;

        app.DataTable = uitable(app.ResultGrid);
        app.DataTable.Layout.Row = 1;
        app.DataTable.Layout.Column = 1;

        app.MetaTable = uitable(app.ResultGrid);
        app.MetaTable.Layout.Row = 1;
        app.MetaTable.Layout.Column = 2;
    end

    function onLoad(app)
        [f,p] = uigetfile({'*.*','All Supported Files'}, 'Select antenna pattern file');
        if isequal(f,0), return; end

        try
            filePath = fullfile(p,f);
            app.FileField.Value = filePath;

            app.RawOut = PatternAnalyzerApp_v3_1.loadPattern(filePath);
            app.RawOut = PatternAnalyzerApp_v3_1.processPattern(app.RawOut, app.getProcessOptions());
            app.ProcOut = app.RawOut;

            app.populatePatternList();
            app.refreshView();
            app.StatusLabel.Text = sprintf('Loaded and processed: %s', f);
        catch ME
            app.RawOut = struct();
            app.ProcOut = struct();
            app.clearView();
            uialert(app.UIFigure, ME.message, 'Load error');
        end
    end

    function onProcess(app)
        if ~isfield(app.RawOut,'patterns') || isempty(app.RawOut.patterns)
            app.clearView();
            app.StatusLabel.Text = 'Load a file first.';
            return
        end
        try
            app.ProcOut = PatternAnalyzerApp_v3_1.processPattern(app.RawOut, app.getProcessOptions());
            app.populatePatternList(true);
            app.refreshView();
            app.StatusLabel.Text = sprintf('Processed %d pattern(s).', app.ProcOut.nPatterns);
        catch ME
            uialert(app.UIFigure, ME.message, 'Process error');
        end
    end

    function onExport(app)
        if ~isfield(app.ProcOut,'patterns') || isempty(app.ProcOut.patterns)
            uialert(app.UIFigure, 'Process the pattern first.', 'Nothing to export');
            return
        end
        [f,p] = uiputfile({'*.uan','XGTD UAN (*.uan)'}, 'Save UAN file');
        if isequal(f,0), return; end
        try
            PatternAnalyzerApp_v3_1.exportUAN(app.ProcOut, fullfile(p,f), app.getSelectedPatternIndex());
            app.StatusLabel.Text = sprintf('Exported UAN: %s', f);
        catch ME
            uialert(app.UIFigure, ME.message, 'Export error');
        end
    end

    function populatePatternList(app, keepSelection)
        if nargin < 2, keepSelection = false; end
        src = app.ProcOut;
        if ~isfield(src,'patterns') || isempty(src.patterns)
            src = app.RawOut;
        end

        if ~isfield(src,'patterns') || isempty(src.patterns)
            app.PatternDropDown.Items = {'1'};
            app.PatternDropDown.Value = '1';
            app.PatternDropDown.Enable = 'off';
            return
        end

        labels = cellfun(@(p) sprintf('Block %d | %s', p.blockID, PatternAnalyzerApp_v3_1.fmtHz(p.freq_Hz)), ...
            src.patterns, 'UniformOutput', false);

        prev = app.PatternDropDown.Value;
        app.PatternDropDown.Items = labels;
        app.PatternDropDown.Enable = 'on';
        if keepSelection && any(strcmp(labels, prev))
            app.PatternDropDown.Value = prev;
        else
            app.PatternDropDown.Value = labels{1};
        end
    end

    function refreshView(app)
        if app.Updating, return; end
        app.Updating = true;
        c = onCleanup(@()setfield(app,'Updating',false)); %#ok<SFLD>

        P = app.getCurrentPattern();
        if isempty(P) || ~isfield(P,'Table') || isempty(P.Table)
            app.clearView();
            return
        end

        [col, ttl] = PatternAnalyzerApp_v3_1.compToColumn(app.ComponentDropDown.Value);
        theta = P.theta_deg(:);
        phi   = P.phi_deg(:);

        if numel(theta) < 2 || numel(phi) < 2
            app.clearView();
            return
        end

        Z = P.Table.(col);
        Z = reshape(Z, numel(theta), numel(phi));

        % --- Contour
        cla(app.ContourAxes, 'reset');
        contourf(app.ContourAxes, phi, theta, Z, 24, 'LineStyle','none');
        app.ContourAxes.Box = 'on';
        app.ContourAxes.XGrid = 'on';
        app.ContourAxes.YGrid = 'on';
        app.ContourAxes.YDir = 'reverse';
        axis(app.ContourAxes, 'image');
        daspect(app.ContourAxes, [1 1 1]);
        pbaspect(app.ContourAxes, [1 1 1]);
        xlabel(app.ContourAxes, '\phi (deg)');
        ylabel(app.ContourAxes, '\theta (deg)');
        title(app.ContourAxes, ttl, 'Interpreter','tex');
        cb1 = colorbar(app.ContourAxes);
        cb1.Label.String = char(ttl);
        colormap(app.ContourAxes, jet(256));

        % --- 3D
        cla(app.ThreeDAxes, 'reset');
        [PHI, THETA] = meshgrid(phi, theta);
        R = PatternAnalyzerApp_v3_1.normalizeRadius(Z);
        [X, Y, Z3] = sph2cart(deg2rad(PHI), deg2rad(90 - THETA), R);
        surf(app.ThreeDAxes, X, Y, Z3, Z, 'EdgeColor','none');
        app.ThreeDAxes.Box = 'on';
        app.ThreeDAxes.XGrid = 'on';
        app.ThreeDAxes.YGrid = 'on';
        app.ThreeDAxes.ZGrid = 'on';
        axis(app.ThreeDAxes, 'vis3d');
        daspect(app.ThreeDAxes, [1 1 1]);
        pbaspect(app.ThreeDAxes, [1 1 1]);
        camproj(app.ThreeDAxes, 'orthographic');
        view(app.ThreeDAxes, 3);
        rotate3d(app.UIFigure, 'on');
        xlabel(app.ThreeDAxes, 'X');
        ylabel(app.ThreeDAxes, 'Y');
        zlabel(app.ThreeDAxes, 'Z');
        title(app.ThreeDAxes, [ttl ' | 3D'], 'Interpreter','tex');
        cb2 = colorbar(app.ThreeDAxes);
        cb2.Label.String = char(ttl);
        colormap(app.ThreeDAxes, jet(256));

        % --- Tables
        app.DataTable.Data = P.Table;
        app.MetaTable.Data = PatternAnalyzerApp_v3_1.metaToTable(P);

        app.StatusLabel.Text = sprintf('Showing block %d | %s', P.blockID, PatternAnalyzerApp_v3_1.compTitle(app.ComponentDropDown.Value));
        drawnow limitrate nocallbacks
    end

    function P = getCurrentPattern(app)
        P = struct();
        src = app.ProcOut;
        if ~isfield(src,'patterns') || isempty(src.patterns)
            src = app.RawOut;
        end
        if ~isfield(src,'patterns') || isempty(src.patterns)
            return
        end
        idx = app.getSelectedPatternIndex();
        idx = min(max(1, idx), numel(src.patterns));
        P = src.patterns{idx};
    end

    function idx = getSelectedPatternIndex(app)
        idx = 1;
        items = string(app.PatternDropDown.Items);
        if isempty(items), return; end
        v = string(app.PatternDropDown.Value);
        k = find(items == v, 1, 'first');
        if ~isempty(k), idx = k; end
    end

    function opts = getProcessOptions(app)
        opts = struct();
        opts.Loss_dB = app.LossField.Value;
        opts.TxPower_dBW = app.TxPowerField.Value;
        opts.Range_m = max(app.DistanceField.Value, eps);
        opts.RxMode = string(app.RxModeDropDown.Value);
        opts.RxAR_dB = app.RxARField.Value;
        opts.Tau_deg = app.TauField.Value;
        opts.LossMag = 10.^(-opts.Loss_dB/20);
    end

    function clearView(app)
        cla(app.ContourAxes, 'reset');
        cla(app.ThreeDAxes, 'reset');
        app.DataTable.Data = table();
        app.MetaTable.Data = table();
    end
end

methods (Static)
    function items = componentItems()
        items = {'Etheta','Ephi','Ercp','Elcp','E_total','AR','PLF','PolCorrGain','EIRP','PFD','E_dBVm'};
    end

    function [col, ttl] = compToColumn(comp)
        switch lower(string(comp))
            case {"etheta","e_th","e_theta"}
                col = 'E_TH_mag_dB'; ttl = 'E_{\theta} (dB)';
            case {"ephi","e_ph","e_phi"}
                col = 'E_PH_mag_dB'; ttl = 'E_{\phi} (dB)';
            case {"ercp","e_rcp"}
                col = 'E_RCP_mag_dB'; ttl = 'E_{RCP} (dB)';
            case {"elcp","e_lcp"}
                col = 'E_LCP_mag_dB'; ttl = 'E_{LCP} (dB)';
            case {"e_total","gain","total","totalgain"}
                col = 'Gain_dBi'; ttl = 'Gain (dBi)';
            case {"ar","axial","axialratio"}
                col = 'AR_dB'; ttl = 'Axial Ratio (dB)';
            case {"plf","polarizationloss","polloss"}
                col = 'PLF_dB'; ttl = 'PLF (dB)';
            case {"polcorrgain","polarizedcorrectedgain","pcg"}
                col = 'PolCorrGain_dBi'; ttl = 'Polarized Corrected Gain (dBi)';
            case {"eirp","eirp_dbw"}
                col = 'EIRP_dBW'; ttl = 'EIRP (dBW)';
            case {"pfd","pfd_dbwm2"}
                col = 'PFD_dBWm2'; ttl = 'PFD (dBW/m^2)';
            case {"e_dbvm","efield","e_field"}
                col = 'E_dBVm'; ttl = 'E-field (dBV/m)';
            otherwise
                error('PatternAnalyzerApp_v3:UnknownComponent', 'Unknown component: %s', comp);
        end
    end

    function ttl = compTitle(comp)
        [~, ttl] = PatternAnalyzerApp_v3_1.compToColumn(comp);
    end

    function out = loadPattern(filePath)
        [~,~,ext] = fileparts(filePath);
        ext = lower(ext);
        fmt = upper(string(ext(2:end)));

        switch ext
            case '.ffd'
                [rawTables, freqs, isDep, freqCount] = PatternAnalyzerApp_v3_1.readFfdRaw(filePath);
            otherwise
                rawTables = {PatternAnalyzerApp_v3_1.readSimpleRaw(filePath, ext)};
                freqs = NaN;
                isDep = false;
                freqCount = 0;
        end

        nBlk = numel(rawTables);
        blkIDs = num2cell((1:nBlk).');
        fIDs = num2cell(freqs(:));
        if numel(fIDs) == 1 && nBlk > 1
            fIDs = repmat(fIDs, nBlk, 1);
        end

        patterns = cellfun(@(rt,k,f) struct( ...
            'sourceFile', filePath, ...
            'sourceFormat', fmt, ...
            'blockID', k, ...
            'freq_Hz', f, ...
            'rawTable', rt, ...
            'table', PatternAnalyzerApp_v3_1.normalizePatternTable(rt)), ...
            rawTables, blkIDs, fIDs, 'UniformOutput', false);

        out = struct();
        out.sourceFile = filePath;
        out.sourceFormat = fmt;
        out.isFrequencyDependent = isDep;
        out.freqCount = freqCount;
        out.nPatterns = nBlk;
        out.rawTables = rawTables;
        out.patterns = patterns;
        out.freqs_Hz = cellfun(@(p) p.freq_Hz, patterns);
    end

    function out = processPattern(in, opts)
        if nargin < 2 || isempty(opts)
            opts = struct();
        end
        opts = PatternAnalyzerApp_v3_1.fillProcessDefaults(opts);

        if ~isfield(in, 'patterns') || isempty(in.patterns)
            error('PatternAnalyzerApp_v3:NoPatterns', 'Input contains no patterns.');
        end

        out = in;
        out.processed = true;
        out.processOpts = opts;
        out.patterns = cellfun(@(P) PatternAnalyzerApp_v3_1.processOne(P, opts), in.patterns, 'UniformOutput', false);
        out.nPatterns = numel(out.patterns);
        out.freqs_Hz = cellfun(@(p) p.freq_Hz, out.patterns);
    end

    function opts = fillProcessDefaults(opts)
        if ~isfield(opts,'Loss_dB'), opts.Loss_dB = 0; end
        if ~isfield(opts,'TxPower_dBW'), opts.TxPower_dBW = 0; end
        if ~isfield(opts,'Range_m'), opts.Range_m = 1; end
        if ~isfield(opts,'RxMode'), opts.RxMode = "Auto"; end
        if ~isfield(opts,'RxAR_dB'), opts.RxAR_dB = 6; end
        if ~isfield(opts,'Tau_deg'), opts.Tau_deg = 90; end
        opts.LossMag = 10.^(-opts.Loss_dB/20);
        opts.Range_m = max(opts.Range_m, eps);
    end

    function P = processOne(P, opts)
        T = P.table;

        thetaVec = unique(T.Theta,'sorted');
        phiVec   = unique(T.Phi,'sorted');

        Eth = (T.Re_Etheta + 1i*T.Im_Etheta) .* opts.LossMag;
        Eph = (T.Re_Ephi   + 1i*T.Im_Ephi)   .* opts.LossMag;
        ER  = (Eth + 1i*Eph)/sqrt(2);
        EL  = (Eth - 1i*Eph)/sqrt(2);

        E_TH_mag_dB    = 20*log10(max(abs(Eth), eps));
        E_PH_mag_dB    = 20*log10(max(abs(Eph), eps));
        E_TH_phase_deg  = rad2deg(angle(Eth));
        E_PH_phase_deg  = rad2deg(angle(Eph));
        E_RCP_mag_dB    = 20*log10(max(abs(ER), eps));
        E_LCP_mag_dB    = 20*log10(max(abs(EL), eps));
        E_RCP_phase_deg = rad2deg(angle(ER));
        E_LCP_phase_deg = rad2deg(angle(EL));

        Glin = abs(Eth).^2 + abs(Eph).^2;
        Gain_dBi = 10*log10(max(Glin, eps));

        AR_lin = (abs(ER) + abs(EL)) ./ max(abs(abs(ER) - abs(EL)), 1e-12);
        AR_dB = min(20*log10(AR_lin), 40);

        dom = "RCP";
        if mean(abs(EL)) > mean(abs(ER))
            dom = "LCP";
        end

        rxMode = string(opts.RxMode);
        switch lower(rxMode)
            case 'auto'
                sense = dom;
            case 'rhcp'
                sense = "RCP";
            case 'lhcp'
                sense = "LCP";
            otherwise
                sense = "Linear";
        end

        Ra = max(10.^(AR_dB/20), 1);
        if sense == "Linear"
            PLF_dB = 20*log10(abs(cosd(opts.Tau_deg)));
            PLF_dB = PLF_dB .* ones(size(Ra));
        else
            RwSign = 1;
            if sense ~= dom
                RwSign = -1;
            end
            Rw = RwSign * 10.^(opts.RxAR_dB/20);
            dTau = opts.Tau_deg;
            PLF_lin = 0.5 + (4*Ra.*Rw + (Ra.^2 - 1).*(Rw.^2 - 1).*cosd(2*dTau)) ./ ...
                (2*(Ra.^2 + 1).*(Rw.^2 + 1));
            PLF_lin = max(min(PLF_lin, 1), eps);
            PLF_dB = 10*log10(PLF_lin);
        end

        PolCorrGain_dBi = Gain_dBi + PLF_dB;
        EIRP_dBW  = opts.TxPower_dBW + PolCorrGain_dBi;
        E_dBVm    = 10*log10(30) + EIRP_dBW - 20*log10(opts.Range_m);
        PFD_dBWm2 = EIRP_dBW - 10*log10(4*pi*opts.Range_m^2);

        Table = table( ...
            T.Theta, T.Phi, ...
            E_TH_mag_dB, E_PH_mag_dB, ...
            E_TH_phase_deg, E_PH_phase_deg, ...
            E_RCP_mag_dB, E_LCP_mag_dB, ...
            E_RCP_phase_deg, E_LCP_phase_deg, ...
            Gain_dBi, AR_dB, PLF_dB, PolCorrGain_dBi, E_dBVm, EIRP_dBW, PFD_dBWm2, ...
            'VariableNames', {'Theta','Phi', ...
            'E_TH_mag_dB','E_PH_mag_dB', ...
            'E_TH_phase_deg','E_PH_phase_deg', ...
            'E_RCP_mag_dB','E_LCP_mag_dB', ...
            'E_RCP_phase_deg','E_LCP_phase_deg', ...
            'Gain_dBi','AR_dB','PLF_dB','PolCorrGain_dBi','E_dBVm','EIRP_dBW','PFD_dBWm2'} );

        [peak_gain_dBi, ~] = max(Gain_dBi);
        peak_ar_dB = max(AR_dB);
        peak_plf_dB = max(PLF_dB);
        peak_pcg_dBi = max(PolCorrGain_dBi);
        peak_eirp_dBW = max(EIRP_dBW);
        peak_pfd_dBWm2 = max(PFD_dBWm2);
        peak_e_dBVm = max(E_dBVm);

        P.theta_deg = thetaVec;
        P.phi_deg   = phiVec;
        P.Etheta = Eth;
        P.Ephi   = Eph;
        P.ERCP   = ER;
        P.ELCP   = EL;
        P.Gain_dBi = Gain_dBi;
        P.AR_dB  = AR_dB;
        P.PLF_dB = PLF_dB;
        P.PolCorrGain_dBi = PolCorrGain_dBi;
        P.EIRP_dBW = EIRP_dBW;
        P.E_dBVm = E_dBVm;
        P.PFD_dBWm2 = PFD_dBWm2;
        P.Table = Table;
        P.meta = struct( ...
            'peak_gain_dBi', peak_gain_dBi, ...
            'peak_ar_dB', peak_ar_dB, ...
            'peak_plf_dB', peak_plf_dB, ...
            'peak_polarized_corrected_gain_dBi', peak_pcg_dBi, ...
            'peak_eirp_dBW', peak_eirp_dBW, ...
            'peak_pfd_dBWm2', peak_pfd_dBWm2, ...
            'peak_e_dBVm', peak_e_dBVm, ...
            'dominant_polarization', dom, ...
            'theta_inc_deg', PatternAnalyzerApp_v3_1.stepSize(thetaVec), ...
            'phi_inc_deg', PatternAnalyzerApp_v3_1.stepSize(phiVec), ...
            'loss_dB', opts.Loss_dB, ...
            'txPower_dBW', opts.TxPower_dBW, ...
            'distance_m', opts.Range_m, ...
            'rxMode', rxMode, ...
            'rxAR_dB', opts.RxAR_dB, ...
            'rxTilt_deg', opts.Tau_deg);
    end

    function rawTable = readSimpleRaw(filePath, ext)
        nHdr = PatternAnalyzerApp_v3_1.findHeaderLines(filePath);
        M = readmatrix(filePath, ...
            'FileType','text', ...
            'NumHeaderLines', nHdr, ...
            'Delimiter', {' ','\t',',',';'}, ...
            'ConsecutiveDelimitersRule','join', ...
            'LeadingDelimitersRule','ignore');
        M = M(~all(isnan(M),2),:);
        assert(size(M,2) >= 6, 'File does not contain at least 6 numeric columns.');

        switch ext
            case '.out'
                th = M(:,1); ph = M(:,2);
                Ercp = complex(M(:,3), M(:,4));
                Elcp = complex(M(:,5), M(:,6));
                Eth = (Ercp + Elcp) ./ sqrt(2);
                Eph = (Ercp - Elcp) ./ (1i*sqrt(2));
            case '.ffs'
                ph = M(:,1); th = M(:,2);
                Eth = complex(M(:,3), M(:,4));
                Eph = complex(M(:,5), M(:,6));
            case '.ffe'
                th = M(:,1); ph = M(:,2);
                Eth = complex(M(:,3), M(:,4));
                Eph = complex(M(:,5), M(:,6));
            case {'.fz','.uan'}
                th = M(:,1); ph = M(:,2);
                Eth = 10.^(M(:,3)./20) .* exp(1i*deg2rad(M(:,5)));
                Eph = 10.^(M(:,4)./20) .* exp(1i*deg2rad(M(:,6)));
            otherwise
                th = M(:,1); ph = M(:,2);
                Eth = complex(M(:,3), M(:,4));
                Eph = complex(M(:,5), M(:,6));
        end

        rawTable = table(th(:), ph(:), real(Eth(:)), imag(Eth(:)), real(Eph(:)), imag(Eph(:)), ...
            'VariableNames', {'Theta','Phi','Re_Etheta','Im_Etheta','Re_Ephi','Im_Ephi'});
    end

    function nHdr = findHeaderLines(filePath)
        fid = fopen(filePath,'r');
        assert(fid > 0, 'Cannot open file: %s', filePath);
        nHdr = 0;
        while true
            pos = ftell(fid);
            line = fgetl(fid);
            if ~ischar(line), break; end
            if ~isempty(regexp(strtrim(line), '^[+-]?(?:\d+\.?\d*|\.\d+)(?:[eEdD][+-]?\d+)?', 'once'))
                fseek(fid, pos, 'bof');
                break
            end
            nHdr = nHdr + 1;
        end
        fclose(fid);
    end

    function T = normalizePatternTable(T)
        T.Phi = mod(T.Phi, 360);
        T = sortrows(T, {'Phi','Theta'});
        ang = T{:, {'Theta','Phi'}};
        [~, ia] = unique(ang, 'rows', 'stable');
        keep = false(height(T),1); keep(ia) = true;
        T = T(keep,:);
        if any(T.Phi == 0) && ~any(T.Phi == 360)
            T0 = T(T.Phi == 0,:);
            T0.Phi(:) = 360;
            T = sortrows([T; T0], {'Phi','Theta'});
        end
    end

    function rows = metaToTable(P)
        m = P.meta;
        rows = table( ...
            string({ ...
                'File','Format','Block','Frequency', ...
                'Peak Gain','Peak AR','Peak PLF','Peak Pol. Corr. Gain', ...
                'Peak EIRP','Peak PFD','Peak E-field', ...
                'Dominant Pol.','Rx Mode','Rx AR','Rx Tilt', ...
                'Theta Inc.','Phi Inc.','Loss','Tx Power','Range' }).', ...
            string({ ...
                P.sourceFile, string(P.sourceFormat), num2str(P.blockID), PatternAnalyzerApp_v3_1.fmtHz(P.freq_Hz), ...
                sprintf('%.3f dBi', m.peak_gain_dBi), sprintf('%.3f dB', m.peak_ar_dB), sprintf('%.3f dB', m.peak_plf_dB), sprintf('%.3f dBi', m.peak_polarized_corrected_gain_dBi), ...
                sprintf('%.3f dBW', m.peak_eirp_dBW), sprintf('%.3f dBW/m^2', m.peak_pfd_dBWm2), sprintf('%.3f dBV/m', m.peak_e_dBVm), ...
                string(m.dominant_polarization), string(m.rxMode), sprintf('%.3f dB', m.rxAR_dB), sprintf('%.3f deg', m.rxTilt_deg), ...
                sprintf('%.3f deg', m.theta_inc_deg), sprintf('%.3f deg', m.phi_inc_deg), sprintf('%.3f dB', m.loss_dB), ...
                sprintf('%.3f dBW', m.txPower_dBW), sprintf('%.3f m', m.distance_m) }).', ...
            'VariableNames', {'Field','Value'} );
    end

    function y = fmtHz(f)
        if isnan(f), y = 'n/a'; else, y = sprintf('%.4g GHz', f/1e9); end
    end

    function s = stepSize(v)
        if numel(v) > 1
            s = abs(v(2) - v(1));
        else
            s = NaN;
        end
    end

    function R = normalizeRadius(Z)
        zmin = min(Z(:));
        zmax = max(Z(:));
        if abs(zmax-zmin) < eps
            R = ones(size(Z));
        else
            R = 0.2 + 0.8 * (Z - zmin) ./ (zmax - zmin);
        end
    end
end
end