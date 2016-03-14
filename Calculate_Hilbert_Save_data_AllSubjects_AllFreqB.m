
clear;clc

%fl = rdir( 'F:\HFO_DATA_ECOG\*\**\ftData*.mat' );

% flist = { ...
%     'D:\ECoG_Data_HighFrequency\2014-11-13_4siezure_2Patients\ftData_PATTERSON~ EME_78891e84-a179-4981-835e-c2884a9cb79d.mat'
%     'D:\ECoG_Data_HighFrequency\2014-11-13_4siezure_2Patients\ftData_SMITH~ MARSHAL_0e94ed10-cb62-4bfc-8553-19d0a0133353.mat'
%     'D:\ECoG_Data_HighFrequency\2014-11-13_4siezure_2Patients\ftData_SMITH~ MARSHAL_0fae1013-ddda-4a32-bcff-49dc5c076eac.mat'
%     'D:\ECoG_Data_HighFrequency\2015-06-06_SeizureClips_3Patients\ftData_MN_2015-09-04_Start05-15-27_End05-23-26_Dur_7M-60S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\2015-06-06_SeizureClips_3Patients\ftData_MN_2015-09-04_Start22-08-24_End22-19-36_Dur_11M-13S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\2015-06-06_SeizureClips_3Patients\ftData_MS2014-10-01_Start23-05-54_End23-11-07_Dur_5M-13S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\2015-06-06_SeizureClips_3Patients\ftData_MS_2014-10-01_Start08-29-33_End0-40-14_Dur_10M-41S_Fs513.mat'
%     'D:\ECoG_Data_HighFrequency\2015-06-06_SeizureClips_3Patients\ftData_MS_2014-10-01_Start15-08-07_End15-18-09_Dur_10M-2S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\2015-06-06_SeizureClips_3Patients\ftData_MU_2015-04-14_Start08-48-51_End09-00-59_Dur_12M-8S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\2015-06-06_SeizureClips_3Patients\ftData_MU_2015-04-14_Start09-04-20_End09-18-04_Dur_13M-44S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\2015-06-06_SeizureClips_3Patients\ftData_MU_2015-04-14_Start09-14-38_End09-31-32_Dur_16M-53S_Fs1026.mat'};
%{
flist = { ...
    'E:\ft_format_data\ftData_MN_2015-09-04_Start05-15-27_End05-23-26_Dur_7M-60S_Fs1026_Bipolar.mat'
    'E:\ft_format_data\ftData_EP_2014-03-10_Start02-03-10_End02-15-01_Dur_11M-49S_Fs1026_Bipolar.mat'
    'E:\ft_format_data\ftData_MN_2015-09-04_Start22-08-24_End22-19-36_Dur_11M-13S_Fs1026_Bipolar.mat'
    'E:\ft_format_data\ftData_MS_2014-10-01_Start15-08-07_End15-18-09_Dur_10M-2S_Fs1026_Bipolar.mat'
    'E:\ft_format_data\ftData_MS_2014-10-01_Start23-05-54_End23-11-07_Dur_5M-13S_Fs1026_Bipolar.mat'
    'E:\ft_format_data\ftData_MU_2015-04-14_Start08-48-51_End09-00-59_Dur_12M-8S_Fs1026_Bipolar.mat'
    'E:\ft_format_data\ftData_MU_2015-04-14_Start09-04-20_End09-18-04_Dur_13M-44S_Fs1026_Bipolar.mat'
    'E:\ft_format_data\ftData_MU_2015-04-14_Start09-14-38_End09-31-32_Dur_16M-53S_Fs1026_Bipolar.mat'    
    };
%}

