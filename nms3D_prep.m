


% run old start files to load variables
%run(['parameters' filesep 'old' filesep 'runScripts.m'])


load('paramRR.mat')
load('paramIC_02cm.mat')
run(['parameters' filesep 'nms3D_sInit'])
run(['parameters' filesep 'nms3D_mInit'])
run(['parameters' filesep 'nms3D_cInit'])
run(['parameters' filesep 'nms3D_icInit'])

%load model_14dof.mat
load model_left_ball.mat
load model_right_ball.mat
%load model_left_full.mat
%load model_right_full.mat
load model_swing_left.mat
load model_swing_right.mat
load model_trunk.mat
%load WminPitch.csv
%load WminRoll.csv
%load ZminPitch.csv
%load ZminRoll.csv


%WramameiSL_20 = readmatrix('WSL_20_Norm_tanh_MSE_cont.csv');
%ZramameiSL_20 = readmatrix('ZSL_20_Norm_tanh_MSE_cont.csv');
WramameiSL_1000 = readmatrix('WSL_1000_Norm_Sigmoid_MSE_cont.csv');
ZramameiSL_1000 = readmatrix('ZSL_1000_Norm_Sigmoid_MSE_cont.csv');



%parameters
assign_parameters;

lp1=0.45;
lp2=0.55;







