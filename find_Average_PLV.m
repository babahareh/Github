function Average_PLV_ch = find_Average_PLV(PLV, plv_time, pre_onset_time , start_onset )

ix_selected = find( ( plv_time >=  (start_onset - pre_onset_time) ) & ( plv_time <  start_onset ) );
%%

PLV_before_onset = PLV(:,ix_selected);
Average_PLV_ch = mean(PLV_before_onset, 2); % choosing average value in each row(channel)
end
