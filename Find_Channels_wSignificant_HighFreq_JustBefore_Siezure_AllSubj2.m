clear;clc;close('all')
save_flag = 1;

addpath E:\Software\fieldtrip-20130815 %  E:\Software\eeglab13_1_1b
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

mpath = 'E:\HFO_DATA_ECOG';
flist = { ...
    'E:\HFO_DATA_ECOG\ftData_GH_2013-07-30_Start03-17-52_End03-27-52_Dur_10M-55S_Fs513.mat'
    'E:\HFO_DATA_ECOG\ftData_GH_2013-08-06_Start15-42-23_End15-58-43_Dur_21M-11S_Fs513'
    'E:\HFO_DATA_ECOG\ftData_GH_2013-08-07_Start00-51-19_End00-55-48_Dur_17M-58S_Fs513.mat'
    'E:\HFO_DATA_ECOG\ftData_DM_2014-02-22_Start13-01-09_End13-07-18_Dur_13M-20S_Fs1026.mat'
    'E:\HFO_DATA_ECOG\ftData_DM_2014-02-22_Start17-23-22_End17-30-56_Dur_11M-11S_Fs1026.mat'
    'E:\HFO_DATA_ECOG\ftData_DM_2014-02-22_Start22-49-01_End22-58-48_Dur_12M-7S_Fs1026.mat'
    
    };

for i = 1 : numel(flist)
    fname = flist{i};
    [p,f,e] = fileparts( fname );
    ix2 = strfind( f , '_Start' )  ;
    ix1 = strfind( f , 'ftData_' )  ;
    subjname = f((ix1+7):(ix2-1));
    
    ResectedChannelLabel = {};
    switch subjname
          case 'GH_2013-07-30'
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
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value );
                    
                case 'ftData_GH_2013-08-06_Start15-42-23_End15-58-43_Dur_21M-11S_Fs513'
                    start_onset_time = 300 - 7; 
                    end_onset_time = 293 + 7*60 -24;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;% 3; % 
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value );
                    
                case 'ftData_GH_2013-08-07_Start00-51-19_End00-55-48_Dur_17M-58S_Fs513'
                    start_onset_time = 170 - 0;
                    end_onset_time = 170 + 4*60+29;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value );
                    
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
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value );
                    
                    case 'ftData_DM_2014-02-22_Start17-23-22_End17-30-56_Dur_11M-11S_Fs1026'
                    start_onset_time = 4*60-21;%
                    end_onset_time = 219 + 2 * 60 + 34;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value );
                    
                    
                case 'ftData_DM_2014-02-22_Start22-49-01_End22-58-48_Dur_12M-7S_Fs1026'
                    start_onset_time = 2 *60+21;% 
                    end_onset_time = 141 + 2 * 60+ 52;
                    BackGroundIdx_time = [0 60];
                    TimeWindowBeforeSiezure_dur = 2;%3;%;
                    P_value = 0.01;
                    fname_bipol = [p, '\' , f , '_Bipolar.mat'];
                    func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname_bipol , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value );
                    
                
                    
            end
           
                    
    end
    
end %for i=1:numel(flist)
