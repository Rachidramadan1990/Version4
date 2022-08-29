%% Initialize p0Mod
%p0Mod is the initial parameter set and serves as a strating point of the
%optimization. It contains both low- and high-level parameters

p0Mod=zeros(35,1);

%% Low-Level Parameter

% Basis Stimulation 
p0Mod(1)=0.004402;
p0Mod(2)=0.0018555;
p0Mod(3)=0.00059356;
p0Mod(4)=0.0059068;
p0Mod(5)=0.038268;
p0Mod(6)=0.00018628;
p0Mod(7)=0.046843;
p0Mod(8)=0.0019638;
p0Mod(9)=0.0061881;
p0Mod(10)=0.0026712;
p0Mod(11)=0.0092196;
  
% Compliant Leg                  
p0Mod(12)=0.00030660225848;
p0Mod(13)=0.000609163672865;
p0Mod(14)=0.000254152777915;
 
% Compliant Leg Lateral
p0Mod(15)=0.000107998077771;

% Prevent Knee Overextension             
p0Mod(16)= 9.2542e-05; 
p0Mod(17)= 2.7217;
p0Mod(18)= 0.067801;
p0Mod(19)= 1.1026;
p0Mod(20)= 0.72915;
p0Mod(21)= 0.001105;
 
% Balance Trunk Lat
p0Mod(22)=3.328583913861149;
p0Mod(23)=0.616535126762686;
p0Mod(24)=0.330123320271684;
p0Mod(25)=0.086278023748251;

%% High-Level Parmeters

% Balance 
p0Mod(26)=  0.4405; %cd13
p0Mod(27)=  0.2336; %cv13
p0Mod(28)=  0.0163; %cd13lat 
p0Mod(29)=  0.0163; %cv13lat

% Target 02 
%p0Mod(30)= 0.30+pi ; %swh02 %
%p0Mod(31)= 2.00+pi;%4.703873169815919; 
%p0Mod(32)= 1.30+pi; %swa02

p0Mod(30)=5;
% Target 13
p0Mod(31)=  3.4; %swh13 
p0Mod(32)=  6.1610; %swk13     
p0Mod(33)=  pi+0.1;%4.9014; %swa13 

% Referen 
p0Mod(34)=0.3; % Caution! Substracting 1 in the simulink model

%Propulsion Extra
p0Mod(35)=0.440993299219605; %



 
load pMod_init.mat

p0Mod=pMod_init;
p0Mod(34)=0.3; 
 
 








