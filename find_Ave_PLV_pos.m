function Average_PLV_ch = find_Ave_PLV_pos(PLV, plv_time, pre_onset_time , start_onset )

%%
ix_selected = find( ( plv_time >=  (start_onset - pre_onset_time) ) & ( plv_time <  start_onset ) );
PLV2 = PLV(:, ix_selected);
for ch = 1: size(PLV2, 1)
    Ave_PLV_ch(ch) = mean(PLV2(ch,:),2);
end
Average_PLV_ch = Ave_PLV_ch; 
end