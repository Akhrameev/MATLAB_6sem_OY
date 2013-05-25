function [dx] = systemDifferential(t,x)

	 dx = zeros(6,1);
	 dx(1) = x(2);
	 dx(2) = x(3);
	 dx(3) = 0.5*(sqrt((1e-10)+(x(6)+1)*(x(6)+1))-sqrt((1e-10)+(x(6)-1)*(x(6)-1)));
	 dx(4) = 0;
	 dx(5) = -x(4);
	 dx(6) = -x(5);
end