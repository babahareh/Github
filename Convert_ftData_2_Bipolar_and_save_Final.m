clear;clc
close('all')
save_flag = 1;

%addpath(genpath('C:\Program Files\MATLAB\R2013a\toolbox\fieldtrip'))
%addpath E:\Software\fieldtrip-20130815 %  E:\Software\eeglab13_1_1b
ft_defaults

BandStopFreq = [59,61; 119 121; 179 181];


%%
%--------------------------------------------------------------------------
%==========================================================================
%{
mpath = 'D:\ECoG_Data_HighFrequency\ft_format_data\';
flist = rdir( [mpath, 'ftData_*_Fs1026.mat'] );
% 
%     'D:\ECoG_Data_HighFrequency\ft_format_data\ftData_EP_2014-03-10_Start02-03-10_End02-15-01_Dur_11M-49S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\ft_format_data\ftData_MN_2015-09-04_Start05-15-27_End05-23-26_Dur_7M-60S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\ft_format_data\ftData_MN_2015-09-04_Start22-08-24_End22-19-36_Dur_11M-13S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\ft_format_data\ftData_MS_2014-10-01_Start15-08-07_End15-18-09_Dur_10M-2S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\ft_format_data\ftData_MS_2014-10-01_Start23-05-54_End23-11-07_Dur_5M-13S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\ft_format_data\ftData_MU_2015-04-14_Start08-48-51_End09-00-59_Dur_12M-8S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\ft_format_data\ftData_MU_2015-04-14_Start09-04-20_End09-18-04_Dur_13M-44S_Fs1026.mat'
%     'D:\ECoG_Data_HighFrequency\ft_format_data\ftData_MU_2015-04-14_Start09-14-38_End09-31-32_Dur_16M-53S_Fs1026.mat'
%}
%==========================================================================
%{
mpath = 'D:\ECoG_Data_HighFrequency\2015-07-07_Travis_Bell_SeizueClips\';
flist = rdir( [mpath, 'ftData_*_Fs1026.mat'] );
%}
%==========================================================================
% mpath = 'E:\HFO_DATA_ECOG\';
% flist = rdir( [mpath, 'ftData_*.mat'] );
% mpath = 'E:\HFO_DATA_ECOG\';
% flist = {...
% 
%     'E:\HFO_DATA_ECOG\ftData_ZS_2014-03-11_Start18-19-54_End18-22-02_Dur_6M-36S_Fs1026.mat'
%     'E:\HFO_DATA_ECOG\ftData_ZS_2014-03-12_Start07-52-34_End07-53-47_Dur_9M-14S_Fs1026.mat'
%     'E:\HFO_DATA_ECOG\ftData_ZS_2014-03-12_Start20-16-44_End20-19-05_Dur_7M-40S_Fs1026.mat'
% };
% 
flist = {...
% 'E:\HFO_DATA_ECOG\ftData_BB_2013-11-11_Start19-16-27_End19-18-45_Dur_3M-44S_Fs513.mat'
% 'E:\HFO_DATA_ECOG\ftData_BB_2013-11-12_Start04-43-11_End04-50-42_Dur_9M-10S_Fs513.mat'
% 'E:\HFO_DATA_ECOG\ftData_BB_2013-11-13_Start03-51-48_End03-59-18_Dur_8M-5S_Fs513.mat'
%     
% 'E:\HFO_DATA_ECOG\ftData_GL_2013-11-11_Start19-16-27_End19-18-45_Dur_8M-27S_Fs1026.mat'
% 'E:\HFO_DATA_ECOG\ftData_GL_2013-11-13_Start12-55-28_End12-58_17_Dur_3M-43S_Fs1026.mat'
% 'E:\HFO_DATA_ECOG\ftData_GL_2013-11-14_Start06-46-20_End06-47-45_Dur_6M-55S_Fs1026.mat'
% 
% 'E:\HFO_DATA_ECOG\ftData_MN_2013-01-23_Start18-48-37_End18-49-20_Dur_10M-8S_Fs513.mat'
% 'E:\HFO_DATA_ECOG\ftData_MN_2013-01-24_Start08-14-07_End08-19-36_Dur_8M-11S_Fs513.mat'
% 'E:\HFO_DATA_ECOG\ftData_MN_2013-01-25_Start13-58-09_End14-01-44_Dur_5M-32S_Fs513.mat'    
%     
% 'E:\HFO_DATA_ECOG\ftData_TS_2013-07-02_Start12-55-11_End13-04-55_Dur_10M-57S_Fs513.mat'
% 
% 'E:\HFO_GRIDS_14-12-2015\ftData_CW_2015-07-30_Start15-41-10_End16-09-28_Dur_28M-15S_Fs1026.mat'
% 'E:\HFO_GRIDS_14-12-2015\ftData_CW_2015-07-30_Start18-36-19_End18-56-33_Dur_20M-11S_Fs1026.mat'
% 'E:\HFO_GRIDS_14-12-2015\ftData_CW_2015-07-30_Start19-01-48_End19-08-06_Dur_6M-17S_Fs1026.mat'
% 
% 'E:\HFO_GRIDS_14-12-2015\ftData_JC_2015-10-30_Start21-29-09_End21-46-56_Dur_17M-44S_Fs1026.mat'
% 'E:\HFO_GRIDS_14-12-2015\ftData_JC_2015-11-01_Start14-54-59_End15-11-46_Dur_16M-46S_Fs1026.mat'
% 'E:\HFO_GRIDS_14-12-2015\ftData_JC_2015-11-01_Start19-10-22_End19-27-03_Dur_16M-40S_Fs1026.mat'
% 'E:\HFO_GRIDS_14-12-2015\ftData_JC_2015-11-01_Start21-38-08_End21-51-49_Dur_13M-40S_Fs1026.mat'
% 'E:\HFO_GRIDS_14-12-2015\ftData_JC_2015-11-02_Start06-18-37_End06-36-40_Dur_18M-2S_Fs1026.mat'

% 'E:\HFO_GRIDS_14-12-2015\ftData_JM_2015-07-13_Start10-27-14_End10-49-31_Dur_22M-14S_Fs1026.mat'
% 'E:\HFO_GRIDS_14-12-2015\ftData_JM_2015-07-13_Start14-01-52_End14-10-47_Dur_8M-54S_Fs1026.mat'
% 'E:\HFO_GRIDS_14-12-2015\ftData_JM_2015-07-13_Start15-18-03_End15-44-54_Dur_26M-48S_Fs1026.mat'
% 'E:\HFO_GRIDS_14-12-2015\ftData_JM_2015-07-14_Start08-31-57_End08-47-04_Dur_15M-5S_Fs1026.mat'
% 'E:\HFO_GRIDS_14-12-2015\ftData_JM_2015-07-14_Start13-02-44_End13-45-26_Dur_42M-37S_Fs1026.mat'
% 
% 'E:\HFO_GRIDS_14-12-2015\ftData_TB_2015-07-02_Start03-29-55_End03-42-27_Dur_15M-0S_Fs1026.mat'
% 'E:\HFO_GRIDS_14-12-2015\ftData_TB_2015-07-07_Start15-51-37_End15-55-58_Dur_4M-20S_Fs1026.mat'
% 'E:\HFO_GRIDS_14-12-2015\ftData_TB_2015-07-09_Start01-34-04_End01-43-08_Dur_9M-3S_Fs1026.mat'
% 'E:\HFO_GRIDS_14-12-2015\ftData_TB_2015-07-09_Start04-04-41_End04-09-59_Dur_5M-17S_Fs1026.mat'
% 'E:\HFO_GRIDS_14-12-2015\ftData_TB_2015-07-09_Start06-06-36_End06-11-42_Dur_5M-6S_Fs1026.mat'
% 
 'E:\HFO_GRIDS_14-12-2015\ftData_VN_2015-07-07_Start23-51-07_End00-15-46_Dur_24M-36S_Fs1026.mat'
}
%}

