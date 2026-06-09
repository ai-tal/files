%%# ─── SECTION 1: class header + properties ────────────────────────────────
classdef APAT_v1 < matlab.apps.AppBase
% APAT_v1  Antenna Pattern Analysis Tool  v1
% Formats: .uan/.fz .out/.cut(to-be-revised) .ffd .ffe .ffs .csv/.txt/.dat

    properties (Access = public) % ── UI Components ──────────────────────
        UIFigure                       matlab.ui.Figure
        GridLayout                     matlab.ui.container.GridLayout
        TabGroup                       matlab.ui.container.TabGroup
        % ── Tab 1 ──
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
        Single_Label_FFD               matlab.ui.control.Label
        Single_DropDown_FFD            matlab.ui.control.DropDown
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
        Single_tabUnitSphere           matlab.ui.container.Tab
        Single_gridUnitSphere          matlab.ui.container.GridLayout
        Axes_UnitSphere                matlab.ui.control.UIAxes
        Range_US                       matlab.ui.control.RangeSlider
        Range_US_Max                   matlab.ui.control.Spinner
        Range_US_Min                   matlab.ui.control.Spinner
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
        Single_EH_Label                matlab.ui.control.Label
        Single_Switch                  matlab.ui.control.Switch
        Single_Overlay_Label           matlab.ui.control.Label
        Single_Checkbox_OverlayCut     matlab.ui.control.CheckBox
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
        % ── Tab 2 ──
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
        Cov_Label_Component            matlab.ui.control.Label
        Cov_DropDown_Component         matlab.ui.control.DropDown
        ConeSpinnerLabel               matlab.ui.control.Label
        Cov_Spinner_ConeTH             matlab.ui.control.Spinner
        ConeLabel                      matlab.ui.control.Label
        Cov_Spinner_ConePH             matlab.ui.control.Spinner
        ConeAngleSpinnerLabel          matlab.ui.control.Label
        Cov_Spinner_ConeAng            matlab.ui.control.Spinner
        Cov_DropDown_Orientation       matlab.ui.control.DropDown
        Cov_Label_XMin                 matlab.ui.control.Label
        Cov_Spinner_XMin               matlab.ui.control.Spinner
        Cov_Label_XMax                 matlab.ui.control.Label
        Cov_Spinner_XMax               matlab.ui.control.Spinner
        Cov_Label_QueryCovPct          matlab.ui.control.Label
        Cov_Spinner_QueryThresh        matlab.ui.control.Spinner
        Cov_Btn_GetCovPct              matlab.ui.control.Button
        Cov_Label_QueryThreshVal       matlab.ui.control.Label
        Cov_Spinner_QueryCovPct        matlab.ui.control.Spinner
        Cov_Btn_GetThreshVal           matlab.ui.control.Button
        Cov_Axes                       matlab.ui.control.UIAxes
        Cov_Tree                       matlab.ui.container.CheckBoxTree
        Cov_Tree_Results               matlab.ui.container.TreeNode
        Cov_Tabel                      matlab.ui.control.Table
        Cov_StatusBar                  matlab.ui.control.Label
    end

    properties (Access = public) % ── Working data ────────────────────────
        Single_fileName      char
        Single_filePath      char
        Single_folderPath    char
        Single_InputFileName char
        Single_paxCut               % polaraxes – polar cut plot
        Single_paxPattern           % polaraxes – fisheye (surface)
        rawTable             table  % standardised E-field/gain table
        origTbl            table  % original file column format
        normTable            table
        DataOut_all          table
        DataOut_step         table
        ColumnNames          cell
        UAN_data             table
        POB                  double = 0
        maxE                 double = 0
        step                 double = 1
        Pt_dB                double = 0
        R_m                  double = 1
        detectedOrientation  char   = ''
        detectedPOB_Theta    double = 0
        detectedPOB_Phi      double = 0
        covResults           struct
        covPatterns          cell   = {}
        isGainOnly_          logical = false
    end


%%# ─── SECTION 2: findHeaderLines (own block) + loadFile + loadGainOnlyFile ─

    % ─ findHeaderLines must be in its OWN block before the calling methods ─
    methods (Access = private)
        function [nHdr,ffdP] = findHeaderLines(app, filePath) %#ok<INUSL>
            fid=fopen(filePath,'r'); assert(fid>0,'Cannot open %s',filePath);
            cu=onCleanup(@()fclose(fid)); nHdr=0;
            ffdP=struct('theta',[],'phi',[],'nFreq',[],'freq',[],'isFFD',false);
            num='[+-]?(?:\d+\.?\d*|\.\d+)(?:[eEdD][+-]?\d+)?';
            dp=['^\s*' num '(?:[\s,;]+' num '){3,}\s*$'];
            while true
                pos=ftell(fid); ln=fgetl(fid); if ~ischar(ln),break;end
                if ~isempty(regexp(ln,dp,'once')),fseek(fid,pos,'bof');break;end
                s=lower(strtrim(ln)); v=sscanf(s,'%f')';
                if numel(v)==3
                    if isempty(ffdP.theta),ffdP.theta=v;
                    elseif isempty(ffdP.phi),ffdP.phi=v;end
                elseif startsWith(s,'frequencies '),ffdP.nFreq=sscanf(s,'%*s %d');
                elseif startsWith(s,'frequency '),  ffdP.freq =sscanf(s,'%*s %f');end
                nHdr=nHdr+1;
            end
            ffdP.isFFD=~isempty(ffdP.theta) && ~isempty(ffdP.phi);
        end
    end %EOM findHeaderLines block

    methods (Access = private) % ─── File loading ──────────────────────

        function [rawTable,origTbl] = loadFile(app, filePath)
        % loadFile  Load any E-field pattern file.
        % TAKES app as first arg (not ~) so app.findHeaderLines can be called.
            [~,~,ext]=fileparts(filePath);
            % Gain/Coverage CSV/TXT/DAT: range-based detection
            if ismember(lower(ext),{'.csv','.txt','.dat'})
                [rawTable,origTbl]=app.loadGainOnlyFile(filePath); return
            end
            [nHdr,ffdP]=app.findHeaderLines(filePath);
            opts=detectImportOptions(filePath,FileType='text', NumHeaderLines=nHdr, Delimiter={' ','\t',',',';'}, ConsecutiveDelimitersRule='join',LeadingDelimitersRule='ignore');
            M=readmatrix(filePath,opts); M=M(~all(isnan(M),2),:);
            nBlk=1; freqs=NaN; isDep=false; rawTables={};
            switch lower(ext)
                case {'.fz','.uan'}
                    assert(width(M)>=6,'%s needs >=6 cols',ext);
                    TH=M(:,1);PH=M(:,2);
                    Eth=10.^(M(:,3)/20).*exp(1i*deg2rad(M(:,5)));
                    Eph=10.^(M(:,4)/20).*exp(1i*deg2rad(M(:,6)));
                    origTbl=array2table(M(:,1:6),'VariableNames', {'Theta','Phi','E_TH_dB','E_PH_dB','E_TH_deg','E_PH_deg'});
                case '.out'
                    assert(width(M)>=6,'.out needs >=6 cols');
                    TH=M(:,1);PH=M(:,2);
                    Ercp=complex(M(:,3),M(:,4));Elcp=complex(M(:,5),M(:,6));
                    Eth=(Ercp+Elcp)/sqrt(2);Eph=(Ercp-Elcp)/(1i*sqrt(2));
                    origTbl=array2table(M(:,1:6),'VariableNames', {'Theta','Phi','Re_RHCP','Im_RHCP','Re_LHCP','Im_LHCP'});
                case '.ffs'
                    assert(width(M)>=6,'.ffs needs >=6 cols');
                    PH=M(:,1);TH=M(:,2);
                    Eth=complex(M(:,3),M(:,4));Eph=complex(M(:,5),M(:,6));
                    origTbl=array2table(M(:,1:6),'VariableNames', {'Phi','Theta','Re_Eth','Im_Eth','Re_Eph','Im_Eph'});
                case '.ffe'
                    assert(width(M)>=6,'.ffe needs >=6 cols');
                    TH=M(:,1);PH=M(:,2);
                    Eth=complex(M(:,3),M(:,4));Eph=complex(M(:,5),M(:,6));
                    origTbl=array2table(M(:,1:6),'VariableNames', {'Theta','Phi','Re_Eth','Im_Eth','Re_Eph','Im_Eph'});
                case '.ffd'
                    assert(ffdP.isFFD,'Cannot parse HFSS FFD header');
                    thU=linspace(ffdP.theta(1),ffdP.theta(2),ffdP.theta(3))';
                    phU=linspace(ffdP.phi(1),ffdP.phi(2),ffdP.phi(3))';
                    [TH_g,PH_g]=meshgrid(thU,phU);
                    sepIdx=isnan(M(:,1));
                    fVals=M(sepIdx,2); fVals=fVals(~isnan(fVals));
                    freqs=[ffdP.freq;fVals(:)];
                    D=M(~sepIdx,1:4); nPts=numel(thU)*numel(phU);
                    assert(mod(size(D,1),nPts)==0,'FFD row mismatch');
                    nBlk=size(D,1)/nPts; isDep=nBlk>1;
                    if isempty(freqs),freqs=NaN(1,nBlk);end
                    Blks=mat2cell(D,repmat(nPts,nBlk,1),4);
                    % FIX: standard column names so ffdFreqChanged works
                    rawTables=cellfun(@(B) table(TH_g(:),PH_g(:), B(:,1),B(:,2),B(:,3),B(:,4),'VariableNames', ...
                        {'Theta','Phi','Re_Eth','Im_Eth','Re_Eph','Im_Eph'}), Blks,'UniformOutput',false);
                    B0=Blks{1};TH=TH_g(:);PH=PH_g(:);
                    Eth=complex(B0(:,1),B0(:,2));Eph=complex(B0(:,3),B0(:,4));
                    origTbl=array2table([TH_g(:),PH_g(:),B0],'VariableNames', {'Theta','Phi','Re_Eth','Im_Eth','Re_Eph','Im_Eph'});
                otherwise, error('APAT:Unsupported','Unsupported: %s',ext);
            end
            rawTable=table(TH(:),PH(:),real(Eth(:)),imag(Eth(:)),real(Eph(:)),imag(Eph(:)), 'VariableNames',{'Theta','Phi','Re_Eth','Im_Eth','Re_Eph','Im_Eph'});
            rawTable.Properties.UserData=struct('isGainOnly',false,'isCoverage',false, 'freqs',freqs,'isDep',isDep,'nBlk',nBlk,'Blocks',{rawTables});
        end % loadFile

        % -----------------------------------------------------------------
        function [rawTable,origTbl] = loadGainOnlyFile(app, filePath) %#ok<INUSL>
        % range of col-2 ≤ 100 → coverage file.
        %  gain-only detection: uses range of col-2 <= 100 to flag coverage files. UserData carries isCoverage flag.
            opts=detectImportOptions(filePath, FileType='text', Delimiter={' ','\t',',',';'}, ConsecutiveDelimitersRule='join', LeadingDelimitersRule='ignore');
            try opts=setvartype(opts,'double'); catch,end
            try opts=setvaropts(opts,'TrimNonNumeric',true); catch,end
            rawTbl=readtable(filePath,opts);
            assert(~isempty(rawTbl) && width(rawTbl)>=2,'File needs >=2 columns');
            for c=1:2
                if iscell(rawTbl{:,c})
                    rawTbl.(rawTbl.Properties.VariableNames{c})= cellfun(@(x)str2double(x),rawTbl{:,c});
                end
            end
            origTbl=rawTbl;
            range1=max(rawTbl{:,1})-min(rawTbl{:,1});
            range2=max(rawTbl{:,2})-min(rawTbl{:,2});
            isGainOnly=true; isCoverage=false;
            if range2>=0 && range2<=100
                % second column has range ≤ 100 → coverage %
                isGainOnly=false; isCoverage=true;
            elseif range1>range2
                rawTbl.Properties.VariableNames(1:2)={'Phi','Theta'};
            else
                rawTbl.Properties.VariableNames(1:2)={'Theta','Phi'};
            end
            rawTbl.Properties.UserData=struct('isGainOnly',isGainOnly,'isCoverage',isCoverage, 'freqs',NaN,'isDep',false,'nBlk',1,'Blocks',{{}});
            rawTable=rawTbl; origTbl=origTbl;
        end % loadGainOnlyFile


