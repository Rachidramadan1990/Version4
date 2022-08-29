

param=zeros(35,1);
 
 %% Basis Stimulation 
 param(1)=0.004402;
 param(2)=0.0018555;
 param(3)=0.00059356;
 param(4)=0.0059068;
 param(5)=0.038268;
 param(6)=0.00018628;
 param(7)=0.046843;
 param(8)=0.0019638;
 param(9)=0.0061881;
 param(10)=0.0026712;
 param(11)=0.0092196;
 
 BasisStim=param(1:11);
 
 
 % Compliant Leg                  
 param(12)=0.00030660225848;%0.001530660225848
 param(13)=0.000609163672865;
 param(14)=0.000154152777915;
 
 CompliantLeg=param(12:14);
 
 % Compliant Leg Lateral
 param(15)=0.000107998077771;
 CompliantLegLat=param(15);
   
                 
 % Prevent Knee Overextension (13:18)             
 param(16)= 9.2542e-05; 
 param(17)= 2.7217;
 param(18)= 0.067801;
 param(19)= 1.1026;
 param(20)= 0.72915;
 param(21)= 0.001105;
 
 PreventKneeOverextension=param(16:21);
  
 
 
% Balance Trunk        %% Need to be changed!            
% param(22)=2.201963664035377; 
% param(23)=0.233171395293302;
% BalanceTrunk=param(22:23);
 
            
 % Balance Trunk Old Lat
param(22)=3.328583913861149;
param(23)=0.616535126762686;
param(24)=0.330123320271684;
param(25)=0.086278023748251;
BalanceTrunkLat=param(22:25);


 
 
% Balance02 
%param(28)= 0.371990243994403; %cd02
%param(29)= 0.094042826353683; %cv02
%param(30)= 0.011596666505603; %cd02lat
%param(31)= 0.401934248294249; %cv02lat


%Balance02=param(28:31);

% Balance 13 

param(26)=  0.4405; %cd13
param(27)=  0.2336; %cv13
param(28)=  0.0163; %cd13lat 0.4091
param(29)=  0.0163; %cv13lat

Balance=param(26:29);


% Target 02 

param(30)= 0.30+pi ; %swh02 % -1.1 


Target02=param(30);

  
% Target 13

param(31)=  -0.10 +pi; %swh13 0.4
param(32)=  3.1154+pi; %swk13     0
param(33)=  1.5+pi; %swa13 0

Target13=param(31:33);

% theta0 
param(34)=0.1; %-0.033
theta0=param(34);

 
 %Propulsion Extra
 param(35)=0.440993299219605; %+0.47
 propulsion=param(35);


 
 
 % Step Duration
 %param(44)=0.58; % -0.15
 %stepDur=param(44);
 
 
 %param(45)=0.05;
 %Target_lat=param(45);
 
 %v_init=1.25;
 

 

 
 
 
 





