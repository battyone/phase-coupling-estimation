% 2D phase coupling example
% Niru Maheswaranathan
% Mon Feb 18 21:06:05 2013

% generate coupling matrix
K = zeros(2);
K(1,2) = 12*exp(1i*pi);
K(2,1) = K(1,2);
subplot(223); imgsc(kappa2m(K));

% draw samples
numSamples = 1e3;
samples = sample_model(K, numSamples);

% plot on 2D torus
edges = linspace(-pi,pi,50);
qhist = ndHist(samples, edges, edges);
subplot(221); imgsc(qhist);

% fit coupling model
Kest= fit_model(samples');
subplot(224); imgsc(kappa2m(Kest));
