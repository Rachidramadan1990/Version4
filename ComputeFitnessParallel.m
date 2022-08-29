function FitnessVec = ComputeFitnessParallel( xCMA, CurrentIter, p0Mod , rtp)


nPop = size(xCMA, 2);      % get population size
FitnessVec = NaN(1, nPop);  % preallocate fitness vector

if exist('BestHist.mat', 'file')==2 % load best param set history 
  load BestHist.mat bh  
else % create best history iteration number and corresponding fitness     
  bh.iter  = CurrentIter;
  bh.Fitness(bh.iter) = Inf;
end  


 for idx=1:nPop
    in(idx)=Simulink.SimulationInput('ramadan_2022');
    pMod = p0Mod.* exp(xCMA(:,idx));
    nms3D_prep;
    AssignSimulinkParams;

    ParamSet(idx) = Simulink.BlockDiagram.modifyTunableParameters(rtp, ...
    'BasisStim', BasisStim, 'CompliantLeg', CompliantLeg,'CompliantLegLat', CompliantLegLat, 'PreventKneeOverextension', PreventKneeOverextension, ...
    'BalanceTrunkLat', BalanceTrunkLat, 'theta0', theta0, ...
    'Balance', Balance, 'Target02', Target02, 'Target13', Target13, 'propulsion', propulsion);

    in(idx)=in(idx).setModelParameter('SimulationMode','rapid', 'RapidAcceleratorUpToDateCheck','off','RapidAcceleratorParameterSets', ParamSet(idx));
 end
 
tic;
SimOut = parsim(in, 'ShowProgress', 'off','TransferBaseWorkspaceVariables', 'on');
Dt=toc;



for pIdx=1:nPop  



  xCoM = sqrt(SimOut(pIdx).xyzHAT(end,1)^2+SimOut(pIdx).xyzHAT(end,3)^2);
  %time=SimOut(pIdx).tout(end);
  Stability=100*sum(SimOut(pIdx).SSdist.signals.values);
  if xCoM<1
    FitnessVec(pIdx) = NaN;
    %disp('case 1')
    %disp(xCoM)
  elseif xCoM <10      
      
    FitnessVec(pIdx) = 10000+ abs(11-xCoM) ;  
      
  else 
    
    FitnessVec(pIdx) = 100*sum(SimOut(pIdx).SSdist.signals.values);
      
  end
      
 


  % display update
  %fprintf('Time: %3.1fs (%3.1f%%), fitness: %4.2f, dist: %4.2fm, max FoT: %4.2f\n', ...
  %  Dt, SimOut.tout(end)/Dt*100, FitnessVec(pIdx), xCoM, SimOut.maxFoT);
      
  % Store best parameter set
  % ------------------------
  if CurrentIter > bh.iter % new iteration: append parameter vectors
    bh.iter = CurrentIter;
    bh.Fitness(bh.iter) = FitnessVec(pIdx);
    bh.pMod(:,bh.iter)  = p0Mod .* exp(xCMA(:,pIdx));
    bh.p0Mod(:,bh.iter) = p0Mod;
    %fprintf('\n > Iteration: %d, BestFitness: %4.2f\n\n\n', bh.iter, bh.Fitness(bh.iter)) 
    %fprintf(' BestFitness: %4.2f\n\n\n', bh.Fitness(bh.iter))
    save BestHist.mat bh % save file
  elseif FitnessVec(pIdx) < bh.Fitness(bh.iter)  % existing iteration: replace if better fitness 
    bh.Fitness(bh.iter) = FitnessVec(pIdx);
    bh.pMod(:,bh.iter)  = p0Mod .* exp(xCMA(:,pIdx));
    bh.p0Mod(:,bh.iter) = p0Mod;
    %fprintf('\n > Iteration: %d, BestFitness: %4.2f\n\n\n', bh.iter, bh.Fitness(bh.iter)) 
    save BestHist.mat bh % save file
  end
end

[bestFitness, bestPop]=min(FitnessVec);

   % display update
 fprintf('Iteration: %d, Simulation time: %3.1fs,  bestPopFitness: %4.2f, bestTotFitness: %4.2f, dist: %4.2fm\n',  ...
           bh.iter,      Dt,                        min(FitnessVec),      min(bh.Fitness),       sqrt(SimOut(bestPop).xyzHAT(end,1)^2+SimOut(bestPop).xyzHAT(end,3)^2));
          
end


