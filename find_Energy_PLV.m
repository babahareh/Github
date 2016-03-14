function Energy_PLV_ch = find_Energy_PLV(PLV, plv_time, pre_onset_time , start_onset , end_onset)
% Calculate teh energy of PLV signal from start onset till end onset
startonset_endonset = find( ( plv_time >=  start_onset ) & (plv_time <  end_onset ) );

%%

PLV_onset = PLV(:,startonset_endonset);
Energy_PLV_ch = mean(PLV_onset.^2 , 2);
end
