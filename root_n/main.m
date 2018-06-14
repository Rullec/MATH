% complex analysis - n times of nth roots for any complex number a
% z^N = a, calculate for z
Color = ['r', 'g', 'b', 'c', 'm', 'y', 'k']
a = 10 + 9*i;
R = abs(a).^1/3;
axis([-1*R,R,-1*R,R]);
stN = 3;
edN = 10;
for i=stN:edN
    plotN(a,i,Color(mod(i - stN, length(Color))+1))
    hold on
end

clear
