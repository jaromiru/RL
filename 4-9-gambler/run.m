% probability of winning
pw = 0.4;

epsilon = 0.001;

%discounting factor
y = 0.9; 

% value function, v(1) ~ $0, v(101) ~ $100
v = zeros(101,1);

% reward function for coming to state i
r = zeros(101,1);
r(101) = 1;

disp('Computing value function.. press any key to iterate');
d = 1;
while d > epsilon
    d = 0;
    for s = 2:100   %dont count for $0 and $100
        tmp = v(s);

        [maxA, maxValue] = findMaxA(pw, y, v, s, r);        

        v(s) = maxValue;    
        d = max(d, abs(tmp - v(s)));
    end
      
    plot(v(2:100));
    pause;
end


disp('Computing policy.. press any key to iterate');
p=zeros(101,1);

for s=2:100
    [maxA, maxValue] = findMaxA(pw, y, v, s, r);
    p(s) = maxA;
end

bar(p(2:100));   