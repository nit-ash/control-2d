close all;
% statess = [x x' y y' theta theta']
params.m = 10; params.g= 9.81; params.B = 1; 


[t, X] = ode45(@(t, statess) system_diff(t, statess, params), [0 200], [0 0 0 0 0 0]);
figure; plot(t, X(:,1))
figure; plot(t, X(:,3))
figure; plot(t, X(:,5))
figure; plot(X(:,1), X(:,3))


%%

x = X(:,1);
y = X(:,3);
phi = X(:,5);
A =  [min(x)-10, min(y)-10; max(x)+10, min(y)-10; max(x)+10, max(y)+10; min(x)-10, max(y)+10; min(x)-10, min(y)-10];
figure; plot(A(:,1), A(:,2)); hold on;
axis equal;
%%
p=patch('Vertices',[0 1 1 0 ; 0 0 1 1]','Faces',[1 2 3 4],'Edgecolor',[0 0 0],'Facecolor',[0.9 0.5 0.2],'Linewidth',0.8);


%%
for i = 1:length(x)
    drawrr(p, [x(i),y(i)],3 ,3 , phi(i));
    drawnow;
end

