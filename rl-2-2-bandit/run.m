function run
    figure; hold on;
    xlabel('steps');
    ylabel('reward');
      
    [avg(1,:), opt(1,:)] = evaluate(1);
    [avg(2,:), opt(2,:)] = evaluate(0.99);
    [avg(3,:), opt(3,:)] = evaluate(0.9);
    [avg(4,:), opt(4,:)] = evaluate(0.6);
      
    p1 = subplot(2,1,1);
    plot(avg');
    legend(p1, 'greedy', '0.99', '0.9', '0.6')
    
    subplot(2,1,2);
    plot(opt');
    
end