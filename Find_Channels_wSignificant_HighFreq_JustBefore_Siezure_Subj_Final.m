clear;clc;close('all')
save_flag = 1;
%addpath(genpath('C:\Program Files\MATLAB\R2013a\toolbox\fieldtrip'))
%addpath E:\Software\fieldtrip-20130815 %  E:\Software\eeglab13_1_1b
%ft_defaults


%%
%------------------------------

flist = {...
'E:\HFO_DATA_ECOG\ftData_BB_2013-11-11_Start19-16-27_End19-18-45_Dur_3M-44S_Fs513.mat'
'E:\HFO_DATA_ECOG\ftData_BB_2013-11-12_Start04-43-11_End04-50-42_Dur_9M-10S_Fs513.mat'
'E:\HFO_DATA_ECOG\ftData_BB_2013-11-13_Start03-51-48_End03-59-18_Dur_8M-5S_Fs513.mat'
    
'E:\HFO_DATA_ECOG\ftData_GL_2013-11-11_Start19-16-27_End19-18-45_Dur_8M-27S_Fs1026.mat'
'E:\HFO_DATA_ECOG\ftData_GL_2013-11-13_Start12-55-28_End12-58_17_Dur_3M-43S_Fs1026.mat'
'E:\HFO_DATA_ECOG\ftData_GL_2013-11-14_Start06-46-20_End06-47-45_Dur_6M-55S_Fs1026.mat'

'E:\HFO_DATA_ECOG\ftData_MN_2013-01-23_Start18-48-37_End18-49-20_Dur_10M-8S_Fs513.mat'
'E:\HFO_DATA_ECOG\ftData_MN_2013-01-24_Start08-14-07_End08-19-36_Dur_8M-11S_Fs513.mat'
'E:\HFO_DATA_ECOG\ftData_MN_2013-01-25_Start13-58-09_End14-01-44_Dur_5M-32S_Fs513.mat'    
    
'E:\HFO_DATA_ECOG\ftData_TS_2013-07-02_Start12-55-11_End13-04-55_Dur_10M-57S_Fs513.mat'
};

