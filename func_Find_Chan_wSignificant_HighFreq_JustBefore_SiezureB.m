function func_Find_Chan_wSignificant_HighFreq_JustBefore_Siezure( fname , start_onset_time,end_onset_time,BackGroundIdx_time,TimeWindowBeforeSiezure_dur , ResectedChannelLabel , P_value )

% fname = 'D:\ECoG_Data_HighFrequency\ft_format_data\ftData_EP_2014-03-10_Start02-03-10_End02-15-01_Dur_11M-49S_Fs1026_Bipolar.amt';
tmplate_fn_excel = 'E:\HighFreq_Epilepsy_Summary_of _8Siezures_to_ExcellFiles\Template_Extracted_Significant_Channels_wHighFreq_Enhancement.xlsx';
[p,f,e] = fileparts( fname );

patho = 'E:\HighFreq_Epilepsy_Summary_of _8Siezures_to_ExcellFiles';
fno_excel = [patho,'Extracted_Significant_Channels_wHighFreq_Enhancement_' , f , '.xlsx' ];
if exist( fno_excel , 'file' )
    fno_excel = [patho,'Extracted_Significant_Channels_wHighFreq_Enhancement_' , f , '_' , num2str(round(10000*rand)) , '.xlsx' ];
end
copyfile( tmplate_fn_excel , fno_excel );

[NUM0,TXT0,RAW0] = xlsread(fno_excel);


%%
flist = rdir( [p, '\' , f , '_Hlb_*.mat'] );

for j=1:numel(flist)
    tmp = flist(j).name;
    ix1 = findstr( 'Hlb_' , tmp );
    ix2 = findstr( '-' , tmp((ix1+4):end) );
    hlbfrq(j) = str2num(tmp((ix1+4):(ix1+4+ix2-2) ));
end
[sx,si] = sort(hlbfrq);
flist = flist(si);
%%

for ihlb = 1:numel( flist )
    fnhilb = flist(ihlb).name;
    load(fnhilb);
    data = datah1; clear datah1;
    
    %% initiate
    fs = data.fsample;
    start_onset = round(( start_onset_time)* fs);
    end_onset = round(end_onset_time * fs);
    BackGroundIdx = max(1,BackGroundIdx_time(1)*fs) : BackGroundIdx_time(2)*fs;
    TimeWindowBeforeSiezure = round(TimeWindowBeforeSiezure_dur*fs);
    
    % P_value = 0.01;
    Threshold = 1.5 *P_value ;
    
    %%
    ChanSel = 1:numel( data.label );
    dath = cell2mat( data.trial);
    
    %%  calculate the threshold based on CDF and P-value
    datht_seg = [];
    tresh = [];
    k = 0;
    for i = ChanSel
        k = k+1;
        dati = dath(i,:);
        datib = dati(BackGroundIdx);
        [F_1,X] = ecdf( datib );
        
        ix = min( find( F_1 >( 1 - P_value) ) );
        tresh(k) = X(ix);
        
        datht = dati .* ( dati > tresh(k) );
        datht_seg (k,: ) = datht(start_onset - TimeWindowBeforeSiezure : start_onset);
        
        %     plot( datht_seg (k,: ) )
        %     title( [data.label{i} , '  Thresh = ' , num2str(tresh(k))] )
        %     pause
        
    end
    h = figure;
    imagesc(datht_seg);colorbar
    set(h, 'Name' , fnhilb )
    
    %%
    Rate = sum( datht_seg > 0 , 2 ) / size(datht_seg,2);
    
    [sx,si] = sort(Rate,'descend');
    data.label( ChanSel(si) );
    
    disp('Significant Contacts')
    Significat_HF_chan = data.label( ChanSel(si(sx > Threshold )) )
    
    Significat_HF_chan_mono = {};
    for j=1:numel( Significat_HF_chan )
        lable = Significat_HF_chan{j};
        ix = strfind( lable , '-' );
        Significat_HF_chan_mono = [Significat_HF_chan_mono , {lable(1:(ix-1))} , {lable((ix+1):end)} ];
    end
    Significat_HF_chan_mono = unique(Significat_HF_chan_mono);
    
    [a,b] = match_str( Significat_HF_chan_mono , ResectedChannelLabel )
    Significant_resected_Channel = Significat_HF_chan_mono(a)
    
    RAW = RAW0;
    RAW(1,1) = {'fnamebase'};
    RAW(1,2) = {fnhilb};
    RAW(2,2) = {start_onset_time};
    RAW(3,2) = {TimeWindowBeforeSiezure_dur};
    RAW(4,2) = {end_onset_time};    
    RAW(5,2) = {BackGroundIdx_time};    
    RAW(6,2) = {P_value};    
    RAW(7,2) = {Threshold};
    RAW(8,1) = {'channel label'};
    RAW(8,2) = {'Rate'};
    RAW(8,3) = {'Channels:  Rate > Threshold'};
    RAW(8,4) = {'Resected channels'};
    RAW(8,5) = {'Resected significant'};
    RAW(8,6) = {'#Res. Sig./Res.'};
    RAW(8,7) = {'DICE'};
    
    RAW(8 + (1:numel(data.label)),1) = data.label(si);
    Rates = Rate(si);
    for j=1:length(Rate)
        RAW(8 + j,2) = {Rates(j)};
    end
    
    RAW(8 + (1:numel(Significat_HF_chan)),3) = Significat_HF_chan;
    RAW(8 + (1:numel(ResectedChannelLabel)),4) = ResectedChannelLabel;
    RAW(8 + (1:numel(Significant_resected_Channel)),5) = Significant_resected_Channel;
    RAW(8 + 1,6) = {numel(Significant_resected_Channel)/numel(ResectedChannelLabel)};
    
    [a,b] = match_str( Significat_HF_chan_mono , ResectedChannelLabel );
    dice = 2*length(a) / ( numel(Significat_HF_chan_mono) + numel(ResectedChannelLabel) ) ;
    RAW(8 + 1,7) = {dice};
    
    xlswrite( fno_excel , RAW , ihlb )
    
% %     Ratew = sum( datht_seg , 2 ) / size(datht_seg,2);
% %     [sxw,siw] = sort(Ratew,'descend');
% %     data.label( ChanSel(siw) );

%% ----------- write excell 

end
