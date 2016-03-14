clear;clc;close('all')
save_flag = 1;
addpath(genpath('C:\Program Files\MATLAB\R2013a\toolbox\fieldtrip'))
%addpath E:\Software\fieldtrip-20130815 %  E:\Software\eeglab13_1_1b
ft_defaults


%%
%------------------------------
% mpath = 'D:\ECoG_Data_HighFrequency\ft_format_data\';
% flist = { ...
%     'D:\ECoG_Data_HighFrequency\ft_format_data\ftData_EP_2014-03-10_Start02-03-10_End02-15-01_Dur_11M-49S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\ft_format_data\ftData_MN_2015-09-04_Start05-15-27_End05-23-26_Dur_7M-60S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\ft_format_data\ftData_MN_2015-09-04_Start22-08-24_End22-19-36_Dur_11M-13S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\ft_format_data\ftData_MS_2014-10-01_Start15-08-07_End15-18-09_Dur_10M-2S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\ft_format_data\ftData_MS_2014-10-01_Start23-05-54_End23-11-07_Dur_5M-13S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\ft_format_data\ftData_MU_2015-04-14_Start08-48-51_End09-00-59_Dur_12M-8S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\ft_format_data\ftData_MU_2015-04-14_Start09-04-20_End09-18-04_Dur_13M-44S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\ft_format_data\ftData_MU_2015-04-14_Start09-14-38_End09-31-32_Dur_16M-53S_Fs1026.mat'};
% 
% 

mpath = 'F:\HFO_DATA_ECOG\';
flist = { ...
%     'E:\HFO_DATA_ECOG\ftData_GH_2013-07-30_Start03-17-52_End03-27-52_Dur_10M-55S_Fs513.mat'
%     'E:\HFO_DATA_ECOG\ftData_GH_2013-08-06_Start15-42-23_End15-58-43_Dur_21M-11S_Fs513.mat'
%     'E:\HFO_DATA_ECOG\ftData_GH_2013-08-07_Start00-51-19_End00-55-48_Dur_17M-58S_Fs513.mat'
%     'E:\HFO_DATA_ECOG\ftData_DM_2014-02-22_Start13-01-09_End13-07-18_Dur_13M-20S_Fs1026.mat'
%     'E:\HFO_DATA_ECOG\ftData_DM_2014-02-22_Start17-23-22_End17-30-56_Dur_11M-11S_Fs1026.mat'
%     'E:\HFO_DATA_ECOG\ftData_DM_2014-02-22_Start22-49-01_End22-58-48_Dur_12M-7S_Fs1026.mat'
%     'E:\HFO_DATA_ECOG\ftData_ZS_2014-03-11_Start18-19-54_End18-22-02_Dur_6M-36S_Fs1026.mat'
%     'E:\HFO_DATA_ECOG\ftData_ZS_2014-03-12_Start07-52-34_End07-53-47_Dur_9M-14S_Fs1026.mat'
%     'E:\HFO_DATA_ECOG\ftData_ZS_2014-03-12_Start20-16-44_End20-19-05_Dur_7M-40S_Fs1026.mat'
    'F:\HFO_DATA_ECOG\ftData_ET_2014-02-17_Start19-55-54_End20-07-20_Dur_11M-24S_Fs513.mat'
    'F:\HFO_DATA_ECOG\ftData_ET_2014-02-18_Start02-31-14_End02-46-32_Dur_15M-16S_Fs513.mat'
    'F:\HFO_DATA_ECOG\ftData_ET_2014-02-18_Start09-43-43_End09-49-17_Dur_5M-33S_Fs513.mat'
    'F:\HFO_DATA_ECOG\ftData_ET_2014-02-18_Start19-33-26_End19-35-23_Dur_1M-57S_Fs513.mat'
    'F:\HFO_DATA_ECOG\ftData_ET_2014-02-18_Start20-49-22_End20-52-38_Dur_3M-15S_Fs513.mat'
    'F:\HFO_DATA_ECOG\ftData_ET_2014-02-19_Start03-44-39_End03-46-21_Dur_1M-42S_Fs513.mat'
    'F:\HFO_DATA_ECOG\ftData_ET_2014-02-24_Start04-39-00_End04-50-45_Dur_11M-44S_Fs513.mat'
    };

