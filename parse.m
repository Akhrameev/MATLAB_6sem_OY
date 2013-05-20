function [ parseResult ] = parse (s)
parseResult = '';
i = 1;
len = length (s);
while i <= len
    parseResult = strcat(parseResult,s(i));
    if (((s (i) == 'x') || (s (i) == 'y')) && (i < len) && (s (i + 1) >= '1') && (s (i + 1) <= '9'))
       parseResult = strcat (parseResult,'(');       
       while ((i < len) && (s (i + 1) >= '0') && (s (i + 1) <= '9'))
           i = i + 1;
           parseResult = strcat (parseResult, s (i));
       end
       parseResult = strcat (parseResult, ')');       
    end
    i = i + 1;
end
end