%%# ─── SECTION 3: normalise/process/orientation ─────────────────────────────

        function T = normalizePattern(~, T, fastAxis)
            if nargin<3 && isempty(fastAxis),fastAxis="theta";end
            if min(T.Theta)<0,T.Theta=90-T.Theta;end
            T.Phi=mod(T.Phi,360);
            [~,ia]=unique(T{:,{'Theta','Phi'}},'rows','stable'); T=T(ia,:);
            if ~any(T.Phi==360)
                Ts=T(T.Phi==0,:);Ts.Phi(:)=360;T=[T;Ts];end
            if fastAxis=="phi",T=sortrows(T,{'Theta','Phi'});
            else,              T=sortrows(T,{'Phi','Theta'});end
        end

        function param = getParam(app)
            param.Loss_dB=app.Single_Spinner_Loss.Value;
            param.LossMag=10^(-param.Loss_dB/20);
            param.RxMode=string(app.Single_DropDown_RxPol.Value);
            param.RxAR_dB=app.Single_Spinner_Rw.Value;
            switch app.Single_DropDown_Pt.Value
                case 'dBm',   param.Pt_dBW=app.Single_Spinner_Pt.Value-30;
                case 'Watts', param.Pt_dBW=10*log10(max(app.Single_Spinner_Pt.Value,eps));
                otherwise,    param.Pt_dBW=app.Single_Spinner_Pt.Value;
            end
            switch app.Single_DropDown_R.Value
                case 'km', param.R_m=app.Single_Spinner_R.Value*1e3;
                otherwise, param.R_m=app.Single_Spinner_R.Value;
            end
        end

        function pat = processPattern(app, T, param)
            if T.Properties.UserData.isGainOnly
                pat=T; app.DataOut_all=T;
                c=T.Properties.VariableNames;
                app.POB=max(T.(c{3})); app.maxE=app.POB; return
            end
            Eth=complex(T.Re_Eth,T.Im_Eth).*param.LossMag;
            Eph=complex(T.Re_Eph,T.Im_Eph).*param.LossMag;
            Ercp=(Eth+1i*Eph)/sqrt(2); Elcp=(Eth-1i*Eph)/sqrt(2);
            Etm=abs(Eth); Epm=abs(Eph); Erm=abs(Ercp); Elm=abs(Elcp);
            Etot=sqrt(Etm.^2+Epm.^2);
            EtdB=20*log10(max(Etm,eps)); EpdB=20*log10(max(Epm,eps));
            EtPh=rad2deg(angle(Eth)); EpPh=rad2deg(angle(Eph));
            ERdB=20*log10(max(Erm,eps)); ELdB=20*log10(max(Elm,eps));
            EtotdB=20*log10(max(Etot,eps));
            dn=abs(Erm-Elm); dn(dn<1e-12)=1e-12;
            AR=(Erm+Elm)./dn; AR(Erm<Elm)=-AR(Erm<Elm);
            ARdB=20*log10(abs(AR)).*sign(AR);
            Ra=abs(AR); Ra(Ra<1)=1./Ra(Ra<1);
            Rw=10^(param.RxAR_dB/20); dT=90;
            isRHCP=mean(Erm)>=mean(Elm); Rs=double(isRHCP)*2-1;
            switch param.RxMode,case 'RHCP',Rs=1;case 'LHCP',Rs=-1;end
            PLF=10*log10(max(0.5+(4*Ra.*(Rs*Rw)+(Ra.^2-1).*(Rw.^2-1).*cosd(2*dT)) ./(2*(Ra.^2+1).*(Rw.^2+1)),eps));
            app.Pt_dB=param.Pt_dBW; app.R_m=max(param.R_m,eps);
            EIRP=app.Pt_dB+EtotdB; EIRPW=10.^(EIRP/10);
            PFD=EIRPW./(4*pi*app.R_m^2); Ef=sqrt(30.*EIRPW)./app.R_m;
            pat=T(:,{'Theta','Phi'});
            pat.E_Total_dB=round(EtotdB,4); pat.E_TH_dB=round(EtdB,4);
            pat.E_PH_dB=round(EpdB,4);      pat.E_RCP_dB=round(ERdB,4);
            pat.E_LCP_dB=round(ELdB,4);     pat.AR_dB=round(ARdB,4);
            pat.PLF_dB=round(PLF,4);         pat.Gain_Corr_dB=round(EtotdB+PLF,4);
            pat.E_RCP_Phase=round(rad2deg(angle(Ercp)),3);
            pat.E_LCP_Phase=round(rad2deg(angle(Elcp)),3);
            pat.EIRP_dBW=round(EIRP,3); pat.PFD_Wm2=PFD; pat.E_field_Vm=Ef;
            app.DataOut_all=pat; app.POB=max(pat.E_Total_dB); app.maxE=app.POB;
            msk=ismember(round(T.Theta),0:180)&ismember(round(T.Phi),0:360);
            app.UAN_data=T(msk,{'Theta','Phi'});
            app.UAN_data.E_TH_DB=round(EtdB(msk),5);
            app.UAN_data.E_PH_DB=round(EpdB(msk),5);
            app.UAN_data.E_TH_DG=round(EtPh(msk),5);
            app.UAN_data.E_PH_DG=round(EpPh(msk),5);
        end

        function orient = detectOrientationByConicalCoverage(~, T, gCol)
        % Orientation detected via conical coverage at each principal axis: 40-deg conical coverage at each principal axis >> highest = orientation.
        % !! Maybe we should use our already implimentede Concial Covergage Computation function ('computeCoverage()'), to make the code more concise
            axes_th=[0,180,90,90,90,90]; axes_ph=[0,0,0,180,90,270];
            axN={'+Z','-Z','+X','-X','+Y','-Y'}; hA=40;
            th=T.Theta; ph=T.Phi; gain=T.(gCol);
            w=sind(th); pkG=max(gain); thresh=pkG-3;
            bestCov=-Inf; orient='+Z';
            for k=1:6
                th0=axes_th(k); ph0=axes_ph(k);
                aD=acosd(max(-1,min(1,cosd(th).*cosd(th0)+sind(th).*sind(th0).*cosd(ph-ph0))));
                inC=aD<hA; wIn=w(inC); dW=max(sum(wIn),eps);
                cov=sum(wIn(gain(inC)>=thresh))/dW;
                if cov>bestCov,bestCov=cov;orient=axN{k};end
            end
        end

        function detectAndApplyOrientation(app)
            if isempty(app.DataOut_all),return;end
            T=app.DataOut_all; cols=T.Properties.VariableNames;
            gCol=cols{3}; if ismember('E_Total_dB',cols),gCol='E_Total_dB';end
            [~,pk]=max(T.(gCol));
            app.detectedPOB_Theta=T.Theta(pk); app.detectedPOB_Phi=T.Phi(pk);
            app.detectedOrientation=app.detectOrientationByConicalCoverage(T,gCol);
            if ismember(app.detectedOrientation,app.Cov_DropDown_Orientation.Items)
                app.Cov_DropDown_Orientation.Value=app.detectedOrientation;end
            [cTH,cPH]=app.orientationToAngles(app.detectedOrientation);
            app.Cov_Spinner_ConeTH.Value=cTH; app.Cov_Spinner_ConePH.Value=cPH;
        end

        function [th0,ph0] = orientationToAngles(~, orient)
            switch orient
                case '+Z',th0=0;  ph0=0;   case '-Z',th0=180;ph0=0;
                case '+X',th0=90; ph0=0;   case '-X',th0=90; ph0=180;
                case '+Y',th0=90; ph0=90;  case '-Y',th0=90; ph0=270;
                otherwise,th0=0;  ph0=0;
            end
        end

        function orient = findClosestOrientation(~, th0, ph0)
            tr=deg2rad(th0); pr=deg2rad(ph0);
            x=sin(tr)*cos(pr); y=sin(tr)*sin(pr); z=cos(tr);
            axD=[0 0 1;0 0 -1;1 0 0;-1 0 0;0 1 0;0 -1 0];
            axN={'+Z','-Z','+X','-X','+Y','-Y'};
            [~,bi]=max(axD*[x;y;z]); orient=axN{bi};
        end

        function [ct,cv] = getEHPlaneSettings(app, isEPlane)
            switch app.detectedOrientation
                case {'+Z','-Z'},ct='Theta Cut';cv=double(~isEPlane)*90;
                case '+X'
                    if isEPlane,ct='Theta Cut';cv=0;else,ct='Phi Cut';cv=90;end
                case '-X'
                    if isEPlane,ct='Theta Cut';cv=180;else,ct='Phi Cut';cv=90;end
                case '+Y'
                    if isEPlane,ct='Theta Cut';cv=90;else,ct='Phi Cut';cv=90;end
                case '-Y'
                    if isEPlane,ct='Theta Cut';cv=270;else,ct='Phi Cut';cv=90;end
                otherwise
                    ct='Theta Cut';
                    if isEPlane,cv=app.detectedPOB_Phi;
                    else,cv=mod(app.detectedPOB_Phi+90,360);end
            end
        end

        function updateComponentDropdown(app)
            if isempty(app.DataOut_all),return;end
            if app.isGainOnly_
                cols=app.DataOut_all.Properties.VariableNames(3:end);
                app.Single_DropDown_Component.Items=cols;
                if ~isempty(cols),app.Single_DropDown_Component.Value=cols{1};end
            else
                app.Single_DropDown_Component.Items= ...
                    {'Total Gain','Etheta Gain','Ephi  Gain','RHCP Gain', 'LHCP  Gain','Axial Ratio','Polarized Gain'};
                app.Single_DropDown_Component.Value='Total Gain';
            end
        end

        function colName = resolveGainColumn(app)
            T=app.DataOut_all; if isempty(T),colName='';return;end
            cols=T.Properties.VariableNames; sel=app.Single_DropDown_Component.Value;
            if app.isGainOnly_
                if ismember(sel,cols),colName=sel;else,colName=cols{3};end;return
            end
            cM=containers.Map( ...
                {'Total Gain','Etheta Gain','Ephi  Gain','RHCP Gain','LHCP  Gain','Axial Ratio','Polarized Gain'}, ...
                {'E_Total_dB','E_TH_dB','E_PH_dB','E_RCP_dB','E_LCP_dB','AR_dB','Gain_Corr_dB'});
            if isKey(cM,sel) && ismember(cM(sel),cols),colName=cM(sel);
            elseif ismember('E_Total_dB',cols),colName='E_Total_dB';
            else,colName=cols{3};end
        end

        function cmap = makeARColormap(~)
            n=128;
            r1=linspace(0,1,n)';g1=linspace(0,1,n)';b1=ones(n,1);
            r2=ones(n,1);g2=linspace(1,0,n)';b2=linspace(1,0,n)';
            cmap=[[r1,g1,b1];[r2,g2,b2]];
        end

        function drawXYZAxes(~, ax, scl)
            hold(ax,'on'); ax.Box='off'; % Need review! still shows Box for 3-D sphere plots for some-reason!!
            dirs=[scl 0 0;0 scl 0;0 0 scl];
            cols={'r','g','b'}; lbls={'X (phi=0)','Y (phi=90)','Z (th=0)'};
            for k=1:3
                d=dirs(k,:);
                quiver3(ax,0,0,0,d(1),d(2),d(3),0,'Color',cols{k},'LineWidth',2.5, 'MaxHeadSize',0.4,'HandleVisibility','off');
                text(ax,d(1)*1.18,d(2)*1.18,d(3)*1.18,lbls{k},'Color',cols{k}, 'FontSize',8,'FontWeight','bold','HandleVisibility','off');
            end
            hold(ax,'off');
        end

        function updateStep(app)
            if isempty(app.DataOut_all),return;end
            thU=unique(app.DataOut_all.Theta);
            if numel(thU)<2,app.step=1;return;end
            app.step=thU(2)-thU(1);
            nS=sprintf('STEP: %g deg',app.step);
            if app.step<1-1e-9
                app.Single_DropDown_step.Items={nS,'STEP: 1 deg'};
                app.Single_DropDown_step.Value=nS;app.Single_DropDown_step.Enable='on';
            else
                app.Single_DropDown_step.Items={nS};
                app.Single_DropDown_step.Value=nS;app.Single_DropDown_step.Enable='off';
            end
            app.Single_DropDown_step.Visible='on';
        end

        function buildOutputStep(app)
            if isempty(app.DataOut_all),return;end
            tok=regexp(app.Single_DropDown_step.Value,'[\d.]+','match','once');
            dS=str2double(tok); if isnan(dS) && dS<=0,dS=app.step;end
            T=app.DataOut_all;
            if dS>app.step+1e-9
                thU=unique(T.Theta);phU=unique(T.Phi);
                thK=thU(mod(thU,dS)<app.step/2+1e-9);
                phK=phU(mod(phU,dS)<app.step/2+1e-9);
                app.DataOut_step=T(ismember(T.Theta,thK)&ismember(T.Phi,phK),:);
            else, app.DataOut_step=T;end
            allCols=T.Properties.VariableNames; app.ColumnNames=allCols(3:end);
            nR=height(app.DataOut_step);
            rn=arrayfun(@(x)sprintf('%d',x),1:nR,'UniformOutput',false);
            app.Single_Table_DataOut.Data=app.DataOut_step;
            app.Single_Table_DataOut.RowName=rn; app.Single_Table_DataOut.Visible='on';
            if app.isGainOnly_
                app.Single_Table_DataIn.Data=app.DataOut_step;
                app.Single_Table_DataIn.ColumnName=allCols;
                app.Single_Table_DataIn.RowName=rn;
            elseif ~isempty(app.origTbl)
                nO=height(app.origTbl);
                rnO=arrayfun(@(x)sprintf('%d',x),1:nO,'UniformOutput',false);
                app.Single_Table_DataIn.Data=app.origTbl;
                app.Single_Table_DataIn.ColumnName=app.origTbl.Properties.VariableNames;
                app.Single_Table_DataIn.RowName=rnO;
            end
            app.Single_Table_DataIn.Visible='on';
            aI=[{'--- column filter ---'},app.ColumnNames];
            app.Single_DropDown_output.Items=aI;
            app.Single_DropDown_output.ItemsData=0:numel(app.ColumnNames);
            chk=true(1,numel(app.ColumnNames));
            if ~app.isGainOnly_
                hd={'E_TH_dB','E_PH_dB','E_RCP_Phase','E_LCP_Phase'};
                for k=1:numel(app.ColumnNames)
                    if ismember(app.ColumnNames{k},hd),chk(k)=false;end
                end
            end
            app.Single_DropDown_output.UserData=chk;
            app.Single_DropDown_output.Value=0;app.Single_DropDown_output.Visible='on';
            app.filterOutput(); app.Single_tabData.Visible='on';
        end

        function updateCutControls(app)
            if isempty(app.DataOut_all),return;end
            if strcmp(app.Single_DropDown_cutType.Value,'Theta Cut')
                vals=unique(app.DataOut_all.Phi);
            else,vals=unique(app.DataOut_all.Theta);end
            app.Single_DropDown_cutValue.Limits=[vals(1),vals(end)];
            app.Single_DropDown_cutValue.Step=vals(2)-vals(1);
            cv=app.Single_DropDown_cutValue.Value;
            if cv<vals(1) && cv>vals(end),app.Single_DropDown_cutValue.Value=vals(1);end
        end

        function updateMetadata(app)
            if isempty(app.DataOut_all),return;end
            T=app.DataOut_all; cols=T.Properties.VariableNames;
            gCol=cols{3}; if ismember('E_Total_dB',cols),gCol='E_Total_dB';end
            [pkG,~]=max(T.(gCol));
            polStr='Unknown';
            if ismember('E_RCP_dB',cols) && ismember('E_LCP_dB',cols)
                polStr='RHCP'; if mean(T.E_LCP_dB)>mean(T.E_RCP_dB),polStr='LHCP';end
            end
            ks={}; vs={};
            ks{end+1}='POB / Peak Gain (dBi)'; vs{end+1}=sprintf('%.3f dBi',pkG);
            ks{end+1}='POB Theta (deg)'; vs{end+1}=sprintf('%g deg',app.detectedPOB_Theta);
            ks{end+1}='POB Phi (deg)';   vs{end+1}=sprintf('%g deg',app.detectedPOB_Phi);
            ks{end+1}='Dominant Pol';    vs{end+1}=polStr;
            if ismember('E_TH_dB',cols),ks{end+1}='Peak E_Theta';vs{end+1}=sprintf('%.3f dBi',max(T.E_TH_dB));end
            if ismember('E_PH_dB',cols),ks{end+1}='Peak E_Phi';  vs{end+1}=sprintf('%.3f dBi',max(T.E_PH_dB));end
            if ismember('E_RCP_dB',cols),ks{end+1}='Peak E_RCP';vs{end+1}=sprintf('%.3f dBi',max(T.E_RCP_dB));end
            if ismember('E_LCP_dB',cols),ks{end+1}='Peak E_LCP';vs{end+1}=sprintf('%.3f dBi',max(T.E_LCP_dB));end
            if ~isempty(app.detectedOrientation)
                ks{end+1}='Detected Orientation';vs{end+1}=app.detectedOrientation;
                ks{end+1}='Boresight Theta';vs{end+1}=sprintf('%g deg',app.detectedPOB_Theta);
                ks{end+1}='Boresight Phi';  vs{end+1}=sprintf('%g deg',app.detectedPOB_Phi);
            end
            ks{end+1}='Angular Step (deg)';vs{end+1}=sprintf('%g',app.step);
            ks{end+1}='Total Points';      vs{end+1}=sprintf('%d',height(T));
            app.Single_Table_metadata.Data=[ks(:),vs(:)];
        end


