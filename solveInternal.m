function [ya, yb, Xa, Xb] = solveInternal (p)
global solvingInternalEpsilon solvingInternalMethod solvingTimeBegin;
global solvingTimeEnd solvingStep systemForSolvingDimension solvingTimeStarred;
n = systemForSolvingDimension;
l = solvingTimeBegin;
r = solvingTimeEnd;
s = solvingStep;
t_s = solvingTimeStarred;
opts = odeset('RelTol', solvingInternalEpsilon);
nMult = n * (n +  1);
q = zeros(1, nMult);
q (1 : n) = p;
I = eye (n);
for i = 1 : n
   q (i * n + 1 : n * (i + 1)) = I (i, :); 
end
if t_s == l
        [~, X] = solvingInternalMethod(@Internal,[l:s:r],q,opts);
elseif t_s == r
        [~, X1] = solvingInternalMethod(@Internal,[r:-s:l],q,opts);
        X = ones (length (X1),nMult);
        X (1 : end, :) = X1 (end:-1:1,:);
else
        [~,X1] = solvingInternalMethod(@Internal,[t_s:-s:l],q,opts);
        [~,X2] = solvingInternalMethod(@Internal,[t_s: s:r],q,opts);
        X = ones(length(X1) + length(X2) - 1, nMult);
        X(1 : length(X1),       :) = X1(end:-1:1, :);
        X(length(X1) + 1 : end, :) = X2(2:end,    :);
end
Xa = zeros (n,n); 
Xb = zeros (n,n);
ya = X(1,   1:n); 
yb = X(end, 1:n);
ya = ya'; 
yb = yb';
for i = 1 : n
    Xa(:,i) = X(1,   i * n + 1 : (i + 1) * n);
    Xb(:,i) = X(end, i * n + 1 : (i + 1) * n);
end
end

