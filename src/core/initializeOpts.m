function [default_opts] = initializeOpts(rho, mu, maxit, MatSig, term_eps, parallelization)
%Initializes the opts struct with standard values
%   


eps = 1e-4;


    default_opts = struct ('rho0',rho,...
                           'rhoUpdate',1,...
                           'rhoMax',5e3,...
                           'mu0',mu,...
                           'muUpdate',1,...
                           'muMax',1e5,...
                           'eps',eps,...
                           'maxiter',maxit,...
                           'actMargin',-1e-6,...
                           'hessian','full',...
                           'solveQP','MA57',...
                           'reg','true',...
                           'locSol','ipopt',...
                           'innerIter',2400,...
                           'innerAlg','none',...
                           'plot',true,...
                           'Hess','standard',...
                           'slpGlob', true,...
                           'trGamma', 1e6,...
                           'SSig', {MatSig},...
                           'Sig','const',...
                           'lamInit','false',...
                           'term_eps', term_eps,...
                           'slack','standard',...
                           'warmstart',true, ...
                           'parfor', parallelization);
                   
              % default_opts.SSig = MatSig;
                   
end