%     'F:\HFO_DATA_ECOG\ftData_ET_2014-02-17_Start19-55-54_End20-07-20_Dur_11M-24S_Fs513.mat'
%     'F:\HFO_DATA_ECOG\ftData_ET_2014-02-18_Start02-31-14_End02-46-32_Dur_15M-16S_Fs513.mat'
%     'F:\HFO_DATA_ECOG\ftData_ET_2014-02-18_Start09-43-43_End09-49-17_Dur_5M-33S_Fs513.mat'
%     'F:\HFO_DATA_ECOG\ftData_ET_2014-02-18_Start19-33-26_End19-35-23_Dur_1M-57S_Fs513.mat'
%     'F:\HFO_DATA_ECOG\ftData_ET_2014-02-18_Start20-49-22_End20-52-38_Dur_3M-15S_Fs513.mat'
%     'F:\HFO_DATA_ECOG\ftData_ET_2014-02-19_Start03-44-39_End03-46-21_Dur_1M-42S_Fs513.mat'
%     'F:\HFO_DATA_ECOG\ftData_ET_2014-02-24_Start04-39-00_End04-50-45_Dur_11M-44S_Fs513.mat'



%%
for i = 1: numel(flist)
    fname = flist{i,1}
    [p,f,e] = fileparts( fname );
    ix2 = strfind( f , '_Start' )  ;
    ix1 = strfind( f , 'ftData_' )  ;
    subjname = f((ix1+7):(ix2-1));
    
    ResectedChannelLabel = {};
    label = {}; loc = [];
   
    switch subjname
        case {'MN_2013-01-23','MN_2013-01-24','MN_2013-01-25'}
            %% -- Define resected electrodes
        label = {}; loc = [];
        %---------- grid temporal
        ContactLabel = {'LG'};
        tmp = [1:32];
        nx = 8; ny = 4;
        
        X0 = 0 ; Y0 = 0; Z0 = 0;
        k = numel(label);
        for ii=1:length(tmp),
            label(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
        end
        [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
%         xx=x;
%         x=y(:,end:-1:1);
%         y=xx;
%         y = y(end:-1:1);
        
        loc0 = [];
        loc0(:,1) = X0 + x(tmp); loc0(:,2) = Y0 + y(tmp); loc0(:,3) = Z0 + 0*x(tmp);
        loc = [ loc ; loc0 ];
        %---- rearrange label number
%         label = label(64:-1:1);
        
        %---------- Strips
        ContactLabel = {'AT';'AST';'PST';'STO'};
        X0_strip = [ 0 , 0 , 4 , 0];
        Y0_strip = [ -1 , -2 , -2 , -3 ];
        Z0_strip = [ -1 , -2, -3 , -4 ];
        strip_cntno = [ 6, 4, 4 , 4];
        
        for ist = 1 : numel( ContactLabel )
            tmp = 1:strip_cntno(ist);
            k = numel(label);
            for ii=1:length(tmp),
                label(k+ii) = {[ContactLabel{ist} , num2str( tmp(ii) ) ]};
            end
            nx = length(tmp); ny = 1; [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
            loc0 = []; loc0(:,1) = X0_strip(ist)+x(tmp); loc0(:,2) = Y0_strip(ist)+y(tmp); loc0(:,3) = Z0_strip(ist)+0*x(tmp);
            loc = [ loc ; loc0 ];
        end
        
        
        case 'TS_2013-07-02'
            %% -- Define resected electrodes
        label = {}; loc = [];
        %---------- grid temporal
        ContactLabel = {'TG'};
        tmp = [1:32];
        nx = 8; ny = 4;
        
        X0 = 0 ; Y0 = 0; Z0 = 0;
        k = numel(label);
        for ii=1:length(tmp),
            label(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
        end
        [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
%         xx=x;
%         x=y(:,end:-1:1);
%         y=xx;
        y = y(end:-1:1);
        
        loc0 = [];
        loc0(:,1) = X0 + x(tmp); loc0(:,2) = Y0 + y(tmp); loc0(:,3) = Z0 + 0*x(tmp);
        loc = [ loc ; loc0 ];
        %---- rearrange label number
%         label = label(64:-1:1);
        
        %---------- grid frontal
        ContactLabel = {'IF'};
        tmp = [1:8];
        nx = 8; ny = 1;
        
        X0 = 0 ; Y0 = 4; Z0 = 1;
        k = numel(label);
        for ii=1:length(tmp),
            label(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
        end
        [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
%         xx=x;
%         x=y(:,end:-1:1);
%         y=xx;
        
        loc0 = [];
        loc0(:,1) = X0 + x(tmp); loc0(:,2) = Y0 + y(tmp); loc0(:,3) = Z0 + 0*x(tmp);
        loc = [ loc ; loc0 ];
        
        %---------- Strips
        ContactLabel = {'OF';'TP';'AST';'PST'};% , 'EKG'
        X0_strip = [ 0 , 4 , 0 , 4];
        Y0_strip = [ -1 , -1 , -2 , -2 ];
        Z0_strip = [ -1 , -2, -3 , -4 ];
        strip_cntno = [ 4, 4, 4 , 4];
        
        for ist = 1 : numel( ContactLabel )
            tmp = 1:strip_cntno(ist);
            k = numel(label);
            for ii=1:length(tmp),
                label(k+ii) = {[ContactLabel{ist} , num2str( tmp(ii) ) ]};
            end
            nx = length(tmp); ny = 1; [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
            loc0 = []; loc0(:,1) = X0_strip(ist)+x(tmp); loc0(:,2) = Y0_strip(ist)+y(tmp); loc0(:,3) = Z0_strip(ist)+0*x(tmp);
            loc = [ loc ; loc0 ];
        end
            

        case {'GL_2013-11-11','GL_2013-11-13','GL_2013-11-14'}
            %% -- Define resected electrodes
        label = {}; loc = [];
        %---------- grid temporal
        ContactLabel = {'LF'};
        tmp = [2:8, 10:16, 18:24, 26:32];
        nx = 7; ny = 4;
        
        X0 = 0 ; Y0 = 0; Z0 = 0;
        k = numel(label);
        for ii=1:length(tmp),
            label(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
        end
        [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
%         xx=x;
%         x=y(:,end:-1:1);
%         y=xx;

        tmp2=1:length(tmp);
        loc0 = [];
        loc0(:,1) = X0 + x(tmp2); loc0(:,2) = Y0 + y(tmp2); loc0(:,3) = Z0 + 0*x(tmp2);
        loc = [ loc ; loc0 ];
        %---- rearrange label number
        %---------- Strips
        ContactLabel = {'LFD'};
        X0_strip = [ 0 ];
        Y0_strip = [ -1 ];
        Z0_strip = [ -1 ];
        strip_cntno = [ 4 ];
        
        for ist = 1 : numel( ContactLabel )
            tmp = 1:strip_cntno(ist);
            k = numel(label);
            for ii=1:length(tmp),
                label(k+ii) = {[ContactLabel{ist} , num2str( tmp(ii) ) ]};
            end
            nx = length(tmp); ny = 1; [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
            loc0 = []; loc0(:,1) = X0_strip(ist)+x(tmp); loc0(:,2) = Y0_strip(ist)+y(tmp); loc0(:,3) = Z0_strip(ist)+0*x(tmp);
            loc = [ loc ; loc0 ];
        end            
            
            
        case {'BB_2013-11-11','BB_2013-11-12','BB_2013-11-13'}
            %% -- Define resected electrodes
        label = {}; loc = [];
        %---------- grid temporal
        ContactLabel = {'R-P '};
        tmp = [1:32];
        nx = 8; ny = 4;
        
        X0 = 0 ; Y0 = 0; Z0 = 0;
        k = numel(label);
        for ii=1:length(tmp),
            label(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
        end
        [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
%         xx=x;
%         x=y(:,end:-1:1);
%         y=xx;
        x = x(end:-1:1);
        y = y(end:-1:1);
        
        loc0 = [];
        loc0(:,1) = X0 + x(tmp); loc0(:,2) = Y0 + y(tmp); loc0(:,3) = Z0 + 0*x(tmp);
        loc = [ loc ; loc0 ];
        %---- rearrange label number
%         label = label(64:-1:1);

        
        
        case {'JC_2015-10-30','JC_2015-11-01','JC_2015-11-02'}
            %% -- Define resected electrodes
        label = {}; loc = [];
        %---------- grid temporal
        ContactLabel = {'LTG'};
        tmp = [1:32];
        nx = 8; ny = 4;
        
        X0 = 0 ; Y0 = 0; Z0 = 0;
        k = numel(label);
        for ii=1:length(tmp),
            label(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
        end
        [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
%         xx=x;
%         x=y(:,end:-1:1);
%         y=xx;
        
        loc0 = [];
        loc0(:,1) = X0 + x(tmp); loc0(:,2) = Y0 + y(tmp); loc0(:,3) = Z0 + 0*x(tmp);
        loc = [ loc ; loc0 ];
        %---- rearrange label number
%         label = label(64:-1:1);
        
        %---------- grid frontal
        ContactLabel = {'LF'};
        tmp = [1:16];
        nx = 8; ny = 2;
        
        X0 = 0 ; Y0 = 4; Z0 = 1;
        k = numel(label);
        for ii=1:length(tmp),
            label(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
        end
        [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
%         xx=x;
%         x=y(:,end:-1:1);
%         y=xx;
        
        loc0 = [];
        loc0(:,1) = X0 + x(tmp); loc0(:,2) = Y0 + y(tmp); loc0(:,3) = Z0 + 0*x(tmp);
        loc = [ loc ; loc0 ];
        
        %---------- Strips
        ContactLabel = {'ATP';'AST';'PST'};% , 'EKG'
        X0_strip = [ 0 , 4 , 0];
        Y0_strip = [ -1 , -1 , -2 ];
        Z0_strip = [ -1 , -2, -3 ];
        strip_cntno = [ 4, 4, 4 ];
        
        for ist = 1 : numel( ContactLabel )
            tmp = 1:strip_cntno(ist);
            k = numel(label);
            for ii=1:length(tmp),
                label(k+ii) = {[ContactLabel{ist} , num2str( tmp(ii) ) ]};
            end
            nx = length(tmp); ny = 1; [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
            loc0 = []; loc0(:,1) = X0_strip(ist)+x(tmp); loc0(:,2) = Y0_strip(ist)+y(tmp); loc0(:,3) = Z0_strip(ist)+0*x(tmp);
            loc = [ loc ; loc0 ];
        end

        
        case 'CW_2015-07-30'
            %% -- Define resected electrodes
        label = {}; loc = [];
        %---------- grid temporal
        ContactLabel = {'RFP'};
        tmp = [1:64];
        nx = 8; ny = 8;
        
        X0 = 0 ; Y0 = 0; Z0 = 0;
        k = numel(label);
        for ii=1:length(tmp),
            label(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
        end
        [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
        xx=x;
        x=y(:,end:-1:1);
        y=xx;
        
        loc0 = [];
        loc0(:,1) = X0 + x(tmp); loc0(:,2) = Y0 + y(tmp); loc0(:,3) = Z0 + 0*x(tmp);
        loc = [ loc ; loc0 ];
        %---- rearrange label number
%         label = label(64:-1:1);
        
        %---------- Strips
        ContactLabel = {'STP'};
        X0_strip = [ 0 ];
        Y0_strip = [ -1 ];
        Z0_strip = [ -1 ];
        strip_cntno = [ 5 ];
        
        for ist = 1 : numel( ContactLabel )
            tmp = 1:strip_cntno(ist);
            k = numel(label);
            for ii=1:length(tmp),
                label(k+ii) = {[ContactLabel{ist} , num2str( tmp(ii) ) ]};
                label(k+ii) = {[ContactLabel{ist} , num2str( tmp(ii)+1 ) ]};
            end
            nx = length(tmp); ny = 1; [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
            loc0 = []; loc0(:,1) = X0_strip(ist)+x(tmp); loc0(:,2) = Y0_strip(ist)+y(tmp); loc0(:,3) = Z0_strip(ist)+0*x(tmp);
            loc = [ loc ; loc0 ];
        end
%             
        case {'JM_2015-07-13','JM_2015-07-14'}
            %% -- Define resected electrodes
            %---------- grid temporal
        label = {}; loc = [];
        
        %---------- grid temporal
        ContactLabel = {'ROG'};
        tmp = [1:32];%[3:8, 10:16, 18:24, 27:32];
        nx = 8; ny = 4;
        
        X0 = 0 ; Y0 = 0; Z0 = 0;
        k = numel(label);
        for ii=1:length(tmp),
            label(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
        end
        [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
        loc0 = [];
        loc0(:,1) = X0 + x(tmp); loc0(:,2) = Y0 + y(tmp); loc0(:,3) = Z0 + 0*x(tmp);
        loc = [ loc ; loc0 ];
        
        %---------- Strips
        ContactLabel = {'RTO';'RPT';'SIH';'IIH';'RTD'};% , 'EKG'
        X0_strip = [ 0 , 0 , 0 , 4 , 0];
        Y0_strip = [ -1 , -2 , -3 , -3 , -4 ];
        Z0_strip = [ -1 , -2, -3, -4 , -5 ];
        strip_cntno = [ 6, 6, 4, 4, 4 ];
        
        for ist = 1 : numel( ContactLabel )
            tmp = 1:strip_cntno(ist);
            k = numel(label);
            for ii=1:length(tmp),
                label(k+ii) = {[ContactLabel{ist} , num2str( tmp(ii) ) ]};
            end
            nx = length(tmp); ny = 1; [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
            loc0 = []; loc0(:,1) = X0_strip(ist)+x(tmp); loc0(:,2) = Y0_strip(ist)+y(tmp); loc0(:,3) = Z0_strip(ist)+0*x(tmp);
            loc = [ loc ; loc0 ];
        end
            
        case {'TB_2015-07-02', 'TB_2015-07-07','TB_2015-07-09'}
            %% -- Define resected electrodes
         ContactLabel = {'RFP'};
        tmp = [1:64];
        nx = 8; ny = 8;
        
        X0 = 0 ; Y0 = 0; Z0 = 0;
        k = numel(label);
        for ii=1:length(tmp),
            label(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
        end
        [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
        loc0 = [];
        loc0(:,1) = X0 + x(tmp); loc0(:,2) = Y0 + y(tmp); loc0(:,3) = Z0 + 0*x(tmp);
        loc = [ loc ; loc0 ];
        %---- rearrange label number
        label = label(64:-1:1);
        
        %---------- Strips
        ContactLabel = {'RIH'};
        X0_strip = [ 0 ];
        Y0_strip = [ -1 ];
        Z0_strip = [ -1 ];
        strip_cntno = [ 4 ];
        
        for ist = 1 : numel( ContactLabel )
            tmp = 1:strip_cntno(ist);
            k = numel(label);
            for ii=1:length(tmp),
                label(k+ii) = {[ContactLabel{ist} , num2str( tmp(ii) ) ]};
            end
            nx = length(tmp); ny = 1; [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
            loc0 = []; loc0(:,1) = X0_strip(ist)+x(tmp); loc0(:,2) = Y0_strip(ist)+y(tmp); loc0(:,3) = Z0_strip(ist)+0*x(tmp);
            loc = [ loc ; loc0 ];
        end

                        
        case 'VN_2015-07-07'
            %% -- Define resected electrodes
            %---------- grid temporal
        label = {}; loc = [];
        
        %---------- grid temporal
        ContactLabel = {'LF'};
        tmp = [1:64];%[3:8, 10:16, 18:24, 27:32];
        nx = 8; ny = 8;
        
        X0 = 0 ; Y0 = 0; Z0 = 0;
        k = numel(label);
        for ii=1:length(tmp),
            label(k+ii) = {[ContactLabel{1}, num2str( tmp(ii) ) ]};
        end
        [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
        loc0 = [];
        loc0(:,1) = X0 + x(tmp); loc0(:,2) = Y0 + y(tmp); loc0(:,3) = Z0 + 0*x(tmp);
        loc = [ loc ; loc0 ];
        
        %---------- Depth Electrode: 1x4 but only LD1 and LD2 were cut
        ContactLabel = {'LD'};
        X0_strip = [ 0 ];
        Y0_strip = [ -1 ];
        Z0_strip = [ -1 ];
        strip_cntno = [2];
        
        %         for ist = 1 : numel( ContactLabel )
        ist = 1;
        tmp = 1:2;
        k = numel(label);
        for ii=1:length(tmp),
            label(k+ii) = {[ContactLabel{ist} , num2str( tmp(ii) +2 ) ]};
        end
        nx = length(tmp); ny = 1; [x,y] = meshgrid( 1:nx , 1:ny );  x = x'; y = y';
        loc0 = []; loc0(:,1) = X0_strip(ist)+x(tmp); loc0(:,2) = Y0_strip(ist)+y(tmp); loc0(:,3) = Z0_strip(ist)+0*x(tmp);
        loc = [ loc ; loc0 ];
          
    end
    Electrode = [];
    Electrode.EEG_channel_Numbers = 1:numel(label);
    [ResectedChannelNo,b] = match_str( label , ResectedChannelLabel );
    Electrode.ResectedChannel = ResectedChannelNo;
    Electrode.ResectedChannelLabel = label(ResectedChannelNo);
    Electrode.loc = loc;
    Electrode.label = label;
    h = figure; plot3(loc(:,1),loc(:,2),loc(:,3),'.');text(loc(:,1),loc(:,2),loc(:,3),Electrode.label);view(0,90)
    %%
    clear data
    load( fname )
    if subjname =='MN_2015-09-04'
        ix = find( strcmp( data.label , 'LE9' ) );
        data.label(ix) = {'LF9'};
    end
    
    if any( strcmp({subjname}, {'TB_2015-07-02', 'TB_2015-07-07','TB_2015-07-09'}))
        ix = find( strcmp( data.label , 'RFP64.' ) );
        data.label(ix) = {'RFP64'};
    end
    
    if subjname =='ZS_2014-03-11'
        ix = find( strcmp( data.label , 'OF`12' ) );
        data.label(ix) = {'OF12'};
    end
    if subjname =='ZS_2014-03-12'
        ix = find( strcmp( data.label , 'OF`12' ) );
        data.label(ix) = {'OF12'};
    end
    if any( strcmp( {subjname} , {'MN_2013-01-23','MN_2013-01-24','MN_2013-01-25'} ) )
        % just for this subject, Fieldtrip confused by channel name 'G9'
        for ii=1:32
            ix = find( strcmp( data.label , ['G',num2str(ii)] ) );
            data.label(ix) = {['LG',num2str(ii)]};
            data.elec.label(ix) = {['LG',num2str(ii)]};
        end
        
        ix = find( strcmp( data.label , 'ST02' ) );
        data.label(ix) = {'STO2'};
        ix = find( strcmp( data.label , 'ST03' ) );
        data.label(ix) = {'STO3'};
    end
    

    
    cfg = [];
    cfg.channel = label;
    data1 = ft_preprocessing( cfg , data );
    [a,b] = match_str(label , data1.label);
    
    data2 = data1;
    data2.label = data1.label(b);
    data2.trial{1} = data1.trial{1}(b,:);
    data = data2; clear data1 data2

    
    %------------------- construct bipolar Electrode for nighbore electrodes
    loc = Electrode.loc;
    bipol_pair = [];
    bipol_loc = [];
    bipol_label = {};
    k = 0;
    for ii = 1 : (size(loc,1))-1
        for jj = ii+1: size(loc,1)
            d = sqrt( sum( (loc(ii,:) - loc(jj,:)).^2 ) );
            if( d >= (1-eps) && d <= (1+eps) )
                k = k + 1;
                bipol_pair(k,:) = [ ii jj ];
                bipol_loc(k,:) = [ mean( loc([ii jj ],:) )];
                bipol_label(k) = {[data.label{ii} , '-' , data.label{jj} ] };
            end
        end
    end
    
    Electrode.locBipolar = bipol_loc;
    Electrode.labelBipolar = bipol_label;
    
    figure;
    loc = Electrode.locBipolar;
    plot3(loc(:,1),loc(:,2),loc(:,3),'.');text(loc(:,1),loc(:,2),loc(:,3),Electrode.labelBipolar);view(0,90); ylim( [ min(loc(:,2))-0.5 , max(loc(:,2)) + 0.5] ); xlim( [ min(loc(:,1))-0.5 , max(loc(:,1)) + 0.5] )
    
    %--- apply_montage
    montage = [];
    montage.labelorg = data.label;%Nx1 cell-array
    montage.labelnew = bipol_label; %Mx1 cell-array
    tra = zeros( numel(montage.labelnew) , numel(montage.labelorg) );%eye( numel(montage.labelnew) , numel(montage.labelorg) );
    k0 = 0;%numel(montage.labelorg);
    for k = 1 : size(bipol_pair,1)
        tra(k0+k , bipol_pair(k,1) ) =  1;
        tra(k0+k , bipol_pair(k,2) ) = -1;
    end
    montage.tra = tra;%MxN matrix

    data = ft_apply_montage( data , montage );
    data.Electrode = Electrode;
    
    %----- Bandstop filters
    cfg = [];
    cfg.bsfilter    = 'yes';
    cfg.bsfreq      = BandStopFreq;
    cfg.bsfiltord     =  2;
    cfg.Electrode = Electrode;
    data = ft_preprocessing( cfg , data );    
    data.Electrode = Electrode;
    
    % save
    %====================================
    if save_flag
            [p,f,e] = fileparts( fname );
            fno = [p, '\' , f, '_Bipolar.mat'];
            if exist( fno , 'file' )
                continue; %fno = [p, '\' ,f, '_Bipolar2.mat'];
            else
                save( fno , 'data' )
            end
    end
    
end %for i=1:numel(flist)
