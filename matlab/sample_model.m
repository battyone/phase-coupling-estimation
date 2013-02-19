% Sample from phase-coupling model using Hybrid Monte Carlo
% Niru Maheswaranathan
% Mon Feb 18 21:01:15 2013
% data = sample_model(K, numSamples, burnin)

function data = sample_model(K, numSamples, burnin)

    if nargin < 3
        burnin = 10^3;
    end

    addpath('f_energy');
    M = kappa2m(K);

    lf_steps = 50;
    step_sz = .15;
    persistence = 0;

    opts = hmc2_opt();
    opts.nsamples = numSamples;
    opts.nomit = burnin;
    opts.steps = lf_steps;
    opts.stepadj = step_sz;
    opts.persistence = persistence;

    %% sample some data
    [samps, E, diagn] = hmc2('f_phasedist', zeros(size(K,1),1), opts, 'g_phasedist', M);
    data = smod(transpose(samps))';
