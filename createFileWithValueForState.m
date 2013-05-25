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
elseif (state == fileCreationStates.sInternal)
    syms x y t;
    sizeMult = valueSize * (valueSize + 1);
    x = sym ('x', [sizeMult 1]);
    y = sym ('x', [valueSize 1]);
    F = A (t, y);
    
    fprintf (fid, '\t dx = zeros(%u,1);\n', sizeMult);
    for i = 1 : valueSize
        fprintf (fid, '\t dx(%u) = %s;\n',i, parse (value{i,1}));
    end
    for i = 1 : valueSize
        y = x (i * valueSize + 1 : (i + 1) * valueSize);
        y = F * y;
        for j = 1 : valueSize
            fprintf (fid,'\t dx(%u) = %s;\n',i * valueSize + j, parse (char (y (j))));
        end
    end
elseif (state == fileCreationStates.sJ)
	fprintf(fid,'\tj = %s;\n',parse(value));
end
fprintf (fid, footerForState (state));
fclose (fid);
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
        fileName = 'systemDifferential.m';
    case fileCreationStates.sInternal
        fileName = 'Internal.m';
    case fileCreationStates.sJ
    	fileName = 'J.m';
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
        header = 'function [dx] = systemDifferential(t,x)\n';
    case fileCreationStates.sInternal
        header = 'function [dx] = Internal(t,x)\n';
    case fileCreationStates.sJ
    	header = 'function [j] = J(x)\n';
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
        initialization = 'try\n\ta = [';
    case fileCreationStates.sDiff
        initialization = '\n';
    case fileCreationStates.sInternal
        initialization = '\n';
    case fileCreationStates.sJ
        initialization = 'try\n';
    otherwise
        initialization = 'errorInitialization = [';
end
end

function [footer] = footerForState (state)
switch (state)
    case fileCreationStates.sA
        footer = 'catch\n\terrorAlertSystem;\nend';
    case fileCreationStates.sJ
    	footer = 'catch\n\terrorAlertJ;\nend';
    otherwise
        footer = 'end';
end
end
