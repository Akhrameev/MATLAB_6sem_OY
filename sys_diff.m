function [dx] = sys_diff(t,x)

	 dx = zeros(4,1);
	 dx(1) = x(3);
	 dx(2) = x(4);
	 dx(3) = -x(1)*(x(1)*x(1)+x(2)*x(2))^(-1.5);
	 dx(4) = -x(2)*(x(1)*x(1)+x(2)*x(2))^(-1.5);
end