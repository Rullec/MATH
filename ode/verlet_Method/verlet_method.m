% 2018/8/6 ÌÆÉ½
% verlet method
% y' = ky, s.t. y''=k^2 * y
t = [];
y = [];
k = 1;
step = 0.04;
IterNum = 1000;
t(1:2) = [0, step];
y(1:2) = [1, 1 + step*k + step^2/2*1];
for i=3:IterNum
    t(i) = t(i-1) + step;
    y(i) = 2*y(i-1) -y(i-2)+ step^2*(k^2*y(i-1));
end
plot(t, y);
hold on
a = t(1):step:IterNum * step;
b = exp(k*a) + (y(1)-1);
plot(a, b);
legend('verlet method', 'example')
disp( 'err=' )
disp( b(IterNum) - y(IterNum));
disp('y=')
disp(b(IterNum));