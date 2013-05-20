function [ ] = createR( n,sx,sy )
global systemForSolving;
createFileWithValueForState (fileCreationStates.sR, systemForSolving, n);
createFileWithValueForState (fileCreationStates.sRx, sx, 0);
createFileWithValueForState (fileCreationStates.sRy, sy, 0);
end