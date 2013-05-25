function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 25-May-2013 15:53:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)
global currentExample progressbarOK;
% Choose default command line output for gui
progressbarOK = 0;
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
createWaitbar (handles);
initExample (currentExample, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

function createWaitbar (handles)
global jProgressbar progressbarOK jInternalProgressbar;
global solvingIterationCount solvingIterationCurrent;
if (progressbarOK)
    
else
    try
        externalProgressbar = handles.externalProgressbar;
        internalProgressbar = handles.internalProgressbar;
        jProgressbarPosition = get (externalProgressbar, 'Position');
        jInternalProgressbarPosition = get (internalProgressbar, 'Position');
        jProgressbar = jcontrol(handles.figure1, javax.swing.JProgressBar(),'Position', jProgressbarPosition, 'Visible', 'off'); 
        jProgressbar.setMaximum (solvingIterationCount);
        jProgressbar.setMinimum (0);
        jProgressbar.setValue (solvingIterationCurrent);
        jProgressbar.setBorderPainted (true);
        jProgressbar.setStringPainted (true);
        jInternalProgressbar = jcontrol (handles.figure1, javax.swing.JProgressBar(), 'Position', jInternalProgressbarPosition, 'Visible', 'off');        
        jInternalProgressbar.setIndeterminate (true);
        progressbarOK = 1;
    catch
        jProgressbar = 0;
        jInternalProgressbar = 0;
        progressbarOK = 0;
    end;
end

function showWaitbar ()
global jProgressbar wait progressbarOK jInternalProgressbar;
global solvingIterationCount solvingIterationCurrent;
if (progressbarOK)
    jProgressbar.setVisible (true);
    jProgressbar.setMaximum (solvingIterationCount);
    jProgressbar.setValue (solvingIterationCurrent);
    jInternalProgressbar.setVisible (true);
else
    wait = waitbar (solvingIterationCurrent/solvingIterationCount, 'In progress'); 
end

function closeWaitbar ()
global jProgressbar wait progressbarOK jInternalProgressbar;
if (progressbarOK)
    jProgressbar.setVisible (false);
    jInternalProgressbar.setVisible (false);
else
    close (wait);
end;

% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%function to get Exmples
function examplesList = getExamples ()
examplesList = getAllFiles ('Examples/'); 

function propertyList = getPropertyListFromFile (filename)
fid_r = fopen(filename, 'r');
C = textscan(fid_r, '%s');
propertyList = C{1};


%function to get all files in Directory (from stackoverflow)
function fileList = getAllFiles(dirName)

dirData = dir(dirName);      %# Get the data for the current directory
dirIndex = [dirData.isdir];  %# Find the index for directories
fileList = {dirData(~dirIndex).name};  %'# Get a list of the files
if ~isempty(fileList)
    fileList = cellfun(@(x) fullfile(dirName,x),...  %# Prepend path to files
                     fileList,'UniformOutput',false);
end
subDirs = {dirData(dirIndex).name};  %# Get a list of the subdirectories
validIndex = ~ismember(subDirs,{'.','..'});  %# Find index of subdirectories
                                             %#   that are not '.' or '..'
for iDir = find(validIndex)                  %# Loop over valid subdirectories
    nextDir = fullfile(dirName,subDirs{iDir});    %# Get the subdirectory path
    fileList = [fileList; getAllFiles(nextDir)];  %# Recursively call getAllFiles
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
compute (handles);

function [ method ] = setMethod (state)
switch (state)
    case 1.0
        method = @ode45;
    case 2.0
        method = @ode23;
    case 3.0
        method = @ode113;
    case 4.0
        method = @ode15s;
    otherwise
        method = @ode45;
end;

% --- function to compute 
function [ ] = compute (handles)
global solvingTimeBegin solvingTimeEnd solvingStep;
global solvingIterationCount systemForSolvingDimension;
global systemForSolving p Y solvingIterationCurrent;
if ((solvingTimeEnd - solvingTimeBegin) * solvingStep < 0)
    errordlg('Error! Incorrect input (time_begin, time_end or step)','OK');
    return;
end
x = sym ('x', [1 systemForSolvingDimension]);
y = sym ('y', [1 systemForSolvingDimension]);
createA (parse (char (jacobian (systemForSolving (:, 1), x))));
createR (systemForSolvingDimension, parse (char (jacobian (systemForSolving (:, 2), x))),...
          parse (char (jacobian (systemForSolving (:, 2), y))));
createDiff (systemForSolvingDimension);
createInternal (systemForSolvingDimension);

p0 = zeros (1, systemForSolvingDimension);
for i = 1 : systemForSolvingDimension
   p0 (i) = systemForSolving {i, 3}; 
end
solvingIterationCurrent = 0;
showWaitbar ();
p = external (p0, solvingIterationCount);
Y = solveDifferential (systemForSolvingDimension, solvingTimeBegin, solvingTimeEnd, solvingStep, p);
closeWaitbar ();
drawPlot (handles);

function drawPlot (handles)
global systemForSolving Y;
global systemForSolvingDimension;
global lineStyle lineColor;
global Xi Xj ji solved;
global solvingTimeBegin solvingTimeEnd solvingStep;
cla reset;
hold all;
style = lineStyle;
color = lineColor;
width = 1;
m = floor(0.5*(solvingTimeEnd - solvingTimeBegin) / solvingStep);
if ji
    plot(handles.plotter,Y(:,Xi),Y(:,Xj),strcat(style,color),'LineWidth',width);
    xlabel(sprintf('x%d',Xi));
    ylabel(sprintf('x%d',Xj));
    text(Y(m,Xi),Y(m,Xj),sprintf('x%d(x%d)',Xj,Xi));
else
    for i = 1 : systemForSolvingDimension
        %visibility parameter from table
        if systemForSolving {i,4} == 1
            plot(handles.plotter, solvingTimeBegin:solvingStep:solvingTimeEnd, Y(:,i), strcat(style,color), 'LineWidth', width); 
            text (solvingTimeBegin + m * solvingStep, Y(m,i), sprintf ('x%d(t)',i));
        end
    end
    xlabel('t');
    ylabel('x');
end
solved = 1;
setShowSystemForSolving ('off', handles);

% --- function to init data in table
function [ ] = initExample (file, handles)
global systemForSolving; 
global systemForSolvingDimension;
global solvingTimeBegin;  global solvingTimeEnd; 
global solvingStep;
global solvingIterationCount;
global solvingTimeStarred;
global solvingExternalMethod; global solvingInternalMethod; 
global solvingExternalEpsilon; global solvingInternalEpsilon;
load (file);
sS = saveStructure;
fR = sS.fieldRecord;
pr = sS.property;
for i = 1 : length (fR) - 1
    fRi = correctNameForExistingElement(fR{i});
    if (fRi == 0)
        continue;
    end
    pri = pr(i);
    field = getfield(handles, fRi);
    set (field, 'Value',   pri.Value);
    set (field, 'String',  pri.String);
    set (field, 'Enable',  pri.Enable);
    set (field, 'Visible', pri.Visible);
end
fRl = fR{length(fR)};
prl = pr(length(fR));
field = getfield(handles, fRl);
set (field, 'Data',    prl.Data);
set (field, 'Enable',  prl.Enable);
set (field, 'Visible', prl.Visible);
fields = fieldnames(sS);
for i = 1 : length (fields)
    fi = fields{i};
    handles = setfield (handles, fi, getfield(sS, fi));
end
systemForSolvingDimension = str2double (get (handles.sys_dim, 'String'));
systemForSolving = get (handles.sdu, 'Data');
solvingTimeBegin = str2double (get (handles.left_edge, 'String'));
solvingTimeEnd = str2double (get (handles.right_edge, 'String'));
solvingStep = str2double (get (handles.step, 'String'));
solvingExternalMethod = get (handles.meth_ext, 'Value');
solvingExternalMethod = setMethod (solvingExternalMethod);
solvingInternalMethod = get (handles.meth_int, 'Value');
solvingInternalMethod = setMethod (solvingInternalMethod);
solvingExternalEpsilon = str2double (get (handles.eps_ext, 'String'));
solvingInternalEpsilon = str2double (get (handles.eps_int, 'String'));
solvingTimeStarred = str2double (get (handles.t_star, 'String'));
solvingIterationCount = str2double (get (handles.Iter_num, 'String'));
setShowSystemForSolving ('on', handles);

function sys_dim_Callback(hObject, eventdata, handles)
% hObject    handle to sys_dim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global systemForSolvingDimension;
global solved;
n = str2double (get(hObject, 'String'));
if (n <= 0 || isnan(n) || floor (n) < n)
    errordlg('Error! systemForSolvingDimension is incorrect.','OK');
    s = num2str (systemForSolvingDimension);
    set (hObject, 'String', s); 
else
    systemForSolvingDimension = n;
    solved = 0;
end
set (handles.sdu, 'Data', cell (systemForSolvingDimension, 4));

% --- Executes during object creation, after setting all properties.
function sys_dim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sys_dim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global systemForSolvingDimension;
systemForSolvingDimension = 1;
set (handles.sdu, 'Data', cell (1,4));
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set (hObject,'BackgroundColor','white');
end

function [ existElement ] = correctNameForExistingElement (name)
switch (name)
    case 'sys_dim'
        existElement = name;
    case 'left_edge'
        existElement = name;
    case 'right_edge'
        existElement = name;
    case 'meth_int'
        existElement = name;
    case 'meth_ext'
        existElement = name;
    case 'eps_ext'
        existElement = name;
    case 'eps_int'
        existElement = name;
    case 'Iter_num'
        existElement = name;
    case 't_star'
        existElement = name;
    case 'step'
        existElement = name;
    otherwise
        existElement = 0;
end


% --- Executes on selection change in example.
function example_Callback(hObject, eventdata, handles)
% hObject    handle to example (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global currentExample;
contents = cellstr(get(hObject,'String'));
currentExample = contents{get(hObject,'Value')};
initExample (currentExample, handles);

% --- Executes during object creation, after setting all properties.
function example_CreateFcn(hObject, eventdata, handles)
% hObject    handle to example (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global currentExample;
examplesList = updateExamplesList (handles);
currentExample = examplesList{1};
handles.example.set ('Value', currentExample);
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function [examplesList] = updateExamplesList (handles)
examplesList = getExamples ();
popupMenuHandle = findobj(gcbf,'Tag','example');
set(popupMenuHandle,'String', examplesList);

% --- Executes on button press in redraw.
function redraw_Callback(hObject, eventdata, handles)
% hObject    handle to redraw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
drawPlot (handles);

% --- Executes on button press in showSystemForSolving.
function showSystemForSolving_Callback(hObject, eventdata, handles)
% hObject    handle to showSystemForSolving (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
changeShowSystemForSolving (handles);

function setShowSystemForSolving (show, handles)
if (length(show) == 2)
    set (handles.sdu, 'Visible', 'on');
    set (handles.panelPlotter, 'Visible', 'off');
else
    set (handles.sdu, 'Visible', 'off');
    set (handles.panelPlotter, 'Visible', 'on');
end 

function changeShowSystemForSolving (handles)
shown = get(handles.sdu,'Visible');
if (length(shown) == 2)
    set (handles.sdu,'Visible', 'off');
    set (handles.panelPlotter, 'Visible', 'on');
else
    set (handles.sdu,'Visible', 'on');
    set (handles.panelPlotter, 'Visible', 'off');
end

% --- Executes on selection change in popupLineStyle.
function popupLineStyle_Callback(hObject, eventdata, handles)
% hObject    handle to popupLineStyle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global lineStyle;
contents = cellstr(get(hObject,'String'));
lineStyle = contents{get(hObject,'Value')};
% Hints: contents = cellstr(get(hObject,'String')) returns popupLineStyle contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupLineStyle


% --- Executes during object creation, after setting all properties.
function popupLineStyle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupLineStyle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global lineStyle;
pList = getPropertyListFromFile ('Settings/lineStyles.txt');
lineStyle = pList{1};
popupMenuHandle = findobj(gcbf,'Tag','popupLineStyle');
set (popupMenuHandle,'String', pList);
set (popupMenuHandle,'Value', lineStyle);
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupLineColor.
function popupLineColor_Callback(hObject, eventdata, handles)
% hObject    handle to popupLineColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global lineColor;
contents = cellstr(get(hObject,'String'));
lineColor = contents{get(hObject,'Value')};
% Hints: contents = cellstr(get(hObject,'String')) returns popupLineColor contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupLineColor


% --- Executes during object creation, after setting all properties.
function popupLineColor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupLineColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global lineColor;
pList = getPropertyListFromFile ('Settings/colors.txt');
lineColor = pList{1};
popupMenuHandle = findobj(gcbf,'Tag','popupLineColor');
set (popupMenuHandle,'String', pList);
set (popupMenuHandle,'Value', lineColor);
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkboxXiXj.
function checkboxXiXj_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxXiXj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ji;
ji = get(hObject,'Value');

% Hint: get(hObject,'Value') returns toggle state of checkboxXiXj

function Xi_Callback(hObject, eventdata, handles)
% hObject    handle to Xi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Xi;
global systemForSolvingDimension;
num = str2double (get (hObject, 'String'));
if ((num >= 1) && (num <= systemForSolvingDimension))
    Xi = num;
else
    set (hObject, 'String', 'NaN');
end
% Hints: get(hObject,'String') returns contents of Xi as text
%        str2double(get(hObject,'String')) returns contents of Xi as a double


% --- Executes during object creation, after setting all properties.
function Xi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Xi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Xi;
Xi = 1;
set (hObject, 'String', Xi);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Xj_Callback(hObject, eventdata, handles)
% hObject    handle to Xj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Xj;
global systemForSolvingDimension;
num = str2double (get (hObject, 'String'));
if ((num >= 1) && (num <= systemForSolvingDimension))
    Xj = num;
else
    set (hObject, 'String', 'NaN');
    errordlg('Внимание! Ошибка заполнения Xj','OK');
end
% Hints: get(hObject,'String') returns contents of Xj as text
%        str2double(get(hObject,'String')) returns contents of Xj as a double


% --- Executes during object creation, after setting all properties.
function Xj_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Xj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Xj;
Xj = 1;
set (hObject, 'String', Xj);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when entered data in editable cell(s) in sdu.
function sdu_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to sdu (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
global Xi Xj solved;
Xi = 1;
Xj = 1;
if (eventdata.Indices(2) <= 3)
    solved = 0;
end


% -------------------------------------------------------------------
function menuFileManual_Callback(hObject, eventdata, handles)
% hObject    handle to menuFileManual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menuHelpManual_Callback(hObject, eventdata, handles)
% hObject    handle to menuHelpManual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function menuHelp_Callback(hObject, eventdata, handles)
% hObject    handle to menuHelpManual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menuAbout_Callback(hObject, eventdata, handles)
% hObject    handle to menuAbout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
aboutAuthor;

% --------------------------------------------------------------------
function menuExit_Callback(hObject, eventdata, handles)
% hObject    handle to menuExit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
answer = exitQuestion;
if (isequal(answer, 'OK') || isequal(answer, 'Yes'))
    delete (gcf);
end



function left_edge_Callback(hObject, eventdata, handles)
% hObject    handle to left_edge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global solvingTimeBegin;
global solved;
n = str2double (get(hObject, 'String'));
if (n <= 0 || isnan(n))
    errordlg('Error! solvingTimeBegin is incorrect.','OK');
    s = num2str (solvingTimeBegin);
    set (hObject, 'String', s); 
else
    solvingTimeBegin = n;
    solved = 0;
end



function right_edge_Callback(hObject, eventdata, handles)
% hObject    handle to right_edge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global solvingTimeEnd;
global solved;
n = str2double (get(hObject, 'String'));
if (n <= 0 || isnan(n))
    errordlg('Error! solvingTimeEnd is incorrect.','OK');
    s = num2str (solvingTimeEnd);
    set (hObject, 'String', s); 
else
    solvingTimeEnd = n;
    solved = 0;
end



function t_star_Callback(hObject, eventdata, handles)
% hObject    handle to t_star (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global solvingTimeStarred;
global solved;
n = str2double (get(hObject, 'String'));
if (n <= 0 || isnan(n))
    errordlg('Error! solvingTimeStarred is incorrect.','OK');
    ss = num2str (solvingTimeStarred);
    set (hObject, 'String', s); 
else
    solvingTimeStarred = n;
    solved = 0;
end


% --- Executes on selection change in meth_int.
function meth_int_Callback(hObject, eventdata, handles)
% hObject    handle to meth_int (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global solvingInternalMethod solved;
solvingInternalMethod = setMethod (get (hObject, 'Value'));
solved = 0;

% --- Executes on selection change in meth_ext.
function meth_ext_Callback(hObject, eventdata, handles)
% hObject    handle to meth_ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global solvingExternalMethod solved;
solvingExternalMethod = setMethod (get (hObject, 'Value'));
solved = 0;


function eps_int_Callback(hObject, eventdata, handles)
% hObject    handle to eps_int (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global solvingInternalEpsilon solved;
n = str2double(get(hObject,'String'));
if ((n < 0) || isnan(n)) 
    errordlg('Error! solvingInternalEpsilon is incorrect.','OK');
    s = num2str (solvingInternalEpsilon);
    set (hObject, 'String', s); 
else
    solvingInternalEpsilon = n;
    solved = 0;
end
% Hints: get(hObject,'String') returns contents of eps_int as text
%        str2double(get(hObject,'String')) returns contents of eps_int as a double



function eps_ext_Callback(hObject, eventdata, handles)
% hObject    handle to eps_ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global solvingExternalEpsilon solved;
n = str2double(get(hObject,'String'));
if ((n < 0) || isnan(n)) 
    errordlg('Error! solvingExternalEpsilon is incorrect.','OK');
    s = num2str (solvingExternalEpsilon);
    set (hObject, 'String', s); 
else
    solvingExternalEpsilon = n;
    solved = 0;
end



function step_Callback(hObject, eventdata, handles)
% hObject    handle to step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global solvingStep solved;
n = str2double(get(hObject,'String'));
if isnan(n)
    errordlg('Error! solvingStep is incorrect.','OK');
    s = num2str (solvingStep);
    set (hObject, 'String', s); 
else
    solvingStep = n;
    solved = 0;
end



function Iter_num_Callback(hObject, eventdata, handles)
% hObject    handle to Iter_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global solvingIterationCount solved;
n = str2double(get(hObject,'String'));
if ((isnan (n)) || (n <= 0) || (floor(n) < n))
    errordlg('Error! solvingIterationCount is incorrect.','OK');
    s = num2str (solvingIterationCount);
    set (hObject, 'String', s); 
else
    solvingIterationCount = n;
    solved = 0;
end

% --------------------------------------------------------------------
function menuSave_Callback(hObject, eventdata, handles)
% hObject    handle to menuSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fieldRecord = {'sys_dim','left_edge','right_edge','step','t_star',...
               'eps_int','eps_ext','Iter_num','meth_int','meth_ext','sdu'};
saveStructure.fieldRecord = fieldRecord;
for i=1:length(fieldRecord)-1
    property(i).Value = get(getfield(handles,fieldRecord{i}),'Value');
    property(i).Enable = get(getfield(handles,fieldRecord{i}),'Enable');
    property(i).String = get(getfield(handles,fieldRecord{i}),'String');
    property(i).Visible = get(getfield(handles,fieldRecord{i}),'Visible');
end
property(length(fieldRecord)).Data = get(getfield(handles,fieldRecord{end}),'Data');
property(length(fieldRecord)).Enable = get(getfield(handles,fieldRecord{end}),'Enable');
property(length(fieldRecord)).Visible = get(getfield(handles,fieldRecord{end}),'Visible');
saveStructure.property = property;
examplesList = getExamples ();
listSize = size(examplesList);
listSize = listSize(2);
defaultName = strcat ('Examples/example', num2str(listSize + 1));
filename = uiputfile('Examples/*.mat','Save example', defaultName);
filename = strcat ('Examples/', filename);
fid = fopen(filename,'w');
fclose (fid);
save(filename,'saveStructure');
updateExamplesList (handles);