flist ={...
%     'E:\HFO_DATA_ECOG\ftData_GH_2013-07-30_Start03-17-52_End03-27-52_Dur_10M-55S_Fs513_Bipolar'
%     'E:\HFO_DATA_ECOG\ftData_GH_2013-08-06_Start15-42-23_End15-58-43_Dur_21M-11S_Fs513_Bipolar'
%     'E:\HFO_DATA_ECOG\ftData_GH_2013-08-07_Start00-51-19_End00-55-48_Dur_17M-58S_Fs513_Bipolar'
%     'E:\HFO_DATA_ECOG\ftData_DM_2014-02-22_Start13-01-09_End13-07-18_Dur_13M-20S_Fs1026_Bipolar'
%     'E:\HFO_DATA_ECOG\ftData_DM_2014-02-22_Start22-49-01_End22-58-48_Dur_12M-7S_Fs1026_Bipolar'
%     'E:\HFO_DATA_ECOG\ftData_DM_2014-02-22_Start17-23-22_End17-30-56_Dur_11M-11S_Fs1026_Bipolar'
%     'E:\HFO_DATA_ECOG\ftData_BB_2013-11-11_Start19-16-27_End19-18-45_Dur_3M-44S_Fs513_Bipolar'
%     'E:\HFO_DATA_ECOG\ftData_BB_2013-11-12_Start04-43-11_End04-50-42_Dur_9M-10S_Fs513_Bipolar'
%     'E:\HFO_DATA_ECOG\ftData_BB_2013-11-13_Start03-51-48_End03-59-18_Dur_8M-5S_Fs513_Bipolar'
%     'E:\HFO_DATA_ECOG\ftData_ZS_2014-03-11_Start18-19-54_End18-22-02_Dur_6M-36S_Fs1026_Bipolar'
%     'E:\HFO_DATA_ECOG\ftData_ZS_2014-03-12_Start07-52-34_End07-53-47_Dur_9M-14S_Fs1026_Bipolar'
%     'E:\HFO_DATA_ECOG\ftData_ZS_2014-03-12_Start20-16-44_End20-19-05_Dur_7M-40S_Fs1026_Bipolar'
% 'F:\HFO_DATA_ECOG\ftData_ET_2014-02-17_Start19-55-54_End20-07-20_Dur_11M-24S_Fs513_Bipolar'
% 'F:\HFO_DATA_ECOG\ftData_ET_2014-02-18_Start02-31-14_End02-46-32_Dur_15M-16S_Fs513_Bipolar'
% 'F:\HFO_DATA_ECOG\ftData_ET_2014-02-18_Start09-43-43_End09-49-17_Dur_5M-33S_Fs513_Bipolar'
% 'F:\HFO_DATA_ECOG\ftData_ET_2014-02-18_Start19-33-26_End19-35-23_Dur_1M-57S_Fs513_Bipolar'
% 'F:\HFO_DATA_ECOG\ftData_ET_2014-02-18_Start20-49-22_End20-52-38_Dur_3M-15S_Fs513_Bipolar'
% 'F:\HFO_DATA_ECOG\ftData_ET_2014-02-19_Start03-44-39_End03-46-21_Dur_1M-42S_Fs513_Bipolar'
% 'F:\HFO_DATA_ECOG\ftData_ET_2014-02-24_Start04-39-00_End04-50-45_Dur_11M-44S_Fs513_Bipolar'
% 'E:\HFO_DATA_ECOG\ftData_BB_2013-11-11_Start19-16-27_End19-18-45_Dur_3M-44S_Fs513_Bipolar'
% 'E:\HFO_DATA_ECOG\ftData_BB_2013-11-12_Start04-43-11_End04-50-42_Dur_9M-10S_Fs513_Bipolar'
% 'E:\HFO_DATA_ECOG\ftData_BB_2013-11-13_Start03-51-48_End03-59-18_Dur_8M-5S_Fs513_Bipolar'
%     
% 'E:\HFO_DATA_ECOG\ftData_GL_2013-11-11_Start19-16-27_End19-18-45_Dur_8M-27S_Fs1026_Bipolar'
% 'E:\HFO_DATA_ECOG\ftData_GL_2013-11-13_Start12-55-28_End12-58_17_Dur_3M-43S_Fs1026_Bipolar'
% 'E:\HFO_DATA_ECOG\ftData_GL_2013-11-14_Start06-46-20_End06-47-45_Dur_6M-55S_Fs1026_Bipolar'
% 
% 'E:\HFO_DATA_ECOG\ftData_MN_2013-01-23_Start18-48-37_End18-49-20_Dur_10M-8S_Fs513_Bipolar'
% 'E:\HFO_DATA_ECOG\ftData_MN_2013-01-24_Start08-14-07_End08-19-36_Dur_8M-11S_Fs513_Bipolar'
% 'E:\HFO_DATA_ECOG\ftData_MN_2013-01-25_Start13-58-09_End14-01-44_Dur_5M-32S_Fs513_Bipolar'    
%     
% 'E:\HFO_DATA_ECOG\ftData_TS_2013-07-02_Start12-55-11_End13-04-55_Dur_10M-57S_Fs513_Bipolar'

% 'E:\HFO_GRIDS_14-12-2015\ftData_CW_2015-07-30_Start15-41-10_End16-09-28_Dur_28M-15S_Fs1026_Bipolar'
% 'E:\HFO_GRIDS_14-12-2015\ftData_CW_2015-07-30_Start18-36-19_End18-56-33_Dur_20M-11S_Fs1026_Bipolar'
% 'E:\HFO_GRIDS_14-12-2015\ftData_CW_2015-07-30_Start19-01-48_End19-08-06_Dur_6M-17S_Fs1026_Bipolar'
% 
% 'E:\HFO_GRIDS_14-12-2015\ftData_JC_2015-10-30_Start21-29-09_End21-46-56_Dur_17M-44S_Fs1026_Bipolar'
% 'E:\HFO_GRIDS_14-12-2015\ftData_JC_2015-11-01_Start14-54-59_End15-11-46_Dur_16M-46S_Fs1026_Bipolar'
% 'E:\HFO_GRIDS_14-12-2015\ftData_JC_2015-11-01_Start19-10-22_End19-27-03_Dur_16M-40S_Fs1026_Bipolar'
% 'E:\HFO_GRIDS_14-12-2015\ftData_JC_2015-11-01_Start21-38-08_End21-51-49_Dur_13M-40S_Fs1026_Bipolar'
% 'E:\HFO_GRIDS_14-12-2015\ftData_JC_2015-11-02_Start06-18-37_End06-36-40_Dur_18M-2S_Fs1026_Bipolar'
% 
% 'E:\HFO_GRIDS_14-12-2015\ftData_JM_2015-07-13_Start10-27-14_End10-49-31_Dur_22M-14S_Fs1026_Bipolar'
% 'E:\HFO_GRIDS_14-12-2015\ftData_JM_2015-07-13_Start14-01-52_End14-10-47_Dur_8M-54S_Fs1026_Bipolar'
% 'E:\HFO_GRIDS_14-12-2015\ftData_JM_2015-07-13_Start15-18-03_End15-44-54_Dur_26M-48S_Fs1026_Bipolar'
% 'E:\HFO_GRIDS_14-12-2015\ftData_JM_2015-07-14_Start08-31-57_End08-47-04_Dur_15M-5S_Fs1026_Bipolar'
% 'E:\HFO_GRIDS_14-12-2015\ftData_JM_2015-07-14_Start13-02-44_End13-45-26_Dur_42M-37S_Fs1026_Bipolar'
%  
'Z:\Bahar\Files\HFO_GRIDS_13-02-2016\ftData_CD_2016-01-26_Start19-40-29_End19-52-38_Dur_12M-9S_Fs1026_Bipolar'
'Z:\Bahar\Files\HFO_GRIDS_13-02-2016\ftData_CD_2016-01-26_Start23-20-12_End23-25-54_Dur_5M-44S_Fs1026_Bipolar'
'Z:\Bahar\Files\HFO_GRIDS_13-02-2016\ftData_CD_2016-01-27_Start01-46-49_End01-55-11_Dur_8M-24S_Fs1026_Bipolar'
'Z:\Bahar\Files\HFO_GRIDS_13-02-2016\ftData_CD_2016-01-27_Start04-25-23_End04-29-39_Dur_4M-16S_Fs1026_Bipolar'
'Z:\Bahar\Files\HFO_GRIDS_13-02-2016\ftData_CD_2016-01-27_Start12-34-05_End12-39-40_Dur_5M-36S_Fs1026_Bipolar'
'Z:\Bahar\Files\HFO_GRIDS_13-02-2016\ftData_CD_2016-01-27_Start22-29-50_End22-34-59_Dur_5M-9S_Fs1026_Bipolar'
'Z:\Bahar\Files\HFO_GRIDS_13-02-2016\ftData_ML_2015-11-03_Start17-42-43_End17-47-27_Dur_4M-47S_Fs1026_Bipolar'
'Z:\Bahar\Files\HFO_GRIDS_13-02-2016\ftData_ML_2015-11-03_Start19-43-02_End19-53-00_Dur_9M-60S_Fs1026_Bipolar'
'Z:\Bahar\Files\HFO_GRIDS_13-02-2016\ftData_ML_2015-11-04_Start06-34-02_End06-44-54_Dur_10M-51S_Fs1026_Bipolar'



% 'E:\HFO_GRIDS_14-12-2015\ftData_TB_2015-07-02_Start03-29-55_End03-42-27_Dur_15M-0S_Fs1026_Bipolar'
% 'E:\HFO_GRIDS_14-12-2015\ftData_TB_2015-07-07_Start15-51-37_End15-55-58_Dur_4M-20S_Fs1026_Bipolar'
% 'E:\HFO_GRIDS_14-12-2015\ftData_TB_2015-07-09_Start01-34-04_End01-43-08_Dur_9M-3S_Fs1026_Bipolar'
% 'E:\HFO_GRIDS_14-12-2015\ftData_TB_2015-07-09_Start04-04-41_End04-09-59_Dur_5M-17S_Fs1026_Bipolar'
% 'E:\HFO_GRIDS_14-12-2015\ftData_TB_2015-07-09_Start06-06-36_End06-11-42_Dur_5M-6S_Fs1026_Bipolar'
% 
% 'E:\HFO_GRIDS_14-12-2015\ftData_VN_2015-07-07_Start23-51-07_End00-15-46_Dur_24M-36S_Fs1026_Bipolar'
    };



for i = 1 : numel(flist)
%     fn = fl(i).name
    fn = flist{i}
    [p,f,e] = fileparts( fn );
    clear data
    load(fn);
    for freq = 70:20:(data.fsample)/5
        tic
        cfg = [];
        cfg.bpfilter = 'yes';
        cfg.bpfreq = freq + [0 +20];
        cfg.hilbert = 'abs';
        clear datah1
        datah1 = ft_preprocessing( cfg , data );
        save( ['Z:\Bahar\Files\HFO_GRIDS_13-02-2016' , '\' , f , '_Hlb_' , num2str(cfg.bpfreq(1)) , '-' , num2str(cfg.bpfreq(2)) , 'Hz'] , 'datah1' )
        toc
    end
end