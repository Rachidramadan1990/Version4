
 %
% RunOptimization.m - Run CMA-ES optimization on a neuromuscular control
%                     model
% 
% H Geyer
% 05/2018
%


% **************** %
% DECLARATION PART %
% **************** %

% Initial Parameter Vector
% ------------------------
nms3D_prep;
Createp0Mod;
pMod=p0Mod;


% CMAES Options
% -------------
opts.Resume       = 1;      % resume from stored cmaes data files
opts.CMA.active   = 1;      % set active flag for faster adaptation (1: negative update and checks positive definiteness; 2: negative update w/o checking positive definiteness
opts.DiagonalOnly = 0;      % set whether to maintain diagonal convariance matrix (0: no; 1: always; >1: number of iterations
opts.LogModulo    = 5;      % frequency of cmaes standard data recording: 0: none, i: every i iterations
opts.EvalParallel = 'yes';  % parallel evaluation of population  
% -> EDIT HERE: For model-dependent options
opts.StopFitness  =  0.1;   % set stop fitness value 
opts.PopSize      =   12;   % set population size
opts.EvalInitialX = 'no';   % set whether to evaluate initial parameter set
opts.Restarts = 5;

% CMA Initial Values
% ------------------
xCMA0 = zeros(length(p0Mod),1); % set initial x
sigma0 = 1/32;  % set initial standard deviations


% ************ %
% PROGRAM PART %
% ************ %

% ------------------------------
% Create Rapid Accelerator Model
% ------------------------------


% build rapid accelerator model
rtp = Simulink.BlockDiagram.buildRapidAcceleratorTarget('ramadan_2022');

save rtp rtp
%rtp=0;
% warning('off', 'physmod:mech:mechlib:DeprecationConvertMsg')  
cmaes_hg('ComputeFitnessParallel', xCMA0, sigma0, opts,p0Mod,  rtp);  % run CMA-ES


