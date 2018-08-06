% Trapezoidal_rule ���ι�ʽ
% 2018/8/6 13:35 ��ɽ
% y' = ky
t = [];
y = [];
t(1) = 0;
y(1) = 1;
k = 1;
step = 0.04;
IterNum = 200;
for i=2:IterNum
    t(i) = t(i-1) + step;
    y(i) = (1 + k*step/2)/(1 - k*step/2)*y(i-1);
end
plot(t, y);
hold on
a = t(1):step:IterNum * step;
b = exp(k*a) + (y(1)-1);
plot(a, b);
legend('Trapezoidal rule method', 'example')
disp( 'err=' )
disp( b(IterNum) - y(IterNum));
disp('y=')
disp(b(IterNum));