classdef APAT_v2_02 < matlab.apps.AppBase
% APAT_v2_02  Antenna Pattern Analysis Tool – v1
%   Formats: .uan .fz .out .ffd .ffe .ffs .csv .txt .dat
%
% CHANGELOG (this revision):
%   • Browse: forced uigetfile when typed path == currently-loaded path
%   • Metadata: POB, POB θ/φ, peak Eθ/Eφ/RHCP/LHCP, dominant pol, orientation
%   • Fisheye: polaraxes + surf (R2025a) instead of regular axes
%   • Input table: 'Enable','off' removed; ColumnEditable=false used instead
%   • Coverage: "Go to Coverage" button now pre-fills the file-path field
%   • Orientation: auto-detected after load; updates Coverage dropdown + cone
%     spinners + E/H-plane cut; "Custom" option for manual entry
%   • Coverage tree: checkbox-style uitree; each run stored as a node;
%     checked nodes → plotted + in table; unchecked → removed
%   • Coverage query: coverage @ threshold (dBi) and threshold @ coverage (%)
% -------------------------------------------------------------------------

    % =====================================================================
    % UI COMPONENT PROPERTIES
    % =====================================================================
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        GridLayout                     matlab.ui.container.GridLayout
        TabGroup                       matlab.ui.container.TabGroup

        % ── Tab 1 ─────────────────────────────────────────────────────────
        Tab1_Single                    matlab.ui.container.Tab
        Single_Grid                    matlab.ui.container.GridLayout
        Single_panelParam              matlab.ui.container.Panel
        Single_gridPanel_Param         matlab.ui.container.GridLayout
        InputPatternLabel              matlab.ui.control.Label
        Single_EditField_Path          matlab.ui.control.EditField
        Single_Button_Load             matlab.ui.control.Button
        Single_Button_Process          matlab.ui.control.Button
        Single_Export_Output           matlab.ui.control.Button
        Single_Export_UAN              matlab.ui.control.Button
        Single_Button_Coverage         matlab.ui.control.Button
        Single_DropDown_step           matlab.ui.control.DropDown
        RxPolLabel                     matlab.ui.control.Label
        Single_DropDown_RxPol          matlab.ui.control.DropDown
        IncidentWaveARRwPLFLabel       matlab.ui.control.Label
        Single_Spinner_Rw              matlab.ui.control.Spinner
        LossindBLabel                  matlab.ui.control.Label
        Single_Spinner_Loss            matlab.ui.control.Spinner
        TransmitPowerLabel             matlab.ui.control.Label
        Single_Spinner_Pt              matlab.ui.control.Spinner
        Single_DropDown_Pt             matlab.ui.control.DropDown
        DistanceLabel                  matlab.ui.control.Label
        Single_Spinner_R               matlab.ui.control.Spinner
        Single_DropDown_R              matlab.ui.control.DropDown

        % Full pattern
        Single_Panel_fullPattern       matlab.ui.container.Panel
        Single_gridPanel_full          matlab.ui.container.GridLayout
        Single_tabPlots                matlab.ui.container.TabGroup
        Single_tabContour              matlab.ui.container.Tab
        Single_gridContour             matlab.ui.container.GridLayout
        Single_Axes_Ctr                matlab.ui.control.UIAxes
        Range_Ctr                      matlab.ui.control.RangeSlider
        Range_Ctr_Max                  matlab.ui.control.Spinner
        Range_Ctr_Min                  matlab.ui.control.Spinner
        Single_tabCircular             matlab.ui.container.Tab
        Single_gridCircular            matlab.ui.container.GridLayout
        Range_Cir                      matlab.ui.control.RangeSlider
        Range_Cir_Max                  matlab.ui.control.Spinner
        Range_Cir_Min                  matlab.ui.control.Spinner
        Single_tabSpherical            matlab.ui.container.Tab
        Single_gridSpherical           matlab.ui.container.GridLayout
        Axes3_3                        matlab.ui.control.UIAxes
        Range_Sph                      matlab.ui.control.RangeSlider
        Range_Sph_Max                  matlab.ui.control.Spinner
        Range_Sph_Min                  matlab.ui.control.Spinner
        Single_tab3D                   matlab.ui.container.Tab
        Single_grid3D                  matlab.ui.container.GridLayout
        Axes3_4                        matlab.ui.control.UIAxes
        Range_3D                       matlab.ui.control.RangeSlider
        Range_3D_Max                   matlab.ui.control.Spinner
        Range_3D_Min                   matlab.ui.control.Spinner

        % Plot control
        Single_Panel_plotControl       matlab.ui.container.Panel
        Single_gridPanel_Ctrl          matlab.ui.container.GridLayout
        ComponentLabel                 matlab.ui.control.Label
        Single_DropDown_Component      matlab.ui.control.DropDown
        CuttypeDropDownLabel           matlab.ui.control.Label
        Single_DropDown_cutType        matlab.ui.control.DropDown
        CutvalueSpinnerLabel           matlab.ui.control.Label
        Single_DropDown_cutValue       matlab.ui.control.Spinner
        ColorbarmaxLabel               matlab.ui.control.Label
        Single_Plot_Cmax               matlab.ui.control.Spinner
        ColorbarminLabel               matlab.ui.control.Label
        Single_Plot_Cmin               matlab.ui.control.Spinner
        ColorbarstepLabel              matlab.ui.control.Label
        Single_Plot_Cstep              matlab.ui.control.Spinner

        % Cut panel
        Single_Panel_Rect              matlab.ui.container.Panel
        Single_gridPanel_Cut           matlab.ui.container.GridLayout
        Single_tabCut                  matlab.ui.container.TabGroup
        Single_tabPolarPlot            matlab.ui.container.Tab
        Single_Grid_Polar              matlab.ui.container.GridLayout
        Range_Cut                      matlab.ui.control.RangeSlider
        Range_Cut_Max                  matlab.ui.control.Spinner
        Range_Cut_Min                  matlab.ui.control.Spinner
        Button_HPBW                    matlab.ui.control.StateButton
        Label_HPBW                     matlab.ui.control.Label
        Single_gridEcut                matlab.ui.container.GridLayout
        CheckBox_Et                    matlab.ui.control.CheckBox
        CheckBox_Er                    matlab.ui.control.CheckBox
        CheckBox_El                    matlab.ui.control.CheckBox
        Button_ExportCut               matlab.ui.control.Button
        Single_tabRectPlot             matlab.ui.container.Tab
        Single_gridRect                matlab.ui.container.GridLayout
        Single_AxesRect                matlab.ui.control.UIAxes
        Single_Switch                  matlab.ui.control.Switch

        % Data tables
        Single_DropDown_output         matlab.ui.control.DropDown
        Single_tabData                 matlab.ui.container.TabGroup
        Single_tabDataOut              matlab.ui.container.Tab
        Single_gridDataOut             matlab.ui.container.GridLayout
        Single_Table_DataOut           matlab.ui.control.Table
        Single_tabDataIn               matlab.ui.container.Tab
        Single_gridDataIn              matlab.ui.container.GridLayout
        Single_Table_DataIn            matlab.ui.control.Table
        MetadataTab                    matlab.ui.container.Tab
        Single_gridMetadata            matlab.ui.container.GridLayout
        Single_Table_metadata          matlab.ui.control.Table
        Single_statusBar               matlab.ui.control.Label

        % ── Tab 2 ─────────────────────────────────────────────────────────
        Tab2_Coverage                  matlab.ui.container.Tab
        Cov_Grid                       matlab.ui.container.GridLayout
        Cov_Panel_Param                matlab.ui.container.Panel
        Cov_gridPanel_Parm             matlab.ui.container.GridLayout
        Cov_ButtonGroup_CovType        matlab.ui.container.ButtonGroup
        Cov_ButtonGroup_Btn_Spherical  matlab.ui.control.RadioButton
        Cov_ButtonGroup_Btn_Conical    matlab.ui.control.RadioButton
        AntennaPatternEditFieldLabel   matlab.ui.control.Label
        Cov_EditField_filePath         matlab.ui.control.EditField
        Cov_Button_Load                matlab.ui.control.Button
        Cov_Button_Process             matlab.ui.control.Button
        ThresholdMindBSpinnerLabel     matlab.ui.control.Label
        Cov_Spinner_ThreshMin          matlab.ui.control.Spinner
        ThresholdMaxdBSpinnerLabel     matlab.ui.control.Label
        Cov_Spinner_ThreshMax          matlab.ui.control.Spinner
        StepdBSpinnerLabel             matlab.ui.control.Label
        Cov_Spinner_Step               matlab.ui.control.Spinner
        Cov_Button_Clear               matlab.ui.control.Button
        Cov_Button_Export              matlab.ui.control.Button
        ConeSpinnerLabel               matlab.ui.control.Label
        Cov_Spinner_ConeTH             matlab.ui.control.Spinner
        ConeLabel                      matlab.ui.control.Label
        Cov_Spinner_ConePH             matlab.ui.control.Spinner
        ConeAngleSpinnerLabel          matlab.ui.control.Label
        Cov_Spinner_ConeAng            matlab.ui.control.Spinner
        Cov_DropDown_Orientation       matlab.ui.control.DropDown
        % Coverage query controls (row 4)
        Cov_Label_QueryCovPct          matlab.ui.control.Label
        Cov_Spinner_QueryThresh        matlab.ui.control.Spinner
        Cov_Btn_GetCovPct              matlab.ui.control.Button
        Cov_Label_QueryResult1         matlab.ui.control.Label
        Cov_Label_QueryThreshVal       matlab.ui.control.Label
        Cov_Spinner_QueryCovPct        matlab.ui.control.Spinner
        Cov_Btn_GetThreshVal           matlab.ui.control.Button
        Cov_Label_QueryResult2         matlab.ui.control.Label
        % Coverage results
        Cov_Axes                       matlab.ui.control.UIAxes
        Cov_Tree                       matlab.ui.container.Tree
        Cov_Tree_Results               matlab.ui.container.TreeNode
        Node2                          matlab.ui.container.TreeNode
        Node3                          matlab.ui.container.TreeNode
        Node4                          matlab.ui.container.TreeNode
        Cov_Tabel                      matlab.ui.control.Table
    end

    % =====================================================================
    % WORKING DATA PROPERTIES
    % =====================================================================
    properties (Access = public)
        % File info
        Single_fileName         char
        Single_filePath         char
        Single_folderPath       char
        Single_InputFileName    char
        % Programmatic axes (created in startupFcn)
        Single_paxCut                   % polaraxes – cut polar plot
        Single_paxPattern               % polaraxes – fisheye (R2025a surf)
        % Data pipeline
        rawTable                table
        normTable               table
        procTable               table
        UAN_data                table
        DataOut_all             table
        DataOut_step            table
        ColumnNames             cell
        % Scalars
        POB                     double = 0
        maxE                    double = 0
        step                    double = 1
        Pt_dB                   double = 0
        R_m                     double = 1
        % Orientation detection
        detectedOrientation     char = ''
        detectedPOB_Theta       double = 0
        detectedPOB_Phi         double = 0
        % Coverage run history
        covResults              struct  % initialised in startupFcn
    end

    % =====================================================================
    % PRIVATE HELPER METHODS
    % =====================================================================
    methods (Access = private)

        % -----------------------------------------------------------------
        function rawTable = loadPattern(app, filePath)
            [nHdr, ffdParams] = app.findHeaderLines(filePath);
            [~,~,ext] = fileparts(filePath);
            opts = detectImportOptions(filePath,'FileType','text', ...
                'NumHeaderLines',nHdr,'Delimiter',{' ','\t',',',';'}, ...
                'ConsecutiveDelimitersRule','join','LeadingDelimitersRule','ignore');
            M = readmatrix(filePath, opts);
            M = M(~all(isnan(M),2), :);
            nBlk = 1;  freqs = NaN;  isDep = false;  rawTables = {};
            switch lower(ext)
                case {'.fz','.uan'}
                    assert(width(M)>=6,'APAT:BadFile','%s needs ≥6 columns',ext);
                    TH  = M(:,1);  PH  = M(:,2);
                    Eth = 10.^(M(:,3)/20) .* exp(1i*deg2rad(M(:,5)));
                    Eph = 10.^(M(:,4)/20) .* exp(1i*deg2rad(M(:,6)));
                case '.out'
                    assert(width(M)>=6,'APAT:BadFile','.out needs ≥6 columns');
                    TH   = M(:,1);  PH  = M(:,2);
                    Ercp = complex(M(:,3),M(:,4));
                    Elcp = complex(M(:,5),M(:,6));
                    Eth  = (Ercp + Elcp)        / sqrt(2);
                    Eph  = (Ercp - Elcp) / (1i*sqrt(2));
                case '.ffs'
                    assert(width(M)>=6,'APAT:BadFile','.ffs needs ≥6 columns');
                    PH  = M(:,1);  TH  = M(:,2);
                    Eth = complex(M(:,3),M(:,4));
                    Eph = complex(M(:,5),M(:,6));
                case '.ffe'
                    assert(width(M)>=6,'APAT:BadFile','.ffe needs ≥6 columns');
                    TH  = M(:,1);  PH  = M(:,2);
                    Eth = complex(M(:,3),M(:,4));
                    Eph = complex(M(:,5),M(:,6));
                case '.ffd'
                    assert(ffdParams.isFFD,'APAT:BadFile', ...
                        'Could not parse HFSS FFD theta/phi ranges');
                    thU = linspace(ffdParams.theta(1),ffdParams.theta(2),ffdParams.theta(3))';
                    phU = linspace(ffdParams.phi(1),  ffdParams.phi(2),  ffdParams.phi(3))';
                    [TH_g,PH_g] = meshgrid(thU,phU);
                    sepIdx = isnan(M(:,1));
                    fVals  = M(sepIdx,2);  fVals = fVals(~isnan(fVals));
                    freqs  = [ffdParams.freq; fVals(:)];
                    D      = M(~sepIdx,1:4);
                    nPts   = numel(thU)*numel(phU);
                    assert(mod(size(D,1),nPts)==0,'APAT:BadFile','FFD row count mismatch');
                    nBlk   = size(D,1)/nPts;
                    isDep  = nBlk > 1;
                    if isempty(freqs), freqs = NaN(1,nBlk); end
                    Blks   = mat2cell(D,repmat(nPts,nBlk,1),4);
                    rawTables = cellfun(@(B) table(TH_g(:),PH_g(:), ...
                        B(:,1),B(:,2),B(:,3),B(:,4), ...
                        'VariableNames',{'Theta','Phi', ...
                        'Re_Etheta','Im_Etheta','Re_Ephi','Im_Ephi'}), ...
                        Blks,'UniformOutput',false);
                    B0  = Blks{1};
                    TH  = TH_g(:);  PH = PH_g(:);
                    Eth = complex(B0(:,1),B0(:,2));
                    Eph = complex(B0(:,3),B0(:,4));
                case {'.csv','.txt','.dat'}
                    nH2 = max(0,nHdr-1);
                    opts2 = detectImportOptions(filePath,'FileType','text', ...
                        'NumHeaderLines',nH2,'LeadingDelimitersRule','ignore', ...
                        'ConsecutiveDelimitersRule','join');
                    rawTable = readtable(filePath,opts2);
                    assert(~isempty(rawTable),'APAT:EmptyFile','File has no data');
                    rawTable.Properties.VariableNames(1) = {'Theta'};
                    rawTable.Properties.VariableNames(2) = {'Phi'};
                    if numel(unique(rawTable{:,1})) < numel(unique(rawTable{:,2}))
                        rawTable.Properties.VariableNames(1:2) = {'Phi','Theta'};
                    end
                    assert(all(rawTable{:,1:2}>=-180 & rawTable{:,1:2}<=360,'all'), ...
                        'APAT:BadAngles','First 2 columns must be angles in [-180,360]');
                    rawTable.Properties.UserData = struct('isGainOnly',true, ...
                        'freqs',freqs,'isDep',isDep,'nBlk',nBlk,'Blocks',{{}});
                    return
                otherwise
                    error('APAT:Unsupported','Unsupported format: %s',ext);
            end
            rawTable = table(TH(:),PH(:), ...
                real(Eth(:)),imag(Eth(:)),real(Eph(:)),imag(Eph(:)), ...
                'VariableNames',{'Theta','Phi', ...
                'Re_Etheta','Im_Etheta','Re_Ephi','Im_Ephi'});
            rawTable.Properties.UserData = struct('isGainOnly',false, ...
                'freqs',freqs,'isDep',isDep,'nBlk',nBlk,'Blocks',{rawTables});
        end % loadPattern

        % -----------------------------------------------------------------
        function [nHdr, ffdParams] = findHeaderLines(~, filePath)
            fid = fopen(filePath,'r');
            assert(fid>0,'Cannot open: %s',filePath);
            cleanup = onCleanup(@() fclose(fid));
            nHdr = 0;
            ffdParams = struct('theta',[],'phi',[],'nFreq',[],'freq',[],'isFFD',false);
            num     = '[+-]?(?:\d+\.?\d*|\.\d+)(?:[eEdD][+-]?\d+)?';
            dataPat = ['^\s*' num '(?:[\s,;]+' num '){3,}\s*$'];
            while true
                pos  = ftell(fid);
                line = fgetl(fid);
                if ~ischar(line), break; end
                if ~isempty(regexp(line,dataPat,'once'))
                    fseek(fid,pos,'bof');  break;
                end
                s = lower(strtrim(line));
                v = sscanf(s,'%f')';
                if numel(v)==3
                    if     isempty(ffdParams.theta), ffdParams.theta = v;
                    elseif isempty(ffdParams.phi),   ffdParams.phi   = v;
                    end
                elseif startsWith(s,'frequencies '), ffdParams.nFreq = sscanf(s,'%*s %d');
                elseif startsWith(s,'frequency '),   ffdParams.freq  = sscanf(s,'%*s %f');
                end
                nHdr = nHdr+1;
            end
            ffdParams.isFFD = ~isempty(ffdParams.theta) && ~isempty(ffdParams.phi);
        end % findHeaderLines

        % -----------------------------------------------------------------
        function T = normalizePattern(~, T, fastAxis)
            if nargin<3 || isempty(fastAxis), fastAxis = "theta"; end
            if min(T.Theta) < 0,  T.Theta = 90 - T.Theta; end
            T.Phi = mod(T.Phi, 360);
            [~,ia] = unique(T{:,{'Theta','Phi'}},'rows','stable');
            T = T(ia,:);
            if ~any(T.Phi == 360)
                Ts = T(T.Phi==0,:);  Ts.Phi(:)=360;  T = [T; Ts];
            end
            if fastAxis=="phi", T = sortrows(T,{'Theta','Phi'});
            else,               T = sortrows(T,{'Phi','Theta'});
            end
        end % normalizePattern

        % -----------------------------------------------------------------
        function param = getParam(app)
            param.Loss_dB  = app.Single_Spinner_Loss.Value;
            param.LossMag  = 10^(-param.Loss_dB/20);
            param.RxMode   = string(app.Single_DropDown_RxPol.Value);
            param.RxAR_dB  = app.Single_Spinner_Rw.Value;
            switch app.Single_DropDown_Pt.Value
                case 'dBm',   param.Pt_dBW = app.Single_Spinner_Pt.Value - 30;
                case 'Watts', param.Pt_dBW = 10*log10(max(app.Single_Spinner_Pt.Value,eps));
                otherwise,    param.Pt_dBW = app.Single_Spinner_Pt.Value;
            end
            switch app.Single_DropDown_R.Value
                case 'km',  param.R_m = app.Single_Spinner_R.Value * 1e3;
                otherwise,  param.R_m = app.Single_Spinner_R.Value;
            end
        end % getParam

        % -----------------------------------------------------------------
        function pat = processPattern(app, T, param)
            if T.Properties.UserData.isGainOnly
                pat = T;  app.DataOut_all = T;
                c = T.Properties.VariableNames;
                app.POB = max(T.(c{3}));  app.maxE = app.POB;
                return
            end
            Eth = complex(T.Re_Etheta, T.Im_Etheta) .* param.LossMag;
            Eph = complex(T.Re_Ephi,   T.Im_Ephi)   .* param.LossMag;
            Ercp = (Eth + 1i*Eph) / sqrt(2);
            Elcp = (Eth - 1i*Eph) / sqrt(2);
            E_TH_mag  = abs(Eth);    E_PH_mag  = abs(Eph);
            Ercp_mag  = abs(Ercp);   Elcp_mag  = abs(Elcp);
            E_tot_mag = sqrt(E_TH_mag.^2 + E_PH_mag.^2);
            E_TH_DB   = 20*log10(max(E_TH_mag, eps));
            E_PH_DB   = 20*log10(max(E_PH_mag, eps));
            E_TH_DG   = rad2deg(angle(Eth));
            E_PH_DG   = rad2deg(angle(Eph));
            E_RCP_DB  = 20*log10(max(Ercp_mag, eps));
            E_LCP_DB  = 20*log10(max(Elcp_mag, eps));
            E_tot_dB  = 20*log10(max(E_tot_mag, eps));
            % Axial Ratio (signed: + RHCP, – LHCP)
            denom = abs(Ercp_mag - Elcp_mag);
            denom(denom < 1e-12) = 1e-12;
            AR = (Ercp_mag + Elcp_mag) ./ denom;
            AR(Ercp_mag < Elcp_mag) = -AR(Ercp_mag < Elcp_mag);
            AR_dB = 20*log10(abs(AR)) .* sign(AR);
            % PLF
            dTau = 90;
            Ra   = abs(AR);  Ra(Ra < 1) = 1./Ra(Ra < 1);
            Rw   = 10^(param.RxAR_dB/20);
            isRHCP  = mean(Ercp_mag) >= mean(Elcp_mag);
            Rw_sign = double(isRHCP)*2 - 1;
            switch param.RxMode
                case 'RHCP', Rw_sign =  1;
                case 'LHCP', Rw_sign = -1;
            end
            PLF_dB = 10*log10(max( ...
                0.5 + (4*Ra.*(Rw_sign*Rw) + (Ra.^2-1).*(Rw.^2-1).*cosd(2*dTau)) ...
                    ./ (2*(Ra.^2+1).*(Rw.^2+1)), eps));
            app.Pt_dB = param.Pt_dBW;  app.R_m = max(param.R_m,eps);
            EIRP_dBW  = app.Pt_dB + E_tot_dB;
            EIRP_W    = 10.^(EIRP_dBW/10);
            PFD       = EIRP_W ./ (4*pi*app.R_m^2);
            E_field   = sqrt(30.*EIRP_W) ./ app.R_m;
            pat = T(:,{'Theta','Phi'});
            pat.E_Total_dB      = round(E_tot_dB,       4);
            pat.E_TH_dB         = round(E_TH_DB,        4);
            pat.E_PH_dB         = round(E_PH_DB,        4);
            pat.E_RCP_dB        = round(E_RCP_DB,       4);
            pat.E_LCP_dB        = round(E_LCP_DB,       4);
            pat.AR_dB           = round(AR_dB,          4);
            pat.PLF_dB          = round(PLF_dB,         4);
            pat.Gain_Corr_dB    = round(E_tot_dB+PLF_dB,4);
            pat.E_RCP_Phase_deg = round(rad2deg(angle(Ercp)),3);
            pat.E_LCP_Phase_deg = round(rad2deg(angle(Elcp)),3);
            pat.EIRP_dBW        = round(EIRP_dBW,       3);
            pat.PFD_Wm2         = PFD;
            pat.E_field_Vm      = E_field;
            app.DataOut_all = pat;
            app.POB  = max(pat.E_Total_dB);
            app.maxE = app.POB;
            mask = ismember(round(T.Theta),0:180) & ismember(round(T.Phi),0:360);
            app.UAN_data = T(mask,{'Theta','Phi'});
            app.UAN_data.E_TH_DB = round(E_TH_DB(mask),5);
            app.UAN_data.E_PH_DB = round(E_PH_DB(mask),5);
            app.UAN_data.E_TH_DG = round(E_TH_DG(mask),5);
            app.UAN_data.E_PH_DG = round(E_PH_DG(mask),5);
        end % processPattern

        % -----------------------------------------------------------------
        function detectAndApplyOrientation(app)
        % Auto-detect dominant beam direction; update Coverage UI accordingly.
            if isempty(app.DataOut_all), return; end
            T    = app.DataOut_all;
            cols = T.Properties.VariableNames;
            gCol = cols{3};
            if ismember('E_Total_dB',cols), gCol='E_Total_dB'; end
            [~,pkIdx]            = max(T.(gCol));
            app.detectedPOB_Theta = T.Theta(pkIdx);
            app.detectedPOB_Phi   = T.Phi(pkIdx);
            th0 = app.detectedPOB_Theta;
            ph0 = app.detectedPOB_Phi;
            tol = 15;
            if th0 <= tol
                orient = '+Z';
            elseif th0 >= 180-tol
                orient = '-Z';
            else
                phN = mod(ph0+180,360)-180;          % normalise to [-180,180]
                if     abs(phN)      <= tol,         orient = '+X';
                elseif abs(abs(phN)-180) <= tol,     orient = '-X';
                elseif abs(phN-90)   <= tol,         orient = '+Y';
                elseif abs(phN+90)   <= tol,         orient = '-Y';
                else,                                orient = 'Custom';
                end
            end
            app.detectedOrientation = orient;
            % Update Coverage orientation dropdown
            if ismember(orient, app.Cov_DropDown_Orientation.Items)
                app.Cov_DropDown_Orientation.Value = orient;
            else
                app.Cov_DropDown_Orientation.Value = 'Custom';
            end
            % Update cone centre
            [cTH,cPH] = app.orientationToAngles(orient);
            app.Cov_Spinner_ConeTH.Value = cTH;
            app.Cov_Spinner_ConePH.Value = cPH;
        end % detectAndApplyOrientation

        % -----------------------------------------------------------------
        function [th0,ph0] = orientationToAngles(~, orient)
            switch orient
                case '+Z', th0=  0; ph0=  0;
                case '-Z', th0=180; ph0=  0;
                case '+X', th0= 90; ph0=  0;
                case '-X', th0= 90; ph0=180;
                case '+Y', th0= 90; ph0= 90;
                case '-Y', th0= 90; ph0=270;
                otherwise, th0=  0; ph0=  0;
            end
        end % orientationToAngles

        % -----------------------------------------------------------------
        function [ePhi,hPhi] = getEHPlanePhi(app)
        % Return E-plane and H-plane phi values based on detected orientation.
            switch app.detectedOrientation
                case {'+Z','-Z'}, ePhi=  0; hPhi= 90;
                case '+X',        ePhi=  0; hPhi= 90;
                case '-X',        ePhi=180; hPhi= 90;
                case '+Y',        ePhi= 90; hPhi=  0;
                case '-Y',        ePhi=270; hPhi=  0;
                otherwise  % Custom
                    ePhi = mod(app.detectedPOB_Phi,360);
                    hPhi = mod(app.detectedPOB_Phi+90,360);
            end
        end % getEHPlanePhi

        % -----------------------------------------------------------------
        function updateStep(app)
            if isempty(app.DataOut_all), return; end
            thU = unique(app.DataOut_all.Theta);
            if numel(thU)<2, app.step=1; return; end
            app.step = thU(2)-thU(1);
            nStr = sprintf('STEP: %g°',app.step);
            if app.step < 1-1e-9
                app.Single_DropDown_step.Items  = {nStr,'STEP: 1°'};
                app.Single_DropDown_step.Value  = nStr;
                app.Single_DropDown_step.Enable = 'on';
            else
                app.Single_DropDown_step.Items  = {nStr};
                app.Single_DropDown_step.Value  = nStr;
                app.Single_DropDown_step.Enable = 'off';
            end
            app.Single_DropDown_step.Visible = 'on';
        end % updateStep

        % -----------------------------------------------------------------
        function buildOutputStep(app)
            if isempty(app.DataOut_all), return; end
            tok = regexp(app.Single_DropDown_step.Value,'[\d.]+','match','once');
            dispStep = str2double(tok);
            if isnan(dispStep)||dispStep<=0, dispStep=app.step; end
            T = app.DataOut_all;
            if dispStep > app.step+1e-9
                thU = unique(T.Theta);  phU = unique(T.Phi);
                thK = thU(mod(thU,dispStep) < app.step/2+1e-9);
                phK = phU(mod(phU,dispStep) < app.step/2+1e-9);
                app.DataOut_step = T(ismember(T.Theta,thK) & ismember(T.Phi,phK),:);
            else
                app.DataOut_step = T;
            end
            allCols = T.Properties.VariableNames;
            app.ColumnNames = allCols(3:end);
            app.Single_Table_DataOut.Data    = app.DataOut_step;
            app.Single_Table_DataOut.Visible = 'on';
            if ~isempty(app.UAN_data)
                app.Single_Table_DataIn.Data    = app.UAN_data;
                app.Single_Table_DataIn.Visible = 'on';
            end
            allItems = [{'— column filter —'}, app.ColumnNames];
            app.Single_DropDown_output.Items     = allItems;
            app.Single_DropDown_output.ItemsData = 0:numel(app.ColumnNames);
            app.Single_DropDown_output.UserData  = true(1,numel(app.ColumnNames));
            app.Single_DropDown_output.Value     = 0;
            app.Single_DropDown_output.Visible   = 'on';
            app.filterOutput();
            app.Single_tabData.Visible = 'on';
        end % buildOutputStep

        % -----------------------------------------------------------------
        function updateMetadata(app)
        % Populate Metadata tab with POB, component peaks, orientation, etc.
            if isempty(app.DataOut_all), return; end
            T    = app.DataOut_all;
            cols = T.Properties.VariableNames;
            gCol = cols{3};
            if ismember('E_Total_dB',cols), gCol='E_Total_dB'; end
            [pkG,pkIdx] = max(T.(gCol));

            % Use pre-detected POB coordinates if available
            if ~isempty(app.detectedOrientation)
                pobTH = app.detectedPOB_Theta;
                pobPH = app.detectedPOB_Phi;
            else
                pobTH = T.Theta(pkIdx);
                pobPH = T.Phi(pkIdx);
            end

            % Polarization
            polStr = 'Unknown';
            if ismember('E_RCP_dB',cols) && ismember('E_LCP_dB',cols)
                polStr = 'RHCP';
                if mean(T.E_LCP_dB) > mean(T.E_RCP_dB), polStr='LHCP'; end
            end

            keys = {}; vals = {};
            keys{end+1}='POB / Peak Gain (dBi)';   vals{end+1}=sprintf('%.3f dBi',pkG);
            keys{end+1}='POB Theta (°)';             vals{end+1}=sprintf('%g°',pobTH);
            keys{end+1}='POB Phi (°)';               vals{end+1}=sprintf('%g°',pobPH);
            keys{end+1}='Dominant Polarisation';     vals{end+1}=polStr;

            if ismember('E_TH_dB', cols)
                keys{end+1}='Peak E_Theta (dBi)';   vals{end+1}=sprintf('%.3f',max(T.E_TH_dB));
            end
            if ismember('E_PH_dB', cols)
                keys{end+1}='Peak E_Phi (dBi)';     vals{end+1}=sprintf('%.3f',max(T.E_PH_dB));
            end
            if ismember('E_RCP_dB', cols)
                keys{end+1}='Peak E_RCP (dBi)';     vals{end+1}=sprintf('%.3f',max(T.E_RCP_dB));
            end
            if ismember('E_LCP_dB', cols)
                keys{end+1}='Peak E_LCP (dBi)';     vals{end+1}=sprintf('%.3f',max(T.E_LCP_dB));
            end
            if ~isempty(app.detectedOrientation)
                keys{end+1}='Detected Orientation'; vals{end+1}=app.detectedOrientation;
                keys{end+1}='Boresight Theta (°)';  vals{end+1}=sprintf('%g°',app.detectedPOB_Theta);
                keys{end+1}='Boresight Phi (°)';    vals{end+1}=sprintf('%g°',app.detectedPOB_Phi);
            end
            keys{end+1}='Angular Step (°)';         vals{end+1}=sprintf('%g',app.step);
            keys{end+1}='Total Data Points';        vals{end+1}=sprintf('%d',height(T));

            app.Single_Table_metadata.Data = [keys(:), vals(:)];
        end % updateMetadata

        % -----------------------------------------------------------------
        function updateCutControls(app)
            if isempty(app.DataOut_all), return; end
            if strcmp(app.Single_DropDown_cutType.Value,'Phi Cut')
                vals = unique(app.DataOut_all.Phi);
            else
                vals = unique(app.DataOut_all.Theta);
            end
            app.Single_DropDown_cutValue.Limits = [vals(1), vals(end)];
            app.Single_DropDown_cutValue.Step   = vals(2)-vals(1);
            cv = app.Single_DropDown_cutValue.Value;
            if cv < vals(1) || cv > vals(end)
                app.Single_DropDown_cutValue.Value = vals(1);
            end
        end % updateCutControls

        % -----------------------------------------------------------------
        function getCut(app)
            if isempty(app.DataOut_all)||isempty(app.Single_paxCut), return; end
            T       = app.DataOut_all;
            cutType = app.Single_DropDown_cutType.Value;
            cutVal  = app.Single_DropDown_cutValue.Value;
            if strcmp(cutType,'Phi Cut')
                phV=unique(T.Phi);  [~,ix]=min(abs(phV-cutVal));  cA=phV(ix);
                sel=abs(T.Phi-cA)<1e-6;  ang=T.Theta(sel);  lbl='Theta (°)';
                ttl=sprintf('Phi = %g°  cut',cA);
            else
                thV=unique(T.Theta); [~,ix]=min(abs(thV-cutVal)); cA=thV(ix);
                sel=abs(T.Theta-cA)<1e-6; ang=T.Phi(sel); lbl='Phi (°)';
                ttl=sprintf('Theta = %g°  cut',cA);
            end
            if ~any(sel), return; end
            gTot=[]; gRCP=[]; gLCP=[];
            if ismember('E_Total_dB',T.Properties.VariableNames), gTot=T.E_Total_dB(sel); end
            if ismember('E_RCP_dB',  T.Properties.VariableNames), gRCP=T.E_RCP_dB(sel);   end
            if ismember('E_LCP_dB',  T.Properties.VariableNames), gLCP=T.E_LCP_dB(sel);   end
            lo=app.Range_Cut_Min.Value;  hi=app.Range_Cut_Max.Value;
            if lo >= hi
                ref=max([gTot;gRCP;gLCP]);  if isempty(ref)||isnan(ref), ref=10; end
                hi=ref+3;  lo=hi-60;
                app.Range_Cut_Max.Value=hi;  app.Range_Cut_Min.Value=lo;
                app.Range_Cut.Limits=[lo-10,hi+10];  app.Range_Cut.Value=[lo,hi];
            end
            % Polar
            cla(app.Single_paxCut);  hold(app.Single_paxCut,'on');
            ar=deg2rad(ang);
            if app.CheckBox_Et.Value && ~isempty(gTot)
                polarplot(app.Single_paxCut,ar,max(gTot-lo,0),'b-','LineWidth',1.8,'DisplayName','E_{Total}');
            end
            if app.CheckBox_Er.Value && ~isempty(gRCP)
                polarplot(app.Single_paxCut,ar,max(gRCP-lo,0),'r--','LineWidth',1.3,'DisplayName','E_{RCP}');
            end
            if app.CheckBox_El.Value && ~isempty(gLCP)
                polarplot(app.Single_paxCut,ar,max(gLCP-lo,0),'g:','LineWidth',1.3,'DisplayName','E_{LCP}');
            end
            app.Single_paxCut.ThetaZeroLocation='top'; app.Single_paxCut.ThetaDir='clockwise';
            app.Single_paxCut.RLim=[0,max(hi-lo,1)];
            rt=app.Single_paxCut.RTick;
            app.Single_paxCut.RTickLabel=arrayfun(@(v) sprintf('%g',v+lo),rt,'UniformOutput',false);
            title(app.Single_paxCut,ttl);
            legend(app.Single_paxCut,'show','Location','southoutside','Orientation','horizontal');
            hold(app.Single_paxCut,'off');
            % Rectangular
            cla(app.Single_AxesRect);  hold(app.Single_AxesRect,'on');
            app.Single_AxesRect.Visible='on';
            if app.CheckBox_Et.Value && ~isempty(gTot)
                plot(app.Single_AxesRect,ang,gTot,'b-','LineWidth',1.8,'DisplayName','E_{Total}');
            end
            if app.CheckBox_Er.Value && ~isempty(gRCP)
                plot(app.Single_AxesRect,ang,gRCP,'r--','LineWidth',1.3,'DisplayName','E_{RCP}');
            end
            if app.CheckBox_El.Value && ~isempty(gLCP)
                plot(app.Single_AxesRect,ang,gLCP,'g:','LineWidth',1.3,'DisplayName','E_{LCP}');
            end
            ylim(app.Single_AxesRect,[lo,hi]);  grid(app.Single_AxesRect,'on');
            xlabel(app.Single_AxesRect,lbl);    ylabel(app.Single_AxesRect,'Magnitude (dBi)');
            title(app.Single_AxesRect,ttl);
            legend(app.Single_AxesRect,'show','Location','best');
            hold(app.Single_AxesRect,'off');
            if app.Button_HPBW.Value && ~isempty(gTot)
                app.Label_HPBW.Text=sprintf('HPBW\n%.1f°',app.computeHPBW(ang,gTot));
            else
                app.Label_HPBW.Text='';
            end
        end % getCut

        % -----------------------------------------------------------------
        function hpbw = computeHPBW(~, ang, gain_dB)
            pk=max(gain_dB);  abov=gain_dB>=pk-3;
            e=diff([false;abov(:);false]);
            rises=find(e==1);  falls=find(e==-1)-1;
            if isempty(rises), hpbw=0; return; end
            hpbw=max(ang(falls)-ang(rises));
        end % computeHPBW

        % -----------------------------------------------------------------
        function plotPattern(app)
            if isempty(app.DataOut_all), return; end
            T = app.DataOut_all;
            colMap = containers.Map( ...
                {'Total Gain','Etheta Gain','Ephi  Gain','RHCP Gain', ...
                 'LHCP  Gain','Axial Ratio','Polarized Gain'}, ...
                {'E_Total_dB','E_TH_dB','E_PH_dB','E_RCP_dB', ...
                 'E_LCP_dB','AR_dB','Gain_Corr_dB'});
            comp=app.Single_DropDown_Component.Value;
            colName='E_Total_dB';
            if isKey(colMap,comp)&&ismember(colMap(comp),T.Properties.VariableNames)
                colName=colMap(comp);
            elseif ~ismember('E_Total_dB',T.Properties.VariableNames)
                colName=T.Properties.VariableNames{3};
            end
            thU=unique(T.Theta);  phU=unique(T.Phi);
            nTH=numel(thU);       nPH=numel(phU);
            if nTH*nPH == height(T)
                Z=reshape(T.(colName),nTH,nPH);
            else
                [PH_q,TH_q]=meshgrid(phU,thU);
                Z=griddata(T.Phi,T.Theta,T.(colName),PH_q,TH_q,'linear');
            end
            hi=app.Single_Plot_Cmax.Value;  lo=app.Single_Plot_Cmin.Value;
            cs=app.Single_Plot_Cstep.Value;
            if lo>=hi || cs<=0
                hi=ceil(max(T.(colName)))+2;  lo=hi-60;  cs=5;
                app.Single_Plot_Cmax.Value=hi; app.Single_Plot_Cmin.Value=lo;
                app.Single_Plot_Cstep.Value=cs; app.syncRangeSliders(lo,hi);
            end
            lvls=lo:max(cs,1):hi;
            [PH_m,TH_m]=meshgrid(phU,thU);

            % ── Contour ────────────────────────────────────────────────
            ax=app.Single_Axes_Ctr;  cla(ax);
            contourf(ax,PH_m,TH_m,Z,lvls,'LineColor','none');
            colormap(ax,'jet');  clim(ax,[lo,hi]);  colorbar(ax);
            xlabel(ax,'Phi (°)');  ylabel(ax,'Theta (°)');
            title(ax,strrep(colName,'_',' '));
            ax.XLim=[0,360];  ax.YLim=[0,180];  ax.YDir='reverse';
            ax.XTick=0:30:360;  ax.YTick=0:15:180;  ax.Box='on';

            % ── Fisheye polaraxes (R2025a surf on polaraxes) ────────────
            if ~isempty(app.Single_paxPattern)
                pax=app.Single_paxPattern;  cla(pax);
                % surf(polaraxes, azimuth_rad, radius, Z)
                % phi → azimuth,  theta_antenna → radius
                surf(pax, deg2rad(PH_m), TH_m, Z, ...
                    'EdgeColor','none','FaceAlpha',0.92);
                colormap(pax,'jet');  clim(pax,[lo,hi]);  colorbar(pax);
                pax.RLim=[0,max(thU)];
                pax.ThetaDir='clockwise';
                pax.ThetaZeroLocation='top';
                title(pax,'Circular (Fisheye)  –  radius = θ,  angle = φ');
            end

            % ── Spherical 3-D ───────────────────────────────────────────
            ax3=app.Axes3_3;  cla(ax3);
            Znorm=max(Z-lo,0);
            TH_r=deg2rad(TH_m);  PH_r=deg2rad(PH_m);
            Xs=Znorm.*sin(TH_r).*cos(PH_r);
            Ys=Znorm.*sin(TH_r).*sin(PH_r);
            Zs=Znorm.*cos(TH_r);
            surf(ax3,Xs,Ys,Zs,Z,'EdgeColor','none','FaceAlpha',0.9);
            colormap(ax3,'jet');  clim(ax3,[lo,hi]);  colorbar(ax3);
            axis(ax3,'equal');  grid(ax3,'on');
            xlabel(ax3,'X');  ylabel(ax3,'Y');  zlabel(ax3,'Z');
            title(ax3,'3D Spherical Pattern');

            % ── 3-D Surface ─────────────────────────────────────────────
            ax4=app.Axes3_4;  cla(ax4);
            surf(ax4,PH_m,TH_m,Z,'EdgeColor','none','FaceAlpha',0.9);
            colormap(ax4,'jet');  clim(ax4,[lo,hi]);  colorbar(ax4);
            view(ax4,-37.5,30);
            xlabel(ax4,'Phi (°)');  ylabel(ax4,'Theta (°)');  zlabel(ax4,'dBi');
            title(ax4,'3D Surface Pattern');

            app.updateCutControls();
            app.getCut();
        end % plotPattern

        % -----------------------------------------------------------------
        function syncRangeSliders(app, lo, hi)
            rng=[lo,hi];  lims=[lo-40,hi+20];
            for sl=[app.Range_Ctr,app.Range_Cir,app.Range_Sph,app.Range_3D]
                sl.Limits=lims;  sl.Value=rng;
            end
            for sp=[app.Range_Ctr_Min,app.Range_Cir_Min,app.Range_Sph_Min,app.Range_3D_Min]
                sp.Value=lo;
            end
            for sp=[app.Range_Ctr_Max,app.Range_Cir_Max,app.Range_Sph_Max,app.Range_3D_Max]
                sp.Value=hi;
            end
            app.Range_Cut_Min.Value=lo;  app.Range_Cut_Max.Value=hi;
            lo2=lo-10;  hi2=hi+10;
            if app.Range_Cut.Limits(1)>lo2 || app.Range_Cut.Limits(2)<hi2
                app.Range_Cut.Limits=[lo2,hi2];
            end
            app.Range_Cut.Value=rng;
        end % syncRangeSliders

        % -----------------------------------------------------------------
        function computeCoverage(app)
        % Compute and ADD a new coverage run to the tree (never replaces).
            if isempty(app.DataOut_all), return; end
            T=app.DataOut_all;  cols=T.Properties.VariableNames;
            gCol=cols{3};  if ismember('E_Total_dB',cols), gCol='E_Total_dB'; end
            gain=T.(gCol);  th=T.Theta;
            w=sind(th);  wTot=sum(w);  if wTot<eps, wTot=1; end
            tMin=app.Cov_Spinner_ThreshMin.Value;
            tMax=app.Cov_Spinner_ThreshMax.Value;
            tStep=max(app.Cov_Spinner_Step.Value,0.1);
            if tMin>=tMax, tMax=tMin+10; end
            tVec=tMin:tStep:tMax;
            cov=zeros(size(tVec));
            isConical=app.Cov_ButtonGroup_Btn_Conical.Value;
            for k=1:numel(tVec)
                abv=gain>=tVec(k);
                if isConical
                    th0=app.Cov_Spinner_ConeTH.Value;
                    ph0=app.Cov_Spinner_ConePH.Value;
                    a  =app.Cov_Spinner_ConeAng.Value/2;
                    cosA=cosd(th).*cosd(th0)+sind(th).*cosd(T.Phi-ph0).*sind(th0);
                    inC=acosd(min(cosA,1))<=a;
                    dW=max(sum(w(inC)),eps);
                    cov(k)=100*sum(w(abv&inC))/dW;
                else
                    cov(k)=100*sum(w(abv))/wTot;
                end
            end
            % Colour palette (cycle)
            pal={[0.00,0.45,0.74],[0.85,0.33,0.10],[0.47,0.67,0.19], ...
                 [0.49,0.18,0.56],[0.93,0.69,0.13],[0.30,0.75,0.93]};
            runNum = numel(app.covResults)+1;
            col    = pal{mod(runNum-1,numel(pal))+1};
            tstamp = datestr(now,'HH:MM:SS'); %#ok<TNOW1,DATST>
            if isConical
                lbl=sprintf('Run %d  Conical θ₀=%g° φ₀=%g° α=%g° [%s,%.1f→%.1f dBi] %s', ...
                    runNum, app.Cov_Spinner_ConeTH.Value, ...
                    app.Cov_Spinner_ConePH.Value, app.Cov_Spinner_ConeAng.Value, ...
                    app.Cov_DropDown_Orientation.Value, tVec(1), tVec(end), tstamp);
            else
                lbl=sprintf('Run %d  Spherical [%.1f → %.1f dBi]  %s', ...
                    runNum, tVec(1), tVec(end), tstamp);
            end
            % Append to covResults
            app.covResults(runNum).label      = lbl;
            app.covResults(runNum).type       = 'Spherical'; if isConical, app.covResults(runNum).type='Conical'; end
            app.covResults(runNum).thresholds = tVec;
            app.covResults(runNum).coverage   = cov;
            app.covResults(runNum).color      = col;
            app.covResults(runNum).params     = struct('min',tMin,'max',tMax,'step',tStep);
            % Add tree node
            node = uitreenode(app.Cov_Tree_Results,'Text',lbl);
            node.NodeData = runNum;
            node.Checked  = true;
            expand(app.Cov_Tree_Results);
            app.updateCovPlot();
        end % computeCoverage

        % -----------------------------------------------------------------
        function updateCovPlot(app)
        % Redraw coverage axes from currently checked tree nodes.
            ax=app.Cov_Axes;  cla(ax);
            if isempty(app.covResults)||isempty(app.Cov_Tree_Results.Children)
                return;
            end
            hold(ax,'on');  anyPlot=false;
            children=app.Cov_Tree_Results.Children;
            for i=1:numel(children)
                nd=children(i);
                if ~nd.Checked || isempty(nd.NodeData), continue; end
                idx=nd.NodeData;
                if idx<1||idx>numel(app.covResults), continue; end
                r=app.covResults(idx);
                plot(ax,r.thresholds,r.coverage,'-o', ...
                    'Color',r.color,'LineWidth',1.6, ...
                    'MarkerFaceColor',r.color,'MarkerSize',4, ...
                    'DisplayName',r.label);
                anyPlot=true;
            end
            if anyPlot
                yline(ax,50,'r--','50%','LabelVerticalAlignment','bottom');
                legend(ax,'show','Location','best','Interpreter','none');
            end
            grid(ax,'on');  ylim(ax,[0,105]);
            xlabel(ax,'Threshold (dBi)');  ylabel(ax,'Coverage (%)');
            title(ax,'Coverage vs Gain Threshold');
            hold(ax,'off');
            app.updateCovTable();
        end % updateCovPlot

        % -----------------------------------------------------------------
        function updateCovTable(app)
        % Rebuild the results table from checked nodes.
            allData={};
            if isempty(app.covResults)||isempty(app.Cov_Tree_Results.Children)
                app.Cov_Tabel.ColumnName={'Threshold (dBi)','Coverage (%)'};
                app.Cov_Tabel.Data={};  return;
            end
            children=app.Cov_Tree_Results.Children;
            for i=1:numel(children)
                nd=children(i);
                if ~nd.Checked||isempty(nd.NodeData), continue; end
                idx=nd.NodeData;
                if idx<1||idx>numel(app.covResults), continue; end
                r=app.covResults(idx);
                for k=1:numel(r.thresholds)
                    allData(end+1,:)={r.label, r.type, r.thresholds(k), r.coverage(k)}; %#ok<AGROW>
                end
            end
            app.Cov_Tabel.ColumnName={'Run','Type','Threshold (dBi)','Coverage (%)'};
            app.Cov_Tabel.Data=allData;
        end % updateCovTable

    end % helper methods

    % =====================================================================
    % CALLBACKS
    % =====================================================================
    methods (Access = private)

        % -----------------------------------------------------------------
        function startupFcn(app)
            % Polar axes – cut plot
            app.Single_paxCut = polaraxes(app.Single_Grid_Polar);
            app.Single_paxCut.Layout.Row=[1 4];  app.Single_paxCut.Layout.Column=3;
            % Polar axes – fisheye (R2025a surf)
            app.Single_paxPattern = polaraxes(app.Single_gridCircular);
            app.Single_paxPattern.Layout.Row=[1 3];  app.Single_paxPattern.Layout.Column=2;
            app.Single_paxPattern.ThetaDir='clockwise';
            app.Single_paxPattern.ThetaZeroLocation='top';
            colormap(app.Single_paxPattern,'jet');
            % Defaults
            app.Single_Plot_Cmax.Value=10;  app.Single_Plot_Cmin.Value=-50;
            app.Single_Plot_Cstep.Value=5;
            app.Single_Spinner_Pt.Value=0;  app.Single_Spinner_R.Value=1;
            app.Single_Spinner_Rw.Value=6;
            app.Cov_Spinner_ThreshMin.Value=-10; app.Cov_Spinner_ThreshMax.Value=10;
            app.Cov_Spinner_Step.Value=1;        app.Cov_Spinner_ConeAng.Value=45;
            % Initialise covResults as empty struct array
            app.covResults=struct('label',{},'type',{},'thresholds',{}, ...
                'coverage',{},'color',{},'params',{});
            % Initialise query result labels
            app.Cov_Label_QueryResult1.Text='—';
            app.Cov_Label_QueryResult2.Text='—';
            % Hide data-dependent widgets
            app.Single_tabData.Visible='off';  app.Single_DropDown_output.Visible='off';
            app.Single_DropDown_step.Visible='off'; app.Single_Panel_Rect.Visible='off';
            app.Single_Export_Output.Visible='off'; app.Single_Export_UAN.Visible='off';
            app.Single_Button_Coverage.Visible='off'; app.Single_Switch.Visible='off';
            app.Single_statusBar.Text='Ready — load an antenna pattern file to begin.';
        end % startupFcn

        % -----------------------------------------------------------------
        function browseSingle(app, ~)
        % Load and process a pattern file.
        % Forces uigetfile if the path in the edit field is identical to
        % the currently loaded file (i.e., user wants to pick a new file).
            typed       = strtrim(app.Single_EditField_Path.Value);
            sameLoaded  = ~isempty(app.Single_filePath) && ...
                           strcmp(typed, app.Single_filePath);
            needBrowse  = sameLoaded || isempty(typed) || ~isfile(typed);

            if ~needBrowse
                % Use the typed path directly
                app.Single_filePath = typed;
                [app.Single_folderPath, app.Single_InputFileName, ext] = fileparts(typed);
                app.Single_fileName = [app.Single_InputFileName ext];
            else
                % Open file browser (start in last-used folder if available)
                startDir = pwd;
                if ~isempty(app.Single_folderPath) && isfolder(app.Single_folderPath)
                    startDir = app.Single_folderPath;
                end
                filt={ ...
                    '*.uan;*.fz;*.out;*.ffd;*.ffe;*.ffs', ...
                        'Pattern Files (*.uan,*.fz,*.out,*.ffd,*.ffe,*.ffs)'; ...
                    '*.csv;*.dat;*.txt','Gain Data (*.csv,*.dat,*.txt)'; ...
                    '*.*','All Files (*.*)'};
                [fname,fpath]=uigetfile(filt,'Select Antenna Pattern File',startDir);
                if isequal(fname,0), return; end
                app.Single_fileName   = fname;
                app.Single_folderPath = fpath;
                app.Single_filePath   = fullfile(fpath,fname);
                [~,app.Single_InputFileName]=fileparts(fname);
                app.Single_EditField_Path.Value=app.Single_filePath;
            end
            if ~isfile(app.Single_filePath)
                uialert(app.UIFigure,'Please select a valid pattern file.','No File');
                return;
            end
            dlg=uiprogressdlg(app.UIFigure,'Title','Loading', ...
                'Message','Reading file …','Indeterminate','on');
            cleanDlg=onCleanup(@() close(dlg));
            try
                app.rawTable  = app.loadPattern(app.Single_filePath);
                dlg.Message   = 'Normalising …';
                app.normTable = app.normalizePattern(app.rawTable);
                dlg.Message   = 'Processing …';
                app.procTable = app.processPattern(app.normTable, app.getParam());
                app.updateStep();
                app.buildOutputStep();
                app.detectAndApplyOrientation();
                app.updateMetadata();
                app.plotPattern();
                % Pre-populate Coverage file path field
                app.Cov_EditField_filePath.Value = app.Single_filePath;
                % Show controls
                app.Single_Panel_Rect.Visible='on';
                app.Single_Export_Output.Visible='on';
                app.Single_Button_Coverage.Visible='on';
                app.Single_Switch.Visible='on';
                if ~app.rawTable.Properties.UserData.isGainOnly
                    app.Single_Export_UAN.Visible='on';
                else
                    app.Single_Export_UAN.Visible='off';
                end
                app.Single_statusBar.Text=sprintf( ...
                    '<b>Loaded:</b> %s &nbsp;&nbsp; Peak = %.2f dBi &nbsp; Orient = %s', ...
                    app.Single_fileName, app.POB, app.detectedOrientation);
            catch ME
                app.Single_statusBar.Text= ...
                    ['<span style="color:red"><b>Error:</b> ' ME.message '</span>'];
                uialert(app.UIFigure,ME.message,'Load Error','Icon','error');
            end
        end % browseSingle

        % -----------------------------------------------------------------
        function onProcess(app, ~)
            if isempty(app.normTable)
                uialert(app.UIFigure,'Load a pattern file first.','No Data'); return;
            end
            dlg=uiprogressdlg(app.UIFigure,'Title','Processing', ...
                'Message','Applying parameters …','Indeterminate','on');
            cleanDlg=onCleanup(@() close(dlg));
            try
                app.procTable=app.processPattern(app.normTable,app.getParam());
                app.buildOutputStep();
                app.detectAndApplyOrientation();
                app.updateMetadata();
                app.plotPattern();
                app.Single_statusBar.Text=sprintf( ...
                    '<b>Re-processed:</b> %s &nbsp;&nbsp; Peak = %.2f dBi', ...
                    app.Single_fileName, app.POB);
            catch ME
                uialert(app.UIFigure,ME.message,'Process Error','Icon','error');
            end
        end % onProcess

        % -----------------------------------------------------------------
        function gotoCoverage(app, ~)
        % Switch to Coverage tab and prefill the file path.
            app.TabGroup.SelectedTab = app.Tab2_Coverage;
            if ~isempty(app.Single_filePath) && isfile(app.Single_filePath)
                app.Cov_EditField_filePath.Value = app.Single_filePath;
            end
        end % gotoCoverage

        % -----------------------------------------------------------------
        function exportResults(app, ~)
            if isempty(app.DataOut_step)
                uialert(app.UIFigure,'No results to export.','Export'); return;
            end
            def=fullfile(app.Single_folderPath,[app.Single_InputFileName '_results']);
            [fn,fp]=uiputfile({'*.csv','CSV';'*.txt','Tab-delimited'},'Export Results',def);
            if isequal(fn,0), return; end
            dlg=uiprogressdlg(app.UIFigure,'Title','Saving','Indeterminate','on');
            cleanDlg=onCleanup(@() close(dlg));
            try
                pth=fullfile(fp,fn);
                if endsWith(fn,'.txt'), writetable(app.DataOut_step,pth,'Delimiter','\t');
                else,                   writetable(app.DataOut_step,pth); end
            catch ME, uialert(app.UIFigure,ME.message,'Save Error','Icon','error'); end
        end % exportResults

        % -----------------------------------------------------------------
        function exportUAN(app, ~)
            if isempty(app.UAN_data)
                uialert(app.UIFigure,'No E-field data to export.','Export UAN'); return;
            end
            def=fullfile(app.Single_folderPath, ...
                sprintf('%s_%.5f',app.Single_InputFileName,app.maxE));
            [fn,fp]=uiputfile({'*.uan','UAN';'*.csv','CSV';'*.txt','TXT'}, ...
                'Save UAN File',def);
            if isequal(fn,0), return; end
            dlg=uiprogressdlg(app.UIFigure,'Title','Saving','Indeterminate','on');
            cleanDlg=onCleanup(@() close(dlg));
            try
                fullpath=fullfile(fp,fn);  [~,~,ext]=fileparts(fn);
                uan=app.UAN_data;
                dPhi=min(diff(unique(uan.Phi)));   if isempty(dPhi)||isnan(dPhi), dPhi=1; end
                dTh =min(diff(unique(uan.Theta))); if isempty(dTh) ||isnan(dTh),  dTh=1; end
                if strcmpi(ext,'.uan')
                    hdr=sprintf([ ...
                        'begin_<parameters>\nformat free\n', ...
                        'phi_min %g\nphi_max %g\nphi_inc %g\n', ...
                        'theta_min %g\ntheta_max %g\ntheta_inc %g\n', ...
                        'complex\nmag_phase\npattern gain\nmagnitude dB\n', ...
                        'maximum_gain %.5f\nphase degrees\ndirection degrees\n', ...
                        'polarization theta_phi\nend_<parameters>'], ...
                        min(uan.Phi),max(uan.Phi),dPhi, ...
                        min(uan.Theta),max(uan.Theta),dTh,app.maxE);
                    writelines(hdr,fullpath);
                    writetable(uan,fullpath,'Delimiter','\t', ...
                        'WriteVariableNames',false,'WriteMode','append','FileType','text');
                elseif strcmpi(ext,'.txt'), writetable(uan,fullpath,'Delimiter','\t');
                else, writetable(uan,fullpath);
                end
            catch ME, uialert(app.UIFigure,ME.message,'Save Error','Icon','error'); end
        end % exportUAN

        % -----------------------------------------------------------------
        function filterOutput(app, ~)
            if isempty(app.ColumnNames)||isempty(app.DataOut_step), return; end
            val=app.Single_DropDown_output.Value;
            if isnumeric(val)&&val>0&&val<=numel(app.Single_DropDown_output.UserData)
                app.Single_DropDown_output.UserData(val)= ...
                    ~app.Single_DropDown_output.UserData(val);
                app.Single_DropDown_output.Value=0;
            end
            checked=app.Single_DropDown_output.UserData;
            items=[{'— column filter —'},app.ColumnNames];
            for k=1:numel(app.ColumnNames)
                if checked(k), items{k+1}=['✓ ' app.ColumnNames{k}];
                else,          items{k+1}=['  ' app.ColumnNames{k}]; end
            end
            app.Single_DropDown_output.Items=items;
            removeStyle(app.Single_DropDown_output);
            onIdx=find([false,checked]);  offIdx=find([true,~checked]);
            if ~isempty(onIdx)
                addStyle(app.Single_DropDown_output, ...
                    uistyle('FontWeight','bold','FontColor','black', ...
                            'BackgroundColor',[0.80 1 0.80]),'Item',onIdx);
            end
            if ~isempty(offIdx)
                addStyle(app.Single_DropDown_output, ...
                    uistyle('FontWeight','normal','FontColor',[0.5 0.5 0.5], ...
                            'BackgroundColor',[0.92 0.92 0.92]),'Item',offIdx);
            end
            selC=['Theta','Phi',app.ColumnNames(checked)];
            selC=selC(ismember(selC,app.DataOut_step.Properties.VariableNames));
            app.Single_Table_DataOut.Data=app.DataOut_step(:,selC);
        end % filterOutput

        % -----------------------------------------------------------------
        function stepChanged(app, ~)
            app.buildOutputStep();  app.plotPattern();
        end

        % -----------------------------------------------------------------
        function rangeSliderChanged(app, ~)
            lo=app.Single_Plot_Cmin.Value;  hi=app.Single_Plot_Cmax.Value;
            for sl=[app.Range_Ctr,app.Range_Cir,app.Range_Sph,app.Range_3D]
                v=sl.Value;
                if abs(v(1)-lo)>0.1||abs(v(2)-hi)>0.1, lo=v(1);hi=v(2); break; end
            end
            app.Single_Plot_Cmin.Value=lo;  app.Single_Plot_Cmax.Value=hi;
            app.syncRangeSliders(lo,hi);  app.plotPattern();
        end

        function colorbarSpinnerChanged(app, ~)
            lo=app.Single_Plot_Cmin.Value;  hi=app.Single_Plot_Cmax.Value;
            if lo>=hi, return; end
            app.syncRangeSliders(lo,hi);  app.plotPattern();
        end

        function cutRangeChanged(app, ~)
            app.Range_Cut_Min.Value=app.Range_Cut.Value(1);
            app.Range_Cut_Max.Value=app.Range_Cut.Value(2);
            app.getCut();
        end

        function cutSpinnerChanged(app, ~)
            lo=app.Range_Cut_Min.Value;  hi=app.Range_Cut_Max.Value;
            if lo<hi
                app.Range_Cut.Limits=[lo-10,hi+10];
                app.Range_Cut.Value=[lo,hi];
            end
            app.getCut();
        end

        function componentChanged(app, ~)
            if ~isempty(app.DataOut_all), app.plotPattern(); end
        end

        function cutTypeChanged(app, ~)
            app.updateCutControls();  app.getCut();
        end

        function cutValueChanged(app, ~)
            app.getCut();
        end

        function checkBoxChanged(app, ~)
            app.getCut();
        end

        function hpbwToggled(app, ~)
            if ~app.Button_HPBW.Value, app.Label_HPBW.Text=''; end
            app.getCut();
        end

        % -----------------------------------------------------------------
        function switchChanged(app, ~)
        % E/H plane switch – uses orientation-aware phi values.
            if isempty(app.DataOut_all), return; end
            app.Single_DropDown_cutType.Value='Phi Cut';
            [ePhi,hPhi]=app.getEHPlanePhi();
            target=ePhi;
            if strcmp(app.Single_Switch.Value,'H-Plane'), target=hPhi; end
            phVals=unique(app.DataOut_all.Phi);
            [~,idx]=min(abs(phVals-target));
            app.Single_DropDown_cutValue.Value=phVals(idx);
            app.updateCutControls();
            app.getCut();
        end % switchChanged

        % -----------------------------------------------------------------
        function exportCut(app, ~)
            if isempty(app.DataOut_all), return; end
            T=app.DataOut_all;  cutType=app.Single_DropDown_cutType.Value;
            cutVal=app.Single_DropDown_cutValue.Value;
            if strcmp(cutType,'Phi Cut')
                pV=unique(T.Phi);  [~,ix]=min(abs(pV-cutVal));  cA=pV(ix);
                cutData=T(abs(T.Phi-cA)<1e-6,:);
                def=sprintf('%s_PhiCut_%g',app.Single_InputFileName,cA);
            else
                tV=unique(T.Theta);  [~,ix]=min(abs(tV-cutVal));  cA=tV(ix);
                cutData=T(abs(T.Theta-cA)<1e-6,:);
                def=sprintf('%s_ThetaCut_%g',app.Single_InputFileName,cA);
            end
            [fn,fp]=uiputfile({'*.csv','CSV';'*.txt','Tab-delimited'}, ...
                'Export Cut',fullfile(app.Single_folderPath,def));
            if isequal(fn,0), return; end
            try
                pth=fullfile(fp,fn);
                if endsWith(fn,'.txt'), writetable(cutData,pth,'Delimiter','\t');
                else, writetable(cutData,pth); end
            catch ME, uialert(app.UIFigure,ME.message,'Save Error','Icon','error'); end
        end % exportCut

        % ── Coverage tab callbacks ────────────────────────────────────────

        function covLoad(app, ~)
            if ~isempty(app.Single_filePath)&&isfile(app.Single_filePath)
                app.Cov_EditField_filePath.Value=app.Single_filePath;
            else
                filt={'*.uan;*.fz;*.out;*.ffd;*.ffe;*.ffs','Pattern Files'; ...
                      '*.csv;*.dat;*.txt','Gain Data'};
                [fn,fp]=uigetfile(filt,'Select Antenna Pattern');
                if isequal(fn,0), return; end
                app.Cov_EditField_filePath.Value=fullfile(fp,fn);
                app.Single_EditField_Path.Value=app.Cov_EditField_filePath.Value;
                app.browseSingle([]);
            end
        end % covLoad

        function covProcess(app, ~)
            if isempty(app.DataOut_all)
                fp=strtrim(app.Cov_EditField_filePath.Value);
                if isfile(fp)
                    app.Single_EditField_Path.Value=fp;
                    app.browseSingle([]);
                else
                    uialert(app.UIFigure,'Load a pattern file first.','No Data'); return;
                end
            end
            app.computeCoverage();
        end % covProcess

        function covClear(app, ~)
            delete(app.Cov_Tree_Results.Children);
            app.covResults=struct('label',{},'type',{},'thresholds',{}, ...
                'coverage',{},'color',{},'params',{});
            cla(app.Cov_Axes);
            app.Cov_Tabel.ColumnName={'Threshold (dBi)','Coverage (%)'};
            app.Cov_Tabel.Data={};
            app.Cov_Label_QueryResult1.Text='—';
            app.Cov_Label_QueryResult2.Text='—';
        end % covClear

        function covExport(app, ~)
            if isempty(app.Cov_Tabel.Data), return; end
            [fn,fp]=uiputfile({'*.csv','CSV'},'Export Coverage');
            if isequal(fn,0), return; end
            cn=app.Cov_Tabel.ColumnName;
            T=cell2table(app.Cov_Tabel.Data, ...
                'VariableNames',matlab.lang.makeValidName(cn));
            writetable(T,fullfile(fp,fn));
        end % covExport

        function covTypeChanged(app, ~)
        % Enable cone controls only in conical mode.
            en='off';  if app.Cov_ButtonGroup_Btn_Conical.Value, en='on'; end
            for w=[app.ConeSpinnerLabel,    app.Cov_Spinner_ConeTH, ...
                   app.ConeLabel,           app.Cov_Spinner_ConePH, ...
                   app.ConeAngleSpinnerLabel,app.Cov_Spinner_ConeAng]
                w.Enable=en;
            end
        end % covTypeChanged

        function covTreeCheckedChanged(app, ~)
        % Redraw when user checks/unchecks a coverage run node.
            app.updateCovPlot();
        end % covTreeCheckedChanged

        function orientationChanged(app, ~)
        % When user changes the orientation dropdown, update cone spinners.
            orient=app.Cov_DropDown_Orientation.Value;
            if ~strcmp(orient,'Custom')
                [th0,ph0]=app.orientationToAngles(orient);
                app.Cov_Spinner_ConeTH.Value=th0;
                app.Cov_Spinner_ConePH.Value=ph0;
            end
        end % orientationChanged

        function covQueryAtThreshold(app, ~)
        % Report coverage (%) for a user-specified threshold across active runs.
            thresh=app.Cov_Spinner_QueryThresh.Value;
            parts={};
            children=app.Cov_Tree_Results.Children;
            for i=1:numel(children)
                nd=children(i);
                if ~nd.Checked||isempty(nd.NodeData), continue; end
                idx=nd.NodeData;
                if idx<1||idx>numel(app.covResults), continue; end
                r=app.covResults(idx);
                pct=interp1(r.thresholds,r.coverage,thresh,'linear','extrap');
                pct=max(0,min(100,pct));
                parts{end+1}=sprintf('Run %d: %.1f %%',idx,pct); %#ok<AGROW>
            end
            if isempty(parts)
                app.Cov_Label_QueryResult1.Text='No active runs';
            else
                app.Cov_Label_QueryResult1.Text=strjoin(parts,'   |   ');
            end
        end % covQueryAtThreshold

        function covQueryAtCoverage(app, ~)
        % Report threshold (dBi) corresponding to a user-specified coverage %.
            covTarget=app.Cov_Spinner_QueryCovPct.Value;
            parts={};
            children=app.Cov_Tree_Results.Children;
            for i=1:numel(children)
                nd=children(i);
                if ~nd.Checked||isempty(nd.NodeData), continue; end
                idx=nd.NodeData;
                if idx<1||idx>numel(app.covResults), continue; end
                r=app.covResults(idx);
                [~,sortOrd]=sort(r.thresholds);
                thS=r.thresholds(sortOrd);  covS=r.coverage(sortOrd);
                [covU,uIdx]=unique(covS,'last');  thU=thS(uIdx);
                thResult=interp1(covU,thU,covTarget,'linear','extrap');
                parts{end+1}=sprintf('Run %d: %.1f dBi',idx,thResult); %#ok<AGROW>
            end
            if isempty(parts)
                app.Cov_Label_QueryResult2.Text='No active runs';
            else
                app.Cov_Label_QueryResult2.Text=strjoin(parts,'   |   ');
            end
        end % covQueryAtCoverage

    end % callbacks

    % =====================================================================
    % COMPONENT INITIALISATION
    % =====================================================================
    methods (Access = private)
        function createComponents(app)

            app.UIFigure=uifigure('Visible','off');
            app.UIFigure.Position=[50 50 1400 820];
            app.UIFigure.Name='APAT — Antenna Pattern Analysis Tool  v1';
            app.UIFigure.WindowState='maximized';

            app.GridLayout=uigridlayout(app.UIFigure,[1 1]);
            app.GridLayout.ColumnWidth={'1x'};  app.GridLayout.RowHeight={'1x'};

            app.TabGroup=uitabgroup(app.GridLayout);
            app.TabGroup.Layout.Row=1;  app.TabGroup.Layout.Column=1;

            % =============================================================
            % TAB 1  —  Process Pattern
            % =============================================================
            app.Tab1_Single=uitab(app.TabGroup,'Title','Process Pattern');
            app.Single_Grid=uigridlayout(app.Tab1_Single);
            app.Single_Grid.ColumnWidth=repmat({'1x'},1,14);
            app.Single_Grid.RowHeight={'fit','fit','fit','1x','1x','fit','1x','1x','fit'};
            app.Single_Grid.Padding=[4 4 4 4];  app.Single_Grid.RowSpacing=4;

            % ── Inputs panel ──────────────────────────────────────────────
            app.Single_panelParam=uipanel(app.Single_Grid,'Title','Inputs & Parameters');
            app.Single_panelParam.Layout.Row=[1 3]; app.Single_panelParam.Layout.Column=[1 14];
            app.Single_gridPanel_Param=uigridlayout(app.Single_panelParam);
            app.Single_gridPanel_Param.ColumnWidth=repmat({'1x'},1,14);
            app.Single_gridPanel_Param.RowHeight={'1x','1x','1x'};

            % Row 1
            app.InputPatternLabel=uilabel(app.Single_gridPanel_Param, ...
                'Text','Input Pattern:','HorizontalAlignment','right');
            app.InputPatternLabel.Layout.Row=1; app.InputPatternLabel.Layout.Column=1;
            app.Single_EditField_Path=uieditfield(app.Single_gridPanel_Param,'text', ...
                'Placeholder','Enter path or click Load …');
            app.Single_EditField_Path.Layout.Row=1; app.Single_EditField_Path.Layout.Column=[2 8];
            app.Single_Button_Load=uibutton(app.Single_gridPanel_Param,'push', ...
                'Text','Load Pattern','FontWeight','bold','FontSize',13, ...
                'ButtonPushedFcn',createCallbackFcn(app,@browseSingle,true));
            app.Single_Button_Load.Layout.Row=1; app.Single_Button_Load.Layout.Column=[9 10];
            app.Single_Button_Process=uibutton(app.Single_gridPanel_Param,'push', ...
                'Text','Re-Process', ...
                'ButtonPushedFcn',createCallbackFcn(app,@onProcess,true));
            app.Single_Button_Process.Layout.Row=1; app.Single_Button_Process.Layout.Column=[11 12];
            app.Single_Export_Output=uibutton(app.Single_gridPanel_Param,'push', ...
                'Text','Export Results','FontWeight','bold','Visible','off', ...
                'ButtonPushedFcn',createCallbackFcn(app,@exportResults,true));
            app.Single_Export_Output.Layout.Row=1; app.Single_Export_Output.Layout.Column=[13 14];

            % Row 2
            app.Single_DropDown_step=uidropdown(app.Single_gridPanel_Param, ...
                'Items',{'STEP'},'Value','STEP','Enable','off','Visible','off', ...
                'ValueChangedFcn',createCallbackFcn(app,@stepChanged,true));
            app.Single_DropDown_step.Layout.Row=2; app.Single_DropDown_step.Layout.Column=[9 10];
            app.Single_Export_UAN=uibutton(app.Single_gridPanel_Param,'push', ...
                'Text','Export UAN','FontWeight','bold','Visible','off', ...
                'ButtonPushedFcn',createCallbackFcn(app,@exportUAN,true));
            app.Single_Export_UAN.Layout.Row=2; app.Single_Export_UAN.Layout.Column=[13 14];

            % Row 3 — RF parameters
            app.RxPolLabel=uilabel(app.Single_gridPanel_Param, ...
                'Text','Rx Pol:','HorizontalAlignment','right');
            app.RxPolLabel.Layout.Row=3; app.RxPolLabel.Layout.Column=1;
            app.Single_DropDown_RxPol=uidropdown(app.Single_gridPanel_Param, ...
                'Items',{'Auto','RHCP','LHCP'},'Value','Auto');
            app.Single_DropDown_RxPol.Layout.Row=3; app.Single_DropDown_RxPol.Layout.Column=2;
            app.IncidentWaveARRwPLFLabel=uilabel(app.Single_gridPanel_Param, ...
                'Text','Rx AR (dB):','HorizontalAlignment','right');
            app.IncidentWaveARRwPLFLabel.Layout.Row=3; app.IncidentWaveARRwPLFLabel.Layout.Column=3;
            app.Single_Spinner_Rw=uispinner(app.Single_gridPanel_Param,'Value',6);
            app.Single_Spinner_Rw.Layout.Row=3; app.Single_Spinner_Rw.Layout.Column=4;
            app.LossindBLabel=uilabel(app.Single_gridPanel_Param, ...
                'Text','Loss (dB):','HorizontalAlignment','right');
            app.LossindBLabel.Layout.Row=3; app.LossindBLabel.Layout.Column=5;
            app.Single_Spinner_Loss=uispinner(app.Single_gridPanel_Param,'Step',0.1,'Value',0);
            app.Single_Spinner_Loss.Layout.Row=3; app.Single_Spinner_Loss.Layout.Column=6;
            app.TransmitPowerLabel=uilabel(app.Single_gridPanel_Param, ...
                'Text','Tx Power:','HorizontalAlignment','right');
            app.TransmitPowerLabel.Layout.Row=3; app.TransmitPowerLabel.Layout.Column=7;
            app.Single_Spinner_Pt=uispinner(app.Single_gridPanel_Param,'Value',0);
            app.Single_Spinner_Pt.Layout.Row=3; app.Single_Spinner_Pt.Layout.Column=8;
            app.Single_DropDown_Pt=uidropdown(app.Single_gridPanel_Param, ...
                'Items',{'dBW','dBm','Watts'},'Value','dBW');
            app.Single_DropDown_Pt.Layout.Row=3; app.Single_DropDown_Pt.Layout.Column=9;
            app.DistanceLabel=uilabel(app.Single_gridPanel_Param, ...
                'Text','Range:','HorizontalAlignment','right');
            app.DistanceLabel.Layout.Row=3; app.DistanceLabel.Layout.Column=10;
            app.Single_Spinner_R=uispinner(app.Single_gridPanel_Param,'Value',1,'Limits',[0 Inf]);
            app.Single_Spinner_R.Layout.Row=3; app.Single_Spinner_R.Layout.Column=11;
            app.Single_DropDown_R=uidropdown(app.Single_gridPanel_Param, ...
                'Items',{'m','km'},'Value','m');
            app.Single_DropDown_R.Layout.Row=3; app.Single_DropDown_R.Layout.Column=12;
            app.Single_Button_Coverage=uibutton(app.Single_gridPanel_Param,'push', ...
                'Text','Go to Coverage ▶','FontWeight','bold','Visible','off', ...
                'ButtonPushedFcn',createCallbackFcn(app,@gotoCoverage,true));
            app.Single_Button_Coverage.Layout.Row=3; app.Single_Button_Coverage.Layout.Column=[13 14];

            % ── Full Pattern Panel ─────────────────────────────────────────
            app.Single_Panel_fullPattern=uipanel(app.Single_Grid, ...
                'Title','Full Antenna Pattern','TitlePosition','centertop', ...
                'FontWeight','bold','BackgroundColor',[0.94 0.94 0.94]);
            app.Single_Panel_fullPattern.Layout.Row=[4 6];
            app.Single_Panel_fullPattern.Layout.Column=[1 7];
            app.Single_gridPanel_full=uigridlayout(app.Single_Panel_fullPattern,[1 1]);
            app.Single_gridPanel_full.ColumnWidth={'1x'};
            app.Single_gridPanel_full.RowHeight={'1x'};
            app.Single_tabPlots=uitabgroup(app.Single_gridPanel_full);
            app.Single_tabPlots.Layout.Row=1; app.Single_tabPlots.Layout.Column=1;

            % · Contour ·
            app.Single_tabContour=uitab(app.Single_tabPlots,'Title','Contour Plot');
            app.Single_gridContour=uigridlayout(app.Single_tabContour);
            app.Single_gridContour.ColumnWidth={'fit','1x'};
            app.Single_gridContour.RowHeight={'fit','1x','fit'};
            app.Single_Axes_Ctr=uiaxes(app.Single_gridContour);
            app.Single_Axes_Ctr.Layout.Row=[1 3]; app.Single_Axes_Ctr.Layout.Column=2;
            title(app.Single_Axes_Ctr,'Antenna Pattern');
            xlabel(app.Single_Axes_Ctr,'Phi (°)'); ylabel(app.Single_Axes_Ctr,'Theta (°)');
            app.Single_Axes_Ctr.XLim=[0 360]; app.Single_Axes_Ctr.YLim=[0 180];
            app.Single_Axes_Ctr.YDir='reverse'; app.Single_Axes_Ctr.Box='on';
            app.Single_Axes_Ctr.XTick=0:30:360; app.Single_Axes_Ctr.YTick=0:15:180;
            colormap(app.Single_Axes_Ctr,'jet');
            app.Range_Ctr_Max=uispinner(app.Single_gridContour,'Step',5,'Value',10, ...
                'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_Ctr_Max.Layout.Row=1; app.Range_Ctr_Max.Layout.Column=1;
            app.Range_Ctr=uislider(app.Single_gridContour,'range', ...
                'Orientation','vertical','Limits',[-80 30],'Value',[-50 10], ...
                'ValueChangedFcn',createCallbackFcn(app,@rangeSliderChanged,true));
            app.Range_Ctr.Layout.Row=2; app.Range_Ctr.Layout.Column=1;
            app.Range_Ctr_Min=uispinner(app.Single_gridContour,'Step',5,'Value',-50, ...
                'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_Ctr_Min.Layout.Row=3; app.Range_Ctr_Min.Layout.Column=1;

            % · Circular/Fisheye (polaraxes created in startupFcn) ·
            app.Single_tabCircular=uitab(app.Single_tabPlots,'Title','Circular (Fisheye)');
            app.Single_gridCircular=uigridlayout(app.Single_tabCircular);
            app.Single_gridCircular.ColumnWidth={'fit','1x'};
            app.Single_gridCircular.RowHeight={'fit','1x','fit'};
            app.Range_Cir_Max=uispinner(app.Single_gridCircular,'Step',5,'Value',10, ...
                'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_Cir_Max.Layout.Row=1; app.Range_Cir_Max.Layout.Column=1;
            app.Range_Cir=uislider(app.Single_gridCircular,'range', ...
                'Orientation','vertical','Limits',[-80 30],'Value',[-50 10], ...
                'ValueChangedFcn',createCallbackFcn(app,@rangeSliderChanged,true));
            app.Range_Cir.Layout.Row=2; app.Range_Cir.Layout.Column=1;
            app.Range_Cir_Min=uispinner(app.Single_gridCircular,'Step',5,'Value',-50, ...
                'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_Cir_Min.Layout.Row=3; app.Range_Cir_Min.Layout.Column=1;

            % · Spherical 3D ·
            app.Single_tabSpherical=uitab(app.Single_tabPlots,'Title','Spherical 3D');
            app.Single_gridSpherical=uigridlayout(app.Single_tabSpherical);
            app.Single_gridSpherical.ColumnWidth={'fit','1x'};
            app.Single_gridSpherical.RowHeight={'fit','1x','fit'};
            app.Axes3_3=uiaxes(app.Single_gridSpherical);
            app.Axes3_3.Layout.Row=[1 3]; app.Axes3_3.Layout.Column=2;
            title(app.Axes3_3,'3D Spherical'); colormap(app.Axes3_3,'jet');
            app.Range_Sph_Max=uispinner(app.Single_gridSpherical,'Step',5,'Value',10, ...
                'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_Sph_Max.Layout.Row=1; app.Range_Sph_Max.Layout.Column=1;
            app.Range_Sph=uislider(app.Single_gridSpherical,'range', ...
                'Orientation','vertical','Limits',[-80 30],'Value',[-50 10], ...
                'ValueChangedFcn',createCallbackFcn(app,@rangeSliderChanged,true));
            app.Range_Sph.Layout.Row=2; app.Range_Sph.Layout.Column=1;
            app.Range_Sph_Min=uispinner(app.Single_gridSpherical,'Step',5,'Value',-50, ...
                'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_Sph_Min.Layout.Row=3; app.Range_Sph_Min.Layout.Column=1;

            % · 3D Surface ·
            app.Single_tab3D=uitab(app.Single_tabPlots,'Title','3D Surface');
            app.Single_grid3D=uigridlayout(app.Single_tab3D);
            app.Single_grid3D.ColumnWidth={'fit','1x'};
            app.Single_grid3D.RowHeight={'fit','1x','fit'};
            app.Axes3_4=uiaxes(app.Single_grid3D);
            app.Axes3_4.Layout.Row=[1 3]; app.Axes3_4.Layout.Column=2;
            title(app.Axes3_4,'3D Surface'); colormap(app.Axes3_4,'jet');
            app.Range_3D_Max=uispinner(app.Single_grid3D,'Step',5,'Value',10, ...
                'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_3D_Max.Layout.Row=1; app.Range_3D_Max.Layout.Column=1;
            app.Range_3D=uislider(app.Single_grid3D,'range', ...
                'Orientation','vertical','Limits',[-80 30],'Value',[-50 10], ...
                'ValueChangedFcn',createCallbackFcn(app,@rangeSliderChanged,true));
            app.Range_3D.Layout.Row=2; app.Range_3D.Layout.Column=1;
            app.Range_3D_Min=uispinner(app.Single_grid3D,'Step',5,'Value',-50, ...
                'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_3D_Min.Layout.Row=3; app.Range_3D_Min.Layout.Column=1;

            % ── Plot Control Panel ─────────────────────────────────────────
            app.Single_Panel_plotControl=uipanel(app.Single_Grid,'Title','Plot Control');
            app.Single_Panel_plotControl.Layout.Row=[4 5];
            app.Single_Panel_plotControl.Layout.Column=[8 9];
            app.Single_gridPanel_Ctrl=uigridlayout(app.Single_Panel_plotControl);
            app.Single_gridPanel_Ctrl.ColumnWidth={'fit','1x'};
            app.Single_gridPanel_Ctrl.RowHeight=repmat({'1x'},1,6);

            app.ComponentLabel=uilabel(app.Single_gridPanel_Ctrl, ...
                'Text','Component','HorizontalAlignment','right');
            app.ComponentLabel.Layout.Row=1; app.ComponentLabel.Layout.Column=1;
            app.Single_DropDown_Component=uidropdown(app.Single_gridPanel_Ctrl, ...
                'Items',{'Total Gain','Etheta Gain','Ephi  Gain','RHCP Gain', ...
                         'LHCP  Gain','Axial Ratio','Polarized Gain'},'Value','Total Gain', ...
                'ValueChangedFcn',createCallbackFcn(app,@componentChanged,true));
            app.Single_DropDown_Component.Layout.Row=1; app.Single_DropDown_Component.Layout.Column=2;

            app.CuttypeDropDownLabel=uilabel(app.Single_gridPanel_Ctrl, ...
                'Text','Cut type','HorizontalAlignment','right');
            app.CuttypeDropDownLabel.Layout.Row=2; app.CuttypeDropDownLabel.Layout.Column=1;
            app.Single_DropDown_cutType=uidropdown(app.Single_gridPanel_Ctrl, ...
                'Items',{'Phi Cut','Theta Cut'},'Value','Phi Cut', ...
                'ValueChangedFcn',createCallbackFcn(app,@cutTypeChanged,true));
            app.Single_DropDown_cutType.Layout.Row=2; app.Single_DropDown_cutType.Layout.Column=2;

            app.CutvalueSpinnerLabel=uilabel(app.Single_gridPanel_Ctrl, ...
                'Text','Cut value','HorizontalAlignment','right');
            app.CutvalueSpinnerLabel.Layout.Row=3; app.CutvalueSpinnerLabel.Layout.Column=1;
            app.Single_DropDown_cutValue=uispinner(app.Single_gridPanel_Ctrl, ...
                'ValueChangedFcn',createCallbackFcn(app,@cutValueChanged,true));
            app.Single_DropDown_cutValue.Layout.Row=3; app.Single_DropDown_cutValue.Layout.Column=2;

            app.ColorbarmaxLabel=uilabel(app.Single_gridPanel_Ctrl, ...
                'Text','CB max (dBi)','HorizontalAlignment','right');
            app.ColorbarmaxLabel.Layout.Row=4; app.ColorbarmaxLabel.Layout.Column=1;
            app.Single_Plot_Cmax=uispinner(app.Single_gridPanel_Ctrl,'Step',5,'Value',10, ...
                'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Single_Plot_Cmax.Layout.Row=4; app.Single_Plot_Cmax.Layout.Column=2;

            app.ColorbarminLabel=uilabel(app.Single_gridPanel_Ctrl, ...
                'Text','CB min (dBi)','HorizontalAlignment','right');
            app.ColorbarminLabel.Layout.Row=5; app.ColorbarminLabel.Layout.Column=1;
            app.Single_Plot_Cmin=uispinner(app.Single_gridPanel_Ctrl,'Step',5,'Value',-50, ...
                'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Single_Plot_Cmin.Layout.Row=5; app.Single_Plot_Cmin.Layout.Column=2;

            app.ColorbarstepLabel=uilabel(app.Single_gridPanel_Ctrl, ...
                'Text','CB step','HorizontalAlignment','right');
            app.ColorbarstepLabel.Layout.Row=6; app.ColorbarstepLabel.Layout.Column=1;
            app.Single_Plot_Cstep=uispinner(app.Single_gridPanel_Ctrl, ...
                'Step',1,'Value',5,'Limits',[1 50], ...
                'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Single_Plot_Cstep.Layout.Row=6; app.Single_Plot_Cstep.Layout.Column=2;

            % ── Cut Pattern Panel ──────────────────────────────────────────
            app.Single_Panel_Rect=uipanel(app.Single_Grid, ...
                'Title','Antenna Pattern Cut','TitlePosition','centertop', ...
                'FontWeight','bold','BackgroundColor',[0.94 0.94 0.94],'Visible','off');
            app.Single_Panel_Rect.Layout.Row=[4 6];
            app.Single_Panel_Rect.Layout.Column=[10 14];
            app.Single_gridPanel_Cut=uigridlayout(app.Single_Panel_Rect,[1 1]);
            app.Single_gridPanel_Cut.ColumnWidth={'1x'};
            app.Single_gridPanel_Cut.RowHeight={'1x'};
            app.Single_tabCut=uitabgroup(app.Single_gridPanel_Cut);
            app.Single_tabCut.Layout.Row=1; app.Single_tabCut.Layout.Column=1;

            % · Polar cut ·
            app.Single_tabPolarPlot=uitab(app.Single_tabCut,'Title','Polar Cut');
            app.Single_Grid_Polar=uigridlayout(app.Single_tabPolarPlot);
            app.Single_Grid_Polar.ColumnWidth={'fit','0.18x','1x','fit'};
            app.Single_Grid_Polar.RowHeight={'fit','0.25x','1x','fit'};
            app.Range_Cut_Max=uispinner(app.Single_Grid_Polar,'Step',5,'Value',10, ...
                'ValueChangedFcn',createCallbackFcn(app,@cutSpinnerChanged,true));
            app.Range_Cut_Max.Layout.Row=1; app.Range_Cut_Max.Layout.Column=1;
            app.Range_Cut=uislider(app.Single_Grid_Polar,'range', ...
                'Orientation','vertical','Limits',[-80 30],'Value',[-50 10], ...
                'ValueChangedFcn',createCallbackFcn(app,@cutRangeChanged,true));
            app.Range_Cut.Layout.Row=[2 3]; app.Range_Cut.Layout.Column=1;
            app.Range_Cut_Min=uispinner(app.Single_Grid_Polar,'Step',5,'Value',-50, ...
                'ValueChangedFcn',createCallbackFcn(app,@cutSpinnerChanged,true));
            app.Range_Cut_Min.Layout.Row=4; app.Range_Cut_Min.Layout.Column=1;
            app.Button_HPBW=uibutton(app.Single_Grid_Polar,'state', ...
                'Text','HPBW','FontWeight','bold', ...
                'ValueChangedFcn',createCallbackFcn(app,@hpbwToggled,true));
            app.Button_HPBW.Layout.Row=1; app.Button_HPBW.Layout.Column=4;
            app.Label_HPBW=uilabel(app.Single_Grid_Polar,'Text','', ...
                'HorizontalAlignment','center','FontWeight','bold');
            app.Label_HPBW.Layout.Row=2; app.Label_HPBW.Layout.Column=4;
            app.Single_gridEcut=uigridlayout(app.Single_Grid_Polar);
            app.Single_gridEcut.ColumnWidth={'1x'};
            app.Single_gridEcut.RowHeight={'1x','1x','1x'};
            app.Single_gridEcut.Layout.Row=3; app.Single_gridEcut.Layout.Column=4;
            app.CheckBox_Et=uicheckbox(app.Single_gridEcut,'Text','E_{Total}','Value',true, ...
                'ValueChangedFcn',createCallbackFcn(app,@checkBoxChanged,true));
            app.CheckBox_Et.Layout.Row=1; app.CheckBox_Et.Layout.Column=1;
            app.CheckBox_Er=uicheckbox(app.Single_gridEcut,'Text','E_{RCP}','Value',true, ...
                'ValueChangedFcn',createCallbackFcn(app,@checkBoxChanged,true));
            app.CheckBox_Er.Layout.Row=2; app.CheckBox_Er.Layout.Column=1;
            app.CheckBox_El=uicheckbox(app.Single_gridEcut,'Text','E_{LCP}','Value',true, ...
                'ValueChangedFcn',createCallbackFcn(app,@checkBoxChanged,true));
            app.CheckBox_El.Layout.Row=3; app.CheckBox_El.Layout.Column=1;
            app.Button_ExportCut=uibutton(app.Single_Grid_Polar,'push', ...
                'Text','Export Cut','FontWeight','bold', ...
                'ButtonPushedFcn',createCallbackFcn(app,@exportCut,true));
            app.Button_ExportCut.Layout.Row=4; app.Button_ExportCut.Layout.Column=4;

            % · Rectangular cut ·
            app.Single_tabRectPlot=uitab(app.Single_tabCut,'Title','Rectangular Cut');
            app.Single_gridRect=uigridlayout(app.Single_tabRectPlot,[2 1]);
            app.Single_gridRect.ColumnWidth={'1x'};
            app.Single_gridRect.RowHeight={'1x','fit'};
            app.Single_AxesRect=uiaxes(app.Single_gridRect);
            app.Single_AxesRect.Layout.Row=1; app.Single_AxesRect.Layout.Column=1;
            xlabel(app.Single_AxesRect,'Angle (°)');
            ylabel(app.Single_AxesRect,'Magnitude (dBi)');
            app.Single_AxesRect.Box='on';  app.Single_AxesRect.Visible='off';
            app.Single_Switch=uiswitch(app.Single_gridRect,'slider', ...
                'Items',{'E-Plane','H-Plane'},'Value','E-Plane','Visible','off', ...
                'ValueChangedFcn',createCallbackFcn(app,@switchChanged,true));
            app.Single_Switch.Layout.Row=2; app.Single_Switch.Layout.Column=1;

            % ── Output filter dropdown ─────────────────────────────────────
            app.Single_DropDown_output=uidropdown(app.Single_Grid, ...
                'Items',{'— column filter —'},'Value','— column filter —', ...
                'Visible','off', ...
                'ValueChangedFcn',createCallbackFcn(app,@filterOutput,true));
            app.Single_DropDown_output.Layout.Row=6;
            app.Single_DropDown_output.Layout.Column=[8 11];

            % ── Data tables ────────────────────────────────────────────────
            app.Single_tabData=uitabgroup(app.Single_Grid,'Visible','off');
            app.Single_tabData.Layout.Row=[7 8]; app.Single_tabData.Layout.Column=[1 14];
            app.Single_tabDataOut=uitab(app.Single_tabData,'Title','Results');
            app.Single_gridDataOut=uigridlayout(app.Single_tabDataOut,[1 1]);
            app.Single_Table_DataOut=uitable(app.Single_gridDataOut, ...
                'ColumnRearrangeable','on','ColumnSortable',true,'RowName',{},'Visible','off');
            app.Single_Table_DataOut.Layout.Row=1; app.Single_Table_DataOut.Layout.Column=1;

            app.Single_tabDataIn=uitab(app.Single_tabData,'Title','Input (UAN)');
            app.Single_gridDataIn=uigridlayout(app.Single_tabDataIn,[1 1]);
            % NOTE: 'Enable' is NOT set to 'off' so user can read and scroll content
            app.Single_Table_DataIn=uitable(app.Single_gridDataIn, ...
                'ColumnName',{'Theta','Phi','E_TH_DB','E_PH_DB','E_TH_DG','E_PH_DG'}, ...
                'ColumnRearrangeable','on','ColumnSortable',true, ...
                'ColumnEditable',false,'RowName',{},'Visible','off');
            app.Single_Table_DataIn.Layout.Row=1; app.Single_Table_DataIn.Layout.Column=1;

            app.MetadataTab=uitab(app.Single_tabData,'Title','Metadata');
            app.Single_gridMetadata=uigridlayout(app.MetadataTab,[1 1]);
            app.Single_Table_metadata=uitable(app.Single_gridMetadata, ...
                'ColumnName',{'Parameter','Value'},'RowName',{}, ...
                'ColumnEditable',false,'ColumnWidth',{'1x','2x'});
            app.Single_Table_metadata.Layout.Row=1; app.Single_Table_metadata.Layout.Column=1;

            % ── Status bar ─────────────────────────────────────────────────
            app.Single_statusBar=uilabel(app.Single_Grid,'Text','Ready', ...
                'Interpreter','html','FontSize',11,'FontWeight','bold', ...
                'BackgroundColor',[0.96 0.96 0.96]);
            app.Single_statusBar.Layout.Row=9; app.Single_statusBar.Layout.Column=[1 14];

            % =============================================================
            % TAB 2  —  Compute Coverage
            % =============================================================
            app.Tab2_Coverage=uitab(app.TabGroup,'Title','Compute Coverage');
            app.Cov_Grid=uigridlayout(app.Tab2_Coverage);
            app.Cov_Grid.ColumnWidth={'0.55x','1x','0.65x'};
            app.Cov_Grid.RowHeight={'fit','1x'};

            % ── Coverage parameters panel (4 rows) ─────────────────────────
            app.Cov_Panel_Param=uipanel(app.Cov_Grid,'Title','Inputs & Parameters');
            app.Cov_Panel_Param.Layout.Row=1; app.Cov_Panel_Param.Layout.Column=[1 3];
            app.Cov_gridPanel_Parm=uigridlayout(app.Cov_Panel_Param);
            app.Cov_gridPanel_Parm.ColumnWidth=repmat({'1x'},1,9);
            app.Cov_gridPanel_Parm.RowHeight={'1x','1x','1x','1x'};

            % Row 1 — file + load + compute
            app.Cov_ButtonGroup_CovType=uibuttongroup(app.Cov_gridPanel_Parm, ...
                'Title','Coverage Type', ...
                'SelectionChangedFcn',createCallbackFcn(app,@covTypeChanged,true));
            app.Cov_ButtonGroup_CovType.Layout.Row=[1 2]; app.Cov_ButtonGroup_CovType.Layout.Column=1;
            app.Cov_ButtonGroup_Btn_Spherical=uiradiobutton(app.Cov_ButtonGroup_CovType, ...
                'Text','Spherical','Value',true,'Position',[8 65 80 22]);
            app.Cov_ButtonGroup_Btn_Conical=uiradiobutton(app.Cov_ButtonGroup_CovType, ...
                'Text','Conical','Position',[8 43 70 22]);
            app.AntennaPatternEditFieldLabel=uilabel(app.Cov_gridPanel_Parm, ...
                'Text','Pattern File:','HorizontalAlignment','right');
            app.AntennaPatternEditFieldLabel.Layout.Row=1; app.AntennaPatternEditFieldLabel.Layout.Column=2;
            app.Cov_EditField_filePath=uieditfield(app.Cov_gridPanel_Parm,'text');
            app.Cov_EditField_filePath.Layout.Row=1; app.Cov_EditField_filePath.Layout.Column=[3 7];
            app.Cov_Button_Load=uibutton(app.Cov_gridPanel_Parm,'push','Text','Load', ...
                'ButtonPushedFcn',createCallbackFcn(app,@covLoad,true));
            app.Cov_Button_Load.Layout.Row=1; app.Cov_Button_Load.Layout.Column=8;
            app.Cov_Button_Process=uibutton(app.Cov_gridPanel_Parm,'push', ...
                'Text','Compute Coverage','FontWeight','bold', ...
                'ButtonPushedFcn',createCallbackFcn(app,@covProcess,true));
            app.Cov_Button_Process.Layout.Row=1; app.Cov_Button_Process.Layout.Column=9;

            % Row 2 — threshold range
            app.ThresholdMindBSpinnerLabel=uilabel(app.Cov_gridPanel_Parm, ...
                'Text','Thresh Min (dBi):','HorizontalAlignment','right');
            app.ThresholdMindBSpinnerLabel.Layout.Row=2; app.ThresholdMindBSpinnerLabel.Layout.Column=2;
            app.Cov_Spinner_ThreshMin=uispinner(app.Cov_gridPanel_Parm,'Value',-10);
            app.Cov_Spinner_ThreshMin.Layout.Row=2; app.Cov_Spinner_ThreshMin.Layout.Column=3;
            app.ThresholdMaxdBSpinnerLabel=uilabel(app.Cov_gridPanel_Parm, ...
                'Text','Thresh Max (dBi):','HorizontalAlignment','right');
            app.ThresholdMaxdBSpinnerLabel.Layout.Row=2; app.ThresholdMaxdBSpinnerLabel.Layout.Column=4;
            app.Cov_Spinner_ThreshMax=uispinner(app.Cov_gridPanel_Parm,'Value',10);
            app.Cov_Spinner_ThreshMax.Layout.Row=2; app.Cov_Spinner_ThreshMax.Layout.Column=5;
            app.StepdBSpinnerLabel=uilabel(app.Cov_gridPanel_Parm, ...
                'Text','Step (dB):','HorizontalAlignment','right');
            app.StepdBSpinnerLabel.Layout.Row=2; app.StepdBSpinnerLabel.Layout.Column=6;
            app.Cov_Spinner_Step=uispinner(app.Cov_gridPanel_Parm, ...
                'Value',1,'Step',0.5,'Limits',[0.1 Inf]);
            app.Cov_Spinner_Step.Layout.Row=2; app.Cov_Spinner_Step.Layout.Column=7;
            app.Cov_Button_Clear=uibutton(app.Cov_gridPanel_Parm,'push','Text','Clear', ...
                'ButtonPushedFcn',createCallbackFcn(app,@covClear,true));
            app.Cov_Button_Clear.Layout.Row=2; app.Cov_Button_Clear.Layout.Column=8;
            app.Cov_Button_Export=uibutton(app.Cov_gridPanel_Parm,'push','Text','Export Results', ...
                'ButtonPushedFcn',createCallbackFcn(app,@covExport,true));
            app.Cov_Button_Export.Layout.Row=2; app.Cov_Button_Export.Layout.Column=9;

            % Row 3 — orientation + cone controls
            % Orientation dropdown: auto-detect sets this; controls cone centre
            app.Cov_DropDown_Orientation=uidropdown(app.Cov_gridPanel_Parm, ...
                'Items',{'+Z','-Z','+X','-X','+Y','-Y','Custom'},'Value','+Z', ...
                'ValueChangedFcn',createCallbackFcn(app,@orientationChanged,true));
            app.Cov_DropDown_Orientation.Layout.Row=3; app.Cov_DropDown_Orientation.Layout.Column=1;
            app.ConeSpinnerLabel=uilabel(app.Cov_gridPanel_Parm, ...
                'Text','Cone θ₀ (°):','HorizontalAlignment','right','Enable','off');
            app.ConeSpinnerLabel.Layout.Row=3; app.ConeSpinnerLabel.Layout.Column=2;
            app.Cov_Spinner_ConeTH=uispinner(app.Cov_gridPanel_Parm,'Enable','off','Value',0);
            app.Cov_Spinner_ConeTH.Layout.Row=3; app.Cov_Spinner_ConeTH.Layout.Column=3;
            app.ConeLabel=uilabel(app.Cov_gridPanel_Parm, ...
                'Text','Cone φ₀ (°):','HorizontalAlignment','right','Enable','off');
            app.ConeLabel.Layout.Row=3; app.ConeLabel.Layout.Column=4;
            app.Cov_Spinner_ConePH=uispinner(app.Cov_gridPanel_Parm,'Enable','off','Value',0);
            app.Cov_Spinner_ConePH.Layout.Row=3; app.Cov_Spinner_ConePH.Layout.Column=5;
            app.ConeAngleSpinnerLabel=uilabel(app.Cov_gridPanel_Parm, ...
                'Text','Half-Angle α (°):','HorizontalAlignment','right','Enable','off');
            app.ConeAngleSpinnerLabel.Layout.Row=3; app.ConeAngleSpinnerLabel.Layout.Column=6;
            app.Cov_Spinner_ConeAng=uispinner(app.Cov_gridPanel_Parm, ...
                'Value',45,'Limits',[0 180],'Enable','off');
            app.Cov_Spinner_ConeAng.Layout.Row=3; app.Cov_Spinner_ConeAng.Layout.Column=7;

            % Row 4 — query tools
            % Left half: Coverage @ threshold
            app.Cov_Label_QueryCovPct=uilabel(app.Cov_gridPanel_Parm, ...
                'Text','Coverage @ (dBi):','HorizontalAlignment','right', ...
                'FontWeight','bold');
            app.Cov_Label_QueryCovPct.Layout.Row=4; app.Cov_Label_QueryCovPct.Layout.Column=1;
            app.Cov_Spinner_QueryThresh=uispinner(app.Cov_gridPanel_Parm,'Value',0);
            app.Cov_Spinner_QueryThresh.Layout.Row=4; app.Cov_Spinner_QueryThresh.Layout.Column=2;
            app.Cov_Btn_GetCovPct=uibutton(app.Cov_gridPanel_Parm,'push', ...
                'Text','Get %  →','FontWeight','bold', ...
                'ButtonPushedFcn',createCallbackFcn(app,@covQueryAtThreshold,true));
            app.Cov_Btn_GetCovPct.Layout.Row=4; app.Cov_Btn_GetCovPct.Layout.Column=3;
            app.Cov_Label_QueryResult1=uilabel(app.Cov_gridPanel_Parm,'Text','—', ...
                'WordWrap','on','FontColor',[0 0.45 0.74]);
            app.Cov_Label_QueryResult1.Layout.Row=4; app.Cov_Label_QueryResult1.Layout.Column=4;
            % Right half: Threshold @ coverage %
            app.Cov_Label_QueryThreshVal=uilabel(app.Cov_gridPanel_Parm, ...
                'Text','Threshold @ (%):','HorizontalAlignment','right', ...
                'FontWeight','bold');
            app.Cov_Label_QueryThreshVal.Layout.Row=4; app.Cov_Label_QueryThreshVal.Layout.Column=5;
            app.Cov_Spinner_QueryCovPct=uispinner(app.Cov_gridPanel_Parm, ...
                'Value',50,'Limits',[0 100]);
            app.Cov_Spinner_QueryCovPct.Layout.Row=4; app.Cov_Spinner_QueryCovPct.Layout.Column=6;
            app.Cov_Btn_GetThreshVal=uibutton(app.Cov_gridPanel_Parm,'push', ...
                'Text','←  Get dBi','FontWeight','bold', ...
                'ButtonPushedFcn',createCallbackFcn(app,@covQueryAtCoverage,true));
            app.Cov_Btn_GetThreshVal.Layout.Row=4; app.Cov_Btn_GetThreshVal.Layout.Column=7;
            app.Cov_Label_QueryResult2=uilabel(app.Cov_gridPanel_Parm,'Text','—', ...
                'WordWrap','on','FontColor',[0.85 0.33 0.10]);
            app.Cov_Label_QueryResult2.Layout.Row=4; app.Cov_Label_QueryResult2.Layout.Column=[8 9];

            % ── Coverage axes ───────────────────────────────────────────────
            app.Cov_Axes=uiaxes(app.Cov_Grid);
            app.Cov_Axes.Layout.Row=2; app.Cov_Axes.Layout.Column=2;
            title(app.Cov_Axes,'Coverage vs Threshold');
            xlabel(app.Cov_Axes,'Threshold (dBi)');
            ylabel(app.Cov_Axes,'Coverage (%)');
            grid(app.Cov_Axes,'on');

            % ── Checkbox uitree (one node per run) ─────────────────────────
            app.Cov_Tree=uitree(app.Cov_Grid,'checkbox', 'CheckedNodesChangedFcn', createCallbackFcn(app,@covTreeCheckedChanged,true));
            app.Cov_Tree.Layout.Row=2; app.Cov_Tree.Layout.Column=1;
            app.Cov_Tree_Results=uitreenode(app.Cov_Tree,'Text','Coverage Runs');
            % Placeholder nodes (declared as properties for compatibility)
            app.Node2=uitreenode(app.Cov_Tree_Results,'Text','(no runs yet)');
            app.Node3=uitreenode(app.Cov_Tree_Results,'Text','—');
            app.Node4=uitreenode(app.Cov_Tree_Results,'Text','—');
            delete(app.Node2);  delete(app.Node3);  delete(app.Node4);
            expand(app.Cov_Tree_Results);

            % ── Results table ───────────────────────────────────────────────
            app.Cov_Tabel=uitable(app.Cov_Grid, ...
                'ColumnName',{'Threshold (dBi)','Coverage (%)'},'RowName',{});
            app.Cov_Tabel.Layout.Row=2; app.Cov_Tabel.Layout.Column=3;

            app.UIFigure.Visible='on';
        end % createComponents
    end

    % =====================================================================
    % APP CREATION & DELETION
    % =====================================================================
    methods (Access = public)
        function app = APAT_v2_02
            createComponents(app)
            registerApp(app, app.UIFigure)
            runStartupFcn(app, @startupFcn)
            if nargout == 0, clear app; end
        end
        function delete(app)
            delete(app.UIFigure)
        end
    end
end