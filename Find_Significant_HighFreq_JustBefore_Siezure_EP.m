clear;clc;close('all')

load('D:\ECoG_Data_HighFrequency\ft_format_data\ftData_EP_2014-03-10_Start02-03-10_End02-15-01_Dur_11M-49S_Fs1026_Bipolar_Hlb_190-210Hz.mat');
data = datah1; clear datah1;

%% initiate 
fs = data.fsample;
start_onset = round(( 307)* fs);%round(( 5 * 60 - 9)* fs);
end_onset = round(408 * fs);
BackGroundIdx = 1:60*fs;
TimeWindowBeforeSiezure = round(5*fs);

P_value = 0.01;

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
figure
imagesc(datht_seg);colorbar

Rate = sum( datht_seg > 0 , 2 ) / size(datht_seg,2);
Ratew = sum( datht_seg , 2 ) / size(datht_seg,2);

[sx,si] = sort(Rate,'descend');
data.label( ChanSel(si) );

disp('Significant Contacts')
data.label( ChanSel(si(sx > 1.5*P_value)) )

[sxw,siw] = sort(Ratew,'descend');
data.label( ChanSel(siw) );






adrafzsd



%% values greater than threshold

for i=round(length(sx)/5)
    if sx(i)>= 1.5 * P_value
        for h=1:4
            if (i + j)<= length(sx);
                if sx(i + j)>= 1.5 * P_value;
                    b(i) = sx(i);
                end 
            end
        end
    end
end
%%  Determine the values in each channel
for i=1:86
    b{i,:}=find((datht_seg(i,:))> 1.5 * P_value);
end
%sort the channels by their length more than threshold
[~,Index] = sort(cellfun(@length,b));
Ch_sorted_length = b(Index);

