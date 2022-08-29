%
% nms3D_cInit.m - initialize neural contro parameters of human neuromuscular model
%
% H Geyer, April 2018
%


% initialize control param structure
mParams.control = [];



% --------------------------
% General Control Parameters 
% --------------------------

% signal transmission delays
% long: 1 way between ankle and lumbar cord; mid: between knee and lumbar cord; short: between hip and lumbar cord
mParams.control.delays.long = 0.01;
mParams.control.delays.mid = 0.005;  
mParams.control.delays.short = 0.0025; %[s]
mParams.control.delays.longloop = 0.03;



mParams.control.constraints.pushoff=[4  3];
mParams.control.constraints.swinginteraction=[1 3 4 6];



mParams.control.timelimit=0.03;

