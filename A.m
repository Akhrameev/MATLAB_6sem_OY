function [a] = A(t,x)
a = [0,x(3),x(2),0;
	-x(3),x(3)*cos(x(2)),sin(x(2))-x(1),0;
	0,0,0,0;
	0,0,0,0];
end