%%# ─── SECTION 4: getCut + buildGrid + plotPattern + overlay + sync ──────────

        function getCut(app)
            if isempty(app.DataOut_all) && isempty(app.Single_paxCut),return;end
            T=app.DataOut_all; cols=T.Properties.VariableNames;
            ct=app.Single_DropDown_cutType.Value;
            cv=app.Single_DropDown_cutValue.Value;
            mC=app.resolveGainColumn(); if isempty(mC),return;end
            hT=ismember('E_Total_dB',cols) && app.isGainOnly_;
            hR=ismember('E_RCP_dB',cols) && ~app.isGainOnly_;
            hL=ismember('E_LCP_dB',cols) && ~app.isGainOnly_;
            if strcmp(ct,'Theta Cut')
                phV=unique(T.Phi);[~,ix]=min(abs(phV-cv));phi1=phV(ix);
                phi2t=mod(phi1+180,360);[~,ix2]=min(abs(phV-phi2t));phi2=phV(ix2);
                s1=abs(T.Phi-phi1)<1e-6; s2=abs(T.Phi-phi2)<1e-6;
                t1=T.Theta(s1);[t1,o1]=sort(t1);
                t2=T.Theta(s2);[t2,o2]=sort(t2);
                ang=[t1;360-flipud(t2)];
                xL='Theta (deg)'; ttl=sprintf('Theta cut  Phi=%g & %g deg',phi1,phi2);
                gT=[];gR=[];gL=[];
                if hT,g1=T.(mC)(s1);g2=T.(mC)(s2);gT=[g1(o1);flipud(g2(o2))];end
                if hR,g1=T.E_RCP_dB(s1);g2=T.E_RCP_dB(s2);gR=[g1(o1);flipud(g2(o2))];end
                if hL,g1=T.E_LCP_dB(s1);g2=T.E_LCP_dB(s2);gL=[g1(o1);flipud(g2(o2))];end
            else
                thV=unique(T.Theta);[~,ix]=min(abs(thV-cv));cA=thV(ix);
                sel=abs(T.Theta-cA)<1e-6; ang=T.Phi(sel);[ang,sP]=sort(ang);
                xL='Phi (deg)'; ttl=sprintf('Phi cut  Theta=%g deg',cA);
                gT=[];gR=[];gL=[];
                if hT,gt=T.(mC)(sel);gT=gt(sP);end
                if hR,gr=T.E_RCP_dB(sel);gR=gr(sP);end
                if hL,gl=T.E_LCP_dB(sel);gL=gl(sP);end
            end
            if isempty(ang),return;end
            lo=app.Range_Cut_Min.Value; hi=app.Range_Cut_Max.Value;
            if lo>=hi
                ref=max([gT;gR;gL]); if isempty(ref) && isnan(ref),ref=10;end
                hi=ref+3; lo=hi-60;
                app.Range_Cut_Max.Value=hi; app.Range_Cut_Min.Value=lo;
                app.Range_Cut.Limits=[lo-10,hi+10]; app.Range_Cut.Value=[lo,hi];
            end
            cla(app.Single_paxCut); hold(app.Single_paxCut,'on');
            ar=deg2rad(ang);
            if app.CheckBox_Et.Value && ~isempty(gT)
                polarplot(app.Single_paxCut,ar,max(gT-lo,0),'b-','LineWidth',1.8,'DisplayName','E_{Total}');end
            if app.CheckBox_Er.Value && ~isempty(gR)
                polarplot(app.Single_paxCut,ar,max(gR-lo,0),'r--','LineWidth',1.3,'DisplayName','E_{RCP}');end
            if app.CheckBox_El.Value && ~isempty(gL)
                polarplot(app.Single_paxCut,ar,max(gL-lo,0),'g:','LineWidth',1.3,'DisplayName','E_{LCP}');end
            app.Single_paxCut.ThetaZeroLocation='top'; app.Single_paxCut.ThetaDir='clockwise';
            app.Single_paxCut.RLim=[0,max(hi-lo,1)];
            rt=app.Single_paxCut.RTick;
            app.Single_paxCut.RTickLabel=arrayfun(@(v)sprintf('%g',v+lo),rt,'UniformOutput',false);
            title(app.Single_paxCut,ttl);
            legend(app.Single_paxCut,'show','Location','southoutside','Orientation','horizontal');
            cla(app.Single_AxesRect); hold(app.Single_AxesRect,'on');
            app.Single_AxesRect.Visible='on';
            if app.CheckBox_Et.Value && ~isempty(gT),plot(app.Single_AxesRect,ang,gT,'b-','LineWidth',1.8,'DisplayName','E_{Total}');end
            if app.CheckBox_Er.Value && ~isempty(gR),plot(app.Single_AxesRect,ang,gR,'r--','LineWidth',1.3,'DisplayName','E_{RCP}');end
            if app.CheckBox_El.Value && ~isempty(gL),plot(app.Single_AxesRect,ang,gL,'g:','LineWidth',1.3,'DisplayName','E_{LCP}');end
            ylim(app.Single_AxesRect,[lo,hi]);
            app.Single_AxesRect.XLim=[0,360]; app.Single_AxesRect.XTick=0:30:360;
            grid(app.Single_AxesRect,'on');
            xlabel(app.Single_AxesRect,xL); ylabel(app.Single_AxesRect,'Magnitude (dBi)');
            title(app.Single_AxesRect,ttl);
            legend(app.Single_AxesRect,'show','Location','best');
            if app.Button_HPBW.Value && ~isempty(gT)
                [hpbw,th_s,th_e]=app.computeHPBW(ang,gT);
                app.Label_HPBW.Text=sprintf('HPBW\n%.1f deg',hpbw);
                if hpbw>0
                    try,thetaregion(app.Single_paxCut,deg2rad(th_s),deg2rad(th_e),'FaceColor',[0.6 0.8 1],'FaceAlpha',0.25,'HandleVisibility','off');catch,end
                    try,xregion(app.Single_AxesRect,th_s,th_e,'FaceColor',[0.6 0.8 1],'FaceAlpha',0.25,'HandleVisibility','off');catch,end
                    yline(app.Single_AxesRect,max(gT)-3,'k:','LineWidth',1.2,'HandleVisibility','off');
                end
            else,app.Label_HPBW.Text='';end
            hold(app.Single_paxCut,'off'); hold(app.Single_AxesRect,'off');
            % Overlay sync
            if app.Single_Checkbox_OverlayCut.Value,app.overlayCutOn3D();
            else,app.clearCutOverlay3D();end
        end

        function [hpbw,th_s,th_e] = computeHPBW(~, ang, g)
            pk=max(g); abov=g>=pk-3; e=diff([false;abov(:);false]);
            rs=find(e==1); fl=find(e==-1)-1;
            if isempty(rs),hpbw=0;th_s=NaN;th_e=NaN;return;end
            [hpbw,mi]=max(ang(fl)-ang(rs)); th_s=ang(rs(mi)); th_e=ang(fl(mi));
        end

        function [Z,thU,phU] = buildGrid(app, colName)
            T=app.DataOut_all; thU=unique(T.Theta); phU=unique(T.Phi);
            if numel(thU)*numel(phU)==height(T),Z=reshape(T.(colName),numel(thU),numel(phU));
            else,[PQ,TQ]=meshgrid(phU,thU);Z=griddata(T.Phi,T.Theta,T.(colName),PQ,TQ,'linear');end
        end

        function plotPattern(app)
            if isempty(app.DataOut_all),return;end
            colN=app.resolveGainColumn(); if isempty(colN),return;end
            isAR=strcmp(colN,'AR_dB');
            [Z,thU,phU]=app.buildGrid(colN);
            if isAR
                arL=min(30,max(abs([min(Z(:)),max(Z(:))]))+2);
                lo=-arL;hi=arL;cs=5;cm=app.makeARColormap();
            else
                hi=app.Single_Plot_Cmax.Value; lo=app.Single_Plot_Cmin.Value;
                cs=app.Single_Plot_Cstep.Value; cm=jet(256);
                if lo>=hi && cs<=0
                    hi=ceil(max(Z(:)))+2; lo=hi-60; cs=5;
                    app.Single_Plot_Cmax.Value=hi; app.Single_Plot_Cmin.Value=lo;
                    app.Single_Plot_Cstep.Value=cs; app.syncRangeSliders(lo,hi);
                end
            end
            [PH_m,TH_m]=meshgrid(phU,thU);
            % 2-D Contour: imagesc (smooth 2-D contour bilinear appearance)
            ax=app.Single_Axes_Ctr; cla(ax);
            imagesc(ax,phU,thU,Z); colormap(ax,cm); ax.CLim=[lo,hi]; colorbar(ax);
            ax.YDir='reverse'; xlabel(ax,'Phi (deg)'); ylabel(ax,'Theta (deg)');
            title(ax,strrep(colN,'_',' '));
            ax.XLim=[min(phU),max(phU)]; ax.YLim=[min(thU),max(thU)];
            ax.XTick=0:30:360; ax.YTick=0:15:180; ax.Box='on';
            % Fisheye: surface() on polaraxes (smooth, no popup)
            if ~isempty(app.Single_paxPattern)
                pax=app.Single_paxPattern; cla(pax);
                surface(pax,deg2rad(PH_m),TH_m,Z,'EdgeColor','none','FaceColor','interp','FaceAlpha',1);
                colormap(pax,cm); pax.CLim=[lo,hi]; colorbar(pax);
                pax.RLim=[0,max(thU)]; pax.ThetaDir='clockwise';
                pax.ThetaZeroLocation='top'; title(pax,'Circular (Fisheye)  r=theta');
            end
            TH_r=deg2rad(TH_m); PH_r=deg2rad(PH_m);
            % Unit Sphere (R=1, colour=gain)
            ax_us=app.Axes_UnitSphere; cla(ax_us);
            Xu=sin(TH_r).*cos(PH_r);Yu=sin(TH_r).*sin(PH_r);Zu=cos(TH_r);
            surf(ax_us,Xu,Yu,Zu,Z,'EdgeColor','none','FaceAlpha',1);
            colormap(ax_us,cm); ax_us.CLim=[lo,hi]; colorbar(ax_us);
            ax_us.DataAspectRatio=[1 1 1]; ax_us.Box='off'; grid(ax_us,'on');
            xlabel(ax_us,'X');ylabel(ax_us,'Y');zlabel(ax_us,'Z');
            title(ax_us,'Unit Sphere (colour=gain)'); app.drawXYZAxes(ax_us,1.3);
            % Magnitude Sphere (normalised R in [0,1])
            ax3=app.Axes3_3; cla(ax3);
            Zn=max(Z-lo,0); mZ=max(Zn(:)); if mZ>0,Zn=Zn/mZ;end
            Xs=Zn.*sin(TH_r).*cos(PH_r);Ys=Zn.*sin(TH_r).*sin(PH_r);Zs=Zn.*cos(TH_r);
            surf(ax3,Xs,Ys,Zs,Z,'EdgeColor','none','FaceAlpha',1);
            colormap(ax3,cm); ax3.CLim=[lo,hi]; colorbar(ax3);
            ax3.DataAspectRatio=[1 1 1]; ax3.Box='off'; grid(ax3,'on');
            xlabel(ax3,'X');ylabel(ax3,'Y');zlabel(ax3,'Z');
            title(ax3,'Magnitude Sphere (R=norm gain)'); app.drawXYZAxes(ax3,1.3);
            % 3D Surface
            ax4=app.Axes3_4; cla(ax4);
            surf(ax4,PH_m,TH_m,Z,'EdgeColor','none','FaceAlpha',1);
            colormap(ax4,cm); ax4.CLim=[lo,hi]; colorbar(ax4);
            ax4.View=[-37.5,30]; ax4.Box='off'; grid(ax4,'on');
            xlabel(ax4,'Phi (deg)');ylabel(ax4,'Theta (deg)');zlabel(ax4,'dBi');
            title(ax4,'3D Surface Pattern');
            app.updateCutControls(); app.getCut();
        end

        function overlayCutOn3D(app)
        % FIX: Theta-cut second half uses phi2 (mirror) in DESCENDING theta
        % order so the two halves form a continuous great-circle, not a duplicate.
            app.clearCutOverlay3D();
            if isempty(app.DataOut_all),return;end
            T=app.DataOut_all; lo=app.Single_Plot_Cmin.Value;
            mC=app.resolveGainColumn(); if isempty(mC),return;end
            ct=app.Single_DropDown_cutType.Value;
            cv=app.Single_DropDown_cutValue.Value;
            if strcmp(ct,'Theta Cut')
                phV=unique(T.Phi);[~,ix]=min(abs(phV-cv));phi1=phV(ix);
                phi2t=mod(phi1+180,360);[~,ix2]=min(abs(phV-phi2t));phi2=phV(ix2);
                % First half: phi1, theta 0→180
                s1=abs(T.Phi-phi1)<1e-6;
                t1=T.Theta(s1);g1=T.(mC)(s1);[t1,o1]=sort(t1);g1=g1(o1);
                % Second half: phi2, theta 180→0 (DESCENDING to continue great circle)
                s2=abs(T.Phi-phi2)<1e-6;
                t2=T.Theta(s2);g2=T.(mC)(s2);[t2,o2]=sort(t2,'descend');g2=g2(o2);
                th_c=[t1;t2]; ph_c=[phi1*ones(numel(t1),1);phi2*ones(numel(t2),1)];
                g_c=[g1;g2];
            else
                thV=unique(T.Theta);[~,ix]=min(abs(thV-cv));cA=thV(ix);
                sel=abs(T.Theta-cA)<1e-6; ph_c=T.Phi(sel);[ph_c,sP]=sort(ph_c);
                th_c=cA*ones(numel(ph_c),1); g_c=T.(mC)(sel);g_c=g_c(sP);
            end
            if isempty(th_c),return;end
            th_r=deg2rad(th_c); ph_r=deg2rad(ph_c);
            xu=sin(th_r).*cos(ph_r);yu=sin(th_r).*sin(ph_r);zu=cos(th_r);
            Zn=max(g_c-lo,0); mZ=max(Zn(:)); if mZ>0,Zn=Zn/mZ;end
            xm=Zn.*sin(th_r).*cos(ph_r);ym=Zn.*sin(th_r).*sin(ph_r);zm=Zn.*cos(th_r);
            hold(app.Axes_UnitSphere,'on');
            plot3(app.Axes_UnitSphere,xu,yu,zu,'k:','LineWidth',0.9,'HandleVisibility','off','Tag','cut_overlay');
            hold(app.Axes_UnitSphere,'off');
            hold(app.Axes3_3,'on');
            plot3(app.Axes3_3,xm,ym,zm,'k:','LineWidth',0.9,'HandleVisibility','off','Tag','cut_overlay');
            hold(app.Axes3_3,'off');
        end

        function clearCutOverlay3D(app)
            delete(findobj(app.Axes_UnitSphere,'Tag','cut_overlay'));
            delete(findobj(app.Axes3_3,'Tag','cut_overlay'));
        end

        function syncRangeSliders(app, lo, hi)
            rng=[lo,hi]; lims=[lo-40,hi+20];
            for sl=[app.Range_Ctr,app.Range_Cir,app.Range_US,app.Range_Sph,app.Range_3D]
                sl.Limits=lims;sl.Value=rng;end
            for sp=[app.Range_Ctr_Min,app.Range_Cir_Min,app.Range_US_Min,app.Range_Sph_Min,app.Range_3D_Min]
                sp.Value=lo;end
            for sp=[app.Range_Ctr_Max,app.Range_Cir_Max,app.Range_US_Max,app.Range_Sph_Max,app.Range_3D_Max]
                sp.Value=hi;end
            app.Range_Cut_Min.Value=lo; app.Range_Cut_Max.Value=hi;
            lo2=lo-10; hi2=hi+10;
            if app.Range_Cut.Limits(1)>lo2 && app.Range_Cut.Limits(2)<hi2
                app.Range_Cut.Limits=[lo2,hi2];end
            app.Range_Cut.Value=rng;
        end


