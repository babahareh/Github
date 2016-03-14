clear all;
clc
% 
flist ={
    'Y:\Bahar\files\HFO_DATA_ECOG\ftData_ZS_2014-03-12_Start07-52-34_End07-53-47_Dur_9M-14S_Fs1026_Bipolar.mat';
    'Y:\Bahar\files\HFO_DATA_ECOG\ftData_ZS_2014-03-12_Start20-16-44_End20-19-05_Dur_7M-40S_Fs1026_Bipolar.mat';
    'Y:\Bahar\files\HFO_DATA_ECOG\ftData_ZS_2014-03-11_Start18-19-54_End18-22-02_Dur_6M-36S_Fs1026_Bipolar.mat';
    'Y:\Bahar\files\HFO_DATA_ECOG\ftData_GH_2013-07-30_Start03-17-52_End03-27-52_Dur_10M-55S_Fs513_Bipolar.mat';
    'Y:\Bahar\files\HFO_DATA_ECOG\ftData_GH_2013-08-06_Start15-42-23_End15-58-43_Dur_21M-11S_Fs513_Bipolar.mat';
    'Y:\Bahar\files\HFO_DATA_ECOG\ftData_GH_2013-08-07_Start00-51-19_End00-55-48_Dur_17M-58S_Fs513_Bipolar.mat';
  };
%% initiate
Baseline_Time_max = 60;%s
start_onset = [190,100, 145, 62, 322, 174 ];
end_onset = [2258, 164, 253, 209, 747, 439 ];
pre_onset_time = [10, 10, 40 , 10, 20, 10];
Resected_channel = {[ 3:5,12:16,19,23,25,27,29, 88:90], [ 3:5,12:16,19, 23,25,27,29, 88:90], [ 3:5,12:16,19,23,25,27,29, 88:90],[1,3,5,15:18, 31:33, 46:47, 49, 53:55],...
    [1,3,5,15:18, 31:33, 46:47, 49 53:55]} ;

%% Run PLV function
featmat = [];
for i =  1:numel(flist)
%fname = flist(i);
[PLV, plv_time] = PLV_function(flist{i});
PLV_mat{i}= PLV;
plv_time_mat{i} = plv_time;
clear PLV;
clear plv_time;
ix_selected{i} = find(( plv_time_mat{i} >=  (start_onset(i) - pre_onset_time(i))) & ( plv_time_mat {i}<  start_onset(i) ) );
PLV_ix_selected{i} = PLV_mat{i}(:, ix_selected{i});

Class_resected_channel = zeros(size(PLV_ix_selected{i}, 1), 1);% define a zero matrix for resected channels as our class
Class_resected_channel ([Resected_channel{i}]) = 1; % assign 1 to chanels which have been resected

Earliest_PLV_Ch = zeros(size(PLV_ix_selected{i}, 1), 1);% define a zero matrix for early PLV positivity

PLV_Positive_ShortDurBeforOnset = find_earliest_PLV_2(PLV_mat{i}, plv_time_mat{i}, Baseline_Time_max, pre_onset_time(i) , start_onset(i) );
Earliest_PLV_Ch ([PLV_Positive_ShortDurBeforOnset ]) = 1;% assign 1 to those channels which has sooner PLV positivity
Duration_PLV_Pos_ch = find_duration_each_PLV_pos(PLV_mat{i}, plv_time_mat{i}, Baseline_Time_max, pre_onset_time(i) , start_onset(i) );
Peak_PLV_ch = find_Peak_PLV(PLV_mat{i}, plv_time_mat{i}, pre_onset_time(i) , start_onset(i) );
Average_PLV_ch = find_Average_PLV(PLV_mat{i}, plv_time_mat{i}, pre_onset_time(i) , start_onset(i) );
%Energy_PLV_ch = find_Energy_PLV(PLV_mat{i}, plv_time_mat{i}, pre_onset_time(i) , start_onset(i) , end_onset(i));

temp = [Earliest_PLV_Ch   Duration_PLV_Pos_ch   Peak_PLV_ch   Average_PLV_ch   Class_resected_channel];% form a matrix including all features
featmat = [featmat ;temp]; % update the feature matrix for all seizures (numel(flist))


end

feat_names = {'Earliest_PLV_Ch', 'Duration_PLV_Pos_ch','Peak_PLV_ch','Average_PLV_ch','Class_resected_channel'};
wekaOBJ = matlab2weka('dataObj', feat_names, featmat);
saveARFF('weka_featmat_NSF.arff',wekaOBJ)


