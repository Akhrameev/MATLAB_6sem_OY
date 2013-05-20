function [dx] = Int(t,x)

	 dx = zeros(20,1);
	 dx(1) = x(3);
	 dx(2) = x(4);
	 dx(3) = -x(1)*(x(1)*x(1)+x(2)*x(2))^(-1.5);
	 dx(4) = -x(2)*(x(1)*x(1)+x(2)*x(2))^(-1.5);
	 dx(5) = x(7);
	 dx(6) = x(8);
	 dx(7) = (3*x(1)*x(2)*x(6))/(x(1)^2+x(2)^2)^(5/2)-x(5)*(1/(x(1)^2+x(2)^2)^(3/2)-(3*x(1)^2)/(x(1)^2+x(2)^2)^(5/2));
	 dx(8) = (3*x(1)*x(2)*x(5))/(x(1)^2+x(2)^2)^(5/2)-x(6)*(1/(x(1)^2+x(2)^2)^(3/2)-(3*x(2)^2)/(x(1)^2+x(2)^2)^(5/2));
	 dx(9) = x(11);
	 dx(10) = x(12);
	 dx(11) = (3*x(1)*x(2)*x(10))/(x(1)^2+x(2)^2)^(5/2)-x(9)*(1/(x(1)^2+x(2)^2)^(3/2)-(3*x(1)^2)/(x(1)^2+x(2)^2)^(5/2));
	 dx(12) = (3*x(1)*x(2)*x(9))/(x(1)^2+x(2)^2)^(5/2)-x(10)*(1/(x(1)^2+x(2)^2)^(3/2)-(3*x(2)^2)/(x(1)^2+x(2)^2)^(5/2));
	 dx(13) = x(15);
	 dx(14) = x(16);
	 dx(15) = (3*x(1)*x(2)*x(14))/(x(1)^2+x(2)^2)^(5/2)-x(13)*(1/(x(1)^2+x(2)^2)^(3/2)-(3*x(1)^2)/(x(1)^2+x(2)^2)^(5/2));
	 dx(16) = (3*x(1)*x(2)*x(13))/(x(1)^2+x(2)^2)^(5/2)-x(14)*(1/(x(1)^2+x(2)^2)^(3/2)-(3*x(2)^2)/(x(1)^2+x(2)^2)^(5/2));
	 dx(17) = x(19);
	 dx(18) = x(20);
	 dx(19) = (3*x(1)*x(2)*x(18))/(x(1)^2+x(2)^2)^(5/2)-x(17)*(1/(x(1)^2+x(2)^2)^(3/2)-(3*x(1)^2)/(x(1)^2+x(2)^2)^(5/2));
	 dx(20) = (3*x(1)*x(2)*x(17))/(x(1)^2+x(2)^2)^(5/2)-x(18)*(1/(x(1)^2+x(2)^2)^(3/2)-(3*x(2)^2)/(x(1)^2+x(2)^2)^(5/2));
end