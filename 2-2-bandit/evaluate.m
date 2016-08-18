function [avg, opt] = evaluate(e)
    trials = 100;
    steps = 2000;
    
    avg = zeros(1, steps);
    opt = zeros(1, steps);
    
    for i = 1:trials
       [rewards, actions, optimal] = bandit(steps, e);
        
       avg = avg + (rewards - avg) / i;             
       opt = opt + optimal;
    end      
    
    opt = opt / trials;    
end