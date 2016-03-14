function Duration_PLV_Pos_ch = find_duration_each_PLV_pos(PLV, plv_time, Baseline_Time_max, pre_onset_time , start_onset )
n_sample = 2;

Multiplied_STD_inThresh = 6;
%%
ix_selected = find( ( plv_time >=  (start_onset - pre_onset_time) ) & ( plv_time <  start_onset ) );
ix_Baseline = find( (plv_time >= 0 ) & ( plv_time <=  Baseline_Time_max ));
%%
tmp_PLV = PLV(:,ix_Baseline);
mtmp = mean (tmp_PLV , 2);
stdtmp = std ( tmp_PLV, 0 , 2);

Thre = mtmp + Multiplied_STD_inThresh * stdtmp ;


PLV2 = PLV(:,ix_selected);
% WE consider the duration of PLV positivity(higher than defined Threshold)in each channel 
for ch= 1: size(PLV2,1)
    if PLV2(ch,:) < Thre(ch)
        Duration_PLV_Pos_ch(ch) = 0; % If the PLV of a channel is less than Threshold, make it equal to zero
        continue
    end
    Index_PLV_pos(ch,:) =  PLV2(ch,:) > Thre(ch);% Get the indexes for those which are higher thre
    Temp = find(Index_PLV_pos(ch,:));% Return the index number of the elements which are 1 in Index_PLV_pos
    counter = 1;
    for t= 1:length(Temp)
        if Temp(t) == size(Index_PLV_pos, 2) % if it comes to the last element break the loop
            Duration_PLV_Pos_ch (ch) = counter;
            break;
        end
        if Index_PLV_pos(ch, Temp(t)+ 1)==1 % Look at each consecutive times if they are higher than Threshold
            counter = counter + 1;% count how long the channel remains more than Threshold
            Duration_PLV_Pos_ch (ch) = counter; % store the time each channel stay higher than Threshold
        else
            Duration_PLV_Pos_ch (ch) = counter; % This line consider the channels which has a single 1 which followed by zeros
            break
        end
    end
end
Duration_PLV_Pos_ch = Duration_PLV_Pos_ch';

