function [ timers, opts, iter ] = parallelStepCentral( sProb, iter, timers, opts )
%PARALLELSTEP Summary of this function goes here
NsubSys = length(sProb.AA);


% untangle sProb into sProbScalars and sProbCasadiFunctions
[sProbCas, sProbValues, parforTmpVar] = getParforVars(sProb, iter, opts);


% solve local problems
for j=1:NsubSys % parfor???
    
    
    parforTmpVar(j) = parallelStepInnerLoop(j, ...
                                            sProbCas(j), ...
                                            sProbValues, ...
                                            iter, ...
                                            parforTmpVar(j), ... 
                                            opts);
                                        
end 


% hand over parfor variables
loc = iter.loc;
[loc, timers, opts ] = parforVars2globalVars(parforTmpVar, loc, iter, opts, NsubSys, timers);

% save information for next BFGS iteration
if strcmp(opts.Hess, 'BFGS') || strcmp(opts.Hess, 'DBFGS')
    loc.sensEval.gLiEvalOld = loc.sensEval.gLiEval;
    loc.xxOld               = loc.xx;
end

iter.loc = loc;
 
end
