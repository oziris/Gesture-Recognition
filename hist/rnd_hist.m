function h = rnd_hist(mu, sigma, m, n)
%RND_HIST Generate random histogram.
%
% h = rnd_hist(mu, sigma, m, n)
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

h = mu + sigma*randn(1,m);
h = histc(h, linspace(0, n, n));
h = h ./ sum(h);
    
end %function rnd_hist
