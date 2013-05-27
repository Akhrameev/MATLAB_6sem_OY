function updateWaitbar ()
global jProgressbar wait progressbarOK;
global solvingIterationCount solvingIterationCurrent;
if (progressbarOK)
    jProgressbar.setVisible (true);
    jProgressbar.setMaximum (solvingIterationCount);
    jProgressbar.setValue (solvingIterationCurrent);
else
    try 
        close(wait)
    catch
    end
    wait = waitbar (solvingIterationCurrent/solvingIterationCount, 'In progress');
    jProgressbar = 0; 
end

