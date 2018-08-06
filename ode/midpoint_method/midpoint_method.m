% 2018/8/5 ÌÆÉ½
% midpoint method exercise 
% y' = ky
t = [];
y = [];
t(1) = 0;
y1(1) = 1;
y2(1) = 1;
k = 1;
step = 0.04;
IterNum = 200;
for i=2:IterNum
    t(i) = t(i-1) + step;
    y1(i) = y1(i-1) + step*(k*(y1(i-1) + step/2*k*y1(i-1))); % explicit
    y2(i) = y2(i-1)*(1 + step/2 * k^2)/(1 - step / 2 * k^2); % implicit
end
plot(t, y1);
hold on
plot(t, y2);
hold on
a = t(1):step:IterNum * step;
b = exp(k*a);
plot(a, b);
legend('explicit midpoint', 'implicit midpoint', 'right example')
disp( 'err1=' )
disp( b(IterNum) - y1(IterNum));
disp( 'err2=' )
disp( b(IterNum) - y2(IterNum));
disp('y=')
disp(b(IterNum));
clear;