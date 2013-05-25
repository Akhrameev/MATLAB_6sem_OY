function [dx] = systemDifferential(t,x)

	 dx = zeros(2,1);
	 dx(1) = x(2)*x(3);
	 dx(2) = x(3)*(-x(1)+sin(x(2)));
end