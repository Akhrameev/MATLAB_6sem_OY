function [ ] = createFileWithValueForState (state, value, valueSize)
name = fileNameForState (state);
fid = fopen(name,'w');
clear(name);
fprintf(fid,headerForState(state));
fprintf(fid,initializationForState(state));
if (state == fileCreationStates.sR)
	for i = 1 : valueSize - 1
    	fprintf (fid,'%s;\n\t', parse (value {i, 2}));    
	end
	fprintf (fid, '%s];\n', parse (value {valueSize, 2}));
elseif ((state == fileCreationStates.sRx) || (state == fileCreationStates.sRy) || (state == fileCreationStates.sA))
	matrixBraket = 1;
	len = length (value);
	for i = 10 : len - 3
		if ((matrixBraket == 1) && (value (i) ~= ']'))
		    fprintf (fid, '%c', value (i));
		elseif value (i) == ']' 
		    matrixBraket = 0;
		    fprintf(fid, ';\n\t');
		elseif value (i) == '['
		    matrixBraket = 1;
		end
	end
	fprintf(fid,'];\n');
elseif (state == fileCreationStates.sDiff)
    fprintf (fid, '\t dx = zeros(%u,1);\n', valueSize);
    for i = 1 : valueSize
        fprintf (fid, '\t dx(%u) = %s;\n', i, parse (value {i, 1}));
    end
end
fprintf(fid,'end');
fclose(fid);
end

function [fileName] = fileNameForState (state)
switch (state)
	case fileCreationStates.sR
        fileName = 'R.m';
	case fileCreationStates.sRx
        fileName = 'Rx.m';
	case fileCreationStates.sRy
        fileName = 'Ry.m';
	case fileCreationStates.sA
        fileName = 'A.m';
    case fileCreationStates.sDiff
        fileName = 'sys_diff.m';
    otherwise
        fileName = 'error.m';
end
end

function [header] = headerForState (state)
switch (state)
	case fileCreationStates.sR
        header = 'function [r] = R(x,y)\n';
	case fileCreationStates.sRx
        header = 'function [rx] = Rx(x,y)\n';
	case fileCreationStates.sRy
        header = 'function [ry] = Ry(x,y)\n';
	case fileCreationStates.sA
        header = 'function [a] = A(t,x)\n';
    case fileCreationStates.sDiff
        header = 'function [dx] = sys_diff(t,x)\n';
    otherwise
        header = 'errorHeader';
end
end

function [initialization] = initializationForState (state)
switch (state)
	case fileCreationStates.sR
        initialization = 'r = [';
	case fileCreationStates.sRx
        initialization = 'rx = [';
	case fileCreationStates.sRy
        initialization = 'ry = [';
	case fileCreationStates.sA
        initialization = 'a = [';
    case fileCreationState.sDiff
        initialization = '';
    otherwise
        initialization = 'errorInitialization = [';
end
end