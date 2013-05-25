function [a] = A(t,x)
try
	a = [0,x(3);
	-x(3),x(3)*cos(x(2))];
catch
	errorAlertSystem;
end