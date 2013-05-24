function [dx] = systemDifferential(t,x)

	 dx = zeros(4,1);
	 dx(1) = x(2)*x(3);
	 dx(2) = x(3)*(-x(1)+sin(x(2)));
	 dx(3) = 0;
	 dx(4) = 0;
end