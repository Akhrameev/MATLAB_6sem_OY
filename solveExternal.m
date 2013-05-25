function [ dp ] = solveExternal( count, p )
global q0 ;
updateWaitbar ();
[xa, xb, Xa, Xb] = solveInternal (q0);
F = R(xa, xb);
[xa, xb, Xa, Xb] = solveInternal (p);
dp = -(Rx (xa, xb) * Xa + Ry (xa, xb) * Xb) \ F;
end
