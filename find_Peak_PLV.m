function Peak_PLV_ch = find_Peak_PLV(PLV, plv_time, pre_onset_time , start_onset )

ix_selected = find( ( plv_time >=  (start_onset - pre_onset_time) ) & ( plv_time <  start_onset ) );
%%
% Calculate the peak of PLV value in each channel
PLV2 = PLV(:,ix_selected);
Peak = max(PLV2, [], 2); % choosing maximum value in each row(channel)
[Peak_sort, ch_num] = sort(Peak, 'descend');% sort out the max values to get the number of channels for each
Peak_PLV_ch = Peak; %demonstrate the peak for each channel
%Peak_PLV_ch = ch_num; demonstrate the sorted channels
end
