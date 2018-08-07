% test.m 
% 2018/8/7 22:23 
a = rand(4,2)*10;

[U, S, V] = svd(a);
disp(U*S*transpose(V));
[U, S, V] = svd_own(a);
disp(U*S*transpose(V));
clear