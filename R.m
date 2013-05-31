function [r] = R(x,y)
r = [x(1)-4;
	x(2)-1;
	y(1);
	y(2);
	y(3)^2+y(4)^2-1];
end