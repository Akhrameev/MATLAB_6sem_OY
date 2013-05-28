function [dx] = systemDifferential(t,x)

	 dx = zeros(4,1);
	 dx(1) = (-x(2)+x(3))/sqrt((-x(2)+x(3))^2+(x(1)+x(4))^2);
	 dx(2) = 1+4*(x(1)+x(4))/sqrt((-x(2)+x(3))^2+4*(x(1)+x(4))^2);
	 dx(3) = -1-4*(x(1)+x(4))/sqrt((-x(2)+x(3))^2+4*(x(1)+x(4))^2);
	 dx(4) = (-x(2)+x(3))/sqrt((-x(2)+x(3))^2+(x(1)+x(4))^2);
end