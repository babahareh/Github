function [ PLV, plv_time ] = PLV_function( fname )
%PLV_FUNCTION Summary of this function goes here
%   Detailed explanation goes here
[p,f,e] = fileparts( fname );
 load(fname);
fs = data.fsample;

Baseline_Time_max = 60;%s

%% Hilbert 80_200 Hz
datah_HighGamma =  hilbert ( eegfilt ( data.trial{1}, fs , 80,150));
Amplitude_HighGamma = abs( datah_HighGamma);

Phi_HighGamma = angle (datah_HighGamma);
% Second Hilbert
Phase_amplitude_HighGamma = angle (hilbert( Amplitude_HighGamma));
%% Hilbert 4_30 Hz

Phi_lower_freq = angle (hilbert ( eegfilt ( data.trial{1}, fs , 4,30)));

%% PLV
DT = 0.5; %s
Window = 3; %s
tmp = datah_HighGamma(:,1:round(Baseline_Time_max*fs));
mtmp = mean(tmp,2);
datah_HighGamma_n = datah_HighGamma./ repmat( mtmp , [1 size(datah_HighGamma,2)] );
time = data.time{1};
time_dt = [];
k = 0;

for ts = 0:DT: (time(end) - 2*Window)
    k = k +1;
    ix = round(ts*fs + (1:Window*fs));
    expDphi = exp(1i* (Phi_lower_freq(:,ix) - Phase_amplitude_HighGamma(:,ix)) );
    PLV(:,k) = abs( mean( expDphi , 2 ) );
    PLHG(:,k) = abs( mean(  datah_HighGamma_n(:,ix) .* expDphi , 2 ) ) ;
    ts/(time(end) - 2*DT);
    time_dt(k) = ts;
    
    plv_time(k) = ts;
end
end

