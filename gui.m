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

% Last Modified by GUIDE v2.5 20-May-2013 21:43:23

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

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
initExample ('Examples/krai2tela.mat', handles);
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
global systemForSolving p Y solvingTimeStarred;
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

p = external (p0, solvingIterationCount);
Y = solveDifferential (systemForSolvingDimension, solvingTimeBegin, solvingTimeEnd, solvingStep, p);
%iteration complete
cla reset;
hold all;
style = '-';
color = 'r';
width = 1;
m = floor(0.5*(solvingTimeEnd - solvingTimeBegin) / solvingStep);
ji = 0;
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

function sys_dim_Callback(hObject, eventdata, handles)
% hObject    handle to sys_dim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sys_dim as text
%        str2double(get(hObject,'String')) returns contents of sys_dim as a double
global systemForSolvingDimension;
n = str2double (get(hObject, 'String'));
if (n <= 0 || isnan(n))
    errordlg('Error! systemForSolvingDimension is incorrect.','OK');
else
    systemForSolvingDimension = n;
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