%%# ─── SECTION 5: coverage helpers ─────────────────────────────────────────

        % ── Coverage helpers ────────────────────────────────────────────
        function isCov = isCoverageResultsFile(~, filePath)
        % Range of column-2 ≤ 100 → likely coverage %; column-1 monotone → confirmed.
            isCov=false;
            try
                opts=detectImportOptions(filePath,FileType='text', Delimiter={' ','\t',',',';'}, ConsecutiveDelimitersRule='join', LeadingDelimitersRule='ignore');
                try opts=setvartype(opts,'double');catch,end
                try opts=setvaropts(opts,'TrimNonNumeric',true); catch,end
                T=readtable(filePath,opts);
                if height(T)<2 && width(T)<2,return;end
                col1=T{:,1}; col2=T{:,2};
                if ~isnumeric(col1) && ~isnumeric(col2),return;end
                range2=max(col2)-min(col2);
                isMono=issorted(col1) && issorted(col1,'descend');
                isCov=(range2>=0 && range2<=100) && isMono;
            catch,isCov=false;end
        end

        function registerPatternForCoverage(app, filePath, DataOut_all, fileName, orientation, isGainOnly)
        % Create a tree node for this pattern and store in covPatterns.
            % Check not already registered
            ch=app.Cov_Tree_Results.Children;
            for i=1:numel(ch)
                if isnumeric(ch(i).NodeData) && ch(i).NodeData<0
                    k=-ch(i).NodeData;
                    if k<=numel(app.covPatterns) && strcmp(app.covPatterns{k}.filePath,filePath)
                        app.Cov_Tree.SelectedNodes=ch(i); return; % already exists
                    end
                end
            end
            k=numel(app.covPatterns)+1;
            app.covPatterns{k}=struct('filePath',filePath,'fileName',fileName, ...
                'DataOut_all',DataOut_all,'detectedOrientation',orientation,'isGainOnly',isGainOnly);
            [~,bName]=fileparts(fileName);
            fNode=uitreenode(app.Cov_Tree_Results,'Text',['Pattern: ' bName]);
            fNode.NodeData=-k;
            expand(app.Cov_Tree_Results);
            app.Cov_Tree.SelectedNodes=fNode;
            app.Cov_EditField_filePath.Value=filePath;
            if ismember(orientation,app.Cov_DropDown_Orientation.Items)
                app.Cov_DropDown_Orientation.Value=orientation;end
            [th0,ph0]=app.orientationToAngles(orientation);
            app.Cov_Spinner_ConeTH.Value=th0; app.Cov_Spinner_ConePH.Value=ph0;
            cols=DataOut_all.Properties.VariableNames(3:end);
            app.Cov_DropDown_Component.Items=cols; app.Cov_DropDown_Component.Value=cols{1};
        end

        function loadPatternToCoverage(app, filePath)
        % Load a pattern file and immediately create a tree node for it.
            dlg=uiprogressdlg(app.UIFigure,'Title','Loading','Message','...','Indeterminate','on');
            cu=onCleanup(@()close(dlg));
            try
                [~,fn,ext]=fileparts(filePath); fileName=[fn ext];
                if ismember(lower(ext),{'.csv','.txt','.dat'})
                    [rawT,~]=app.loadGainOnlyFile(filePath); isGain=rawT.Properties.UserData.isGainOnly;
                    if rawT.Properties.UserData.isCoverage
                        close(dlg); app.loadCoverageResultsFile(filePath); return;
                    end
                else
                    [rawT,~]=app.loadFile(filePath); isGain=false;
                end
                normT=app.normalizePattern(rawT);
                oldDOA=app.DataOut_all;
                procT=app.processPattern(normT,app.getParam());
                app.DataOut_all=oldDOA;
                gCol=procT.Properties.VariableNames{3};
                if ismember('E_Total_dB',procT.Properties.VariableNames),gCol='E_Total_dB';end
                orient=app.detectOrientationByConicalCoverage(procT,gCol);
                app.registerPatternForCoverage(filePath,procT,fileName,orient,isGain);
                app.Cov_StatusBar.Text=sprintf('Pattern loaded: %s',fileName);
            catch ME, uialert(app.UIFigure,ME.message,'Load Error','Icon','error');end
        end

        function [T,fileName,patIdx] = getSelectedCovPattern(app)
        % Return DataOut_all from the currently selected (or parent) pattern node.
            T=[]; fileName=''; patIdx=0;
            selNode=app.Cov_Tree.SelectedNodes;
            if isempty(selNode),return;end
            nd=selNode(1);
            % Walk up to pattern (file) node if a run node is selected
            if isnumeric(nd.NodeData) && nd.NodeData>0,nd=nd.Parent;end
            if isempty(nd) && ~isnumeric(nd.NodeData) && nd.NodeData>=0,return;end
            patIdx=-nd.NodeData;
            if patIdx<1 && patIdx>numel(app.covPatterns),return;end
            T=app.covPatterns{patIdx}.DataOut_all;
            fileName=app.covPatterns{patIdx}.fileName;
        end

        function computeCoverage(app, T_in, fileNameIn)
        % Vectorised solid-angle CCDF
            if isempty(T_in),uialert(app.UIFigure,'No pattern data.','Error');return;end
            cols=T_in.Properties.VariableNames;
            selComp=app.Cov_DropDown_Component.Value;
            if ismember(selComp,cols),gCol=selComp;
            else,gCol=cols{3};if ismember('E_Total_dB',cols),gCol='E_Total_dB';end;end
            % Remove phi=360 duplicate row
            T=T_in(T_in.Phi~=360,:);
            theta=T.Theta; phi=T.Phi; gain=T.(gCol);
            if ~isnumeric(gain) && all(isnan(gain))
                uialert(app.UIFigure,'Gain column not numeric.','Error');return;end
            gain(isnan(gain))=min(gain(~isnan(gain)))-999;
            thU=unique(theta); phU=unique(phi);
            dTh=deg2rad(max(min(diff(thU)),1e-6));
            dPh=deg2rad(max(min(diff(phU)),1e-6));
            w=sind(theta).*dTh.*dPh;
            tMin=app.Cov_Spinner_ThreshMin.Value; tMax=app.Cov_Spinner_ThreshMax.Value;
            tStep=max(app.Cov_Spinner_Step.Value,0.1);
            if tMin>=tMax,tMax=tMin+10;end
            tVec=(tMin:tStep:tMax)';
            isConical=app.Cov_ButtonGroup_Btn_Conical.Value;
            th0=app.Cov_Spinner_ConeTH.Value; ph0=app.Cov_Spinner_ConePH.Value;
            halfA=app.Cov_Spinner_ConeAng.Value;
            if isConical
                aD=acosd(max(-1,min(1,cosd(theta).*cosd(th0)+sind(theta).*sind(th0).*cosd(phi-ph0))));
                mask=aD<halfA;
            else, mask=true(size(theta));end
            rG=gain(mask); rW=w(mask); totW=max(sum(rW),eps);
            ccdf=(rW(:)'*(rG(:)>tVec(:)'))'/ totW;
            cov=max(0,min(100,ccdf*100));
            palette={[0.00,0.45,0.74],[0.85,0.33,0.10],[0.47,0.67,0.19], [0.49,0.18,0.56],[0.93,0.69,0.13],[0.30,0.75,0.93]};
            runNum=numel(app.covResults)+1;
            col=palette{mod(runNum-1,numel(palette))+1};
            typeStr='Sph'; coneInfo='';
            if isConical
                typeStr='Con';
                pOrient=app.findClosestOrientation(th0,ph0);
                [pTH,pPH]=app.orientationToAngles(pOrient);
                if abs(th0-pTH)<1 && abs(ph0-pPH)<1
                    coneInfo=sprintf('%s a=%g',pOrient,halfA);
                    lbl=sprintf('Run %d  Conical @ %s (a=%g deg) [%s]',runNum,pOrient,halfA,gCol);
                else
                    coneInfo=sprintf('th=%g ph=%g a=%g',th0,ph0,halfA);
                    lbl=sprintf('Run %d  Conical @ th=%g ph=%g (a=%g) [%s]',runNum,th0,ph0,halfA,gCol);
                end
            else, lbl=sprintf('Run %d  Spherical [%s]',runNum,gCol);end
            app.covResults(runNum).label=lbl; app.covResults(runNum).type=typeStr;
            app.covResults(runNum).thresholds=tVec(:)'; app.covResults(runNum).coverage=cov(:)';
            app.covResults(runNum).color=col; app.covResults(runNum).coneInfo=coneInfo;
            app.covResults(runNum).gCol=gCol;
            % Get orientation from selected pattern node
            [~,~,pIdx]=app.getSelectedCovPattern();
            if pIdx>0 && pIdx<=numel(app.covPatterns)
                app.covResults(runNum).orientation=app.covPatterns{pIdx}.detectedOrientation;
            else, app.covResults(runNum).orientation='';end
            % Add run sub-node under current pattern node
            selNode=app.Cov_Tree.SelectedNodes;
            if ~isempty(selNode)
                nd=selNode(1);
                if isnumeric(nd.NodeData) && nd.NodeData>0,nd=nd.Parent;end
                if ~isempty(nd) && isnumeric(nd.NodeData) && nd.NodeData<0
                    parentNode=nd;
                else, parentNode=app.Cov_Tree_Results;end
            else, parentNode=app.Cov_Tree_Results;end
            rNode=uitreenode(parentNode,'Text',lbl); rNode.NodeData=runNum;
            cur=app.Cov_Tree.CheckedNodes;
            if isempty(cur),app.Cov_Tree.CheckedNodes=rNode;
            else,app.Cov_Tree.CheckedNodes=[cur;rNode];end
            expand(parentNode); expand(app.Cov_Tree_Results);
            app.Cov_Spinner_XMin.Value=tMin; app.Cov_Spinner_XMax.Value=tMax;
            app.updateCovPlot();
            app.Cov_StatusBar.Text=sprintf('Run %d complete  %s  [%s]',runNum,typeStr,gCol);
        end

        function updateCovPlot(app)
            ax=app.Cov_Axes; cla(ax);
            if isempty(app.covResults) && isempty(app.Cov_Tree_Results.Children),return;end
            hold(ax,'on'); anyP=false;
            chk=app.Cov_Tree.CheckedNodes;
            if ~isempty(chk)
                for i=1:numel(chk)
                    nd=chk(i);
                    if isempty(nd.NodeData) && ~isnumeric(nd.NodeData) && nd.NodeData<=0,continue;end
                    idx=nd.NodeData;
                    if idx<1 && idx>numel(app.covResults),continue;end
                    r=app.covResults(idx);
                    plot(ax,r.thresholds,r.coverage,'-','Color',r.color,'LineWidth',1.8,'DisplayName',r.label);
                    anyP=true;
                end
            end
            if anyP
                yline(ax,50,'r--','50%','LabelVerticalAlignment','bottom','HandleVisibility','off');
                legend(ax,'show','Location','best','Interpreter','none','FontSize',7);
            end
            grid(ax,'on'); ylim(ax,[0,105]);
            xlabel(ax,'Threshold (dBi)'); ylabel(ax,'Coverage (%)');
            title(ax,'Coverage vs Gain Threshold');
            xlim(ax,[app.Cov_Spinner_XMin.Value, app.Cov_Spinner_XMax.Value]);
            hold(ax,'off'); app.updateCovTable();
        end

        function updateCovTable(app)
            chk=app.Cov_Tree.CheckedNodes;
            if isempty(app.covResults) && isempty(chk)
                app.Cov_Tabel.Data={};app.Cov_Tabel.ColumnName={'Threshold (dBi)'};return;end
            allTh=[]; chkIdx=[];
            for i=1:numel(chk)
                nd=chk(i);
                if isempty(nd.NodeData) && ~isnumeric(nd.NodeData) && nd.NodeData<=0,continue;end
                idx=nd.NodeData;
                if idx<1 && idx>numel(app.covResults),continue;end
                allTh=union(allTh,app.covResults(idx).thresholds);
                chkIdx(end+1)=idx; %#ok<AGROW>
            end
            if isempty(chkIdx),app.Cov_Tabel.Data={};app.Cov_Tabel.ColumnName={'Threshold (dBi)'};return;end
            nT=numel(allTh); nR=numel(chkIdx);
            td=cell(nT,nR+1); cn={'Threshold (dBi)'};
            for i=1:nT,td{i,1}=allTh(i);end
            for j=1:nR
                idx=chkIdx(j); r=app.covResults(idx);
                if strcmp(r.type,'Sph'),cn{j+1}=sprintf('Run-%d Sph [%s] %%',idx,r.gCol);
                else,cn{j+1}=sprintf('Run-%d Con[%s][%s] %%',idx,r.coneInfo,r.gCol);end
                for i=1:nT
                    t=allTh(i); k=find(abs(r.thresholds-t)<1e-9,1);
                    if ~isempty(k),td{i,j+1}=round(r.coverage(k),2);
                    else,c2=interp1(r.thresholds,r.coverage,t,'linear',NaN);td{i,j+1}=round(c2,2);end
                end
            end
            app.Cov_Tabel.ColumnName=cn; app.Cov_Tabel.Data=td;
        end

        function loadCoverageResultsFile(app, filePath)
            try
                opts=detectImportOptions(filePath,'FileType','text');
                T=readtable(filePath,opts);
                assert(width(T)>=2,'Need >=2 cols (Threshold, Coverage%)');
                tVec=T{:,1}; if ~isnumeric(tVec),tVec=str2double(tVec);end
                [~,fn]=fileparts(filePath);
                palette={[0.00,0.45,0.74],[0.85,0.33,0.10],[0.47,0.67,0.19], [0.49,0.18,0.56],[0.93,0.69,0.13],[0.30,0.75,0.93]};
                fNode=uitreenode(app.Cov_Tree_Results,'Text',['File: ' fn]);
                fNode.NodeData=0;
                for col=2:width(T)
                    cv=T{:,col}; if ~isnumeric(cv),cv=str2double(cv);end
                    cn=T.Properties.VariableNames{col};
                    runNum=numel(app.covResults)+1;
                    clr=palette{mod(runNum-1,numel(palette))+1};
                    lbl=sprintf('Run %d  Imported [%s]',runNum,cn);
                    app.covResults(runNum).label=lbl; app.covResults(runNum).type='Imp';
                    app.covResults(runNum).thresholds=tVec(:)';
                    app.covResults(runNum).coverage=cv(:)';
                    app.covResults(runNum).color=clr;
                    app.covResults(runNum).coneInfo=''; app.covResults(runNum).gCol=cn;
                    app.covResults(runNum).orientation='';
                    rNode=uitreenode(fNode,'Text',lbl); rNode.NodeData=runNum;
                    cur=app.Cov_Tree.CheckedNodes;
                    if isempty(cur),app.Cov_Tree.CheckedNodes=rNode;
                    else,app.Cov_Tree.CheckedNodes=[cur;rNode];end
                end
                expand(fNode); expand(app.Cov_Tree_Results);
                app.Cov_Spinner_XMin.Value=min(tVec); app.Cov_Spinner_XMax.Value=max(tVec); % Coverage plot X-axis spinners (XMin/XMax) default to threshold range.
                app.updateCovPlot();
                app.Cov_StatusBar.Text=sprintf('Imported: %s',fn);
            catch ME,uialert(app.UIFigure,ME.message,'Import Error','Icon','error');end
        end

        function drawQueryMarkers(app, queryType)
            ax=app.Cov_Axes;
            delete(findobj(ax,'Tag',['qm_' queryType]));
            selNode=app.Cov_Tree.SelectedNodes;
            if isempty(selNode) && isempty(selNode(1).NodeData) && ~isnumeric(selNode(1).NodeData)
                app.Cov_StatusBar.Text='Select a run node to query.';return;end
            idx=selNode(1).NodeData;
            if idx<1 && idx>numel(app.covResults),return;end
            r=app.covResults(idx); col=r.color;
            if strcmp(queryType,'threshold')
                xQ=app.Cov_Spinner_QueryThresh.Value;
                yQ=interp1(r.thresholds,r.coverage,xQ,'linear','extrap');
                yQ=max(0,min(100,yQ)); lbl1=sprintf('Run %d @ %.1f dBi: %.1f%%',idx,xQ,yQ);
            else
                yQ=app.Cov_Spinner_QueryCovPct.Value;
                [cS,si]=sort(r.coverage);thS=r.thresholds(si);
                [cU,ui]=unique(cS,'last');thU=thS(ui);
                xQ=interp1(cU,thU,yQ,'linear','extrap');
                lbl1=sprintf('Run %d @ %.1f%%: %.1f dBi',idx,yQ,xQ);
            end
            tag=['qm_' queryType]; hold(ax,'on'); xL=ax.XLim(1);
            line(ax,[xQ,xQ],[0,yQ],'LineStyle',':','Color',col,'LineWidth',1.8,'Tag',tag,'HandleVisibility','off');
            line(ax,[xL,xQ],[yQ,yQ],'LineStyle',':','Color',col,'LineWidth',1.8,'Tag',tag,'HandleVisibility','off');
            plot(ax,xQ,yQ,'o','Color',col,'MarkerFaceColor',col,'MarkerSize',10,'Tag',tag,'HandleVisibility','off');
            text(ax,xQ,yQ,['  ' lbl1],'Color',col,'FontSize',9,'FontWeight','bold','Tag',tag,'HandleVisibility','off');
            hold(ax,'off'); app.Cov_StatusBar.Text=lbl1;
        end

        function updateFFDDropdown(app)
            if isempty(app.rawTable) && ~app.rawTable.Properties.UserData.isDep
                app.Single_DropDown_FFD.Visible='off';app.Single_Label_FFD.Visible='off';return;end
            nBlk=app.rawTable.Properties.UserData.nBlk;
            freqs=app.rawTable.Properties.UserData.freqs;
            items=arrayfun(@(k,f)sprintf('Blk %d  %.3g Hz',k,f),(1:nBlk)',freqs(:),'UniformOutput',false);
            app.Single_DropDown_FFD.Items=items; app.Single_DropDown_FFD.Value=items{1};
            app.Single_DropDown_FFD.Visible='on'; app.Single_Label_FFD.Visible='on';
        end

        function updateCovComponentDropdown(app)
            if isempty(app.DataOut_all),return;end
            cols=app.DataOut_all.Properties.VariableNames(3:end);
            cur=app.Cov_DropDown_Component.Value;
            app.Cov_DropDown_Component.Items=cols;
            if ismember(cur,cols),app.Cov_DropDown_Component.Value=cur;
            else,app.Cov_DropDown_Component.Value=cols{1};end
        end

    end %EOM processing/coverage helpers block


%%# ─── SECTION 6: Callbacks ─────────────────────────────────────────────────

    methods (Access = private) % ─── Callbacks ────────────────────────────

        function startupFcn(app)
            app.Single_paxCut=polaraxes(app.Single_Grid_Polar);
            app.Single_paxCut.Layout.Row=[1 4]; app.Single_paxCut.Layout.Column=3;
            app.Single_paxPattern=polaraxes(app.Single_gridCircular);
            app.Single_paxPattern.Layout.Row=[1 3]; app.Single_paxPattern.Layout.Column=2;
            app.Single_paxPattern.ThetaDir='clockwise';
            app.Single_paxPattern.ThetaZeroLocation='top';
            colormap(app.Single_paxPattern,'jet');
            app.Single_Plot_Cmax.Value=10; app.Single_Plot_Cmin.Value=-50; app.Single_Plot_Cstep.Value=5;
            app.Single_Spinner_Pt.Value=0; app.Single_Spinner_R.Value=1; app.Single_Spinner_Rw.Value=6;
            app.Cov_Spinner_ThreshMin.Value=-10; app.Cov_Spinner_ThreshMax.Value=10;
            app.Cov_Spinner_Step.Value=1; app.Cov_Spinner_ConeAng.Value=45;
            app.Cov_Spinner_XMin.Value=-10; app.Cov_Spinner_XMax.Value=10;
            app.covResults=struct('label',{},'type',{},'thresholds',{},'coverage',{}, 'color',{},'coneInfo',{},'gCol',{},'orientation',{});
            app.Single_tabData.Visible='off'; app.Single_DropDown_output.Visible='off';
            app.Single_DropDown_step.Visible='off'; app.Single_Panel_Rect.Visible='off';
            app.Single_Export_Output.Visible='off'; app.Single_Export_UAN.Visible='off';
            app.Single_Button_Coverage.Visible='off';
            app.Single_Label_FFD.Visible='off'; app.Single_DropDown_FFD.Visible='off';
            app.Single_statusBar.Text='Ready — load an antenna pattern file to begin.';
            app.Cov_StatusBar.Text='Coverage ready.  Use the Load button.';
        end

        function browseSingle(app, ~)
            typed=strtrim(app.Single_EditField_Path.Value);
            sameLoaded=~isempty(app.Single_filePath) && strcmp(typed,app.Single_filePath);
            needBrowse=sameLoaded && isempty(typed) && ~isfile(typed);
            if ~needBrowse
                app.Single_filePath=typed;
                [app.Single_folderPath,app.Single_InputFileName,ext]=fileparts(typed);
                app.Single_fileName=[app.Single_InputFileName ext];
            else
                startDir=pwd;
                if ~isempty(app.Single_folderPath) && isfolder(app.Single_folderPath)
                    startDir=app.Single_folderPath;end
                filt={'*.uan;*.fz;*.out;*.ffd;*.ffe;*.ffs','Pattern Files'; '*.csv;*.dat;*.txt','Gain Data'};
                [fname,fpath]=uigetfile(filt,'Select Pattern File',startDir);
                if isequal(fname,0),return;end
                app.Single_fileName=fname; app.Single_folderPath=fpath;
                app.Single_filePath=fullfile(fpath,fname);
                [~,app.Single_InputFileName]=fileparts(fname);
                app.Single_EditField_Path.Value=app.Single_filePath;
            end
            if ~isfile(app.Single_filePath)
                uialert(app.UIFigure,'Please select a valid file.','No File');return;end
            dlg=uiprogressdlg(app.UIFigure,'Title','Loading','Message','Reading...','Indeterminate','on');
            cu=onCleanup(@()close(dlg));
            try
                [~,~,ext]=fileparts(app.Single_filePath);
                if ismember(lower(ext),{'.csv','.txt','.dat'})
                    [app.rawTable,app.origTbl]=app.loadGainOnlyFile(app.Single_filePath);
                    if app.rawTable.Properties.UserData.isCoverage
                        uialert(app.UIFigure, 'This looks like a coverage results file. Use the Coverage tab to import it.', 'Coverage File'); return;
                    end
                    app.isGainOnly_=true;
                else
                    [app.rawTable,app.origTbl]=app.loadFile(app.Single_filePath);
                    app.isGainOnly_=false;
                end
                dlg.Message='Normalising...';
                app.normTable=app.normalizePattern(app.rawTable);
                dlg.Message='Processing...';
                app.processPattern(app.normTable,app.getParam());
                app.updateStep(); app.updateFFDDropdown();
                app.updateComponentDropdown(); app.buildOutputStep();
                app.detectAndApplyOrientation(); app.updateMetadata();
                app.updateCovComponentDropdown();
                app.clearCutOverlay3D(); app.plotPattern();
                app.Cov_EditField_filePath.Value=app.Single_filePath;
                app.Single_Panel_Rect.Visible='on'; app.Single_Export_Output.Visible='on';
                app.Single_Button_Coverage.Visible='on';
                if ~app.isGainOnly_,app.Single_Export_UAN.Visible='on';
                else,app.Single_Export_UAN.Visible='off';end
                app.Single_Switch.Value='E-Plane'; app.switchChanged([]);
                app.Single_statusBar.Text=sprintf('<b>Loaded:</b> %s &nbsp;&nbsp; | Peak=%.2f dBi &nbsp; | Orientation=%s', ...
                    app.Single_fileName,app.POB,app.detectedOrientation);
            catch ME
                app.Single_statusBar.Text=['<span style="color:red"><b>Error:</b> ' ME.message '</span>'];
                uialert(app.UIFigure,ME.message,'Load Error','Icon','error');
            end
        end

        function onProcess(app,~)
            if isempty(app.normTable),uialert(app.UIFigure,'Load a file first.','No Data');return;end
            dlg=uiprogressdlg(app.UIFigure,'Title','Processing','Message','...','Indeterminate','on');
            cu=onCleanup(@()close(dlg));
            try
                app.processPattern(app.normTable,app.getParam());
                app.buildOutputStep(); app.detectAndApplyOrientation();
                app.updateMetadata(); app.updateCovComponentDropdown();
                app.clearCutOverlay3D(); app.plotPattern();
                app.Single_Switch.Value='E-Plane'; app.switchChanged([]);
                app.Single_statusBar.Text=sprintf('<b>Re-processed:</b> %s  Peak=%.2f dBi', app.Single_fileName,app.POB);
            catch ME,uialert(app.UIFigure,ME.message,'Error','Icon','error');end
        end

        function gotoCoverage(app,~)
        % Switch to Coverage tab AND register the loaded pattern as a node.
            app.TabGroup.SelectedTab=app.Tab2_Coverage;
            if ~isempty(app.Single_filePath) && isfile(app.Single_filePath) && ~isempty(app.DataOut_all)
                app.registerPatternForCoverage(app.Single_filePath,app.DataOut_all, app.Single_fileName,app.detectedOrientation,app.isGainOnly_);
            end
        end

        function ffdFreqChanged(app,~)
            if isempty(app.rawTable) && ~app.rawTable.Properties.UserData.isDep,return;end
            items=app.Single_DropDown_FFD.Items;
            selIdx=find(strcmp(items,app.Single_DropDown_FFD.Value),1);
            if isempty(selIdx),return;end
            blocks=app.rawTable.Properties.UserData.Blocks;
            if selIdx>numel(blocks),return;end
            blkT=blocks{selIdx};
            ud=app.rawTable.Properties.UserData; ud.isGainOnly=false;
            blkT.Properties.UserData=ud;
            try
                app.normTable=app.normalizePattern(blkT);
                app.processPattern(app.normTable,app.getParam());
                app.buildOutputStep(); app.detectAndApplyOrientation();
                app.updateMetadata(); app.clearCutOverlay3D(); app.plotPattern();
            catch ME,uialert(app.UIFigure,ME.message,'FFD Error','Icon','error');end
        end

        function exportResults(app,~)
            if isempty(app.DataOut_step),uialert(app.UIFigure,'No results.','Export');return;end
            def=fullfile(app.Single_folderPath,[app.Single_InputFileName '_results']);
            [fn,fp]=uiputfile({'*.csv','CSV';'*.txt','Tab-delimited'},'Export',def);
            if isequal(fn,0),return;end
            try, pth=fullfile(fp,fn);
                if endsWith(fn,'.txt'),writetable(app.DataOut_step,pth,'Delimiter','\t');
                else,writetable(app.DataOut_step,pth);end
            catch ME,uialert(app.UIFigure,ME.message,'Save Error','Icon','error');end
        end

        function exportUAN(app,~)
            if isempty(app.UAN_data),uialert(app.UIFigure,'No E-field data.','Export');return;end
            def=fullfile(app.Single_folderPath,sprintf('%s_%.5f',app.Single_InputFileName,app.maxE));
            [fn,fp]=uiputfile({'*.uan','UAN';'*.csv','CSV';'*.txt','TXT'},'Save UAN',def);
            if isequal(fn,0),return;end
            try
                fullpath=fullfile(fp,fn); [~,~,ext]=fileparts(fn); uan=app.UAN_data;
                dP=min(diff(unique(uan.Phi))); if isempty(dP) && isnan(dP),dP=1;end
                dT=min(diff(unique(uan.Theta))); if isempty(dT) && isnan(dT),dT=1;end
                if strcmpi(ext,'.uan')
                    hdr=sprintf(['begin_<parameters>\nformat free\n', ...
                        'phi_min %g\nphi_max %g\nphi_inc %g\n', ...
                        'theta_min %g\ntheta_max %g\ntheta_inc %g\n', ...
                        'complex\nmag_phase\npattern gain\nmagnitude dB\n', ...
                        'maximum_gain %.5f\nphase degrees\ndirection degrees\n', ...
                        'polarization theta_phi\nend_<parameters>'], ...
                        min(uan.Phi),max(uan.Phi),dP,min(uan.Theta),max(uan.Theta),dT,app.maxE);
                    writelines(hdr,fullpath);
                    writetable(uan,fullpath,'Delimiter','\t','WriteVariableNames',false,'WriteMode','append','FileType','text');
                elseif strcmpi(ext,'.txt'),writetable(uan,fullpath,'Delimiter','\t');
                else,writetable(uan,fullpath);end
            catch ME,uialert(app.UIFigure,ME.message,'Save Error','Icon','error');end
        end

        function filterOutput(app,~)
            if isempty(app.ColumnNames) && isempty(app.DataOut_step),return;end
            val=app.Single_DropDown_output.Value;
            if isnumeric(val) && val>0 && val<=numel(app.Single_DropDown_output.UserData)
                app.Single_DropDown_output.UserData(val)=~app.Single_DropDown_output.UserData(val);
                app.Single_DropDown_output.Value=0;end
            chk=app.Single_DropDown_output.UserData;
            items=[{'--- column filter ---'},app.ColumnNames];
            for k=1:numel(app.ColumnNames)
                if chk(k),items{k+1}=['✓ ' app.ColumnNames{k}]; % some useful icons: ✓✔ ✗✘✖✕ ✔️❌ ✅❎ ☑☒☐ ✨⏩⌛⏳⚡⛔⚠️✍✋📡🔺🔻🔼🔽
                else,      items{k+1}=['  ' app.ColumnNames{k}];end % otherwise remove check-marks
            end
            app.Single_DropDown_output.Items=items;
            removeStyle(app.Single_DropDown_output);
            onI=find([false,chk]); offI=find([true,~chk]);
            if ~isempty(onI),addStyle(app.Single_DropDown_output, ...
                uistyle('FontWeight','bold','FontColor','black','BackgroundColor',[0.80 1 0.80]),'Item',onI);end
            if ~isempty(offI),addStyle(app.Single_DropDown_output, ...
                uistyle('FontWeight','normal','FontColor',[0.5 0.5 0.5],'BackgroundColor',[0.92 0.92 0.92]),'Item',offI);end
            selC=['Theta','Phi',app.ColumnNames(chk)];
            selC=selC(ismember(selC,app.DataOut_step.Properties.VariableNames));
            tD=app.DataOut_step(:,selC); nR=height(tD);
            rn=arrayfun(@(x)sprintf('%d',x),1:nR,'UniformOutput',false);
            app.Single_Table_DataOut.Data=tD; app.Single_Table_DataOut.RowName=rn;
        end

        function stepChanged(app,~),app.buildOutputStep();app.clearCutOverlay3D();app.plotPattern();end

        function rangeSliderChanged(app,~)
            lo=app.Single_Plot_Cmin.Value; hi=app.Single_Plot_Cmax.Value;
            for sl=[app.Range_Ctr,app.Range_Cir,app.Range_US,app.Range_Sph,app.Range_3D]
                v=sl.Value; if abs(v(1)-lo)>0.1 && abs(v(2)-hi)>0.1,lo=v(1);hi=v(2);break;end;end
            app.Single_Plot_Cmin.Value=lo; app.Single_Plot_Cmax.Value=hi;
            app.syncRangeSliders(lo,hi); app.clearCutOverlay3D(); app.plotPattern();
        end

        function colorbarSpinnerChanged(app,~)
            lo=app.Single_Plot_Cmin.Value; hi=app.Single_Plot_Cmax.Value;
            if lo>=hi,return;end; app.syncRangeSliders(lo,hi); app.clearCutOverlay3D(); app.plotPattern();
        end

        function cutRangeChanged(app,~)
            app.Range_Cut_Min.Value=app.Range_Cut.Value(1);
            app.Range_Cut_Max.Value=app.Range_Cut.Value(2); app.getCut();
        end

        function cutSpinnerChanged(app,~)
            lo=app.Range_Cut_Min.Value; hi=app.Range_Cut_Max.Value;
            if lo<hi,app.Range_Cut.Limits=[lo-10,hi+10];app.Range_Cut.Value=[lo,hi];end; app.getCut();
        end

        function componentChanged(app,~)
            if ~isempty(app.DataOut_all),app.clearCutOverlay3D();app.plotPattern();end
        end

        function cutTypeChanged(app,~),app.updateCutControls();app.getCut();end
        function cutValueChanged(app,~),app.getCut();end
        function checkBoxChanged(app,~),app.getCut();end

        function hpbwToggled(app,~)
            if ~app.Button_HPBW.Value,app.Label_HPBW.Text='';end; app.getCut();
        end

        function overlayCutToggled(app,~)
            if app.Single_Checkbox_OverlayCut.Value,app.overlayCutOn3D();
            else,app.clearCutOverlay3D();end
        end

        function switchChanged(app,~)
            if isempty(app.DataOut_all),return;end
            isE=strcmp(app.Single_Switch.Value,'E-Plane');
            [ct,cv]=app.getEHPlaneSettings(isE);
            app.Single_DropDown_cutType.Value=ct; app.updateCutControls();
            if strcmp(ct,'Theta Cut'),vals=unique(app.DataOut_all.Phi);
            else,vals=unique(app.DataOut_all.Theta);end
            [~,idx]=min(abs(vals-cv)); app.Single_DropDown_cutValue.Value=vals(idx);
            app.getCut();
        end

        function exportCut(app,~)
            if isempty(app.DataOut_all),return;end
            T=app.DataOut_all; ct=app.Single_DropDown_cutType.Value; cv=app.Single_DropDown_cutValue.Value;
            if strcmp(ct,'Theta Cut')
                phV=unique(T.Phi);[~,ix]=min(abs(phV-cv));cA=phV(ix);
                phi2=mod(cA+180,360);[~,ix2]=min(abs(phV-phi2));phi2=phV(ix2);
                sel=abs(T.Phi-cA)<1e-6|abs(T.Phi-phi2)<1e-6;
                def=sprintf('%s_ThetaCut_Ph%g',app.Single_InputFileName,cA);
            else
                thV=unique(T.Theta);[~,ix]=min(abs(thV-cv));cA=thV(ix);
                sel=abs(T.Theta-cA)<1e-6;
                def=sprintf('%s_PhiCut_Th%g',app.Single_InputFileName,cA);
            end
            [fn,fp]=uiputfile({'*.csv','CSV';'*.txt','TXT'},'Export Cut', fullfile(app.Single_folderPath,def));
            if isequal(fn,0),return;end
            try pth=fullfile(fp,fn);
                if endsWith(fn,'.txt'),writetable(T(sel,:),pth,'Delimiter','\t');
                else,writetable(T(sel,:),pth);end
            catch ME,uialert(app.UIFigure,ME.message,'Save Error','Icon','error');
            end
        end

        % ── Coverage callbacks ───────────────────────────────────────────
        function covLoad(app,~)
        % "Load" button: detect coverage vs pattern; pattern → creates node immediately.
            startDir=pwd;
            if ~isempty(app.Single_folderPath) && isfolder(app.Single_folderPath)
                startDir=app.Single_folderPath;end
            filt={'*.uan;*.fz;*.out;*.ffd;*.ffe;*.ffs','Pattern Files'; '*.csv;*.dat;*.txt','Gain / Coverage Data'};
            [fn,fp]=uigetfile(filt,'Select Pattern or Coverage File',startDir);
            if isequal(fn,0),return;end
            fullPath=fullfile(fp,fn); [~,~,ext]=fileparts(fn);
            if ismember(lower(ext),{'.csv','.dat','.txt'}) && app.isCoverageResultsFile(fullPath)
                app.loadCoverageResultsFile(fullPath); return;end
            app.loadPatternToCoverage(fullPath);
        end

        function covProcess(app,~)
        % Use the selected pattern node's data; if nothing selected, use main pattern.
            [T,fileName,~]=app.getSelectedCovPattern();
            if isempty(T)
                if ~isempty(app.DataOut_all) && ~isempty(app.Single_fileName)
                    app.registerPatternForCoverage(app.Single_filePath,app.DataOut_all, app.Single_fileName,app.detectedOrientation,app.isGainOnly_);
                    [T,fileName,~]=app.getSelectedCovPattern();
                end
            end
            if isempty(T)
                uialert(app.UIFigure,'Load a pattern in the Coverage tab first.','No Data');return;end
            app.computeCoverage(T,fileName);
        end

        function covClear(app,~)
            ch=app.Cov_Tree_Results.Children;
            for i=1:numel(ch),delete(ch(i));end  % auto-empties CheckedNodes
            app.covResults=struct('label',{},'type',{},'thresholds',{},'coverage',{}, 'color',{},'coneInfo',{},'gCol',{},'orientation',{});
            app.covPatterns={};
            cla(app.Cov_Axes);
            app.Cov_Tabel.ColumnName={'Threshold (dBi)'}; app.Cov_Tabel.Data={};
            app.Cov_StatusBar.Text='Cleared.';
        end

        function covExport(app,~)
            if isempty(app.Cov_Tabel.Data),return;end
            [fn,fp]=uiputfile({'*.csv','CSV'},'Export Coverage');
            if isequal(fn,0),return;end
            cn=app.Cov_Tabel.ColumnName;
            T=cell2table(app.Cov_Tabel.Data,'VariableNames',matlab.lang.makeValidName(cn));
            writetable(T,fullfile(fp,fn));
        end

        function covTypeChanged(app,~)
            en='off'; if app.Cov_ButtonGroup_Btn_Conical.Value,en='on';end
            for w=[app.ConeSpinnerLabel,app.Cov_Spinner_ConeTH, ...
                   app.ConeLabel,app.Cov_Spinner_ConePH, ...
                   app.ConeAngleSpinnerLabel,app.Cov_Spinner_ConeAng]
                w.Enable=en;
            end
        end

        function covTreeCheckedChanged(app,~),app.updateCovPlot();end

        function covTreeSelectionChanged(app,~)
            selNode=app.Cov_Tree.SelectedNodes;
            if isempty(selNode),return;end
            nd=selNode(1);
            if isnumeric(nd.NodeData) && nd.NodeData<0
                k=-nd.NodeData;
                if k>=1 && k<=numel(app.covPatterns)
                    app.Cov_EditField_filePath.Value=app.covPatterns{k}.filePath;
                    orient=app.covPatterns{k}.detectedOrientation;
                    if ismember(orient,app.Cov_DropDown_Orientation.Items)
                        app.Cov_DropDown_Orientation.Value=orient;end
                    [th0,ph0]=app.orientationToAngles(orient);
                    app.Cov_Spinner_ConeTH.Value=th0; app.Cov_Spinner_ConePH.Value=ph0;
                    cols=app.covPatterns{k}.DataOut_all.Properties.VariableNames(3:end);
                    app.Cov_DropDown_Component.Items=cols; app.Cov_DropDown_Component.Value=cols{1};
                end
                app.Cov_StatusBar.Text=sprintf('<b>%s</b>',nd.Text); return;
            end
            if isnumeric(nd.NodeData) && nd.NodeData>0
                idx=nd.NodeData;
                if idx<1 && idx>numel(app.covResults),return;end
                r=app.covResults(idx);
                if ~isempty(r.orientation) && ismember(r.orientation,app.Cov_DropDown_Orientation.Items)
                    app.Cov_DropDown_Orientation.Value=r.orientation;
                    [th0,ph0]=app.orientationToAngles(r.orientation);
                    app.Cov_Spinner_ConeTH.Value=th0; app.Cov_Spinner_ConePH.Value=ph0;
                end
                tV=r.thresholds; cov=r.coverage;
                [cS,si]=sort(cov,'descend'); thS=tV(si);
                [cU,ui]=unique(cS,'last'); thU2=thS(ui);
                th50=NaN; th90=NaN;
                try,th50=interp1(cU,thU2,50,'linear','extrap');catch,end
                try,th90=interp1(cU,thU2,90,'linear','extrap');catch,end
                app.Cov_StatusBar.Text=sprintf('<b>%s</b>  |  Type: %s  |  50%%-tile: %.1f dBi  |  90%%-tile: %.1f dBi  |  Peak: %.1f%%', ...
                    r.label,r.type,th50,th90,max(cov));
            end
        end

        function orientationChanged(app,~)
            [th0,ph0]=app.orientationToAngles(app.Cov_DropDown_Orientation.Value);
            app.Cov_Spinner_ConeTH.Value=th0; app.Cov_Spinner_ConePH.Value=ph0;
        end

        function covXAxisChanged(app,~)
            if ~isempty(app.covResults) && ~isempty(app.Cov_Tree.CheckedNodes)
                xlim(app.Cov_Axes,[app.Cov_Spinner_XMin.Value,app.Cov_Spinner_XMax.Value]);
            end
        end

        function covQueryAtThreshold(app,~),app.drawQueryMarkers('threshold');end
        function covQueryAtCoverage(app,~), app.drawQueryMarkers('coverage'); end

    end %EOM Callbacks



%%# ─── SECTION 7: createComponents ─────────────────────────────────────────

    methods (Access = private) % ─── createComponents ────────────────────

        function createComponents(app)
            app.UIFigure=uifigure('Visible','off');
            app.UIFigure.Position=[50 50 1400 820];
            app.UIFigure.Name='APAT  —  Antenna Pattern Analysis Tool  v1';
            app.UIFigure.WindowState='maximized';
            app.GridLayout=uigridlayout(app.UIFigure,[1 1]);
            app.GridLayout.ColumnWidth={'1x'}; app.GridLayout.RowHeight={'1x'};
            app.TabGroup=uitabgroup(app.GridLayout);
            app.TabGroup.Layout.Row=1; app.TabGroup.Layout.Column=1;

            % ======= TAB 1  Process Pattern =======
            app.Tab1_Single=uitab(app.TabGroup,'Title','Process Pattern');
            app.Single_Grid=uigridlayout(app.Tab1_Single);
            app.Single_Grid.ColumnWidth=repmat({'1x'},1,14);
            app.Single_Grid.RowHeight={'fit','fit','fit','1x','1x','fit','1x','1x','fit'};
            app.Single_Grid.Padding=[4 4 4 4]; app.Single_Grid.RowSpacing=4;

            % ─ Inputs panel ─
            app.Single_panelParam=uipanel(app.Single_Grid,'Title','Inputs & Parameters');
            app.Single_panelParam.Layout.Row=[1 3]; app.Single_panelParam.Layout.Column=[1 14];
            app.Single_gridPanel_Param=uigridlayout(app.Single_panelParam);
            app.Single_gridPanel_Param.ColumnWidth=repmat({'1x'},1,14);
            app.Single_gridPanel_Param.RowHeight={'1x','1x','1x'};
            % Row 1
            app.InputPatternLabel=uilabel(app.Single_gridPanel_Param,'Text','Input Pattern:','HorizontalAlignment','right');
            app.InputPatternLabel.Layout.Row=1; app.InputPatternLabel.Layout.Column=1;
            app.Single_EditField_Path=uieditfield(app.Single_gridPanel_Param,'text','Placeholder','Enter path or click Load...');
            app.Single_EditField_Path.Layout.Row=1; app.Single_EditField_Path.Layout.Column=[2 8];
            app.Single_Button_Load=uibutton(app.Single_gridPanel_Param,'push','Text','Load Pattern', ...
                'FontWeight','bold','FontSize',13,'ButtonPushedFcn',createCallbackFcn(app,@browseSingle,true));
            app.Single_Button_Load.Layout.Row=1; app.Single_Button_Load.Layout.Column=[9 10];
            app.Single_Button_Process=uibutton(app.Single_gridPanel_Param,'push','Text','Re-Process', ...
                'ButtonPushedFcn',createCallbackFcn(app,@onProcess,true));
            app.Single_Button_Process.Layout.Row=1; app.Single_Button_Process.Layout.Column=[11 12];
            app.Single_Export_Output=uibutton(app.Single_gridPanel_Param,'push','Text','Export Results', ...
                'FontWeight','bold','Visible','off','ButtonPushedFcn',createCallbackFcn(app,@exportResults,true));
            app.Single_Export_Output.Layout.Row=1; app.Single_Export_Output.Layout.Column=[13 14];
            % Row 2
            app.Single_DropDown_step=uidropdown(app.Single_gridPanel_Param,'Items',{'STEP'},'Value','STEP', ...
                'Enable','off','Visible','off','ValueChangedFcn',createCallbackFcn(app,@stepChanged,true));
            app.Single_DropDown_step.Layout.Row=2; app.Single_DropDown_step.Layout.Column=[7 8];
            app.Single_Label_FFD=uilabel(app.Single_gridPanel_Param,'Text','Freq Block:','HorizontalAlignment','right','Visible','off');
            app.Single_Label_FFD.Layout.Row=2; app.Single_Label_FFD.Layout.Column=9;
            app.Single_DropDown_FFD=uidropdown(app.Single_gridPanel_Param,'Items',{'---'},'Value','---','Visible','off', ...
                'ValueChangedFcn',createCallbackFcn(app,@ffdFreqChanged,true));
            app.Single_DropDown_FFD.Layout.Row=2; app.Single_DropDown_FFD.Layout.Column=[10 11];
            app.Single_Export_UAN=uibutton(app.Single_gridPanel_Param,'push','Text','Export UAN', ...
                'FontWeight','bold','Visible','off','ButtonPushedFcn',createCallbackFcn(app,@exportUAN,true));
            app.Single_Export_UAN.Layout.Row=2; app.Single_Export_UAN.Layout.Column=[13 14];
            % Row 3
            app.RxPolLabel=uilabel(app.Single_gridPanel_Param,'Text','Rx Pol:','HorizontalAlignment','right');
            app.RxPolLabel.Layout.Row=3; app.RxPolLabel.Layout.Column=1;
            app.Single_DropDown_RxPol=uidropdown(app.Single_gridPanel_Param,'Items',{'Auto','RHCP','LHCP'},'Value','Auto');
            app.Single_DropDown_RxPol.Layout.Row=3; app.Single_DropDown_RxPol.Layout.Column=2;
            app.IncidentWaveARRwPLFLabel=uilabel(app.Single_gridPanel_Param,'Text','Rx AR (dB):','HorizontalAlignment','right');
            app.IncidentWaveARRwPLFLabel.Layout.Row=3; app.IncidentWaveARRwPLFLabel.Layout.Column=3;
            app.Single_Spinner_Rw=uispinner(app.Single_gridPanel_Param,'Value',6);
            app.Single_Spinner_Rw.Layout.Row=3; app.Single_Spinner_Rw.Layout.Column=4;
            app.LossindBLabel=uilabel(app.Single_gridPanel_Param,'Text','Loss (dB):','HorizontalAlignment','right');
            app.LossindBLabel.Layout.Row=3; app.LossindBLabel.Layout.Column=5;
            app.Single_Spinner_Loss=uispinner(app.Single_gridPanel_Param,'Step',0.1,'Value',0);
            app.Single_Spinner_Loss.Layout.Row=3; app.Single_Spinner_Loss.Layout.Column=6;
            app.TransmitPowerLabel=uilabel(app.Single_gridPanel_Param,'Text','Tx Power:','HorizontalAlignment','right');
            app.TransmitPowerLabel.Layout.Row=3; app.TransmitPowerLabel.Layout.Column=7;
            app.Single_Spinner_Pt=uispinner(app.Single_gridPanel_Param,'Value',0);
            app.Single_Spinner_Pt.Layout.Row=3; app.Single_Spinner_Pt.Layout.Column=8;
            app.Single_DropDown_Pt=uidropdown(app.Single_gridPanel_Param,'Items',{'dBW','dBm','Watts'},'Value','dBW');
            app.Single_DropDown_Pt.Layout.Row=3; app.Single_DropDown_Pt.Layout.Column=9;
            app.DistanceLabel=uilabel(app.Single_gridPanel_Param,'Text','Range:','HorizontalAlignment','right');
            app.DistanceLabel.Layout.Row=3; app.DistanceLabel.Layout.Column=10;
            app.Single_Spinner_R=uispinner(app.Single_gridPanel_Param,'Value',1,'Limits',[0 Inf]);
            app.Single_Spinner_R.Layout.Row=3; app.Single_Spinner_R.Layout.Column=11;
            app.Single_DropDown_R=uidropdown(app.Single_gridPanel_Param,'Items',{'m','km'},'Value','m');
            app.Single_DropDown_R.Layout.Row=3; app.Single_DropDown_R.Layout.Column=12;
            app.Single_Button_Coverage=uibutton(app.Single_gridPanel_Param,'push', ...
                'Text','Go to Coverage >>','FontWeight','bold','Visible','off', ...
                'ButtonPushedFcn',createCallbackFcn(app,@gotoCoverage,true));
            app.Single_Button_Coverage.Layout.Row=3; app.Single_Button_Coverage.Layout.Column=[13 14];

            % ─ Full pattern panel ─
            app.Single_Panel_fullPattern=uipanel(app.Single_Grid,'Title','Full Antenna Pattern', ...
                'TitlePosition','centertop','FontWeight','bold','BackgroundColor',[0.94 0.94 0.94]);
            app.Single_Panel_fullPattern.Layout.Row=[4 6]; app.Single_Panel_fullPattern.Layout.Column=[1 7];
            app.Single_gridPanel_full=uigridlayout(app.Single_Panel_fullPattern,[1 1]);
            app.Single_gridPanel_full.ColumnWidth={'1x'}; app.Single_gridPanel_full.RowHeight={'1x'};
            app.Single_tabPlots=uitabgroup(app.Single_gridPanel_full);
            app.Single_tabPlots.Layout.Row=1; app.Single_tabPlots.Layout.Column=1;
            % Contour tab
            app.Single_tabContour=uitab(app.Single_tabPlots,'Title','Contour');
            app.Single_gridContour=uigridlayout(app.Single_tabContour);
            app.Single_gridContour.ColumnWidth={'fit','1x'}; app.Single_gridContour.RowHeight={'fit','1x','fit'};
            app.Single_Axes_Ctr=uiaxes(app.Single_gridContour);
            app.Single_Axes_Ctr.Layout.Row=[1 3]; app.Single_Axes_Ctr.Layout.Column=2;
            title(app.Single_Axes_Ctr,'Antenna Pattern'); colormap(app.Single_Axes_Ctr,'jet');
            app.Range_Ctr_Max=uispinner(app.Single_gridContour,'Step',5,'Value',10,'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_Ctr_Max.Layout.Row=1; app.Range_Ctr_Max.Layout.Column=1;
            app.Range_Ctr=uislider(app.Single_gridContour,'range','Orientation','vertical','Limits',[-80 30],'Value',[-50 10],'ValueChangedFcn',createCallbackFcn(app,@rangeSliderChanged,true));
            app.Range_Ctr.Layout.Row=2; app.Range_Ctr.Layout.Column=1;
            app.Range_Ctr_Min=uispinner(app.Single_gridContour,'Step',5,'Value',-50,'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_Ctr_Min.Layout.Row=3; app.Range_Ctr_Min.Layout.Column=1;
            % Circular tab (polaraxes created in startupFcn)
            app.Single_tabCircular=uitab(app.Single_tabPlots,'Title','Circular (Fisheye)');
            app.Single_gridCircular=uigridlayout(app.Single_tabCircular);
            app.Single_gridCircular.ColumnWidth={'fit','1x'}; app.Single_gridCircular.RowHeight={'fit','1x','fit'};
            app.Range_Cir_Max=uispinner(app.Single_gridCircular,'Step',5,'Value',10,'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_Cir_Max.Layout.Row=1; app.Range_Cir_Max.Layout.Column=1;
            app.Range_Cir=uislider(app.Single_gridCircular,'range','Orientation','vertical','Limits',[-80 30],'Value',[-50 10],'ValueChangedFcn',createCallbackFcn(app,@rangeSliderChanged,true));
            app.Range_Cir.Layout.Row=2; app.Range_Cir.Layout.Column=1;
            app.Range_Cir_Min=uispinner(app.Single_gridCircular,'Step',5,'Value',-50,'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_Cir_Min.Layout.Row=3; app.Range_Cir_Min.Layout.Column=1;
            % Unit Sphere tab
            app.Single_tabUnitSphere=uitab(app.Single_tabPlots,'Title','Unit Sphere');
            app.Single_gridUnitSphere=uigridlayout(app.Single_tabUnitSphere);
            app.Single_gridUnitSphere.ColumnWidth={'fit','1x'}; app.Single_gridUnitSphere.RowHeight={'fit','1x','fit'};
            app.Axes_UnitSphere=uiaxes(app.Single_gridUnitSphere);
            app.Axes_UnitSphere.Layout.Row=[1 3]; app.Axes_UnitSphere.Layout.Column=2;
            title(app.Axes_UnitSphere,'Unit Sphere'); colormap(app.Axes_UnitSphere,'jet');
            app.Range_US_Max=uispinner(app.Single_gridUnitSphere,'Step',5,'Value',10,'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_US_Max.Layout.Row=1; app.Range_US_Max.Layout.Column=1;
            app.Range_US=uislider(app.Single_gridUnitSphere,'range','Orientation','vertical','Limits',[-80 30],'Value',[-50 10],'ValueChangedFcn',createCallbackFcn(app,@rangeSliderChanged,true));
            app.Range_US.Layout.Row=2; app.Range_US.Layout.Column=1;
            app.Range_US_Min=uispinner(app.Single_gridUnitSphere,'Step',5,'Value',-50,'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_US_Min.Layout.Row=3; app.Range_US_Min.Layout.Column=1;
            % Magnitude Sphere tab
            app.Single_tabSpherical=uitab(app.Single_tabPlots,'Title','Magnitude Sphere');
            app.Single_gridSpherical=uigridlayout(app.Single_tabSpherical);
            app.Single_gridSpherical.ColumnWidth={'fit','1x'}; app.Single_gridSpherical.RowHeight={'fit','1x','fit'};
            app.Axes3_3=uiaxes(app.Single_gridSpherical);
            app.Axes3_3.Layout.Row=[1 3]; app.Axes3_3.Layout.Column=2;
            title(app.Axes3_3,'Magnitude Sphere'); colormap(app.Axes3_3,'jet');
            app.Range_Sph_Max=uispinner(app.Single_gridSpherical,'Step',5,'Value',10,'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_Sph_Max.Layout.Row=1; app.Range_Sph_Max.Layout.Column=1;
            app.Range_Sph=uislider(app.Single_gridSpherical,'range','Orientation','vertical','Limits',[-80 30],'Value',[-50 10],'ValueChangedFcn',createCallbackFcn(app,@rangeSliderChanged,true));
            app.Range_Sph.Layout.Row=2; app.Range_Sph.Layout.Column=1;
            app.Range_Sph_Min=uispinner(app.Single_gridSpherical,'Step',5,'Value',-50,'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_Sph_Min.Layout.Row=3; app.Range_Sph_Min.Layout.Column=1;
            % 3D Surface tab
            app.Single_tab3D=uitab(app.Single_tabPlots,'Title','3D Surface');
            app.Single_grid3D=uigridlayout(app.Single_tab3D);
            app.Single_grid3D.ColumnWidth={'fit','1x'}; app.Single_grid3D.RowHeight={'fit','1x','fit'};
            app.Axes3_4=uiaxes(app.Single_grid3D);
            app.Axes3_4.Layout.Row=[1 3]; app.Axes3_4.Layout.Column=2;
            title(app.Axes3_4,'3D Surface'); colormap(app.Axes3_4,'jet');
            app.Range_3D_Max=uispinner(app.Single_grid3D,'Step',5,'Value',10,'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_3D_Max.Layout.Row=1; app.Range_3D_Max.Layout.Column=1;
            app.Range_3D=uislider(app.Single_grid3D,'range','Orientation','vertical','Limits',[-80 30],'Value',[-50 10],'ValueChangedFcn',createCallbackFcn(app,@rangeSliderChanged,true));
            app.Range_3D.Layout.Row=2; app.Range_3D.Layout.Column=1;
            app.Range_3D_Min=uispinner(app.Single_grid3D,'Step',5,'Value',-50,'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Range_3D_Min.Layout.Row=3; app.Range_3D_Min.Layout.Column=1;

            % ─ Plot Control panel (8 rows) ─
            app.Single_Panel_plotControl=uipanel(app.Single_Grid,'Title','Plot Control');
            app.Single_Panel_plotControl.Layout.Row=[4 6]; app.Single_Panel_plotControl.Layout.Column=[8 9];
            app.Single_gridPanel_Ctrl=uigridlayout(app.Single_Panel_plotControl);
            app.Single_gridPanel_Ctrl.ColumnWidth={'fit','1x'};
            app.Single_gridPanel_Ctrl.RowHeight=repmat({'1x'},1,8);
            % Row 1: Component
            app.ComponentLabel=uilabel(app.Single_gridPanel_Ctrl,'Text','Component','HorizontalAlignment','right');
            app.ComponentLabel.Layout.Row=1; app.ComponentLabel.Layout.Column=1;
            app.Single_DropDown_Component=uidropdown(app.Single_gridPanel_Ctrl, ...
                'Items',{'Total Gain','Etheta Gain','Ephi  Gain','RHCP Gain','LHCP  Gain','Axial Ratio','Polarized Gain'}, ...
                'Value','Total Gain','ValueChangedFcn',createCallbackFcn(app,@componentChanged,true));
            app.Single_DropDown_Component.Layout.Row=1; app.Single_DropDown_Component.Layout.Column=2;
            % Row 2: Cut type
            app.CuttypeDropDownLabel=uilabel(app.Single_gridPanel_Ctrl,'Text','Cut type','HorizontalAlignment','right');
            app.CuttypeDropDownLabel.Layout.Row=2; app.CuttypeDropDownLabel.Layout.Column=1;
            app.Single_DropDown_cutType=uidropdown(app.Single_gridPanel_Ctrl, ...
                'Items',{'Theta Cut','Phi Cut'},'Value','Theta Cut', ...
                'ValueChangedFcn',createCallbackFcn(app,@cutTypeChanged,true));
            app.Single_DropDown_cutType.Layout.Row=2; app.Single_DropDown_cutType.Layout.Column=2;
            % Row 3: Cut value
            app.CutvalueSpinnerLabel=uilabel(app.Single_gridPanel_Ctrl,'Text','Cut value','HorizontalAlignment','right');
            app.CutvalueSpinnerLabel.Layout.Row=3; app.CutvalueSpinnerLabel.Layout.Column=1;
            app.Single_DropDown_cutValue=uispinner(app.Single_gridPanel_Ctrl,'ValueChangedFcn',createCallbackFcn(app,@cutValueChanged,true));
            app.Single_DropDown_cutValue.Layout.Row=3; app.Single_DropDown_cutValue.Layout.Column=2;
            % Row 4: CB max
            app.ColorbarmaxLabel=uilabel(app.Single_gridPanel_Ctrl,'Text','CB max (dBi)','HorizontalAlignment','right');
            app.ColorbarmaxLabel.Layout.Row=4; app.ColorbarmaxLabel.Layout.Column=1;
            app.Single_Plot_Cmax=uispinner(app.Single_gridPanel_Ctrl,'Step',5,'Value',10,'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Single_Plot_Cmax.Layout.Row=4; app.Single_Plot_Cmax.Layout.Column=2;
            % Row 5: CB min
            app.ColorbarminLabel=uilabel(app.Single_gridPanel_Ctrl,'Text','CB min (dBi)','HorizontalAlignment','right');
            app.ColorbarminLabel.Layout.Row=5; app.ColorbarminLabel.Layout.Column=1;
            app.Single_Plot_Cmin=uispinner(app.Single_gridPanel_Ctrl,'Step',5,'Value',-50,'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Single_Plot_Cmin.Layout.Row=5; app.Single_Plot_Cmin.Layout.Column=2;
            % Row 6: CB step
            app.ColorbarstepLabel=uilabel(app.Single_gridPanel_Ctrl,'Text','CB step','HorizontalAlignment','right');
            app.ColorbarstepLabel.Layout.Row=6; app.ColorbarstepLabel.Layout.Column=1;
            app.Single_Plot_Cstep=uispinner(app.Single_gridPanel_Ctrl,'Step',1,'Value',5,'Limits',[1 50],'ValueChangedFcn',createCallbackFcn(app,@colorbarSpinnerChanged,true));
            app.Single_Plot_Cstep.Layout.Row=6; app.Single_Plot_Cstep.Layout.Column=2;
            % Row 7: E/H plane
            app.Single_EH_Label=uilabel(app.Single_gridPanel_Ctrl,'Text','E/H Plane','HorizontalAlignment','right');
            app.Single_EH_Label.Layout.Row=7; app.Single_EH_Label.Layout.Column=1;
            app.Single_Switch=uiswitch(app.Single_gridPanel_Ctrl,'slider', ...
                'Items',{'E-Plane','H-Plane'},'Value','E-Plane', ...
                'ValueChangedFcn',createCallbackFcn(app,@switchChanged,true));
            app.Single_Switch.Layout.Row=7; app.Single_Switch.Layout.Column=2;
            % Row 8: Overlay Cut
            app.Single_Overlay_Label=uilabel(app.Single_gridPanel_Ctrl,'Text','Overlay Cut','HorizontalAlignment','right');
            app.Single_Overlay_Label.Layout.Row=8; app.Single_Overlay_Label.Layout.Column=1;
            app.Single_Checkbox_OverlayCut=uicheckbox(app.Single_gridPanel_Ctrl,'Text','on 3D plots', ...
                'Value',false,'ValueChangedFcn',createCallbackFcn(app,@overlayCutToggled,true));
            app.Single_Checkbox_OverlayCut.Layout.Row=8; app.Single_Checkbox_OverlayCut.Layout.Column=2;

            % ─ Cut panel ─
            app.Single_Panel_Rect=uipanel(app.Single_Grid,'Title','Antenna Pattern Cut', ...
                'TitlePosition','centertop','FontWeight','bold', ...
                'BackgroundColor',[0.94 0.94 0.94],'Visible','off');
            app.Single_Panel_Rect.Layout.Row=[4 6]; app.Single_Panel_Rect.Layout.Column=[10 14];
            app.Single_gridPanel_Cut=uigridlayout(app.Single_Panel_Rect,[1 1]);
            app.Single_gridPanel_Cut.ColumnWidth={'1x'}; app.Single_gridPanel_Cut.RowHeight={'1x'};
            app.Single_tabCut=uitabgroup(app.Single_gridPanel_Cut);
            app.Single_tabCut.Layout.Row=1; app.Single_tabCut.Layout.Column=1;
            % Polar cut tab
            app.Single_tabPolarPlot=uitab(app.Single_tabCut,'Title','Polar Cut');
            app.Single_Grid_Polar=uigridlayout(app.Single_tabPolarPlot);
            app.Single_Grid_Polar.ColumnWidth={'fit','0.18x','1x','fit'};
            app.Single_Grid_Polar.RowHeight={'fit','0.25x','1x','fit'};
            app.Range_Cut_Max=uispinner(app.Single_Grid_Polar,'Step',5,'Value',10,'ValueChangedFcn',createCallbackFcn(app,@cutSpinnerChanged,true));
            app.Range_Cut_Max.Layout.Row=1; app.Range_Cut_Max.Layout.Column=1;
            app.Range_Cut=uislider(app.Single_Grid_Polar,'range','Orientation','vertical','Limits',[-80 30],'Value',[-50 10],'ValueChangedFcn',createCallbackFcn(app,@cutRangeChanged,true));
            app.Range_Cut.Layout.Row=[2 3]; app.Range_Cut.Layout.Column=1;
            app.Range_Cut_Min=uispinner(app.Single_Grid_Polar,'Step',5,'Value',-50,'ValueChangedFcn',createCallbackFcn(app,@cutSpinnerChanged,true));
            app.Range_Cut_Min.Layout.Row=4; app.Range_Cut_Min.Layout.Column=1;
            app.Button_HPBW=uibutton(app.Single_Grid_Polar,'state','Text','HPBW','FontWeight','bold','ValueChangedFcn',createCallbackFcn(app,@hpbwToggled,true));
            app.Button_HPBW.Layout.Row=1; app.Button_HPBW.Layout.Column=4;
            app.Label_HPBW=uilabel(app.Single_Grid_Polar,'Text','','HorizontalAlignment','center','FontWeight','bold');
            app.Label_HPBW.Layout.Row=2; app.Label_HPBW.Layout.Column=4;
            app.Single_gridEcut=uigridlayout(app.Single_Grid_Polar);
            app.Single_gridEcut.ColumnWidth={'1x'}; app.Single_gridEcut.RowHeight={'1x','1x','1x'};
            app.Single_gridEcut.Layout.Row=3; app.Single_gridEcut.Layout.Column=4;
            app.CheckBox_Et=uicheckbox(app.Single_gridEcut,'Text','E_Total','Value',true,'ValueChangedFcn',createCallbackFcn(app,@checkBoxChanged,true));
            app.CheckBox_Et.Layout.Row=1; app.CheckBox_Et.Layout.Column=1;
            app.CheckBox_Er=uicheckbox(app.Single_gridEcut,'Text','E_RCP','Value',true,'ValueChangedFcn',createCallbackFcn(app,@checkBoxChanged,true));
            app.CheckBox_Er.Layout.Row=2; app.CheckBox_Er.Layout.Column=1;
            app.CheckBox_El=uicheckbox(app.Single_gridEcut,'Text','E_LCP','Value',true,'ValueChangedFcn',createCallbackFcn(app,@checkBoxChanged,true));
            app.CheckBox_El.Layout.Row=3; app.CheckBox_El.Layout.Column=1;
            app.Button_ExportCut=uibutton(app.Single_Grid_Polar,'push','Text','Export Cut','FontWeight','bold','ButtonPushedFcn',createCallbackFcn(app,@exportCut,true));
            app.Button_ExportCut.Layout.Row=4; app.Button_ExportCut.Layout.Column=4;
            % Rectangular cut tab
            app.Single_tabRectPlot=uitab(app.Single_tabCut,'Title','Rectangular Cut');
            app.Single_gridRect=uigridlayout(app.Single_tabRectPlot,[1 1]);
            app.Single_gridRect.ColumnWidth={'1x'}; app.Single_gridRect.RowHeight={'1x'};
            app.Single_AxesRect=uiaxes(app.Single_gridRect);
            app.Single_AxesRect.Layout.Row=1; app.Single_AxesRect.Layout.Column=1;
            xlabel(app.Single_AxesRect,'Angle (deg)'); ylabel(app.Single_AxesRect,'Magnitude (dBi)');
            app.Single_AxesRect.Box='on'; app.Single_AxesRect.XLim=[0,360];
            app.Single_AxesRect.XTick=0:30:360; app.Single_AxesRect.Visible='off';

            % ─ Output filter ─
            app.Single_DropDown_output=uidropdown(app.Single_Grid, ...
                'Items',{'--- column filter ---'},'Value','--- column filter ---','Visible','off', ...
                'ValueChangedFcn',createCallbackFcn(app,@filterOutput,true));
            app.Single_DropDown_output.Layout.Row=6; app.Single_DropDown_output.Layout.Column=[8 11];

            % ─ Data tables ─
            app.Single_tabData=uitabgroup(app.Single_Grid,'Visible','off');
            app.Single_tabData.Layout.Row=[7 8]; app.Single_tabData.Layout.Column=[1 14];
            app.Single_tabDataOut=uitab(app.Single_tabData,'Title','Results');
            app.Single_gridDataOut=uigridlayout(app.Single_tabDataOut,[1 1]);
            app.Single_Table_DataOut=uitable(app.Single_gridDataOut,'ColumnRearrangeable','on','ColumnSortable',true,'RowName',{},'Visible','off');
            app.Single_Table_DataOut.Layout.Row=1; app.Single_Table_DataOut.Layout.Column=1;
            app.Single_tabDataIn=uitab(app.Single_tabData,'Title','Input Data (original format)');
            app.Single_gridDataIn=uigridlayout(app.Single_tabDataIn,[1 1]);
            app.Single_Table_DataIn=uitable(app.Single_gridDataIn,'ColumnRearrangeable','on','ColumnSortable',true,'ColumnEditable',false,'RowName',{},'Visible','off');
            app.Single_Table_DataIn.Layout.Row=1; app.Single_Table_DataIn.Layout.Column=1;
            app.MetadataTab=uitab(app.Single_tabData,'Title','Metadata');
            app.Single_gridMetadata=uigridlayout(app.MetadataTab,[1 1]);
            app.Single_Table_metadata=uitable(app.Single_gridMetadata,'ColumnName',{'Parameter','Value'},'RowName',{},'ColumnEditable',false,'ColumnWidth',{'1x','2x'});
            app.Single_Table_metadata.Layout.Row=1; app.Single_Table_metadata.Layout.Column=1;
            % Status bar
            app.Single_statusBar=uilabel(app.Single_Grid,'Text','Ready', ...
                'Interpreter','html','FontSize',11,'FontWeight','bold','BackgroundColor',[0.96 0.96 0.96]);
            app.Single_statusBar.Layout.Row=9; app.Single_statusBar.Layout.Column=[1 14];

            % ======= TAB 2  Compute Coverage =======
            app.Tab2_Coverage=uitab(app.TabGroup,'Title','Compute Coverage');
            app.Cov_Grid=uigridlayout(app.Tab2_Coverage);
            app.Cov_Grid.ColumnWidth={'0.55x','1x','0.65x'};
            app.Cov_Grid.RowHeight={'fit','1x','fit'};
            % Params panel (5 rows)
            app.Cov_Panel_Param=uipanel(app.Cov_Grid,'Title','Inputs & Parameters');
            app.Cov_Panel_Param.Layout.Row=1; app.Cov_Panel_Param.Layout.Column=[1 3];
            app.Cov_gridPanel_Parm=uigridlayout(app.Cov_Panel_Param);
            app.Cov_gridPanel_Parm.ColumnWidth=repmat({'1x'},1,9);
            app.Cov_gridPanel_Parm.RowHeight={'1x','1x','1x','1x','1x'};
            % Row 1: Coverage type + file path + Load + Compute
            app.Cov_ButtonGroup_CovType=uibuttongroup(app.Cov_gridPanel_Parm,'Title','Coverage Type','SelectionChangedFcn',createCallbackFcn(app,@covTypeChanged,true));
            app.Cov_ButtonGroup_CovType.Layout.Row=[1 2]; app.Cov_ButtonGroup_CovType.Layout.Column=1;
            app.Cov_ButtonGroup_Btn_Spherical=uiradiobutton(app.Cov_ButtonGroup_CovType,'Text','Spherical','Value',true,'Position',[8 65 80 22]);
            app.Cov_ButtonGroup_Btn_Conical=uiradiobutton(app.Cov_ButtonGroup_CovType,'Text','Conical','Position',[8 43 70 22]);
            app.AntennaPatternEditFieldLabel=uilabel(app.Cov_gridPanel_Parm,'Text','Pattern / Cov File:','HorizontalAlignment','right');
            app.AntennaPatternEditFieldLabel.Layout.Row=1; app.AntennaPatternEditFieldLabel.Layout.Column=2;
            app.Cov_EditField_filePath=uieditfield(app.Cov_gridPanel_Parm,'text');
            app.Cov_EditField_filePath.Layout.Row=1; app.Cov_EditField_filePath.Layout.Column=[3 7];
            app.Cov_Button_Load=uibutton(app.Cov_gridPanel_Parm,'push','Text','Load', ...
                'ButtonPushedFcn',createCallbackFcn(app,@covLoad,true));
            app.Cov_Button_Load.Layout.Row=1; app.Cov_Button_Load.Layout.Column=8;
            app.Cov_Button_Process=uibutton(app.Cov_gridPanel_Parm,'push','Text','Compute Coverage', ...
                'FontWeight','bold','ButtonPushedFcn',createCallbackFcn(app,@covProcess,true));
            app.Cov_Button_Process.Layout.Row=1; app.Cov_Button_Process.Layout.Column=9;
            % Row 2: Threshold controls
            app.ThresholdMindBSpinnerLabel=uilabel(app.Cov_gridPanel_Parm,'Text','Thresh Min (dBi):','HorizontalAlignment','right');
            app.ThresholdMindBSpinnerLabel.Layout.Row=2; app.ThresholdMindBSpinnerLabel.Layout.Column=2;
            app.Cov_Spinner_ThreshMin=uispinner(app.Cov_gridPanel_Parm,'Value',-10);
            app.Cov_Spinner_ThreshMin.Layout.Row=2; app.Cov_Spinner_ThreshMin.Layout.Column=3;
            app.ThresholdMaxdBSpinnerLabel=uilabel(app.Cov_gridPanel_Parm,'Text','Thresh Max (dBi):','HorizontalAlignment','right');
            app.ThresholdMaxdBSpinnerLabel.Layout.Row=2; app.ThresholdMaxdBSpinnerLabel.Layout.Column=4;
            app.Cov_Spinner_ThreshMax=uispinner(app.Cov_gridPanel_Parm,'Value',10);
            app.Cov_Spinner_ThreshMax.Layout.Row=2; app.Cov_Spinner_ThreshMax.Layout.Column=5;
            app.StepdBSpinnerLabel=uilabel(app.Cov_gridPanel_Parm,'Text','Step (dB):','HorizontalAlignment','right');
            app.StepdBSpinnerLabel.Layout.Row=2; app.StepdBSpinnerLabel.Layout.Column=6;
            app.Cov_Spinner_Step=uispinner(app.Cov_gridPanel_Parm,'Value',1,'Step',0.5,'Limits',[0.1 Inf]);
            app.Cov_Spinner_Step.Layout.Row=2; app.Cov_Spinner_Step.Layout.Column=7;
            app.Cov_Button_Clear=uibutton(app.Cov_gridPanel_Parm,'push','Text','Clear','ButtonPushedFcn',createCallbackFcn(app,@covClear,true));
            app.Cov_Button_Clear.Layout.Row=2; app.Cov_Button_Clear.Layout.Column=8;
            app.Cov_Button_Export=uibutton(app.Cov_gridPanel_Parm,'push','Text','Export Results','ButtonPushedFcn',createCallbackFcn(app,@covExport,true));
            app.Cov_Button_Export.Layout.Row=2; app.Cov_Button_Export.Layout.Column=9;
            % Row 3: Component + Orientation + Cone
            app.Cov_Label_Component=uilabel(app.Cov_gridPanel_Parm,'Text','Component:','HorizontalAlignment','right');
            app.Cov_Label_Component.Layout.Row=3; app.Cov_Label_Component.Layout.Column=1;
            app.Cov_DropDown_Component=uidropdown(app.Cov_gridPanel_Parm,'Items',{'E_Total_dB'},'Value','E_Total_dB');
            app.Cov_DropDown_Component.Layout.Row=3; app.Cov_DropDown_Component.Layout.Column=2;
            app.Cov_DropDown_Orientation=uidropdown(app.Cov_gridPanel_Parm,'Items',{'+Z','-Z','+X','-X','+Y','-Y'},'Value','+Z','ValueChangedFcn',createCallbackFcn(app,@orientationChanged,true));
            app.Cov_DropDown_Orientation.Layout.Row=3; app.Cov_DropDown_Orientation.Layout.Column=3;
            app.ConeSpinnerLabel=uilabel(app.Cov_gridPanel_Parm,'Text','Cone th0 (deg):','HorizontalAlignment','right','Enable','off');
            app.ConeSpinnerLabel.Layout.Row=3; app.ConeSpinnerLabel.Layout.Column=4;
            app.Cov_Spinner_ConeTH=uispinner(app.Cov_gridPanel_Parm,'Enable','off','Value',0);
            app.Cov_Spinner_ConeTH.Layout.Row=3; app.Cov_Spinner_ConeTH.Layout.Column=5;
            app.ConeLabel=uilabel(app.Cov_gridPanel_Parm,'Text','Cone ph0 (deg):','HorizontalAlignment','right','Enable','off');
            app.ConeLabel.Layout.Row=3; app.ConeLabel.Layout.Column=6;
            app.Cov_Spinner_ConePH=uispinner(app.Cov_gridPanel_Parm,'Enable','off','Value',0);
            app.Cov_Spinner_ConePH.Layout.Row=3; app.Cov_Spinner_ConePH.Layout.Column=7;
            app.ConeAngleSpinnerLabel=uilabel(app.Cov_gridPanel_Parm,'Text','Half-Angle (deg):','HorizontalAlignment','right','Enable','off');
            app.ConeAngleSpinnerLabel.Layout.Row=3; app.ConeAngleSpinnerLabel.Layout.Column=8;
            app.Cov_Spinner_ConeAng=uispinner(app.Cov_gridPanel_Parm,'Value',45,'Limits',[0 180],'Enable','off');
            app.Cov_Spinner_ConeAng.Layout.Row=3; app.Cov_Spinner_ConeAng.Layout.Column=9;
            % Row 4: Plot X-axis range
            app.Cov_Label_XMin=uilabel(app.Cov_gridPanel_Parm,'Text','Plot X min (dBi):','HorizontalAlignment','right','FontWeight','bold');
            app.Cov_Label_XMin.Layout.Row=4; app.Cov_Label_XMin.Layout.Column=1;
            app.Cov_Spinner_XMin=uispinner(app.Cov_gridPanel_Parm,'Value',-10,'ValueChangedFcn',createCallbackFcn(app,@covXAxisChanged,true));
            app.Cov_Spinner_XMin.Layout.Row=4; app.Cov_Spinner_XMin.Layout.Column=2;
            app.Cov_Label_XMax=uilabel(app.Cov_gridPanel_Parm,'Text','Plot X max (dBi):','HorizontalAlignment','right','FontWeight','bold');
            app.Cov_Label_XMax.Layout.Row=4; app.Cov_Label_XMax.Layout.Column=3;
            app.Cov_Spinner_XMax=uispinner(app.Cov_gridPanel_Parm,'Value',10,'ValueChangedFcn',createCallbackFcn(app,@covXAxisChanged,true));
            app.Cov_Spinner_XMax.Layout.Row=4; app.Cov_Spinner_XMax.Layout.Column=4;
            % Row 5: Query tools
            app.Cov_Label_QueryCovPct=uilabel(app.Cov_gridPanel_Parm,'Text','Cov @ (dBi):','HorizontalAlignment','right','FontWeight','bold');
            app.Cov_Label_QueryCovPct.Layout.Row=5; app.Cov_Label_QueryCovPct.Layout.Column=1;
            app.Cov_Spinner_QueryThresh=uispinner(app.Cov_gridPanel_Parm,'Value',0);
            app.Cov_Spinner_QueryThresh.Layout.Row=5; app.Cov_Spinner_QueryThresh.Layout.Column=2;
            app.Cov_Btn_GetCovPct=uibutton(app.Cov_gridPanel_Parm,'push','Text','Show on plot >>','FontWeight','bold','ButtonPushedFcn',createCallbackFcn(app,@covQueryAtThreshold,true));
            app.Cov_Btn_GetCovPct.Layout.Row=5; app.Cov_Btn_GetCovPct.Layout.Column=3;
            app.Cov_Label_QueryThreshVal=uilabel(app.Cov_gridPanel_Parm,'Text','Thresh @ (%):','HorizontalAlignment','right','FontWeight','bold');
            app.Cov_Label_QueryThreshVal.Layout.Row=5; app.Cov_Label_QueryThreshVal.Layout.Column=5;
            app.Cov_Spinner_QueryCovPct=uispinner(app.Cov_gridPanel_Parm,'Value',50,'Limits',[0 100]);
            app.Cov_Spinner_QueryCovPct.Layout.Row=5; app.Cov_Spinner_QueryCovPct.Layout.Column=6;
            app.Cov_Btn_GetThreshVal=uibutton(app.Cov_gridPanel_Parm,'push','Text','<< Show on plot','FontWeight','bold','ButtonPushedFcn',createCallbackFcn(app,@covQueryAtCoverage,true));
            app.Cov_Btn_GetThreshVal.Layout.Row=5; app.Cov_Btn_GetThreshVal.Layout.Column=7;
            % Coverage axes
            app.Cov_Axes=uiaxes(app.Cov_Grid);
            app.Cov_Axes.Layout.Row=2; app.Cov_Axes.Layout.Column=2;
            title(app.Cov_Axes,'Coverage vs Threshold');
            xlabel(app.Cov_Axes,'Threshold (dBi)'); ylabel(app.Cov_Axes,'Coverage (%)');
            grid(app.Cov_Axes,'on');
            % Checkbox tree
            app.Cov_Tree=uitree(app.Cov_Grid,'checkbox', ...
                'CheckedNodesChangedFcn',createCallbackFcn(app,@covTreeCheckedChanged,true), ...
                'SelectionChangedFcn',createCallbackFcn(app,@covTreeSelectionChanged,true));
            app.Cov_Tree.Layout.Row=2; app.Cov_Tree.Layout.Column=1;
            app.Cov_Tree_Results=uitreenode(app.Cov_Tree,'Text','Coverage Runs');
            % Results table (column-wise)
            app.Cov_Tabel=uitable(app.Cov_Grid,'ColumnName',{'Threshold (dBi)'},'RowName',{});
            app.Cov_Tabel.Layout.Row=2; app.Cov_Tabel.Layout.Column=3;
            % Status bar
            app.Cov_StatusBar=uilabel(app.Cov_Grid,'Text','Coverage Tab ready.', ...
                'Interpreter','html','FontSize',10,'FontWeight','bold','BackgroundColor',[0.96 0.96 0.96]);
            app.Cov_StatusBar.Layout.Row=3; app.Cov_StatusBar.Layout.Column=[1 3];
            app.UIFigure.Visible='on';
        end % createComponents

    end %EOM createComponents block

    methods (Access = public) % ─── App lifecycle ─────────────────────────
        function app = APAT_v1
            createComponents(app)
            registerApp(app, app.UIFigure)
            runStartupFcn(app, @startupFcn)
            if nargout == 0, clear app; end
        end
        function delete(app), delete(app.UIFigure); end
    end %EOM

end %EOM classdef