function [a] = A(t,x)
try
	a = [0,1.0*x(5),x(5)*((2.0*((0.25*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)^2)/(2*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2+2*x(4)^2)^0.5-(1.0*((0.25*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)^2)/((((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2)^0.5-(4.0*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2*((0.25*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)^2)/(2*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2+2*x(4)^2)^1.5+(1.0*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2*((0.25*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)^2)/((((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2)^1.5+(2.0*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)*((0.25*((3*x(3)^2)/250000+x(4)^2/250000+2))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*((3*x(3)^2)/250000+x(4)^2/250000+2))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5-(0.125*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000)^2)/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^1.5-(0.125*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000)^2)/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^1.5))/(2*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2+2*x(4)^2)^0.5-(1.0*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)*((0.25*((3*x(3)^2)/250000+x(4)^2/250000+2))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*((3*x(3)^2)/250000+x(4)^2/250000+2))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5-(0.125*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000)^2)/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^1.5-(0.125*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000)^2)/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^1.5))/((((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2)^0.5),-x(5)*((1.0*((0.25*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)*((0.25*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5))/((((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2)^0.5-(2.0*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)*((0.25*((x(3)*x(4))/125000+2))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*((x(3)*x(4))/125000-2))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5-(0.125*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000)*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^1.5-(0.125*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000)*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^1.5))/(2*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2+2*x(4)^2)^0.5+(1.0*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)*((0.25*((x(3)*x(4))/125000+2))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*((x(3)*x(4))/125000-2))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5-(0.125*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000)*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^1.5-(0.125*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000)*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^1.5))/((((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2)^0.5-(2.0*((0.25*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)*((0.25*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5))/(2*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2+2*x(4)^2)^0.5+(1.0*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)*((0.25*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)*(4*x(4)+4*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)*((0.25*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)))/(2*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2+2*x(4)^2)^1.5-(1.0*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2*((0.25*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)*((0.25*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5))/((((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2)^1.5),x(2)+(2.0*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)*((0.25*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5))/(2*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2+2*x(4)^2)^0.5-(1.0*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)*((0.25*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5))/((((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2)^0.5;
	-1.5*x(5),-0.25*x(5),-x(5)*((1.0*((0.25*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)*((0.25*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5))/((((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2)^0.5-(0.5*(4*((0.25*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)*((0.25*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)+4*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)*((0.25*((x(3)*x(4))/125000+2))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*((x(3)*x(4))/125000-2))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5-(0.125*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000)*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^1.5-(0.125*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000)*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^1.5)))/(2*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2+2*x(4)^2)^0.5+(1.0*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)*((0.25*((x(3)*x(4))/125000+2))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*((x(3)*x(4))/125000-2))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5-(0.125*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000)*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^1.5-(0.125*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000)*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^1.5))/((((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2)^0.5+(1.0*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)*((0.25*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)*(4*x(4)+4*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)*((0.25*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)))/(2*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2+2*x(4)^2)^1.5-(1.0*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2*((0.25*(2*x(3)+2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(3)-2*x(4)+(x(3)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)*((0.25*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5))/((((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2)^1.5),-x(5)*((0.25*(4*x(4)+4*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)*((0.25*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5))^2)/(2*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2+2*x(4)^2)^1.5+(1.0*((0.25*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)^2)/((((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2)^0.5-(0.5*(4*((0.25*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)^2+4*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)*((0.25*(x(3)^2/250000+(3*x(4)^2)/250000+2))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(x(3)^2/250000+(3*x(4)^2)/250000+2))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5-(0.125*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000)^2)/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^1.5-(0.125*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000)^2)/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^1.5)+4))/(2*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2+2*x(4)^2)^0.5-(1.0*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2*((0.25*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)^2)/((((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2)^1.5+(1.0*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)*((0.25*(x(3)^2/250000+(3*x(4)^2)/250000+2))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(x(3)^2/250000+(3*x(4)^2)/250000+2))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5-(0.125*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000)^2)/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^1.5-(0.125*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000)^2)/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^1.5))/((((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2)^0.5),(0.5*(4*x(4)+4*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)*((0.25*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5)))/(2*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2+2*x(4)^2)^0.5-0.25*x(2)-1.5*x(1)-(1.0*(((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)*((0.25*(2*x(3)+2*x(4)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5+(0.25*(2*x(4)-2*x(3)+(x(4)*(x(3)^2+x(4)^2))/250000))/((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5))/((((x(3)^2+x(4)^2)^2/1000000+(x(3)+x(4))^2)^0.5/2+((x(3)-x(4))^2+(x(3)^2+x(4)^2)^2/1000000)^0.5/2)^2)^0.5;
	0,0,0,1.5*x(5),1.5*x(4);
	0,0,-1.0*x(5),0.25*x(5),0.25*x(4)-x(3);
	0,0,0,0,0];
catch
	errorAlertSystem;
end