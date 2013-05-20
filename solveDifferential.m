function [ X ] = solveDifferential( n,l,r,s,p )
global solvingTimeStarred solvingInternalEpsilon solvingInternalMethod;
opts = odeset('RelTol',solvingInternalEpsilon);
if solvingTimeStarred == l
        [~, X] = solvingInternalMethod (@systemDifferential, [l: s: r], p, opts);
elseif solvingTimeStarred == r
        [~,X1] = solvingInternalMethod (@systemDifferential, [r:-s: l], p, opts);
        X = ones (length (X1), n);
        X (1:end,:) = X1 (end:-1:1,:);
else
        [~, X1] = solvingInternalMethod (@systemDifferential, [solvingTimeStarred:-s:l], p, opts);
        [~, X2] = solvingInternalMethod (@systemDifferential, [solvingTimeStarred: s:r], p, opts);
        X = ones(length(X1) + length(X2) - 1, n);
        X (1 : length(X1),      :) = X1 (end:-1:1,:);
        X (length(X1) + 1 : end,:) = X2 (2:end,   :);
end
end