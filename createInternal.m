function [ ] = createInternal (n)
global systemForSolving;
createFileWithValueForState (fileCreationStates.sInternal, systemForSolving, n);
end