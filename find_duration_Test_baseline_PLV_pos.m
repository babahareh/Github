function Duration_PLV_Pos_ch = find_duration_Test_baseline_PLV_pos(PLV, plv_time, Baseline_Time_max, pre_onset_time , start_onset )


Multiplied_STD_inThresh = 6;
%%
ix_Baseline = find( (plv_time >= 0 ) & ( plv_time <=  Baseline_Time_max ));
%%
tmp_PLV = PLV(:,ix_Baseline);
mtmp = mean (tmp_PLV , 2);
stdtmp = std ( tmp_PLV, 0 , 2);

Thre = mtmp + Multiplied_STD_inThresh * stdtmp ;

for ch = 1:size(PLV, 1)
     Index_PLV_pos(ch,:) =  PLV(ch,:) > Thre(ch);% Get the indexes for those which are higher thre
       Temp = find(Index_PLV_pos(ch,:));% put 1 for those indexes which have higher values than \thre
       for t=1: length(Temp)-2
           if sum(Index_PLV_pos(ch, Temp(t):Temp(t)+2))== 2
               CH_out= ch;
           end
       end
end
 
    Duration_PLV_Pos_ch = sort(CH_out);

end