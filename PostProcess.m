load BestHist.mat

[BestFitness,BestIter]= min(bh.Fitness);

pMod=bh.pMod(:,BestIter);
%AssignSimulinkParams

%Target02(2)=2*pi-deg2rad(70);
%Target13(2)=2*pi-deg2rad(7);
%Target13(1)=pi+deg2rad(50);
