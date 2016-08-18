function [rewards, actions, optimal] = bandit(steps, e)
    % vars
    n = 10;
    l = 0.1;
    initial_q = 5;
        
    % init
    b = randn(1, n);
    q = ones(1, n) * initial_q;     
    
    % aux vars
    rewards = zeros(1,steps);
    actions = zeros(1,steps);
%     [o, optimal(1)] = max(b);
    
    % simulate
    for i = 1:steps
        % random walk
        b = b + 0.1 *randn(1, n);
        [o, opt] = max(b);
        
        % choose action
        if rand <= e
            [o, a] = max(q);       
        else
            a = randi(n);
        end
        
        %sample
        r = b(a) + randn();
        
        % update q
        q(a) = q(a) + l*(r-q(a));

        rewards(i) = r;
        actions(i) = a;        
        optimal(i) = opt == a;
        
    end    
        
end