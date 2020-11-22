function derivatives = system_diff(t, statess, params)
    % statess = [x x' y y' theta theta']
    m = params.m; g= params.g; B = params.B;
 
    x = statess(1);
    y = statess(3);
    phi = statess(5);

    [F_x F_y] = controller([20*sin(t) 30*cos(t)], statess);
%    phi_acc = F * L * sin(theta) / Izz; 
    x_acc = (F_x - B * statess(2)) / m;
    y_acc = (F_y - B * statess(4)) / m;
    phi_acc = 0;
    derivatives = [statess(2); x_acc; statess(4); y_acc; statess(6); phi_acc];
end


function [F_x F_y] = controller(r, s)
    F_x = 0.1 * sum(sum(r(1) - s(1:1)));
    F_y = 0.15 * sum(sum(r(2) - s(3:3)));
end