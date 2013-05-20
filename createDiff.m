function [ ] = createDiff (n)
global systemForSolving;
createFileWithValueForState (fileCreationStates.sDiff, systemForSolving, n);
end