for i = 1 : numel(flist)
    fname = flist{i};
    [p,f,e] = fileparts( fname );
    ix2 = strfind( f , '_Start' )  ;
    ix1 = strfind( f , 'ftData_' )  ;
    subjname = f((ix1+7):(ix2-1));
    
    ResectedChannelLabel = {};
    switch subjname
          case { 'BB_2013-11-11' , 'BB_2013-11-12' , '2013-11-13' }
            %% -- Define resected electrodes
            %---------- grid temporal
              ContactLabel = {'R-P'};
            tmp = [13:15, 21:24, 29:32];
            k = numel(ResectedChannelLabel);
            for ii=1:length(tmp),
                ResectedChannelLabel(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
            end
           
            %---------------------------------
            %---------------------------------
            switch f
                case 'ftData_BB_2013-11-11_Start19-16-27_End19-18-45_Dur_3M-44S_Fs513'
                    start_onset_time = 60+ 26;
                    end_onset_time = 86 + 73;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;% 3; % ;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
                    
                case 'ftData_BB_2013-11-12_Start04-43-11_End04-50-42_Dur_9M-10S_Fs513'
                    start_onset_time = 109; 
                    end_onset_time = 109 +339;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;% 3; % 
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
                    
                case 'ftData_BB_2013-11-13_Start03-51-48_End03-59-18_Dur_8M-5S_Fs513'
                    start_onset_time = 36;
                    end_onset_time = 36 + 141;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
            end
            
         case {'GL_2013-11-11', 'GL_2013-11-13', 'GL_2013-11-14'}
            %% -- Define resected electrodes
            %---------- grid temporal
             ContactLabel = {'LF'};
            tmp = [13:15, 21:23,29:31];
            k = numel(ResectedChannelLabel);
            for ii=1:length(tmp),
                ResectedChannelLabel(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
            end
            ContactLabel = {'LD'};
            tmp = [1:2];
            k = numel(ResectedChannelLabel);
            for ii=1:length(tmp),
                ResectedChannelLabel(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
            end
            
            %---------------------------------
            %---------------------------------
            switch f
                case 'ftData_GL_2013-11-11_Start19-16-27_End19-18-45_Dur_8M-27S_Fs1026'
                    start_onset_time = 2 *60 +16;% 
                    end_onset_time = 136 + 103;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [3];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
                    case 'ftData_GL_2013-11-13_Start12-55-28_End12-58_17_Dur_3M-43S_Fs1026'
                    start_onset_time = 54;%
                    end_onset_time = 54 +105;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
                    
                case 'ftData_GL_2013-11-14_Start06-46-20_End06-47-45_Dur_6M-55S_Fs1026'
                    start_onset_time = 54;% 
                    end_onset_time = 54 +125;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );   
                    
            end
           
        case { 'MN_2013-01-23' , 'MN_2013-01-24' , 'MN_2013-01-25' }
            %% -- Define resected electrodes
            %---------- grid temporal
            ContactLabel = {'LG'};
            tmp = [1:7, 9:14, 17:21, 25:28];
            k = numel(ResectedChannelLabel);
            for ii=1:length(tmp),
                ResectedChannelLabel(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
            end
            
            ContactLabel = {'AST'};
            tmp = [1:4];
            k = numel(ResectedChannelLabel);
            for ii=1:length(tmp),
                ResectedChannelLabel(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
            end
            
            ContactLabel = {'AT'};
            tmp = [1:4];
            k = numel(ResectedChannelLabel);
            for ii=1:length(tmp),
                ResectedChannelLabel(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
            end
            
            ContactLabel = {'PST'};
            tmp = [1:4];
            k = numel(ResectedChannelLabel);
            for ii=1:length(tmp),
                ResectedChannelLabel(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
            end
            %---------------------------------
            %---------------------------------
            switch f
                case 'ftData_MN_2013-01-23_Start18-48-37_End18-49-20_Dur_10M-8S_Fs513'
                    start_onset_time = 253;%
                    end_onset_time = 253 + 47;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
                    
                case 'ftData_MN_2013-01-24_Start08-14-07_End08-19-36_Dur_8M-11S_Fs513'
                    start_onset_time = 164;%
                    end_onset_time = 164 +25;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
                    
                case 'ftData_MN_2013-01-25_Start13-58-09_End14-01-44_Dur_5M-32S_Fs513'
                    start_onset_time = 119;%
                    end_onset_time = 119 + 32;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                  
                    
                    
            end
    
    
     case 'TS_2013-07-02'
            %% -- Define resected electrodes
            %---------- grid temporal
             ContactLabel = {'TG'};
            tmp = [ 1:3, 9:12, 17:21, 25:28];
            k = numel(ResectedChannelLabel);
            for ii=1:length(tmp),
                ResectedChannelLabel(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
            end
            
            ContactLabel = {'AST'};
            tmp = [ 1:4 ];
            k = numel(ResectedChannelLabel);
            for ii=1:length(tmp),
                ResectedChannelLabel(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
            end
            
            ContactLabel = {'PST'};
            tmp = [ 1:2 ];
            k = numel(ResectedChannelLabel);
            for ii=1:length(tmp),
                ResectedChannelLabel(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
            end
            
            ContactLabel = {'TP'};
            tmp = [ 1:4];
            k = numel(ResectedChannelLabel);
            for ii=1:length(tmp),
                ResectedChannelLabel(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
            end
            
            %---------------------------------
            %---------------------------------
            switch f
                case 'ftData_TS_2013-07-02_Start12-55-11_End13-04-55_Dur_10M-57S_Fs513'
                    start_onset_time =  74;%
                    end_onset_time = 74+ 110;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [54, 60:62];% in this seizure we had all channels as bad channels!!!!!
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
               
            end
    end
end %for i=1:numel(flist)
