function [ ] = plotN(a, N, color)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    equ=['x^' , num2str(N) ,num2str(-1*a)];
    ans = eval(solve(equ,'x'));
    for i=1:length(ans)
        tmp = ans(i);
        ans(i,1) = real(tmp);
        ans(i,2) = imag(tmp);
        ans(i,3) = angle(tmp);
        if ans(i,3)<0
            ans(i,3) = 2 * pi + ans(i,3);
        end
    end
    sortrows(ans, 3);

    for i=1:N
        x = [ans(i,1), ans(mod(i,N)+1,1)];
        y = [ans(i,2), ans(mod(i,N)+1,2)];
        plot(x, y, color, 'LineWidth',1.5);
        hold on
    end
    viscircles([0,0],sqrt(x(1).^2 + y(1).^2), 'LineStyle', '--', 'Color', color, 'LineWidth', 0.5);
    hold on
end

