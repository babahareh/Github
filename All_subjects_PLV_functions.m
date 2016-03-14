clear all;
clc
% 
flist ={
    'Y:\Bahar\files\ft_format_data\ftData_EP_2014-03-10_Start02-03-10_End02-15-01_Dur_11M-49S_Fs1026_Bipolar.mat';
    'Y:\Bahar\files\ft_format_data\ftData_MN_2015-09-04_Start05-15-27_End05-23-26_Dur_7M-60S_Fs1026_Bipolar.mat';
    'Y:\Bahar\files\ft_format_data\ftData_MN_2015-09-04_Start22-08-24_End22-19-36_Dur_11M-13S_Fs1026_Bipolar.mat';
   % 'Y:\bahar\Files\HFO_DATA_ECOG\ftData_DM_2014-02-22_Start17-23-22_End17-30-56_Dur_11M-11S_Fs1026_Bipolar.mat';
    %'Y:\bahar\Files\HFO_DATA_ECOG\ftData_DM_2014-02-22_Start22-49-01_End22-58-48_Dur_12M-7S_Fs1026_Bipolar.mat';
    'y:\Bahar\files\HFO_DATA_ECOG\ftData_DM_2014-02-22_Start13-01-09_End13-07-18_Dur_13M-20S_Fs1026_Bipolar.mat';
};
%% initiate
Baseline_Time_max = 60;%s
start_onset = [337,114, 304 ,436  ];
end_onset = [408, 179, 348 , 506];
pre_onset_time = [20, 20, 10,10];
Resected_channel = {[ 1:6, 9:12, 17:20, 25:27, 79:86], [ 61:66, 76:81, 83, 91:98, 106:110, 112, 151], [ 61:66,76:81, 83, 91:98, 106:110, 112, 151],...
   [1,3,5,7,14,16,18,27,29,40,59:61, 70:74]} ;

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
saveARFF('weka_featmat.arff',wekaOBJ)


