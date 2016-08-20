% finds an action maximizing reward in given state and coresponding value
function [maxA, maxValue] = findMaxA(pw, y, v, s, r)
    maxA = -1;
    maxValue = -1;
    for a = 0:min(s-1, 101-s) %action is number of $ to bet        
        val = pw * (r(s+a) + y*v(s+a)) + (1-pw) * (r(s-a) + y*v(s-a));
        if val >= maxValue
            maxValue = val;
            maxA = a;
        end
    end        
end