for i = 1 : numel(flist)
    fname = flist{i};
    [p,f,e] = fileparts( fname );
    ix2 = strfind( f , '_Start' )  ;
    ix1 = strfind( f , 'ftData_' )  ;
    subjname = f((ix1+7):(ix2-1));
    
    ResectedChannelLabel = {};
    switch subjname
          case { 'GH_2013-07-30' , 'GH_2013-08-06' , 'GH_2013-08-07' }
            %% -- Define resected electrodes
            %---------- grid temporal
              ContactLabel = {'LT'};
            tmp = [1:4, 9:12, 17:19, 25:27, 28];
            k = numel(ResectedChannelLabel);
            for ii=1:length(tmp),
                ResectedChannelLabel(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
            end
           
            %---------------------------------
            %---------------------------------
            switch f
                case 'ftData_GH_2013-07-30_Start03-17-52_End03-27-52_Dur_10M-55S_Fs513'
                    start_onset_time = 56;
                    end_onset_time = 56 + 145;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;% 3; % ;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [21, 33 , 35 ,36 ,56 ,57 ,59];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
                    
                case 'ftData_GH_2013-08-06_Start15-42-23_End15-58-43_Dur_21M-11S_Fs513'
                    start_onset_time = 300 - 7; 
                    end_onset_time = 293 + 7*60 -24;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;% 3; % 
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [55:57 , 59 ,60];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
                    
                case 'ftData_GH_2013-08-07_Start00-51-19_End00-55-48_Dur_17M-58S_Fs513'
                    start_onset_time = 170 - 0;
                    end_onset_time = 170 + 4*60+29;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [55:57 , 59 ,60];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
            end
            
         case 'DM_2014-02-22'
            %% -- Define resected electrodes
            %---------- grid temporal
             ContactLabel = {'LFT'};
            tmp = [2:5, 10:12, 18:19  ];
            k = numel(ResectedChannelLabel);
            for ii=1:length(tmp),
                ResectedChannelLabel(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
            end
            
            %---------------------------------
            %---------------------------------
            switch f
                case 'ftData_DM_2014-02-22_Start13-01-09_End13-07-18_Dur_13M-20S_Fs1026'
                    start_onset_time = 7 *60 +12;% 
                    end_onset_time = 432 + 60+ 14;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
                    case 'ftData_DM_2014-02-22_Start17-23-22_End17-30-56_Dur_11M-11S_Fs1026'
                    start_onset_time = 4*60-21;%
                    end_onset_time = 219 + 2 * 60 + 34;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
                    
                case 'ftData_DM_2014-02-22_Start22-49-01_End22-58-48_Dur_12M-7S_Fs1026'
                    start_onset_time = 2 *60+21;% 
                    end_onset_time = 141 + 2 * 60+ 52;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );   
                    
            end
           
        case { 'ZS_2014-03-11' , 'ZS_2014-03-12' , 'ZS_2014-03-12' }
            %% -- Define resected electrodes
            %---------- grid temporal
            ContactLabel = {'LFT'};
            tmp = [4:6, 11:14, 19:23  ];
            k = numel(ResectedChannelLabel);
            for ii=1:length(tmp),
                ResectedChannelLabel(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
            end
            
            %---------------------------------
            %---------------------------------
            switch f
                case 'ftData_ZS_2014-03-11_Start18-19-54_End18-22-02_Dur_6M-36S_Fs1026'
                    start_onset_time = 1 * 60 + 9;%
                    end_onset_time = 69 + 128;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [34 , 35 ,56 ,65:66,69:74, 76, 78:80];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
                    
                case 'ftData_ZS_2014-03-12_Start07-52-34_End07-53-47_Dur_9M-14S_Fs1026'
                    start_onset_time = 3*60 + 1;%
                    end_onset_time = 2181 + 1 * 60 + 13;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [34:35, 61, 65, 68:74, 78, 79:80];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
                    
                case 'ftData_ZS_2014-03-12_Start20-16-44_End20-19-05_Dur_7M-40S_Fs1026'
                    start_onset_time = 23;%
                    end_onset_time = 23 + 2 * 60+ 31;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [34:35, 69:74, 78:90];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                  
                    
                    
            end
    
    
    
    
    
     case {'ET_2014-02-17','ET_2014-02-18','ET_2014-02-19','ET_2014-02-19','ET_2014-02-24'} 
            %% -- Define resected electrodes
            %---------- grid temporal
             ContactLabel = {'LT'};
            tmp = [ 1:7, 9:14, 17:20, 21 ];
            k = numel(ResectedChannelLabel);
            for ii=1:length(tmp),
                ResectedChannelLabel(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
            end
            
            %---------------------------------
            %---------------------------------
            switch f
                case 'ftData_ET_2014-02-17_Start19-55-54_End20-07-20_Dur_11M-24S_Fs513'
                    start_onset_time =  60 - 11;%
                    end_onset_time = 49 + (3 * 180) -3;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [];% in this seizure we had all channels as bad channels!!!!!
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
                    
                case 'ftData_ET_2014-02-18_Start02-31-14_End02-46-32_Dur_15M-16S_Fs513'
                    start_onset_time = 60 + 14;%
                    end_onset_time = 74 + 6 * 60 + 36;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
                    
                case 'ftData_ET_2014-02-18_Start09-43-43_End09-49-17_Dur_5M-33S_Fs513'
                    start_onset_time = 60 +31;%
                    end_onset_time = 91 + 2 * 60+ 19;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                  
                    case 'ftData_ET_2014-02-18_Start19-33-26_End19-35-23_Dur_1M-57S_Fs513'
                    start_onset_time = 30;%
                    end_onset_time = 30 +  60 - 52;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [31:34 , 43, 46 , 49 , 56:57, 66:67];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
                    
                  case 'ftData_ET_2014-02-18_Start20-49-22_End20-52-38_Dur_3M-15S_Fs513'
                    start_onset_time = 60 +11;%
                    end_onset_time = 71 + 19;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [3:4 , 6 ,18];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                    
                    
                  case 'ftData_ET_2014-02-19_Start03-44-39_End03-46-21_Dur_1M-42S_Fs513'
                    start_onset_time = 20;%
                    end_onset_time = 20 +  60;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [5:6, 10:12, 18:20, 47:49, 57:58, 62:63];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                  
                 case 'ftData_ET_2014-02-24_Start04-39-00_End04-50-45_Dur_11M-44S_Fs513'
                    start_onset_time = 60 + 22;%
                    end_onset_time = 82 +  4 * 60 + 40;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    Badchan = [9:12, 51, 62, 63];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value, Badchan );
                     
            end
    end
end %for i=1:numel(flist)
