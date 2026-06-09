classdef APAT_v1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        GridLayout                     matlab.ui.container.GridLayout
        TabGroup                       matlab.ui.container.TabGroup
        Tab1_Single                    matlab.ui.container.Tab
        Single_Grid                    matlab.ui.container.GridLayout
        Single_panelParam              matlab.ui.container.Panel
        Single_gridPanel_Param         matlab.ui.container.GridLayout
        Single_DropDown_FFD            matlab.ui.control.DropDown
        FFDFreqDropDownLabel           matlab.ui.control.Label
        Single_Export_UAN              matlab.ui.control.Button
        Single_Export_Output           matlab.ui.control.Button
        Single_Button_Coverage         matlab.ui.control.Button
        Single_Button_Process          matlab.ui.control.Button
        Single_DropDown_step           matlab.ui.control.DropDown
        Single_DropDown_R              matlab.ui.control.DropDown
        Single_Spinner_R               matlab.ui.control.Spinner
        DistanceLabel                  matlab.ui.control.Label
        Single_Button_Load             matlab.ui.control.Button
        Single_DropDown_Pt             matlab.ui.control.DropDown
        Single_Spinner_Pt              matlab.ui.control.Spinner
        TransmitPowerLabel             matlab.ui.control.Label
        Single_Spinner_Loss            matlab.ui.control.Spinner
        LossindBLabel                  matlab.ui.control.Label
        Single_Spinner_Rw              matlab.ui.control.Spinner
        IncidentWaveARRwPLFLabel       matlab.ui.control.Label
        Single_DropDown_RxPol          matlab.ui.control.DropDown
        RxPolLabel                     matlab.ui.control.Label
        Single_EditField_Path          matlab.ui.control.EditField
        InputPatternLabel              matlab.ui.control.Label
        Single_StatusBar               matlab.ui.control.Label
        Single_Panel_plotControl       matlab.ui.container.Panel
        Single_gridPanel_Ctrl          matlab.ui.container.GridLayout
        CutvalueSpinnerLabel           matlab.ui.control.Label
        Single_Plot_Cstep              matlab.ui.control.Spinner
        ColorbarstepLabel              matlab.ui.control.Label
        Single_Plot_Cmin               matlab.ui.control.Spinner
        ColorbarminLabel               matlab.ui.control.Label
        Single_Plot_Cmax               matlab.ui.control.Spinner
        ColorbarmaxLabel               matlab.ui.control.Label
        Single_DropDown_cutValue       matlab.ui.control.Spinner
        Single_DropDown_cutType        matlab.ui.control.DropDown
        CuttypeDropDownLabel           matlab.ui.control.Label
        Single_DropDown_Component      matlab.ui.control.DropDown
        ComponentLabel                 matlab.ui.control.Label
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
        Single_DropDown_output         matlab.ui.control.DropDown
        Single_Switch                  matlab.ui.control.Switch
        Single_Panel_Rect              matlab.ui.container.Panel
        Single_gridPanel_Cut           matlab.ui.container.GridLayout
        Single_tabCut                  matlab.ui.container.TabGroup
        Single_tabPolarPlot            matlab.ui.container.Tab
        Single_Grid_Polar              matlab.ui.container.GridLayout
        Single_gridEcut                matlab.ui.container.GridLayout
        CheckBox_Et                    matlab.ui.control.CheckBox
        CheckBox_Er                    matlab.ui.control.CheckBox
        CheckBox_El                    matlab.ui.control.CheckBox
        Button_ExportCut               matlab.ui.control.Button
        Range_Cut_Max                  matlab.ui.control.Spinner
        Range_Cut_Min                  matlab.ui.control.Spinner
        Label_HPBW                     matlab.ui.control.Label
        Button_HPBW                    matlab.ui.control.StateButton
        Range_Cut                      matlab.ui.control.RangeSlider
        Single_tabRectPlot             matlab.ui.container.Tab
        Single_gridRect                matlab.ui.container.GridLayout
        Single_AxesRect                matlab.ui.control.UIAxes
        Single_Panel_fullPattern       matlab.ui.container.Panel
        Single_gridPanel_full          matlab.ui.container.GridLayout
        Single_tabPlots                matlab.ui.container.TabGroup
        Single_tabContour              matlab.ui.container.Tab
        Single_gridContour             matlab.ui.container.GridLayout
        Range_Ctr_Min                  matlab.ui.control.Spinner
        Range_Ctr_Max                  matlab.ui.control.Spinner
        Range_Ctr                      matlab.ui.control.RangeSlider
        Single_Axes_Ctr                matlab.ui.control.UIAxes
        Single_tabCircular             matlab.ui.container.Tab
        Single_gridCircular            matlab.ui.container.GridLayout
        Range_Cir_Min                  matlab.ui.control.Spinner
        Range_Cir_Max                  matlab.ui.control.Spinner
        Range_Cir                      matlab.ui.control.RangeSlider
        Single_tab3DSpherical          matlab.ui.container.Tab
        Single_grid3dSpherical         matlab.ui.container.GridLayout
        Range_3dSph_Min                matlab.ui.control.Spinner
        Range_3dSph_Max                matlab.ui.control.Spinner
        Range_3dSph                    matlab.ui.control.RangeSlider
        Single_Axes_3dSph              matlab.ui.control.UIAxes
        Single_tab3DPolar              matlab.ui.container.Tab
        Single_grid3dPolar             matlab.ui.container.GridLayout
        Range_3dPol_Min                matlab.ui.control.Spinner
        Range_3dPol_Max                matlab.ui.control.Spinner
        Range_3dPol                    matlab.ui.control.RangeSlider
        Single_Axes_3dPol              matlab.ui.control.UIAxes
        Single_tab3DRect               matlab.ui.container.Tab
        Single_grid3dRect              matlab.ui.container.GridLayout
        Range_3dRect_Min_2             matlab.ui.control.Spinner
        Range_3dRect_Max_2             matlab.ui.control.Spinner
        Range_3dRect                   matlab.ui.control.RangeSlider
        Single_Axes_3dRect             matlab.ui.control.UIAxes
        Tab2_Coverage                  matlab.ui.container.Tab
        Cov_Grid                       matlab.ui.container.GridLayout
        Cov_StatusBar                  matlab.ui.control.Label
        Cov_Tabel                      matlab.ui.control.Table
        Cov_Tree                       matlab.ui.container.CheckBoxTree
        Cov_Tree_Results               matlab.ui.container.TreeNode
        Node2                          matlab.ui.container.TreeNode
        Node3                          matlab.ui.container.TreeNode
        Node4                          matlab.ui.container.TreeNode
        Cov_Panel_Param                matlab.ui.container.Panel
        Cov_gridPanel_Parm             matlab.ui.container.GridLayout
        Cov_Spinner_ConeAng            matlab.ui.control.Spinner
        ConeAngleSpinnerLabel          matlab.ui.control.Label
        Cov_Spinner_ConePH             matlab.ui.control.Spinner
        ConeLabel                      matlab.ui.control.Label
        Cov_Spinner_ConeTH             matlab.ui.control.Spinner
        ConeSpinnerLabel               matlab.ui.control.Label
        Cov_Spinner_Step               matlab.ui.control.Spinner
        StepdBSpinnerLabel             matlab.ui.control.Label
        Cov_Spinner_ThreshMax          matlab.ui.control.Spinner
        ThresholdMaxdBSpinnerLabel     matlab.ui.control.Label
        Cov_Spinner_ThreshMin          matlab.ui.control.Spinner
        ThresholdMindBSpinnerLabel     matlab.ui.control.Label
        Cov_Button_Export              matlab.ui.control.Button
        Cov_Button_Clear               matlab.ui.control.Button
        Cov_Button_Process             matlab.ui.control.Button
        Cov_Button_Load                matlab.ui.control.Button
        Cov_EditField_filePath         matlab.ui.control.EditField
        AntennaPatternEditFieldLabel   matlab.ui.control.Label
        Cov_DropDown_Orientation       matlab.ui.control.DropDown
        Cov_ButtonGroup_CovType        matlab.ui.container.ButtonGroup
        Cov_ButtonGroup_Btn_Conical    matlab.ui.control.RadioButton
        Cov_ButtonGroup_Btn_Spherical  matlab.ui.control.RadioButton
        Cov_Axes                       matlab.ui.control.UIAxes
    end

    
    properties (Access = public)
        Single_fileName             char % InputFile Name
        Single_filePath             char % InputFile Name
        Single_fullPath             char % InputFile Name
        Single_folderPath           char % InputFile Name
        Single_InputFileName        char % InputFile Name
        Single_paxCut               matlab.graphics.axis.PolarAxes % Description
        Single_paxPattern           matlab.graphics.axis.PolarAxes % Description
        rawTable                    table   % standardised E-field / gain table
        origTable                   table   % original file data (input format)
        normTable                   table
        procTable                   table
        uanTable                    table
        DataOut_all                 table
        DataOut_step                table
        POB                         double
        maxE                        double
        step                        double
        covResults                  struct
        ColumnAll                   cell
        ColumnNames                 cell
    end
    
    methods (Access = private)
        
        function [rawTable, origTable] = loadFile(app, filePath) %loadPattern
            [~,~,ext] = fileparts(app.Single_filePath); ext = lower(ext);
            nBlk = 1;
            freqs = NaN;
            isDep = false;
            rawTables = []; 

            if ismember(ext, {'.csv','.txt','.dat'}) %contains({'.csv','.txt','.dat'}, ext) % CSV/TXT/DAT Gain file (no E-field data: measured or computed gain)
                opts = detectImportOptions(filePath, FileType='text', Delimiter={' ','\t',',',';'}, ConsecutiveDelimitersRule='join', LeadingDelimitersRule='ignore');
                opts = setvartype(opts, 'double');
                opts = setvaropts(opts, 'TrimNonNumeric', true);
                rawTable = readtable(filePath,opts); % preserve input columns name if any
                assert(~isempty(rawTable) && width(rawTable)>=2, 'File needs >=2 columns');
                % if isempty(rawTable), error('loadFile:NoPatterns', 'Input contains no data!'); end
                % outTable.Properties.UserData.isGainOnly = true;
                % outTable.Properties.UserData.freqs = freqs;
                % outTable.Properties.UserData.isDep = isDep;
                % outTable.Properties.UserData.nBlk = nBlk;
                origTable = rawTable;
                range1 = max(rawTable{:,1})-min(rawTable{:,1});
                range2 = max(rawTable{:,2})-min(rawTable{:,2});
                isGainOnly = true; isCoverage = false;
                % check which column's ranges to determine which one is which!
                if allbetween(range2,0,100)
                    isGainOnly = false; isCoverage = true; 
                    % rawTable.Properties.VariableNames{1}={'Treshold'};
                elseif range1>range2  rawTable.Properties.VariableNames(1:2)={'Phi','Theta'};
                else                  rawTable.Properties.VariableNames(1:2)={'Theta','Phi'};
                end
                
                % if numel(unique(rawTable{:,1})) < numel(unique(rawTable{:,2})), rawTable.Properties.VariableNames(1:2) = {'Theta', 'Phi'};
                % else,                                                           rawTable.Properties.VariableNames(1:2) = {'Phi', 'Theta'}; end
                % if min(rawTable{:,1}) >= 0 && max(rawTable{:,1}) <= 180,    rawTable.Properties.VariableNames(1:2) = {'Theta', 'Phi'};
                % else,                                                       rawTable.Properties.VariableNames(1:2) = {'Phi', 'Theta'}; end
                % assert(all(ismember(rawTable{:,1:2}, -180:360), 'all'), 'APAT_v1:NoAngularData', 'First two columns must contain angular values!');
                % assert(all(rawTable{:,1:2} >= -180 & rawTable{:,1:2} <= 360, 'all'), 'First two columns must contain angular values!' );
                % assert(min(rawTable{:,1:2}, [], 'all') >= -180 && max(rawTable{:,1:2}, [], 'all') <= 360, 'First two columns must contain angular values!' );
                % assert(min(rawTable{:,1:2}, [], 'all') >= -180 && max(rawTable{:,1:2}, [], 'all') <= 360, 'First two columns must contain angular values!');
                % error('APAT_v1:NoAngularData', 'First two columns must contain Theta/Phi values!');
                % range = max(x) - min(x); %range = max(x,[], 'all') - min(x,[], 'all');
                % rawTable.Properties.UserData = struct('isGainOnly',true, 'isCoverage',false, 'freqs',freqs,'isDep',isDep,'nBlk',nBlk,'Blocks',[]);
                rawTable.Properties.UserData = struct('isGainOnly',isGainOnly, 'isCoverage',isCoverage, 'freqs',freqs,'isDep',isDep,'nBlk',nBlk,'Blocks',[]);
                return;
            end

            % Parse Header
            [nHdr, ffdParams] = app.findHeaderLines(filePath);
            % Read the data
            opts = detectImportOptions(filePath, FileType='text', NumHeaderLines=nHdr, Delimiter={' ','\t',',',';'}, ConsecutiveDelimitersRule='join', LeadingDelimitersRule='ignore');
            M = readmatrix(filePath, opts);
            M = M(~all(isnan(M),2),:);
            assert(width(M) >= 3, 'loadPattern:InvalidData', 'File does not contain enough numeric columns!'); % assert(size(M,2) >= 3, 'File does not contain enough numeric columns!'); % if size(M,2) < 3,    error('File must have at least 3 columns!');   end

            % Compute complex E-fields (E_theta & E_phi)
            % Eth: E_TH_mag .* exp(1i * E_TH_phase) = complex(E_TH_mag .* cos(E_TH_phase) , E_TH_mag .* sin(E_TH_phase));
            % Eph: E_PH_mag .* exp(1i * E_PH_phase) = complex(E_PH_mag .* cos(E_PH_phase) , E_PH_mag .* sin(E_PH_phase));
            switch ext
                case {'.fz','.uan'} % XGTD *.uan/*.fz | Format: Theta	Phi	E_TH_DB	E_PH_DB	E_TH_DG	E_PH_DG
                    origTable = array2table(M(:,1:6), 'VariableNames',{'Theta','Phi','E_TH_dB','E_PH_dB','E_TH_deg','E_PH_deg'});
                    TH = M(:,1);    PH = M(:,2);
                    Eth = 10.^(M(:,3)./20) .* exp(1i*deg2rad(M(:,5))); % E_TH_mag = 10^(E_TH_dB/20)
                    Eph = 10.^(M(:,4)./20) .* exp(1i*deg2rad(M(:,6))); % E_PH_mag = 10^(E_TH_dB/20)

                case '.out' % TICRA/GRAP *.out | Format: THETA	PHI	POL-1,real	POL-1,imag	POL-2,real	POL-2,imag (default POL-1/POL-2 are RHCP/LHCP)
                    origTable = array2table(M(:,1:6), 'VariableNames',{'Theta','Phi','Re_RHCP','Im_RHCP','Re_LHCP','Im_LHCP'});
                    TH = M(:,1);       PH = M(:,2);
                    Ercp = complex(M(:,3), M(:,4));
                    Elcp = complex(M(:,5), M(:,6));
                    Eth = (Ercp + Elcp) ./ sqrt(2);
                    Eph = (Ercp - Elcp) ./ (1i*sqrt(2));

                case '.ffs' % CST *.ffs | Format: Phi	Theta	Re(E-TH)	Im(E-TH)	Re(E-PH)	Im(E-PH)
                    origTable = array2table(M(:,1:6), 'VariableNames',{'Phi','Theta','Re_Eth','Im_Eth','Re_Eph','Im_Eph'});
                    PH = M(:,1);    TH = M(:,2);
                    Eth = complex(M(:,3), M(:,4));
                    Eph = complex(M(:,5), M(:,6));

                case '.ffe' % Feko *.out | Format: Theta	Phi	Re(E-TH)	Im(E-TH)	Re(E-PH)	Im(E-PH)  | Additional columns to be ignored
                    origTable = array2table(M(:,1:6), 'VariableNames',{'Theta','Phi','Re_Eth','Im_Eth','Re_Eph','Im_Eph'});
                    TH = M(:,1);    PH = M(:,2);
                    Eth = complex(M(:,3), M(:,4));
                    Eph = complex(M(:,5), M(:,6));

                case '.ffd' % HFSS *.FFD | Format: Re(E-TH)	Im(E-TH)	Re(E-PH)	Im(E-PH)
                    % ffdParams: 'theta','phi', 'nFreq','freq', 'isFFD'
                    thU = linspace(ffdParams.theta(1), ffdParams.theta(2), ffdParams.theta(3)).'; % thUnique
                    phU = linspace(ffdParams.phi(1),   ffdParams.phi(2),   ffdParams.phi(3)).';   % phUnique
                    [TH_grid,PH_grid] = meshgrid(thU, phU);
                    TH = TH_grid(:); PH = PH_grid(:);
            
                    sepMask = isnan(M(:,1)); %sepIdx
                    fVals = M(sepMask,2);
                    freqs = [ffdParams.freq; fVals(~isnan(fVals))];
                    D = M(~sepMask,1:4);
                    
                    nPts = numel(thU) * numel(phU);
                    assert(mod(size(D,1), nPts) == 0, 'FFD row mismatch'); % FFD data rows do not match block size
                    nBlk = size(D,1) / nPts;

                    % Check if Frequency Dependent FFD 
                    if isempty(freqs),  freqs = NaN(1,nBlk);
                    else
                        isDep = true;
                        items = arrayfun(@(k,f) sprintf('Blk %d  %.3g Hz',k,f),(1:nBlk)',freqs(:),'UniformOutput',false);
                        app.Single_DropDown_FFD.Items = items; app.Single_DropDown_FFD.Value=items{1};
                        app.Single_DropDown_FFD.Visible='on'; app.FFDFreqDropDownLabel.Visible='on';
                    end % numel(freqs) >= 1 || ~isempty(params.nFreq); %
                    
                    Blocks = mat2cell(D, repmat(nPts,nBlk,1), 4);
                    rawTables = cellfun(@(M) table(TH, PH, M(:,1),M(:,2),M(:,3),M(:,4), ...
                        'VariableNames', {'Theta','Phi','Re_Eth','Im_Eth','Re_Eph','Im_Eph'}), Blocks, 'UniformOutput', false);

                    % Calculate complex E-fields:
                    B = Blocks{1};
                    Eth = complex(B(:,1), B(:,2));
                    Eph = complex(B(:,3), B(:,4));
                    % origTable = array2table([TH,PH,B], 'VariableNames',{'Theta','Phi','Re_Eth','Im_Eth','Re_Eph','Im_Eph'});
                    origTable = rawTables{1};

                otherwise, error('loadPattern:unsupported','Unsupported format: %s', ext);
            end
            % Generating Standard Table
            rawTable = table(TH(:),PH(:), real(Eth(:)), imag(Eth(:)), real(Eph(:)), imag(Eph(:)), 'VariableNames',{'Theta','Phi','Re_Eth','Im_Eth','Re_Eph','Im_Eph'});
            rawTable.Properties.UserData=struct('isGainOnly',false, 'freqs',freqs,'isDep',isDep,'nBlk',nBlk,'Blocks',{rawTables});
        end
        
        function [nHdr,ffdParams] = findHeaderLines(app, filePath)
            % Detect header lines and optionally parse FFD metadata.
            fid = fopen(filePath, 'r');
            assert(fid > 0, 'Cannot open file: %s', filePath);
            cleanup = onCleanup(@() fclose(fid));
            
            nHdr = 0;
            ffdParams = struct('theta',[], 'phi',[], 'nFreq',[], 'freq',[], 'isFFD',false);
            num = '[+-]?(?:\d+\.?\d*|\.\d+)(?:[eEdD][+-]?\d+)?'; % numeric regex pattern
            dataPat = ['^\s*' num '(?:[\s,]+' num '){3,}\s*$'];  % data line = first row with 4+ numbers | added comma to support CSV files
            
            while true
                pos = ftell(fid);
                line = fgetl(fid);              %OR s = regexprep(strtrim(line), '[,\s]+', ' ');   % CSV/TXT/TSV -> one format
                if ~ischar(line), break; end
                if ~isempty(regexp(line, dataPat, 'once'))
                    fseek(fid, pos, 'bof'); break;
                end
            
                % Optionally parse FFD parameters (theta/phi/frequencies/frequency)
                % f = regexp(s, '^(Frequenc(?:ies|y))\s+(\S+)', 'tokens', 'once', 'ignorecase');
                s = lower(line); %s = strtrim(strrep(lower(line), ',', ' ')); % s = regexprep(lower(line), '[,\s]+', ' ');
                v = sscanf(s, '%f').';
                if numel(v) == 3 && isempty(ffdParams.phi)
                    if isempty(ffdParams.theta),        ffdParams.theta = v; else, ffdParams.phi = v; end
                elseif startsWith(s, 'frequencies '),   ffdParams.nFreq = sscanf(s, '%*s %d');
                elseif startsWith(s, 'frequency '),     ffdParams.freq  = sscanf(s, '%*s %f');
                end
            
                nHdr = nHdr + 1;
            end
            ffdParams.isFFD = ~isempty(ffdParams.theta) && ~isempty(ffdParams.phi);
        end
        
        function T = normalizePattern(app, T, fastAxis)
            if nargin < 3 || isempty(fastAxis), fastAxis = "theta";  end
            if min(T.Theta) < 0,    T.Theta = 90 - T.Theta; end     % [-90,90] -> [0,180] | Wrap Elevation
            T.Phi   = mod(T.Phi, 360);                              % [-180,180] -> [0,360] | Wrap Azimuth onto the canonical circle: remap [-180,0) → [180,360)    
            
            % Remove duplicate
            % T = T(unique([T.Theta,T.Phi], 'rows', 'stable'), :);    % Remove duplicate angular samples %OR [~, ia] = unique([T.Theta, T.Phi], 'rows','stable'); || [~, ia] = unique(T{:, {'Theta','Phi'}}, 'rows', 'stable'); >> %T       = T(ia, :);         % remove duplicate phi=180 rows
            [~, ia] = unique(T{:, {'Theta','Phi'}}, 'rows', 'stable');   
            T = T(ia,:);
        
            % Close the spherical seam: copy Phi=0 to Phi=360
            if max(T.Phi) ~= 360 % OR if ~any(T.Phi == 360) % if T.Phi(1) < 0
                Tseam        = T(T.Phi == 0, :);                    % select phi=0 rows (logical index) | T0
                Tseam.Phi(:) = 360;                                 % closing seam at 360°
                T = [T; Tseam];
            end
        
            % Canonical sort order
            % vars = {'Phi','Theta'}; if fastAxis == "phi", vars = fliplr(vars); end; T = sortrows(T, vars);
            T = sortrows(T,{'Phi','Theta'});                                % Phi slow, Theta varying fast.
            if fastAxis == "phi",   T = sortrows(T, {'Theta','Phi'}); end   % Theta slow, Phi varying fast.
        end

        function updateStep(app)
            Theta_unique = unique(app.Single_Table_DataOut.Data.(1));
            app.step = Theta_unique(2) - Theta_unique(1);
            app.Single_DropDown_step.Items = {['STEP: ', num2str(app.step), '°'], 'STEP: 1°'};
            if app.step < 1
                app.Single_DropDown_step.Enable = 'on';
                app.Single_DropDown_step.Visible = 'on';
                app.Single_DropDown_step.Placeholder = 'STEP';
                % app.Single_DropDown_stepValueChanged;
            else
                app.Single_DropDown_step.Value = ['STEP: ', num2str(app.step), '°'];
                app.Single_DropDown_step.Visible = 'off';
                app.Single_DropDown_step.Enable = 'off';
            end
        end
        
        function pat = processPattern(app, T, param)
            % param = struct();
            % param.Loss_dB = app.Single_Spinner_Loss.Value;
            % param.LossMag = 10.^(-param.Loss_dB/20);
            % param.TxPower_dBW = app.Single_Spinner_Pt.Value; % 0 dBW by default
            % param.Range_m = max(app.Single_Spinner_R.Value, eps);
            % param.RxMode = string(app.Single_DropDown_RxPol.Value);
            % param.RxAR_dB = app.Single_Spinner_Rw.Value; % incident wave AR
            % param.step = app.Single_DropDown_step.Value;
            % T = app.normalizePattern(T);
            if T.Properties.UserData.isGainOnly
                % if all(ismember({'Gain_dBi','AR_dB', ...}, lower(rawTable.Properties.VariableNames))) % Check if it's generated by APAT = containing E-field components top allow all components plotting
                pat = T;
                app.DataOut_all = T;
                % need to collect metadata!
                col = T.Properties.VariableNames;
                app.POB = max(T.(col{3}));
                app.maxE = app.POB;
                return;
            end

            % Calculate E-fields components
            Eth = complex(T.Re_Eth, T.Im_Eth) .* param.LossMag;
            Eph = complex(T.Re_Eph, T.Im_Eph) .* param.LossMag;
            Ercp  = (Eth + 1i*Eph)/sqrt(2);
            Elcp  = (Eth - 1i*Eph)/sqrt(2);

            E_TH_mag = abs(Eth);
            E_PH_mag = abs(Eph);
            Ercp_mag = abs(Ercp);
            Elcp_mag = abs(Elcp);
            
            E_TH_DB  = 20*log10(max(E_TH_mag, eps));
            E_PH_DB  = 20*log10(max(E_PH_mag, eps));
            E_TH_DG  = rad2deg(angle(Eth));
            E_PH_DG  = rad2deg(angle(Eph));
            E_RCP_DB = 20*log10(max(Ercp_mag, eps));
            E_LCP_dB = 20*log10(max(Ercp_mag, eps));
            E_RCP_DG = rad2deg(angle(Ercp));
            E_LCP_DG = rad2deg(angle(Elcp));

            % Calculate Total Gain
            E_tot = sqrt(E_TH_mag.^2 + E_PH_mag.^2); % E_tot = sqrt(Ercp_mag.^2 + Elcp_mag.^2); % Glin = E_TH_mag.^2 + E_PH_mag.^2; % Gain_dBi = 10*log10(max(Glin, eps));
            E_tot_dB = 20*log10(E_tot); %or simplified form: Etot_mag_dB = 10*log10( Ercp_mag.^2 + Elcp_mag.^2 ); 

            % Calculate Axial Ratio
            AR = (Ercp_mag + Elcp_mag)./(Ercp_mag - Elcp_mag); % AR = (Ercp_mag + Elcp_mag)./max(Ercp_mag - Elcp_mag), 1e-12);
            AR (Ercp_mag == Elcp_mag) = sqrt(10)/1e+13; % Handle AR edge cases, to be 250dB when converted to dB

            % Compute Polarization Loss
            dTau = repmat(90, size(AR)); % relative tilt angle (Δτ = τa-τw) set to 90 for max loss (worst-case orientation mismatch)
            Ra = AR; % axial ratio of Antenna (Receiving Antenna 'a')
            Rw_dB = param.RxAR_dB; % axial ratio of Wave (Incident Wave 'w')
            PLF = @(Rw) 10*log10(0.5 + (4*Ra.*Rw + (Ra.^2 - 1).*(Rw.^2 - 1).*cosd(2*dTau))./(2*(Ra.^2 + 1).*(Rw.^2 + 1))); %PLF = 10*log10(0.5 +  (4*Ra.*Rw + (Ra.^2 - 1).*(Rw.^2 - 1).*cosd(2*tau))./(2*(Ra.^2 + 1).*(Rw.^2 + 1))); %PLF = 10*log10(0.5 + (sgn.*4*Ra.*Rw + (Ra.^2 - 1).*(Rw.^2 - 1).*cosd(2*tau))./(2*(Ra.^2 + 1).*(Rw.^2 + 1)));

            % Rw pol should match Ra
            isRHCP = mean(Ercp_mag) > mean(Elcp_mag); %isRHCP = gt(mean(Ercp_mag),mean(Elcp_mag)); % RCP dominant or LCP dominant
            Rw_sign = 1*isRHCP + (-1*~isRHCP); % if isRHCP, Rw_sign = 1; else, Rw_sign = -1; end % Rw_sign = -1 for LCP | 1 for RCP
            Pol = Rw_sign;

            is_LHCP = Elcp_mag > Ercp_mag;

            PLF_dB = PLF(Rw_sign*10.^(Rw_dB/20));

            % EIRP = app.Pt_dB * 10.^(dataOut.E_Total_dB / 10); %Watts % G_linear = 10.^(G_dBi/10)
            % EIRP_dBW = 10*log10(app.Pt_dB) + dataOut.E_Total_dB;
            % EIRP_dBm = app.Pt_dB+30 + dataOut.E_Total_dB;
            EIRP_dBW = param.Pt_dBW + E_tot_dB;
            EIRP = 10.^(EIRP_dBW / 10); % Watts
            % assignin('base','EIRP', EIRP);

            PFD = EIRP ./ (4 * pi * param.R_m^2); %W/m² %PFD = EIRP ./ (4 * pi * R.^2);
            % PFD = (Pin .* 10.^(dataOut.E_Total_dB/10)) ./ (4 * pi * R^2);
            % PFD_dBW_m2 = 10*log10(PFD); % = EIRP_dBW + 4 - pi- app.R_m^2;
            % assignin('base','PFD', PFD);

            E_field = sqrt(30 * EIRP) ./ param.R_m^2; %V/m
            % E_field = sqrt(120 * pi * PFD); %V/m
            % E_field = sqrt(30 * Pin .* 10.^(dataOut.E_Total_dB/10)) ./ R;
            % assignin('base','E_field', E_field);


            % Form processing results data table (Theta/Phi, E-fields, Total Gain, AR, Pol Corrected Gain, ...)
            pat = T(:,1:2);
            pat.E_Total_dB = E_tot_dB;                 % = 10*log10(10.^(RCP_mag_db/10)+10.^(LCP_mag_db/10));
            pat.AR_dB = 20.*log10(abs(AR)).*sign(AR);       % Axial Ratio | We have to preserve the sign of the Axial Ratio, so we can differentiate between RHCP (positive AR) and LHCP (negative AR)
            pat.E_TH_dB = 20*log10(Ercp_mag);               % RCP_mag_db | RCP_Phase = rad2deg(angle(Ercp));
            pat.E_PH_dB = 20*log10(Elcp_mag);               % LCP_mag_db | LCP_Phase = rad2deg(angle(Elcp));
            pat.E_TH_Phase = rad2deg(angle(Ercp));
            pat.E_PH_Phase = rad2deg(angle(Elcp));
            pat.E_RCP_dB = 20*log10(Ercp_mag);               % RCP_mag_db | RCP_Phase = rad2deg(angle(Ercp));
            pat.E_LCP_dB = 20*log10(Elcp_mag);               % LCP_mag_db | LCP_Phase = rad2deg(angle(Elcp));
            pat.E_RCP_Phase = rad2deg(angle(Ercp));
            pat.E_LCP_Phase = rad2deg(angle(Elcp));
            pat.PLF_dB = PLF_dB;                            % Generic VV AR=6dB
            pat.Gain_PolCorrected_dB = E_tot_dB + PLF_dB;      % Polarized Corrected Gain
            pat.EIRP_dBW = EIRP_dBW;
            pat.PFD_Wm2 = PFD;
            pat.E_field_Vm = E_field;

            app.Single_Table_DataOut.Data = pat;

            [app.POB, POBidx] = max(pat.E_Total_dB); % app.POB=max(pat.E_Total_dB);
            
            app.maxE=app.POB;

            app.DataOut_all = pat;
            
            if gt(mean(pat.E_RCP_dB),mean(pat.E_LCP_dB)), pol='RHCP-Polarized'; else, pol='LHCP-Polarized'; end

            % metadata table
            % pat.Properties.UserData.Pol =  pol %polarization
            % pat.Properties.UserData.maxE = %max between Eth/Ph peak dB magnitudes
            % pat.Properties.UserData.POB =  %peak Gain (POB: Peak Of Beam)
            % pat.Properties.UserData.POB_TH = pat.Theta(POBidx); %POB Theta % ['(θ:', num2str(pat.Theta(POBidx)),'°]
            % pat.Properties.UserData.POB_PH = pat.Phi(POBidx) %POB Phi % ['(φ:', num2str(pat.Phi(POBidx)),'°)']
            % app.Single_Table_metadata.Data = pat.Properties.UserData;


            % app.Single_DropDown_output.Items = ['Select Output:'; app.Single_Table_DataOut.ColumnName];
            % app.Single_DropDown_output.ItemsData = 0:numel(app.Single_Table_DataOut.ColumnName);
            % app.Single_DropDown_output.UserData = true(1, numel(app.Single_DropDown_output.Items) - 1); % checkedState - Initialize all items as checked (excluding the placeholder)
            % app.filterOutput();
            

            % Prepare UAN data Table for Export (use ismember to preserve the step or at least 1-degree step in case step is less than 1-deg)
            % uanTable = table(dataIn.Theta, dataIn.Phi, round(E_TH_DB, 5), round(E_PH_DB, 5), round(E_TH_DG, 5), round(E_PH_DG, 5));
            % uanTable = T(ismember(T.Theta, (0:180)) & ismember(T.Phi, (0:360)), :);
            app.uanTable = T(ismember(T.Theta, (0:180)) & ismember(T.Phi, (0:360)), 1:2);
            app.uanTable.E_TH_DB = E_TH_DB; % uanTable.(3) = E_TH_DB;
            app.uanTable.E_PH_DB = E_PH_DB; % uanTable.(4) = E_PH_DB;
            app.uanTable.E_TH_DG = E_TH_DG; % uanTable.(5) = E_TH_DG;
            app.uanTable.E_PH_DG = E_PH_DG; % uanTable.(6) = E_PH_DG;
            app.uanTable(:,3:end) = round(app.uanTable(:,3:end), 5);
        end

        function buildTbl(app)

            T = app.DataOut_all;
            if app.step < 1 && isequal(app.DropDown_step.Value,'STEP: 1°')
                % app.DataOut_step = T(ismember(T.Theta, thK)     & ismember(T.Phi, phK),:);
                app.DataOut_step = T(ismember(T.Theta, (0:180)) & ismember(T.Phi, (0:360)),:);
                % app.DataOut_step = app.Table_DataOut.Data(ismember(app.Table_DataOut.Data.Theta, (0:180)) & ismember(app.Table_DataOut.Data.Phi, (0:360)),:);
                % app.cut = app.cut(ismember(app.cut.Theta, (0:360)) & ismember(app.cut.Phi, (0:360)),:);
            else
                app.DataOut_step = T;
                % app.cut = app.cut_step;
            end

            % app.ColumnNames = T.Properties.VariableNames(3:end); % allCols
            app.ColumnAll = T.Properties.VariableNames;
            app.ColumnNames = app.ColumnAll(3:end);
            nR = height(app.DataOut_step);
            RowName = arrayfun(@(x) sprintf('%d',x),1:nR,'UniformOutput',false);
            app.Single_Table_DataOut.Data = app.DataOut_step;
            app.Single_Table_DataOut.RowName = RowName;
            app.Single_Table_DataOut.Visible='on';
            % Input table: original file format
            if T.Properties.UserData.isGainOnly
                app.Single_Table_DataIn.Data = app.DataOut_step;
                app.Single_Table_DataIn.ColumnName = app.ColumnAll; % allCols
                app.Single_Table_DataIn.RowName = RowName;
            elseif ~isempty(app.origTable)
                nOrig = height(app.origTable);
                RowNameOrig = arrayfun(@(x) sprintf('%d',x),1:nOrig, 'UniformOutput',false);
                app.Single_Table_DataIn.Data = app.origTable;
                app.Single_Table_DataIn.ColumnName = app.origTable.Properties.VariableNames;
                app.Single_Table_DataIn.RowName = RowNameOrig;
            end
            app.Single_Table_DataIn.Visible='on';

            % Column filter dropdown
            app.Single_DropDown_output.Items = [{'--- column filter ---'}, app.ColumnNames]; % allItems
            app.Single_DropDown_output.ItemsData = 0:numel(app.ColumnNames);
            checked = true(1,numel(app.ColumnNames));
            if ~T.Properties.UserData.isGainOnly
                % By default only keep: {'Theta'; 'Phi'; 'E_Total_dB'; 'E_RCP_dB'; 'E_LCP_dB'; 'AR_dB'; 'PLF_dB'; 'Gain_PolCorrected_dB'};
                hideByDef = {'E_TH_dB','E_PH_dB','E_TH_Phase','E_PH_Phase','E_RCP_Phase','E_LCP_Phase','EIRP_dBW','PFD_Wm2','E_field_Vm'};
                for k=1:numel(app.ColumnNames)
                    if ismember(app.ColumnNames{k},hideByDef), checked(k)=false; end
                end
            end
            app.Single_DropDown_output.UserData = checked;
            app.Single_DropDown_output.Value=0;
            app.Single_DropDown_output.Visible='on';
            app.filterOutput();
            app.Single_tabData.Visible='on';

            % app.Single_DropDown_output.Items = ['Select Output:'; app.Single_Table_DataOut.ColumnName];
            % app.Single_DropDown_output.ItemsData = 0:numel(app.Single_Table_DataOut.ColumnName);
            % app.Single_DropDown_output.UserData = true(1, numel(app.Single_DropDown_output.Items) - 1); % checkedState - Initialize all items as checked (excluding the placeholder)
            % app.filterOutput();
            
        end

        function param = getParam(app)
            param = struct();
            param.Loss_dB = app.Single_Spinner_Loss.Value;
            param.LossMag = 10.^(-param.Loss_dB/20);
            param.RxMode = string(app.Single_DropDown_RxPol.Value);
            param.RxAR_dB = app.Single_Spinner_Rw.Value; % incident wave AR
            param.step = app.Single_DropDown_step.Value;

            % R = 1; % Distance in meters (Specify the desired distance)
            % Pt = 1; % Transmit power in Watts (Specify the transmit power)
            % param.TxPower_dBW = app.Single_Spinner_Pt.Value; % 0 dBW by default
            switch app.Single_DropDown_Pt.Value %selectedUnit
                case 'dBm'
                    % Convert dBm to dB; assuming you want to treat dBm as absolute power
                    % Convert dBm to Watts first, then convert to dB
                    % powerInWatts = 10^((powerValue - 30) / 10); % Convert from dBm to Watts
                    % powerInDB = 10 * log10(powerInWatts);      % Convert Watts to dB
                    param.Pt_dBW = app.Single_DropDown_Pt.Value - 30; % dBm to dB conversion
                case 'Watts'
                    % Convert Watts to dB
                    param.Pt_dBW = 10 * log10(app.Single_Spinner_Pt.Value);
                otherwise %case 'dBW' : power in dB
                    % If the unit is already dB, use the value as is
                    param.Pt_dBW = app.Single_Spinner_Pt.Value;
            end

            % param.Range_m = max(app.Single_Spinner_R.Value, eps);
            switch app.Single_DropDown_R.Value %selectedUnit
                case 'km'
                    param.R_m = app.Single_Spinner_R.Value * 1000; % 'm' to 'km' conversion
                otherwise %case 'm': Range in m
                    param.R_m = app.Single_Spinner_R.Value;
            end
        end

        function getCut(app)
            % Get E-Plane & H-Plane cuts
            % app.Single_Table_DataOut.Data(app.Single_Table_DataOut.Data.Phi ==  Val, :);
            % ... need to be completed!
        end

        function plotPattern(app)
            % plot pattern!
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            % Cut's polaraxes
            app.Single_paxCut = polaraxes(app.Single_Grid_Polar);
            cla(app.Single_paxCut,"reset");
            reset(app.Single_paxCut);
            app.Single_paxCut.Layout.Row = [1 4];      app.Single_paxCut.Layout.Column = 3;

            % Fisheye's polaraxes
            app.Single_paxPattern = polaraxes(app.Single_gridCircular);
            cla(app.Single_paxPattern,"reset");
            reset(app.Single_paxPattern);
            app.Single_paxPattern.Layout.Row = [1 3]; app.Single_paxPattern.Layout.Column = 2;

            % Defaults
            app.Single_Plot_Cmax.Value= 10;         app.Single_Plot_Cmin.Value=-50;     app.Single_Plot_Cstep.Value=5;
            app.Single_Spinner_Pt.Value= 0;         app.Single_Spinner_R.Value=1;       app.Single_Spinner_Rw.Value=6;
            app.Cov_Spinner_ThreshMin.Value=-10;    app.Cov_Spinner_ThreshMax.Value=10;
            app.Cov_Spinner_Step.Value=1;           app.Cov_Spinner_ConeAng.Value=45;
            app.covResults = struct('label',{},'type',{},'thresholds',{},'coverage',{}, 'color',{},'coneInfo',{},'gCol',{},'orientation',{});
            app.Single_tabData.Visible='off';       app.Single_DropDown_output.Visible='off';
            app.Single_DropDown_step.Visible='off'; app.Single_Panel_Rect.Visible='off';
            app.Single_Export_Output.Visible='off'; app.Single_Export_UAN.Visible='off';
            app.Single_Button_Coverage.Visible='off';
            app.FFDFreqDropDownLabel.Visible='off'; app.Single_DropDown_FFD.Visible='off';
            app.Single_StatusBar.Text='Ready -- load an antenna pattern file to begin.';
            app.Cov_StatusBar.Text='Coverage ready.';

        end

        % Button pushed function: Single_Button_Load
        function onLoad(app, event)
            if ~isempty(app.Single_EditField_Path) && isfile(app.Single_EditField_Path.Value)
                % path = strtrim(string(app.Single_filePath));
                app.Single_filePath = strtrim(string(app.Single_EditField_Path.Value));
            else
                filters = { ...
                '*.uan;*.fz;*.out;*.ffd;*.ffe;*.ffs;', 'Antenna Pattern'; ...
                '*.csv;*.dat;*.txt', 'Gain data';};
                [app.Single_fileName, app.Single_folderPath] = uigetfile(filters, 'Select an antenna pattern file');
                if isequal(app.Single_fileName, 0), return; end % User canceled the operation
                app.Single_filePath = fullfile(app.Single_folderPath, app.Single_fileName);
                app.Single_EditField_Path.Value = app.Single_filePath;
                [~, app.Single_InputFileName, ~] = fileparts(app.Single_filePath);
            end
            if isempty(app.Single_filePath) || ~isfile(app.Single_filePath)  %exist(app.Single_filePath,'file')~=2
                % app.Single_StatusBar.Text = '';
                uialert(app.UIFigure,'Please load a valid antenna pattern file!','No file');
                return;
            end
            dlg = uiprogressdlg(app.UIFigure, 'Title', 'Loading Data', 'Message', 'Reading file...', 'Indeterminate','on');
            clean = onCleanup(@() close(dlg)); % clean = onCleanup(@() delete(app.progressDlg));

            [app.rawTable, app.origTable] = app.loadFile(app.Single_filePath);

            if ~app.rawTable.Properties.UserData.isDep, app.Single_DropDown_FFD.Visible='off'; app.FFDFreqDropDownLabel.Visible='off'; end

            dlg.Message='Normalising...';
            app.normTable = app.normalizePattern(app.rawTable); % normalizePattern(app, rawTable, "phi");
            dlg.Message = 'Processing...';
            app.procTable = app.processPattern(app.normTable, app.getParam());
            app.updateStep();
            app.getCut();
            app.buildTbl();
            dlg.Message = 'Plotting...';
            % app.plotPattern();
            % app.updateResults(); % update Tables & refresh Plots;

            % app.Single_StatusBar.Text = ['Pattern Loaded: ' app.Single_fileName];
            % app.Single_StatusBar.Text = sprintf('Pattern Loaded: <b>%s</b>', app.Single_fileName);
            % app.Single_StatusBar.Text = 'Pattern Loaded: <b>' + string(app.Single_fileName) + '</b>';
            % app.Single_StatusBar.Text = ['Pattern Loaded: <strong>' app.Single_fileName '</strong>.'];
            app.Single_StatusBar.Text = ['Pattern Loaded: <b>' app.Single_fileName '</b>'];
            close(dlg);
        end

        % Button pushed function: Single_Button_Process
        function onProcess(app, event)
            app.processPattern();
        end

        % Button pushed function: Single_Export_Output
        function exportResults(app, event)
            % Export results table
        end

        % Button pushed function: Single_Export_UAN
        function exportUAN(app, event)
            % Export results table
            if ~isempty(app.uanTable) % if ~app.rawTable.Properties.UserData.isGain
                cd(app.FolderPath);
                [FileName, PathName, filterindex] = uiputfile({'*.csv', 'CSV Files (*.csv)'; '*.txt', 'Text Files (*.txt)'; '*.uan', 'user-defined antenna (*.uan)'}, 'Save Input Data (E-field)',[app.FilePath, '_input_', char(extractBetween(app.Single_DropDown_step.Value, 'STEP: ', '°')), '_deg']);
                % assignin('base', 'Path', PathName);
                % assignin('base', 'FileName', FileName);
                if isequal(FileName,0) || isequal(PathName,0)
                    return; % User canceled the operation
                else
                    app.progressDlg = uiprogressdlg(app.UIFigure, 'Title', 'Saving Data', 'Message', 'Please wait while the data is being saved...', 'Indeterminate','on');
                    try
                        filepath = fullfile(PathName, FileName);
                        if filterindex == 1
                            % Export as CSV
                            % writetable(app.Single_Table_DataIn.Data, filepath);
                            writetable(app.uanTable, filepath);
                        elseif filterindex == 2
                            % Export as TXT
                            % writetable(app.Single_Table_DataIn.Data, filepath, 'Delimiter', '\t');
                            writetable(app.uanTable, filepath, 'Delimiter', '\t');
                        elseif filterindex == 3
                            % Export as UAN
                            % Add new header section 'UAN_header'
                            header = sprintf(['begin_<parameters>\n', 'format free\n', 'phi_min %g\n', 'phi_max %g\n', 'phi_inc %g\n', 'theta_min %g\n', 'theta_max %g\n', 'theta_inc %g\n', 'complex\n', 'mag_phase\n', 'pattern gain\n', 'magnitude dB\n', 'maximum_gain %.5f\n', 'phase degrees\n', 'direction degrees\n', 'polarization theta_phi\n', 'end_<parameters>'], min(app.uanTable.Phi), max(app.uanTable.Phi), min(diff(unique(app.uanTable.Phi))), min(app.uanTable.Theta), max(app.uanTable.Theta), min(diff(unique(app.uanTable.Theta))), app.POB);
                            % Write data and header to file
                            % writematrix(header, filepath, 'Delimiter', newline, 'FileType', 'text'); % when defning string ['text'];

                            % [~, Name, ~] = fileparts(extractBefore(FileName, '_input_'));
                            % [~, Name, ~] = fileparts(char(extractBefore(FileName, '_input_')));
                            % newFileName = [Name, '-', num2str(app.maxE)];
                            % newFileName = [Name, '-', num2str(app.maxE), '.uan'];
                            % newFileName = sprintf('%s-%g', Name, app.maxE);
                            % newFileName = sprintf('%s-%g.uan', Name, app.maxE);
                            % newFileName = sprintf('%s-%.5f.uan', Name, app.maxE);
                            % newFileName = strrep(Name, ['-', num2str(app.maxE), '.uan']);
                            % filepath = fullfile(PathName, newFileName);
                            % assignin('base', 'Name', Name);

                            filepath = fullfile(PathName, [app.InputFileName, '-', num2str(app.maxE,'%.5f'), '.uan']); %need ti include max E because it's needed in XGTD when adding the UAN antenna pattern
                            writelines(header, filepath);
                            writetable(app.uanTable, filepath, 'Delimiter', '\t', 'WriteVariableNames', false, 'WriteMode', 'append', 'FileType', 'text');
                        end
                        % Close the progress dialog
                        close(app.progressDlg); %delete(app.progressDlg);
                    catch ME
                        close(app.progressDlg); %delete(app.progressDlg);
                        uialert(app.UIFigure, ME.message, 'Error', 'Icon', 'error'); %uialert(gcf, ME.message, 'Error', 'Icon', 'error');
                        return;
                    end
                end
            else
                msgbox('No data to export.', 'Warning', 'warn');
            end
        end

        % Value changed function: Single_DropDown_output
        function filterOutput(app, event)
            % value = app.Single_DropDown_output.Value;
            filter = app.Single_DropDown_output;
            if filter.Value > 0 % Handle toggle of the selected item (excluding placeholder)
                filter.UserData(filter.Value) = ~filter.UserData(filter.Value); % Toggle the checked state of the selected item
                filter.Value = 0; % Reset to placeholder
            end

            % Update items display (added +1 >> excluding Placeholder)
            filter.Items = regexprep(filter.Items, '^✓ ?', ''); % Remove check-marks if any % useful icons: ✓✔ ✗✘✖✕ ✔️❌ ✅❎ ☑☒☐ ✨⏩⌛⏳⚡⛔⚠️✍✋📡🔺🔻🔼🔽
            filter.Items(find(filter.UserData) + 1) = append('✓ ', filter.Items(find(filter.UserData) + 1)); % Add check-marks for unselected items

            % Apply styles to the items
            % removeStyle(src); % First, clear any existing styles (not needed as of now)
            addStyle(filter, uistyle('FontWeight', 'bold', 'FontColor', 'black','BackgroundColor', [0.8 1 0.8]), 'Item', find([false, filter.UserData]));
            addStyle(filter, uistyle('FontWeight', 'normal', 'FontColor', [0.5, 0.5, 0.5], 'BackgroundColor', [0.9 0.9 0.9]), 'Item', find([true, ~filter.UserData]));

            % Update Table
            % app.Single_Table_DataOut.ColumnName = app.ColumnNames(filter.UserData);
            app.Single_Table_DataOut.Data = app.DataOut_step(:, [logical([1,1]) filter.UserData]);
            app.Single_Table_DataOut.ColumnName = app.ColumnAll([logical([1,1]) filter.UserData]);
            % close(app.progressDlg); % Close the progress dialog           
        end

        % Value changed function: Single_DropDown_step
        function stepChanged(app, event)
            value = app.Single_DropDown_step.Value;
            app.processData();
        end

        % Button down function: Single_tabDataOut
        function Single_tabDataOutButtonDown(app, event)
            % Show the Columns' Filter only when the Results Table/Tab is in view
            app.Single_DropDown_output.Visible = 'on';
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1136 739];
            app.UIFigure.Name = 'Antenna Pattern Analyzer Tool';
            app.UIFigure.WindowState = 'maximized';

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {'1x'};
            app.GridLayout.RowHeight = {'1x'};

            % Create TabGroup
            app.TabGroup = uitabgroup(app.GridLayout);
            app.TabGroup.Layout.Row = 1;
            app.TabGroup.Layout.Column = 1;

            % Create Tab1_Single
            app.Tab1_Single = uitab(app.TabGroup);
            app.Tab1_Single.Title = 'Process Pattern';

            % Create Single_Grid
            app.Single_Grid = uigridlayout(app.Tab1_Single);
            app.Single_Grid.ColumnWidth = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            app.Single_Grid.RowHeight = {'fit', 'fit', 'fit', '1x', '1x', 'fit', '1x', '1x', 'fit'};

            % Create Single_Panel_fullPattern
            app.Single_Panel_fullPattern = uipanel(app.Single_Grid);
            app.Single_Panel_fullPattern.TitlePosition = 'centertop';
            app.Single_Panel_fullPattern.Title = 'Full Antenna Pattern';
            app.Single_Panel_fullPattern.BackgroundColor = [0.9412 0.9412 0.9412];
            app.Single_Panel_fullPattern.Layout.Row = [4 6];
            app.Single_Panel_fullPattern.Layout.Column = [1 6];
            app.Single_Panel_fullPattern.FontWeight = 'bold';

            % Create Single_gridPanel_full
            app.Single_gridPanel_full = uigridlayout(app.Single_Panel_fullPattern);
            app.Single_gridPanel_full.ColumnWidth = {'1x'};
            app.Single_gridPanel_full.RowHeight = {'1x'};

            % Create Single_tabPlots
            app.Single_tabPlots = uitabgroup(app.Single_gridPanel_full);
            app.Single_tabPlots.Layout.Row = 1;
            app.Single_tabPlots.Layout.Column = 1;

            % Create Single_tabContour
            app.Single_tabContour = uitab(app.Single_tabPlots);
            app.Single_tabContour.Title = 'Contour Plot';

            % Create Single_gridContour
            app.Single_gridContour = uigridlayout(app.Single_tabContour);
            app.Single_gridContour.ColumnWidth = {'fit', '1x'};
            app.Single_gridContour.RowHeight = {'fit', '1x', 'fit'};

            % Create Single_Axes_Ctr
            app.Single_Axes_Ctr = uiaxes(app.Single_gridContour);
            title(app.Single_Axes_Ctr, 'Antenna Gain Pattern ')
            xlabel(app.Single_Axes_Ctr, 'Theta (degree)')
            ylabel(app.Single_Axes_Ctr, 'Phi (degree)')
            zlabel(app.Single_Axes_Ctr, 'Z')
            app.Single_Axes_Ctr.XLim = [0 360];
            app.Single_Axes_Ctr.YLim = [0 180];
            app.Single_Axes_Ctr.YDir = 'reverse';
            app.Single_Axes_Ctr.XTick = [0 30 60 90 120 150 180 210 240 270 300 330 360];
            app.Single_Axes_Ctr.YTick = [0 15 30 45 60 75 90 105 120 135 150 165 180];
            app.Single_Axes_Ctr.Box = 'on';
            app.Single_Axes_Ctr.Layout.Row = [1 3];
            app.Single_Axes_Ctr.Layout.Column = 2;
            colormap(app.Single_Axes_Ctr, 'jet')

            % Create Range_Ctr
            app.Range_Ctr = uislider(app.Single_gridContour, 'range');
            app.Range_Ctr.Orientation = 'vertical';
            app.Range_Ctr.Step = 1;
            app.Range_Ctr.Layout.Row = 2;
            app.Range_Ctr.Layout.Column = 1;

            % Create Range_Ctr_Max
            app.Range_Ctr_Max = uispinner(app.Single_gridContour);
            app.Range_Ctr_Max.Step = 5;
            app.Range_Ctr_Max.Layout.Row = 1;
            app.Range_Ctr_Max.Layout.Column = 1;

            % Create Range_Ctr_Min
            app.Range_Ctr_Min = uispinner(app.Single_gridContour);
            app.Range_Ctr_Min.Step = 5;
            app.Range_Ctr_Min.Layout.Row = 3;
            app.Range_Ctr_Min.Layout.Column = 1;

            % Create Single_tabCircular
            app.Single_tabCircular = uitab(app.Single_tabPlots);
            app.Single_tabCircular.Title = 'Circular Contour (Fisheye/Sine-Space)';

            % Create Single_gridCircular
            app.Single_gridCircular = uigridlayout(app.Single_tabCircular);
            app.Single_gridCircular.ColumnWidth = {'fit', '1x'};
            app.Single_gridCircular.RowHeight = {'fit', '1x', 'fit'};

            % Create Range_Cir
            app.Range_Cir = uislider(app.Single_gridCircular, 'range');
            app.Range_Cir.Orientation = 'vertical';
            app.Range_Cir.Step = 1;
            app.Range_Cir.Layout.Row = 2;
            app.Range_Cir.Layout.Column = 1;

            % Create Range_Cir_Max
            app.Range_Cir_Max = uispinner(app.Single_gridCircular);
            app.Range_Cir_Max.Step = 5;
            app.Range_Cir_Max.Layout.Row = 1;
            app.Range_Cir_Max.Layout.Column = 1;

            % Create Range_Cir_Min
            app.Range_Cir_Min = uispinner(app.Single_gridCircular);
            app.Range_Cir_Min.Step = 5;
            app.Range_Cir_Min.Layout.Row = 3;
            app.Range_Cir_Min.Layout.Column = 1;

            % Create Single_tab3DSpherical
            app.Single_tab3DSpherical = uitab(app.Single_tabPlots);
            app.Single_tab3DSpherical.Title = '3D Spherical Plot';

            % Create Single_grid3dSpherical
            app.Single_grid3dSpherical = uigridlayout(app.Single_tab3DSpherical);
            app.Single_grid3dSpherical.ColumnWidth = {'fit', '1x'};
            app.Single_grid3dSpherical.RowHeight = {'fit', '1x', 'fit'};

            % Create Single_Axes_3dSph
            app.Single_Axes_3dSph = uiaxes(app.Single_grid3dSpherical);
            title(app.Single_Axes_3dSph, '3D Spherical Plot')
            xlabel(app.Single_Axes_3dSph, 'Theta (degree)')
            ylabel(app.Single_Axes_3dSph, 'Phi (degree)')
            zlabel(app.Single_Axes_3dSph, 'Z')
            app.Single_Axes_3dSph.XLim = [0 360];
            app.Single_Axes_3dSph.YLim = [0 180];
            app.Single_Axes_3dSph.YDir = 'reverse';
            app.Single_Axes_3dSph.XTick = [0 30 60 90 120 150 180 210 240 270 300 330 360];
            app.Single_Axes_3dSph.YTick = [0 15 30 45 60 75 90 105 120 135 150 165 180];
            app.Single_Axes_3dSph.Box = 'on';
            app.Single_Axes_3dSph.Layout.Row = [1 3];
            app.Single_Axes_3dSph.Layout.Column = 2;
            colormap(app.Single_Axes_3dSph, 'jet')

            % Create Range_3dSph
            app.Range_3dSph = uislider(app.Single_grid3dSpherical, 'range');
            app.Range_3dSph.Orientation = 'vertical';
            app.Range_3dSph.Step = 1;
            app.Range_3dSph.Layout.Row = 2;
            app.Range_3dSph.Layout.Column = 1;

            % Create Range_3dSph_Max
            app.Range_3dSph_Max = uispinner(app.Single_grid3dSpherical);
            app.Range_3dSph_Max.Step = 5;
            app.Range_3dSph_Max.Layout.Row = 1;
            app.Range_3dSph_Max.Layout.Column = 1;

            % Create Range_3dSph_Min
            app.Range_3dSph_Min = uispinner(app.Single_grid3dSpherical);
            app.Range_3dSph_Min.Step = 5;
            app.Range_3dSph_Min.Layout.Row = 3;
            app.Range_3dSph_Min.Layout.Column = 1;

            % Create Single_tab3DPolar
            app.Single_tab3DPolar = uitab(app.Single_tabPlots);
            app.Single_tab3DPolar.Title = '3D Polar Plot';

            % Create Single_grid3dPolar
            app.Single_grid3dPolar = uigridlayout(app.Single_tab3DPolar);
            app.Single_grid3dPolar.ColumnWidth = {'fit', '1x'};
            app.Single_grid3dPolar.RowHeight = {'fit', '1x', 'fit'};

            % Create Single_Axes_3dPol
            app.Single_Axes_3dPol = uiaxes(app.Single_grid3dPolar);
            title(app.Single_Axes_3dPol, '3D Polar Plot')
            xlabel(app.Single_Axes_3dPol, 'Theta (degree)')
            ylabel(app.Single_Axes_3dPol, 'Phi (degree)')
            zlabel(app.Single_Axes_3dPol, 'Z')
            app.Single_Axes_3dPol.XLim = [0 360];
            app.Single_Axes_3dPol.YLim = [0 180];
            app.Single_Axes_3dPol.YDir = 'reverse';
            app.Single_Axes_3dPol.XTick = [0 30 60 90 120 150 180 210 240 270 300 330 360];
            app.Single_Axes_3dPol.YTick = [0 15 30 45 60 75 90 105 120 135 150 165 180];
            app.Single_Axes_3dPol.Box = 'on';
            app.Single_Axes_3dPol.Layout.Row = [1 3];
            app.Single_Axes_3dPol.Layout.Column = 2;
            colormap(app.Single_Axes_3dPol, 'jet')

            % Create Range_3dPol
            app.Range_3dPol = uislider(app.Single_grid3dPolar, 'range');
            app.Range_3dPol.Orientation = 'vertical';
            app.Range_3dPol.Step = 1;
            app.Range_3dPol.Layout.Row = 2;
            app.Range_3dPol.Layout.Column = 1;

            % Create Range_3dPol_Max
            app.Range_3dPol_Max = uispinner(app.Single_grid3dPolar);
            app.Range_3dPol_Max.Step = 5;
            app.Range_3dPol_Max.Layout.Row = 1;
            app.Range_3dPol_Max.Layout.Column = 1;

            % Create Range_3dPol_Min
            app.Range_3dPol_Min = uispinner(app.Single_grid3dPolar);
            app.Range_3dPol_Min.Step = 5;
            app.Range_3dPol_Min.Layout.Row = 3;
            app.Range_3dPol_Min.Layout.Column = 1;

            % Create Single_tab3DRect
            app.Single_tab3DRect = uitab(app.Single_tabPlots);
            app.Single_tab3DRect.Title = '3D Surface Plot';

            % Create Single_grid3dRect
            app.Single_grid3dRect = uigridlayout(app.Single_tab3DRect);
            app.Single_grid3dRect.ColumnWidth = {'fit', '1x'};
            app.Single_grid3dRect.RowHeight = {'fit', '1x', 'fit'};

            % Create Single_Axes_3dRect
            app.Single_Axes_3dRect = uiaxes(app.Single_grid3dRect);
            title(app.Single_Axes_3dRect, '3D Surface (Rectangular) Plot')
            xlabel(app.Single_Axes_3dRect, 'Theta (degree)')
            ylabel(app.Single_Axes_3dRect, 'Phi (degree)')
            zlabel(app.Single_Axes_3dRect, 'Z')
            app.Single_Axes_3dRect.XLim = [0 360];
            app.Single_Axes_3dRect.YLim = [0 180];
            app.Single_Axes_3dRect.YDir = 'reverse';
            app.Single_Axes_3dRect.XTick = [0 30 60 90 120 150 180 210 240 270 300 330 360];
            app.Single_Axes_3dRect.YTick = [0 15 30 45 60 75 90 105 120 135 150 165 180];
            app.Single_Axes_3dRect.Box = 'on';
            app.Single_Axes_3dRect.Layout.Row = [1 3];
            app.Single_Axes_3dRect.Layout.Column = 2;
            colormap(app.Single_Axes_3dRect, 'jet')

            % Create Range_3dRect
            app.Range_3dRect = uislider(app.Single_grid3dRect, 'range');
            app.Range_3dRect.Orientation = 'vertical';
            app.Range_3dRect.Step = 1;
            app.Range_3dRect.Layout.Row = 2;
            app.Range_3dRect.Layout.Column = 1;

            % Create Range_3dRect_Max_2
            app.Range_3dRect_Max_2 = uispinner(app.Single_grid3dRect);
            app.Range_3dRect_Max_2.Step = 5;
            app.Range_3dRect_Max_2.Layout.Row = 1;
            app.Range_3dRect_Max_2.Layout.Column = 1;

            % Create Range_3dRect_Min_2
            app.Range_3dRect_Min_2 = uispinner(app.Single_grid3dRect);
            app.Range_3dRect_Min_2.Step = 5;
            app.Range_3dRect_Min_2.Layout.Row = 3;
            app.Range_3dRect_Min_2.Layout.Column = 1;

            % Create Single_Panel_Rect
            app.Single_Panel_Rect = uipanel(app.Single_Grid);
            app.Single_Panel_Rect.TitlePosition = 'centertop';
            app.Single_Panel_Rect.Title = 'Antenna Pattern Cut';
            app.Single_Panel_Rect.Visible = 'off';
            app.Single_Panel_Rect.BackgroundColor = [0.9412 0.9412 0.9412];
            app.Single_Panel_Rect.Layout.Row = [4 6];
            app.Single_Panel_Rect.Layout.Column = [7 12];
            app.Single_Panel_Rect.FontWeight = 'bold';

            % Create Single_gridPanel_Cut
            app.Single_gridPanel_Cut = uigridlayout(app.Single_Panel_Rect);
            app.Single_gridPanel_Cut.ColumnWidth = {'1x'};
            app.Single_gridPanel_Cut.RowHeight = {'1x'};

            % Create Single_tabCut
            app.Single_tabCut = uitabgroup(app.Single_gridPanel_Cut);
            app.Single_tabCut.Layout.Row = 1;
            app.Single_tabCut.Layout.Column = 1;

            % Create Single_tabPolarPlot
            app.Single_tabPolarPlot = uitab(app.Single_tabCut);
            app.Single_tabPolarPlot.Title = 'Polar Cut Plot';

            % Create Single_Grid_Polar
            app.Single_Grid_Polar = uigridlayout(app.Single_tabPolarPlot);
            app.Single_Grid_Polar.ColumnWidth = {'fit', '0.26x', '1x', '0.23x'};
            app.Single_Grid_Polar.RowHeight = {'fit', '0.25x', '1x', 'fit'};

            % Create Range_Cut
            app.Range_Cut = uislider(app.Single_Grid_Polar, 'range');
            app.Range_Cut.Orientation = 'vertical';
            app.Range_Cut.Step = 1;
            app.Range_Cut.Layout.Row = [2 3];
            app.Range_Cut.Layout.Column = 1;

            % Create Button_HPBW
            app.Button_HPBW = uibutton(app.Single_Grid_Polar, 'state');
            app.Button_HPBW.IconAlignment = 'center';
            app.Button_HPBW.Text = 'HPBW';
            app.Button_HPBW.FontWeight = 'bold';
            app.Button_HPBW.Layout.Row = 1;
            app.Button_HPBW.Layout.Column = 4;

            % Create Label_HPBW
            app.Label_HPBW = uilabel(app.Single_Grid_Polar);
            app.Label_HPBW.HorizontalAlignment = 'center';
            app.Label_HPBW.FontWeight = 'bold';
            app.Label_HPBW.Layout.Row = 2;
            app.Label_HPBW.Layout.Column = 4;
            app.Label_HPBW.Text = '';

            % Create Range_Cut_Min
            app.Range_Cut_Min = uispinner(app.Single_Grid_Polar);
            app.Range_Cut_Min.Step = 5;
            app.Range_Cut_Min.Layout.Row = 4;
            app.Range_Cut_Min.Layout.Column = 1;

            % Create Range_Cut_Max
            app.Range_Cut_Max = uispinner(app.Single_Grid_Polar);
            app.Range_Cut_Max.Step = 5;
            app.Range_Cut_Max.Layout.Row = 1;
            app.Range_Cut_Max.Layout.Column = 1;

            % Create Button_ExportCut
            app.Button_ExportCut = uibutton(app.Single_Grid_Polar, 'push');
            app.Button_ExportCut.FontWeight = 'bold';
            app.Button_ExportCut.Layout.Row = 4;
            app.Button_ExportCut.Layout.Column = 4;
            app.Button_ExportCut.Text = 'Export Cut';

            % Create Single_gridEcut
            app.Single_gridEcut = uigridlayout(app.Single_Grid_Polar);
            app.Single_gridEcut.ColumnWidth = {'1x'};
            app.Single_gridEcut.RowHeight = {'1x', '1x', '1x'};
            app.Single_gridEcut.Layout.Row = 3;
            app.Single_gridEcut.Layout.Column = 4;

            % Create CheckBox_El
            app.CheckBox_El = uicheckbox(app.Single_gridEcut);
            app.CheckBox_El.Text = 'E_LCP';
            app.CheckBox_El.Layout.Row = 3;
            app.CheckBox_El.Layout.Column = 1;
            app.CheckBox_El.Value = true;

            % Create CheckBox_Er
            app.CheckBox_Er = uicheckbox(app.Single_gridEcut);
            app.CheckBox_Er.Text = 'E_RCP';
            app.CheckBox_Er.Layout.Row = 2;
            app.CheckBox_Er.Layout.Column = 1;
            app.CheckBox_Er.Value = true;

            % Create CheckBox_Et
            app.CheckBox_Et = uicheckbox(app.Single_gridEcut);
            app.CheckBox_Et.Text = 'E_Total';
            app.CheckBox_Et.Layout.Row = 1;
            app.CheckBox_Et.Layout.Column = 1;
            app.CheckBox_Et.Value = true;

            % Create Single_tabRectPlot
            app.Single_tabRectPlot = uitab(app.Single_tabCut);
            app.Single_tabRectPlot.Title = 'Rectangular Cut Plot';

            % Create Single_gridRect
            app.Single_gridRect = uigridlayout(app.Single_tabRectPlot);

            % Create Single_AxesRect
            app.Single_AxesRect = uiaxes(app.Single_gridRect);
            xlabel(app.Single_AxesRect, 'Theta (degree)')
            ylabel(app.Single_AxesRect, 'Magnitude (dB)')
            zlabel(app.Single_AxesRect, 'Z')
            app.Single_AxesRect.XLim = [0 180];
            app.Single_AxesRect.XTick = [0 15 30 45 60 75 90 105 120 135 150 165 180];
            app.Single_AxesRect.Box = 'on';
            app.Single_AxesRect.Layout.Row = [1 2];
            app.Single_AxesRect.Layout.Column = [1 2];
            app.Single_AxesRect.Visible = 'off';

            % Create Single_Switch
            app.Single_Switch = uiswitch(app.Single_Grid, 'slider');
            app.Single_Switch.Items = {'E-Plane', 'H-Plane'};
            app.Single_Switch.Visible = 'off';
            app.Single_Switch.Layout.Row = 3;
            app.Single_Switch.Layout.Column = 1;
            app.Single_Switch.Value = 'E-Plane';

            % Create Single_DropDown_output
            app.Single_DropDown_output = uidropdown(app.Single_Grid);
            app.Single_DropDown_output.Items = {'Select Output:'};
            app.Single_DropDown_output.ValueChangedFcn = createCallbackFcn(app, @filterOutput, true);
            app.Single_DropDown_output.Visible = 'off';
            app.Single_DropDown_output.Layout.Row = 6;
            app.Single_DropDown_output.Layout.Column = [13 14];
            app.Single_DropDown_output.Value = 'Select Output:';

            % Create Single_tabData
            app.Single_tabData = uitabgroup(app.Single_Grid);
            app.Single_tabData.Visible = 'off';
            app.Single_tabData.Layout.Row = [7 8];
            app.Single_tabData.Layout.Column = [1 14];

            % Create Single_tabDataOut
            app.Single_tabDataOut = uitab(app.Single_tabData);
            app.Single_tabDataOut.Title = 'Results';
            app.Single_tabDataOut.ButtonDownFcn = createCallbackFcn(app, @Single_tabDataOutButtonDown, true);

            % Create Single_gridDataOut
            app.Single_gridDataOut = uigridlayout(app.Single_tabDataOut);
            app.Single_gridDataOut.ColumnWidth = {'1x'};
            app.Single_gridDataOut.RowHeight = {'1x'};

            % Create Single_Table_DataOut
            app.Single_Table_DataOut = uitable(app.Single_gridDataOut);
            app.Single_Table_DataOut.BackgroundColor = [1 1 1];
            app.Single_Table_DataOut.ColumnName = {'Theta'; 'Phi'; 'E_Total_dB'; 'AR_dB'; 'E_RCP_dB'; 'E_LCP_dB'; 'PLF_dB'; 'Gain_PolCorrected_dB'};
            app.Single_Table_DataOut.ColumnRearrangeable = 'on';
            app.Single_Table_DataOut.RowName = {};
            app.Single_Table_DataOut.ColumnSortable = true;
            app.Single_Table_DataOut.Visible = 'off';
            app.Single_Table_DataOut.Layout.Row = 1;
            app.Single_Table_DataOut.Layout.Column = 1;

            % Create Single_tabDataIn
            app.Single_tabDataIn = uitab(app.Single_tabData);
            app.Single_tabDataIn.Title = 'Input';

            % Create Single_gridDataIn
            app.Single_gridDataIn = uigridlayout(app.Single_tabDataIn);
            app.Single_gridDataIn.ColumnWidth = {'1x'};
            app.Single_gridDataIn.RowHeight = {'1x'};

            % Create Single_Table_DataIn
            app.Single_Table_DataIn = uitable(app.Single_gridDataIn);
            app.Single_Table_DataIn.BackgroundColor = [1 1 1];
            app.Single_Table_DataIn.ColumnName = {'Theta'; 'Phi'; 'E-TH-DB'; 'E-PH-DB'; 'E-TH-DG'; 'E-PH-DG'};
            app.Single_Table_DataIn.ColumnRearrangeable = 'on';
            app.Single_Table_DataIn.RowName = {};
            app.Single_Table_DataIn.ColumnSortable = true;
            app.Single_Table_DataIn.Visible = 'off';
            app.Single_Table_DataIn.Layout.Row = 1;
            app.Single_Table_DataIn.Layout.Column = 1;

            % Create MetadataTab
            app.MetadataTab = uitab(app.Single_tabData);
            app.MetadataTab.Title = 'Metadata';

            % Create Single_gridMetadata
            app.Single_gridMetadata = uigridlayout(app.MetadataTab);
            app.Single_gridMetadata.ColumnWidth = {'1x'};
            app.Single_gridMetadata.RowHeight = {'1x'};

            % Create Single_Table_metadata
            app.Single_Table_metadata = uitable(app.Single_gridMetadata);
            app.Single_Table_metadata.ColumnName = {'Column 1'; 'Column 2'};
            app.Single_Table_metadata.RowName = {};
            app.Single_Table_metadata.Layout.Row = 1;
            app.Single_Table_metadata.Layout.Column = 1;

            % Create Single_Panel_plotControl
            app.Single_Panel_plotControl = uipanel(app.Single_Grid);
            app.Single_Panel_plotControl.Title = 'Plot Control';
            app.Single_Panel_plotControl.Layout.Row = [4 5];
            app.Single_Panel_plotControl.Layout.Column = [13 14];

            % Create Single_gridPanel_Ctrl
            app.Single_gridPanel_Ctrl = uigridlayout(app.Single_Panel_plotControl);
            app.Single_gridPanel_Ctrl.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x'};

            % Create ComponentLabel
            app.ComponentLabel = uilabel(app.Single_gridPanel_Ctrl);
            app.ComponentLabel.HorizontalAlignment = 'right';
            app.ComponentLabel.Layout.Row = 1;
            app.ComponentLabel.Layout.Column = 1;
            app.ComponentLabel.Text = 'Component';

            % Create Single_DropDown_Component
            app.Single_DropDown_Component = uidropdown(app.Single_gridPanel_Ctrl);
            app.Single_DropDown_Component.Items = {'Total Gain', 'Etheta Gain', 'Ephi  Gain', 'RHCP Gain', 'LHCP  Gain', 'Axial Ratio', 'Polarized Gain'};
            app.Single_DropDown_Component.Layout.Row = 1;
            app.Single_DropDown_Component.Layout.Column = 2;
            app.Single_DropDown_Component.Value = 'Total Gain';

            % Create CuttypeDropDownLabel
            app.CuttypeDropDownLabel = uilabel(app.Single_gridPanel_Ctrl);
            app.CuttypeDropDownLabel.HorizontalAlignment = 'right';
            app.CuttypeDropDownLabel.Layout.Row = 2;
            app.CuttypeDropDownLabel.Layout.Column = 1;
            app.CuttypeDropDownLabel.Text = 'Cut type';

            % Create Single_DropDown_cutType
            app.Single_DropDown_cutType = uidropdown(app.Single_gridPanel_Ctrl);
            app.Single_DropDown_cutType.Items = {'Phi Cut', 'Theta Cut'};
            app.Single_DropDown_cutType.Layout.Row = 2;
            app.Single_DropDown_cutType.Layout.Column = 2;
            app.Single_DropDown_cutType.Value = 'Phi Cut';

            % Create Single_DropDown_cutValue
            app.Single_DropDown_cutValue = uispinner(app.Single_gridPanel_Ctrl);
            app.Single_DropDown_cutValue.Layout.Row = 3;
            app.Single_DropDown_cutValue.Layout.Column = 2;

            % Create ColorbarmaxLabel
            app.ColorbarmaxLabel = uilabel(app.Single_gridPanel_Ctrl);
            app.ColorbarmaxLabel.HorizontalAlignment = 'right';
            app.ColorbarmaxLabel.Layout.Row = 4;
            app.ColorbarmaxLabel.Layout.Column = 1;
            app.ColorbarmaxLabel.Text = 'Colorbar max';

            % Create Single_Plot_Cmax
            app.Single_Plot_Cmax = uispinner(app.Single_gridPanel_Ctrl);
            app.Single_Plot_Cmax.Layout.Row = 4;
            app.Single_Plot_Cmax.Layout.Column = 2;

            % Create ColorbarminLabel
            app.ColorbarminLabel = uilabel(app.Single_gridPanel_Ctrl);
            app.ColorbarminLabel.HorizontalAlignment = 'right';
            app.ColorbarminLabel.Layout.Row = 5;
            app.ColorbarminLabel.Layout.Column = 1;
            app.ColorbarminLabel.Text = 'Colorbar min';

            % Create Single_Plot_Cmin
            app.Single_Plot_Cmin = uispinner(app.Single_gridPanel_Ctrl);
            app.Single_Plot_Cmin.Layout.Row = 5;
            app.Single_Plot_Cmin.Layout.Column = 2;

            % Create ColorbarstepLabel
            app.ColorbarstepLabel = uilabel(app.Single_gridPanel_Ctrl);
            app.ColorbarstepLabel.HorizontalAlignment = 'right';
            app.ColorbarstepLabel.Layout.Row = 6;
            app.ColorbarstepLabel.Layout.Column = 1;
            app.ColorbarstepLabel.Text = 'Colorbar step';

            % Create Single_Plot_Cstep
            app.Single_Plot_Cstep = uispinner(app.Single_gridPanel_Ctrl);
            app.Single_Plot_Cstep.Layout.Row = 6;
            app.Single_Plot_Cstep.Layout.Column = 2;

            % Create CutvalueSpinnerLabel
            app.CutvalueSpinnerLabel = uilabel(app.Single_gridPanel_Ctrl);
            app.CutvalueSpinnerLabel.HorizontalAlignment = 'right';
            app.CutvalueSpinnerLabel.Layout.Row = 3;
            app.CutvalueSpinnerLabel.Layout.Column = 1;
            app.CutvalueSpinnerLabel.Text = 'Cut value';

            % Create Single_StatusBar
            app.Single_StatusBar = uilabel(app.Single_Grid);
            app.Single_StatusBar.Layout.Row = 9;
            app.Single_StatusBar.Layout.Column = [1 14];
            app.Single_StatusBar.Interpreter = 'html';
            app.Single_StatusBar.Text = 'Status';

            % Create Single_panelParam
            app.Single_panelParam = uipanel(app.Single_Grid);
            app.Single_panelParam.Title = 'Inputs & Parameters';
            app.Single_panelParam.Layout.Row = [1 3];
            app.Single_panelParam.Layout.Column = [1 14];

            % Create Single_gridPanel_Param
            app.Single_gridPanel_Param = uigridlayout(app.Single_panelParam);
            app.Single_gridPanel_Param.ColumnWidth = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            app.Single_gridPanel_Param.RowHeight = {'1x', '1x', '1x'};

            % Create InputPatternLabel
            app.InputPatternLabel = uilabel(app.Single_gridPanel_Param);
            app.InputPatternLabel.HorizontalAlignment = 'right';
            app.InputPatternLabel.Layout.Row = 1;
            app.InputPatternLabel.Layout.Column = 1;
            app.InputPatternLabel.Text = 'Input Pattern:';

            % Create Single_EditField_Path
            app.Single_EditField_Path = uieditfield(app.Single_gridPanel_Param, 'text');
            app.Single_EditField_Path.Layout.Row = 1;
            app.Single_EditField_Path.Layout.Column = [2 8];

            % Create RxPolLabel
            app.RxPolLabel = uilabel(app.Single_gridPanel_Param);
            app.RxPolLabel.HorizontalAlignment = 'right';
            app.RxPolLabel.Layout.Row = 3;
            app.RxPolLabel.Layout.Column = 1;
            app.RxPolLabel.Text = 'Rx Pol';

            % Create Single_DropDown_RxPol
            app.Single_DropDown_RxPol = uidropdown(app.Single_gridPanel_Param);
            app.Single_DropDown_RxPol.Items = {'Auto', 'RHCP', 'LHCP'};
            app.Single_DropDown_RxPol.Layout.Row = 3;
            app.Single_DropDown_RxPol.Layout.Column = 2;
            app.Single_DropDown_RxPol.Value = 'Auto';

            % Create IncidentWaveARRwPLFLabel
            app.IncidentWaveARRwPLFLabel = uilabel(app.Single_gridPanel_Param);
            app.IncidentWaveARRwPLFLabel.HorizontalAlignment = 'right';
            app.IncidentWaveARRwPLFLabel.Visible = 'off';
            app.IncidentWaveARRwPLFLabel.Layout.Row = 3;
            app.IncidentWaveARRwPLFLabel.Layout.Column = 3;
            app.IncidentWaveARRwPLFLabel.Text = 'Rx AR (dB)';

            % Create Single_Spinner_Rw
            app.Single_Spinner_Rw = uispinner(app.Single_gridPanel_Param);
            app.Single_Spinner_Rw.Visible = 'off';
            app.Single_Spinner_Rw.Layout.Row = 3;
            app.Single_Spinner_Rw.Layout.Column = 4;
            app.Single_Spinner_Rw.Value = 6;

            % Create LossindBLabel
            app.LossindBLabel = uilabel(app.Single_gridPanel_Param);
            app.LossindBLabel.HorizontalAlignment = 'right';
            app.LossindBLabel.Visible = 'off';
            app.LossindBLabel.Layout.Row = 3;
            app.LossindBLabel.Layout.Column = 5;
            app.LossindBLabel.Text = 'Loss (dB)';

            % Create Single_Spinner_Loss
            app.Single_Spinner_Loss = uispinner(app.Single_gridPanel_Param);
            app.Single_Spinner_Loss.Step = 0.1;
            app.Single_Spinner_Loss.Visible = 'off';
            app.Single_Spinner_Loss.Layout.Row = 3;
            app.Single_Spinner_Loss.Layout.Column = 6;

            % Create TransmitPowerLabel
            app.TransmitPowerLabel = uilabel(app.Single_gridPanel_Param);
            app.TransmitPowerLabel.HorizontalAlignment = 'right';
            app.TransmitPowerLabel.Visible = 'off';
            app.TransmitPowerLabel.Layout.Row = 3;
            app.TransmitPowerLabel.Layout.Column = 7;
            app.TransmitPowerLabel.Text = 'Tx Pwr (Pt)';

            % Create Single_Spinner_Pt
            app.Single_Spinner_Pt = uispinner(app.Single_gridPanel_Param);
            app.Single_Spinner_Pt.Visible = 'off';
            app.Single_Spinner_Pt.Layout.Row = 3;
            app.Single_Spinner_Pt.Layout.Column = 8;

            % Create Single_DropDown_Pt
            app.Single_DropDown_Pt = uidropdown(app.Single_gridPanel_Param);
            app.Single_DropDown_Pt.Items = {'dB', 'dBm', 'Watts'};
            app.Single_DropDown_Pt.Visible = 'off';
            app.Single_DropDown_Pt.Layout.Row = 3;
            app.Single_DropDown_Pt.Layout.Column = 9;
            app.Single_DropDown_Pt.Value = 'dB';

            % Create Single_Button_Load
            app.Single_Button_Load = uibutton(app.Single_gridPanel_Param, 'push');
            app.Single_Button_Load.ButtonPushedFcn = createCallbackFcn(app, @onLoad, true);
            app.Single_Button_Load.FontSize = 14;
            app.Single_Button_Load.FontWeight = 'bold';
            app.Single_Button_Load.Layout.Row = 1;
            app.Single_Button_Load.Layout.Column = [11 12];
            app.Single_Button_Load.Text = 'Load Antenna Pattern';

            % Create DistanceLabel
            app.DistanceLabel = uilabel(app.Single_gridPanel_Param);
            app.DistanceLabel.HorizontalAlignment = 'right';
            app.DistanceLabel.Visible = 'off';
            app.DistanceLabel.Layout.Row = 3;
            app.DistanceLabel.Layout.Column = 10;
            app.DistanceLabel.Text = 'Distance';

            % Create Single_Spinner_R
            app.Single_Spinner_R = uispinner(app.Single_gridPanel_Param);
            app.Single_Spinner_R.Visible = 'off';
            app.Single_Spinner_R.Layout.Row = 3;
            app.Single_Spinner_R.Layout.Column = 11;
            app.Single_Spinner_R.Value = 1;

            % Create Single_DropDown_R
            app.Single_DropDown_R = uidropdown(app.Single_gridPanel_Param);
            app.Single_DropDown_R.Items = {'m', 'km'};
            app.Single_DropDown_R.Visible = 'off';
            app.Single_DropDown_R.Layout.Row = 3;
            app.Single_DropDown_R.Layout.Column = 12;
            app.Single_DropDown_R.Value = 'm';

            % Create Single_DropDown_step
            app.Single_DropDown_step = uidropdown(app.Single_gridPanel_Param);
            app.Single_DropDown_step.Items = {'STEP', 'STEP: 1'};
            app.Single_DropDown_step.ValueChangedFcn = createCallbackFcn(app, @stepChanged, true);
            app.Single_DropDown_step.Enable = 'off';
            app.Single_DropDown_step.Visible = 'off';
            app.Single_DropDown_step.Placeholder = 'STEP';
            app.Single_DropDown_step.Layout.Row = 2;
            app.Single_DropDown_step.Layout.Column = [9 10];
            app.Single_DropDown_step.Value = 'STEP';

            % Create Single_Button_Process
            app.Single_Button_Process = uibutton(app.Single_gridPanel_Param, 'push');
            app.Single_Button_Process.ButtonPushedFcn = createCallbackFcn(app, @onProcess, true);
            app.Single_Button_Process.Layout.Row = 1;
            app.Single_Button_Process.Layout.Column = [13 14];
            app.Single_Button_Process.Text = 'Process';

            % Create Single_Button_Coverage
            app.Single_Button_Coverage = uibutton(app.Single_gridPanel_Param, 'push');
            app.Single_Button_Coverage.FontWeight = 'bold';
            app.Single_Button_Coverage.Visible = 'off';
            app.Single_Button_Coverage.Layout.Row = 3;
            app.Single_Button_Coverage.Layout.Column = [13 14];
            app.Single_Button_Coverage.Text = 'Coverage ▶';

            % Create Single_Export_Output
            app.Single_Export_Output = uibutton(app.Single_gridPanel_Param, 'push');
            app.Single_Export_Output.ButtonPushedFcn = createCallbackFcn(app, @exportResults, true);
            app.Single_Export_Output.FontWeight = 'bold';
            app.Single_Export_Output.Visible = 'off';
            app.Single_Export_Output.Layout.Row = 2;
            app.Single_Export_Output.Layout.Column = [11 12];
            app.Single_Export_Output.Text = 'Export Results';

            % Create Single_Export_UAN
            app.Single_Export_UAN = uibutton(app.Single_gridPanel_Param, 'push');
            app.Single_Export_UAN.ButtonPushedFcn = createCallbackFcn(app, @exportUAN, true);
            app.Single_Export_UAN.FontWeight = 'bold';
            app.Single_Export_UAN.Visible = 'off';
            app.Single_Export_UAN.Layout.Row = 2;
            app.Single_Export_UAN.Layout.Column = [13 14];
            app.Single_Export_UAN.Text = 'Export UAN';

            % Create FFDFreqDropDownLabel
            app.FFDFreqDropDownLabel = uilabel(app.Single_gridPanel_Param);
            app.FFDFreqDropDownLabel.HorizontalAlignment = 'right';
            app.FFDFreqDropDownLabel.Enable = 'off';
            app.FFDFreqDropDownLabel.Layout.Row = 1;
            app.FFDFreqDropDownLabel.Layout.Column = 9;
            app.FFDFreqDropDownLabel.Text = 'FFD Freq:';

            % Create Single_DropDown_FFD
            app.Single_DropDown_FFD = uidropdown(app.Single_gridPanel_Param);
            app.Single_DropDown_FFD.Items = {'Frequencies'};
            app.Single_DropDown_FFD.Enable = 'off';
            app.Single_DropDown_FFD.Layout.Row = 1;
            app.Single_DropDown_FFD.Layout.Column = 10;
            app.Single_DropDown_FFD.Value = 'Frequencies';

            % Create Tab2_Coverage
            app.Tab2_Coverage = uitab(app.TabGroup);
            app.Tab2_Coverage.Title = 'Compute Coverage';

            % Create Cov_Grid
            app.Cov_Grid = uigridlayout(app.Tab2_Coverage);
            app.Cov_Grid.ColumnWidth = {'0.75x', '1x', '1x'};
            app.Cov_Grid.RowHeight = {'0.5x', '1x', 'fit'};

            % Create Cov_Axes
            app.Cov_Axes = uiaxes(app.Cov_Grid);
            title(app.Cov_Axes, 'Coverage vs Threshold')
            xlabel(app.Cov_Axes, 'Threshold (dB)')
            ylabel(app.Cov_Axes, 'Coverage (%)')
            zlabel(app.Cov_Axes, 'Z')
            app.Cov_Axes.Layout.Row = 2;
            app.Cov_Axes.Layout.Column = 2;

            % Create Cov_Panel_Param
            app.Cov_Panel_Param = uipanel(app.Cov_Grid);
            app.Cov_Panel_Param.Title = 'Inputs & Parameters';
            app.Cov_Panel_Param.Layout.Row = 1;
            app.Cov_Panel_Param.Layout.Column = [1 3];

            % Create Cov_gridPanel_Parm
            app.Cov_gridPanel_Parm = uigridlayout(app.Cov_Panel_Param);
            app.Cov_gridPanel_Parm.ColumnWidth = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            app.Cov_gridPanel_Parm.RowHeight = {'1x', '1x', '1x'};

            % Create Cov_ButtonGroup_CovType
            app.Cov_ButtonGroup_CovType = uibuttongroup(app.Cov_gridPanel_Parm);
            app.Cov_ButtonGroup_CovType.Title = 'Coverage Type';
            app.Cov_ButtonGroup_CovType.Layout.Row = [1 2];
            app.Cov_ButtonGroup_CovType.Layout.Column = 1;

            % Create Cov_ButtonGroup_Btn_Spherical
            app.Cov_ButtonGroup_Btn_Spherical = uiradiobutton(app.Cov_ButtonGroup_CovType);
            app.Cov_ButtonGroup_Btn_Spherical.Text = 'Spherical';
            app.Cov_ButtonGroup_Btn_Spherical.Position = [11 69 72 22];
            app.Cov_ButtonGroup_Btn_Spherical.Value = true;

            % Create Cov_ButtonGroup_Btn_Conical
            app.Cov_ButtonGroup_Btn_Conical = uiradiobutton(app.Cov_ButtonGroup_CovType);
            app.Cov_ButtonGroup_Btn_Conical.Text = 'Conical';
            app.Cov_ButtonGroup_Btn_Conical.Position = [11 47 65 22];

            % Create Cov_DropDown_Orientation
            app.Cov_DropDown_Orientation = uidropdown(app.Cov_gridPanel_Parm);
            app.Cov_DropDown_Orientation.Items = {'Orientation:', '+Z', '-Z', '+X', '-X', '+Y', '-Y'};
            app.Cov_DropDown_Orientation.Layout.Row = 3;
            app.Cov_DropDown_Orientation.Layout.Column = 1;
            app.Cov_DropDown_Orientation.Value = 'Orientation:';

            % Create AntennaPatternEditFieldLabel
            app.AntennaPatternEditFieldLabel = uilabel(app.Cov_gridPanel_Parm);
            app.AntennaPatternEditFieldLabel.HorizontalAlignment = 'right';
            app.AntennaPatternEditFieldLabel.Layout.Row = 1;
            app.AntennaPatternEditFieldLabel.Layout.Column = 2;
            app.AntennaPatternEditFieldLabel.Text = 'Antenna Pattern:';

            % Create Cov_EditField_filePath
            app.Cov_EditField_filePath = uieditfield(app.Cov_gridPanel_Parm, 'text');
            app.Cov_EditField_filePath.Layout.Row = 1;
            app.Cov_EditField_filePath.Layout.Column = [3 7];

            % Create Cov_Button_Load
            app.Cov_Button_Load = uibutton(app.Cov_gridPanel_Parm, 'push');
            app.Cov_Button_Load.Layout.Row = 1;
            app.Cov_Button_Load.Layout.Column = 8;
            app.Cov_Button_Load.Text = 'Load';

            % Create Cov_Button_Process
            app.Cov_Button_Process = uibutton(app.Cov_gridPanel_Parm, 'push');
            app.Cov_Button_Process.Layout.Row = 1;
            app.Cov_Button_Process.Layout.Column = 9;
            app.Cov_Button_Process.Text = 'Process';

            % Create Cov_Button_Clear
            app.Cov_Button_Clear = uibutton(app.Cov_gridPanel_Parm, 'push');
            app.Cov_Button_Clear.Layout.Row = 2;
            app.Cov_Button_Clear.Layout.Column = 8;
            app.Cov_Button_Clear.Text = 'Clear';

            % Create Cov_Button_Export
            app.Cov_Button_Export = uibutton(app.Cov_gridPanel_Parm, 'push');
            app.Cov_Button_Export.Layout.Row = 2;
            app.Cov_Button_Export.Layout.Column = 9;
            app.Cov_Button_Export.Text = 'Export Results';

            % Create ThresholdMindBSpinnerLabel
            app.ThresholdMindBSpinnerLabel = uilabel(app.Cov_gridPanel_Parm);
            app.ThresholdMindBSpinnerLabel.HorizontalAlignment = 'right';
            app.ThresholdMindBSpinnerLabel.Layout.Row = 2;
            app.ThresholdMindBSpinnerLabel.Layout.Column = 2;
            app.ThresholdMindBSpinnerLabel.Text = 'Threshold  Min (dB):';

            % Create Cov_Spinner_ThreshMin
            app.Cov_Spinner_ThreshMin = uispinner(app.Cov_gridPanel_Parm);
            app.Cov_Spinner_ThreshMin.Layout.Row = 2;
            app.Cov_Spinner_ThreshMin.Layout.Column = 3;

            % Create ThresholdMaxdBSpinnerLabel
            app.ThresholdMaxdBSpinnerLabel = uilabel(app.Cov_gridPanel_Parm);
            app.ThresholdMaxdBSpinnerLabel.HorizontalAlignment = 'right';
            app.ThresholdMaxdBSpinnerLabel.Layout.Row = 2;
            app.ThresholdMaxdBSpinnerLabel.Layout.Column = 4;
            app.ThresholdMaxdBSpinnerLabel.Text = 'Threshold  Max (dB):';

            % Create Cov_Spinner_ThreshMax
            app.Cov_Spinner_ThreshMax = uispinner(app.Cov_gridPanel_Parm);
            app.Cov_Spinner_ThreshMax.Layout.Row = 2;
            app.Cov_Spinner_ThreshMax.Layout.Column = 5;

            % Create StepdBSpinnerLabel
            app.StepdBSpinnerLabel = uilabel(app.Cov_gridPanel_Parm);
            app.StepdBSpinnerLabel.HorizontalAlignment = 'right';
            app.StepdBSpinnerLabel.Layout.Row = 2;
            app.StepdBSpinnerLabel.Layout.Column = 6;
            app.StepdBSpinnerLabel.Text = 'Step (dB):';

            % Create Cov_Spinner_Step
            app.Cov_Spinner_Step = uispinner(app.Cov_gridPanel_Parm);
            app.Cov_Spinner_Step.Layout.Row = 2;
            app.Cov_Spinner_Step.Layout.Column = 7;

            % Create ConeSpinnerLabel
            app.ConeSpinnerLabel = uilabel(app.Cov_gridPanel_Parm);
            app.ConeSpinnerLabel.HorizontalAlignment = 'right';
            app.ConeSpinnerLabel.Enable = 'off';
            app.ConeSpinnerLabel.Layout.Row = 3;
            app.ConeSpinnerLabel.Layout.Column = 2;
            app.ConeSpinnerLabel.Text = 'Cone θ₀ (°):';

            % Create Cov_Spinner_ConeTH
            app.Cov_Spinner_ConeTH = uispinner(app.Cov_gridPanel_Parm);
            app.Cov_Spinner_ConeTH.Enable = 'off';
            app.Cov_Spinner_ConeTH.Layout.Row = 3;
            app.Cov_Spinner_ConeTH.Layout.Column = 3;

            % Create ConeLabel
            app.ConeLabel = uilabel(app.Cov_gridPanel_Parm);
            app.ConeLabel.HorizontalAlignment = 'right';
            app.ConeLabel.Enable = 'off';
            app.ConeLabel.Layout.Row = 3;
            app.ConeLabel.Layout.Column = 4;
            app.ConeLabel.Text = 'Cone φ₀ (°):';

            % Create Cov_Spinner_ConePH
            app.Cov_Spinner_ConePH = uispinner(app.Cov_gridPanel_Parm);
            app.Cov_Spinner_ConePH.Enable = 'off';
            app.Cov_Spinner_ConePH.Layout.Row = 3;
            app.Cov_Spinner_ConePH.Layout.Column = 5;

            % Create ConeAngleSpinnerLabel
            app.ConeAngleSpinnerLabel = uilabel(app.Cov_gridPanel_Parm);
            app.ConeAngleSpinnerLabel.HorizontalAlignment = 'right';
            app.ConeAngleSpinnerLabel.Enable = 'off';
            app.ConeAngleSpinnerLabel.Layout.Row = 3;
            app.ConeAngleSpinnerLabel.Layout.Column = 6;
            app.ConeAngleSpinnerLabel.Text = 'Cone Angle α (°)';

            % Create Cov_Spinner_ConeAng
            app.Cov_Spinner_ConeAng = uispinner(app.Cov_gridPanel_Parm);
            app.Cov_Spinner_ConeAng.Limits = [0 360];
            app.Cov_Spinner_ConeAng.Enable = 'off';
            app.Cov_Spinner_ConeAng.Layout.Row = 3;
            app.Cov_Spinner_ConeAng.Layout.Column = 7;
            app.Cov_Spinner_ConeAng.Value = 45;

            % Create Cov_Tree
            app.Cov_Tree = uitree(app.Cov_Grid, 'checkbox');
            app.Cov_Tree.Layout.Row = 2;
            app.Cov_Tree.Layout.Column = 1;

            % Create Cov_Tree_Results
            app.Cov_Tree_Results = uitreenode(app.Cov_Tree);
            app.Cov_Tree_Results.Text = 'Node';

            % Create Node2
            app.Node2 = uitreenode(app.Cov_Tree_Results);
            app.Node2.Text = 'Node2';

            % Create Node3
            app.Node3 = uitreenode(app.Cov_Tree_Results);
            app.Node3.Text = 'Node3';

            % Create Node4
            app.Node4 = uitreenode(app.Cov_Tree_Results);
            app.Node4.Text = 'Node4';

            % Create Cov_Tabel
            app.Cov_Tabel = uitable(app.Cov_Grid);
            app.Cov_Tabel.ColumnName = {'Threshold (dB)'; 'Coverage %'};
            app.Cov_Tabel.RowName = {};
            app.Cov_Tabel.Layout.Row = 2;
            app.Cov_Tabel.Layout.Column = 3;

            % Create Cov_StatusBar
            app.Cov_StatusBar = uilabel(app.Cov_Grid);
            app.Cov_StatusBar.Layout.Row = 3;
            app.Cov_StatusBar.Layout.Column = [1 3];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = APAT_v1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

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
