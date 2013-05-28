function [dx] = Internal(t,x)

	 dx = zeros(20,1);
	 dx(1) = (-x(2)+x(3))/sqrt((-x(2)+x(3))^2+(x(1)+x(4))^2);
	 dx(2) = 1+4*(x(1)+x(4))/sqrt((-x(2)+x(3))^2+4*(x(1)+x(4))^2);
	 dx(3) = -1-4*(x(1)+x(4))/sqrt((-x(2)+x(3))^2+4*(x(1)+x(4))^2);
	 dx(4) = (-x(2)+x(3))/sqrt((-x(2)+x(3))^2+(x(1)+x(4))^2);
	 dx(5) = x(7)*(1/((x(2)-x(3))^2+(x(1)+x(4))^2)^(1/2)-((2*x(2)-2*x(3))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2)))-x(6)*(1/((x(2)-x(3))^2+(x(1)+x(4))^2)^(1/2)-((2*x(2)-2*x(3))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2)))+(x(5)*(2*x(1)+2*x(4))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2))+(x(8)*(2*x(1)+2*x(4))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2));
	 dx(6) = x(5)*(4/((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(1/2)-((4*x(1)+4*x(4))*(8*x(1)+8*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2)))+x(8)*(4/((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(1/2)-((4*x(1)+4*x(4))*(8*x(1)+8*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2)))-(x(6)*(2*x(2)-2*x(3))*(4*x(1)+4*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2))+(x(7)*(2*x(2)-2*x(3))*(4*x(1)+4*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2));
	 dx(7) = (x(6)*(2*x(2)-2*x(3))*(4*x(1)+4*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2))-x(8)*(4/((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(1/2)-((4*x(1)+4*x(4))*(8*x(1)+8*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2)))-x(5)*(4/((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(1/2)-((4*x(1)+4*x(4))*(8*x(1)+8*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2)))-(x(7)*(2*x(2)-2*x(3))*(4*x(1)+4*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2));
	 dx(8) = x(7)*(1/((x(2)-x(3))^2+(x(1)+x(4))^2)^(1/2)-((2*x(2)-2*x(3))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2)))-x(6)*(1/((x(2)-x(3))^2+(x(1)+x(4))^2)^(1/2)-((2*x(2)-2*x(3))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2)))+(x(5)*(2*x(1)+2*x(4))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2))+(x(8)*(2*x(1)+2*x(4))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2));
	 dx(9) = x(11)*(1/((x(2)-x(3))^2+(x(1)+x(4))^2)^(1/2)-((2*x(2)-2*x(3))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2)))-x(10)*(1/((x(2)-x(3))^2+(x(1)+x(4))^2)^(1/2)-((2*x(2)-2*x(3))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2)))+(x(9)*(2*x(1)+2*x(4))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2))+(x(12)*(2*x(1)+2*x(4))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2));
	 dx(10) = x(9)*(4/((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(1/2)-((4*x(1)+4*x(4))*(8*x(1)+8*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2)))+x(12)*(4/((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(1/2)-((4*x(1)+4*x(4))*(8*x(1)+8*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2)))-(x(10)*(2*x(2)-2*x(3))*(4*x(1)+4*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2))+(x(11)*(2*x(2)-2*x(3))*(4*x(1)+4*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2));
	 dx(11) = (x(10)*(2*x(2)-2*x(3))*(4*x(1)+4*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2))-x(12)*(4/((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(1/2)-((4*x(1)+4*x(4))*(8*x(1)+8*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2)))-x(9)*(4/((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(1/2)-((4*x(1)+4*x(4))*(8*x(1)+8*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2)))-(x(11)*(2*x(2)-2*x(3))*(4*x(1)+4*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2));
	 dx(12) = x(11)*(1/((x(2)-x(3))^2+(x(1)+x(4))^2)^(1/2)-((2*x(2)-2*x(3))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2)))-x(10)*(1/((x(2)-x(3))^2+(x(1)+x(4))^2)^(1/2)-((2*x(2)-2*x(3))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2)))+(x(9)*(2*x(1)+2*x(4))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2))+(x(12)*(2*x(1)+2*x(4))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2));
	 dx(13) = x(15)*(1/((x(2)-x(3))^2+(x(1)+x(4))^2)^(1/2)-((2*x(2)-2*x(3))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2)))-x(14)*(1/((x(2)-x(3))^2+(x(1)+x(4))^2)^(1/2)-((2*x(2)-2*x(3))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2)))+(x(13)*(2*x(1)+2*x(4))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2))+(x(16)*(2*x(1)+2*x(4))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2));
	 dx(14) = x(13)*(4/((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(1/2)-((4*x(1)+4*x(4))*(8*x(1)+8*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2)))+x(16)*(4/((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(1/2)-((4*x(1)+4*x(4))*(8*x(1)+8*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2)))-(x(14)*(2*x(2)-2*x(3))*(4*x(1)+4*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2))+(x(15)*(2*x(2)-2*x(3))*(4*x(1)+4*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2));
	 dx(15) = (x(14)*(2*x(2)-2*x(3))*(4*x(1)+4*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2))-x(16)*(4/((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(1/2)-((4*x(1)+4*x(4))*(8*x(1)+8*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2)))-x(13)*(4/((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(1/2)-((4*x(1)+4*x(4))*(8*x(1)+8*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2)))-(x(15)*(2*x(2)-2*x(3))*(4*x(1)+4*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2));
	 dx(16) = x(15)*(1/((x(2)-x(3))^2+(x(1)+x(4))^2)^(1/2)-((2*x(2)-2*x(3))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2)))-x(14)*(1/((x(2)-x(3))^2+(x(1)+x(4))^2)^(1/2)-((2*x(2)-2*x(3))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2)))+(x(13)*(2*x(1)+2*x(4))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2))+(x(16)*(2*x(1)+2*x(4))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2));
	 dx(17) = x(19)*(1/((x(2)-x(3))^2+(x(1)+x(4))^2)^(1/2)-((2*x(2)-2*x(3))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2)))-x(18)*(1/((x(2)-x(3))^2+(x(1)+x(4))^2)^(1/2)-((2*x(2)-2*x(3))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2)))+(x(17)*(2*x(1)+2*x(4))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2))+(x(20)*(2*x(1)+2*x(4))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2));
	 dx(18) = x(17)*(4/((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(1/2)-((4*x(1)+4*x(4))*(8*x(1)+8*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2)))+x(20)*(4/((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(1/2)-((4*x(1)+4*x(4))*(8*x(1)+8*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2)))-(x(18)*(2*x(2)-2*x(3))*(4*x(1)+4*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2))+(x(19)*(2*x(2)-2*x(3))*(4*x(1)+4*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2));
	 dx(19) = (x(18)*(2*x(2)-2*x(3))*(4*x(1)+4*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2))-x(20)*(4/((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(1/2)-((4*x(1)+4*x(4))*(8*x(1)+8*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2)))-x(17)*(4/((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(1/2)-((4*x(1)+4*x(4))*(8*x(1)+8*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2)))-(x(19)*(2*x(2)-2*x(3))*(4*x(1)+4*x(4)))/(2*((x(2)-x(3))^2+4*(x(1)+x(4))^2)^(3/2));
	 dx(20) = x(19)*(1/((x(2)-x(3))^2+(x(1)+x(4))^2)^(1/2)-((2*x(2)-2*x(3))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2)))-x(18)*(1/((x(2)-x(3))^2+(x(1)+x(4))^2)^(1/2)-((2*x(2)-2*x(3))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2)))+(x(17)*(2*x(1)+2*x(4))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2))+(x(20)*(2*x(1)+2*x(4))*(x(2)-x(3)))/(2*((x(2)-x(3))^2+(x(1)+x(4))^2)^(3/2));
end