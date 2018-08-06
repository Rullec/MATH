% newmark method
% 2018/8/6 15:42 ÌÆÉ½
% y' = ky y'' = k^2*y
t = [];
y = [];
t(1) = 0;
y(1) = 1;
k = 1;
step = 0.04;
IterNum = 200;
beta = 0.2
for i=2:IterNum
    t(i) = t(i-1) + step;
    y(i) = (1+step*k+(1-2*beta)*k^2*step^2/2)/(1-beta*step^2*k^2)*y(i-1);
end
plot(t, y);
hold on
a = t(1):step:IterNum * step;
b = exp(k*a) + (y(1)-1);
plot(a, b);
legend('explicit euler method', 'example')
disp( 'err=' )
disp( b(IterNum) - y(IterNum));
disp('y=')
disp(b(IterNum));