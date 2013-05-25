function [j] = J(x)
try
	j = x(1)+2;
catch
	errorAlertJ;
end