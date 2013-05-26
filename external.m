function [ p ] = external (p0, iterationCount)
global solvingExternalEpsilon solvingExternalMethod q0 solvingIterationCurrent;
global pause;
q0 = p0;
opts = odeset('RelTol',solvingExternalEpsilon);
[xa, xb, ~, ~] = solveInternal (p0);
while (solvingIterationCurrent < iterationCount)  
    if (pause)
        break;
    end
    [~, ps] = solvingExternalMethod (@solveExternal, [0 1], p0, opts);
    if norm(R (xa, xb)) >= solvingExternalEpsilon   
        q0 = ps (end, :);
    end
    [xa, xb, ~, ~] = solveInternal (q0);
    solvingIterationCurrent = solvingIterationCurrent + 1;
end
p = q0;
end