% beeman_algorithm 常用于分子动力学的beeman算法
% 2018/8/6 14:15 唐山
% y' = ky 
% y''=k^2*y
% 算法不能自己启动
t = [];
y = [];
k = 2;
step = 0.04;
IterNum = 200;
t(1:2) = [0, step];
y(1:2) = [1, 1 + step*k + step^2/2*k^2];
subIter = 3;
for i=3:IterNum
    t(i) = t(i-1) + step;
    y(i) = y(i-1) + k*y(i-1)*step + step^2/6*(4*y(i-1)*k^2 -y(i-2)*k^2);
    for j=1:subIter
        y(i) = y(i-1) + k*y(i-1)*step + (step^2)/6*(k^2*y(i) +2*k^2*y(i-1));
    end
end
plot(t, y);
hold on
a = t(1):step:IterNum * step;
b = exp(k*a) + (y(1)-1);
plot(a, b);
legend('beeman algorithm', 'example')
disp( 'err=' )
disp( b(IterNum) - y(IterNum));
disp('y=')
disp(b(IterNum));