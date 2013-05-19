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

% Last Modified by GUIDE v2.5 19-May-2013 19:57:32

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
compute (


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
    temp = fR{i};
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
set (handles.sdu, 'Data', cell (systemForSolving,4));

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

function left_edge_Callback(hObject, eventdata, handles)
% hObject    handle to left_edge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of left_edge as text
%        str2double(get(hObject,'String')) returns contents of left_edge as a double


% --- Executes during object creation, after setting all properties.
function left_edge_CreateFcn(hObject, eventdata, handles)
% hObject    handle to left_edge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function right_edge_Callback(hObject, eventdata, handles)
% hObject    handle to right_edge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of right_edge as text
%        str2double(get(hObject,'String')) returns contents of right_edge as a double


% --- Executes during object creation, after setting all properties.
function right_edge_CreateFcn(hObject, eventdata, handles)
% hObject    handle to right_edge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function step_Callback(hObject, eventdata, handles)
% hObject    handle to step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of step as text
%        str2double(get(hObject,'String')) returns contents of step as a double


% --- Executes during object creation, after setting all properties.
function step_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t_star_Callback(hObject, eventdata, handles)
% hObject    handle to t_star (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t_star as text
%        str2double(get(hObject,'String')) returns contents of t_star as a double


% --- Executes during object creation, after setting all properties.
function t_star_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_star (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eps_int_Callback(hObject, eventdata, handles)
% hObject    handle to eps_int (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eps_int as text
%        str2double(get(hObject,'String')) returns contents of eps_int as a double


% --- Executes during object creation, after setting all properties.
function eps_int_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eps_int (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eps_ext_Callback(hObject, eventdata, handles)
% hObject    handle to eps_ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eps_ext as text
%        str2double(get(hObject,'String')) returns contents of eps_ext as a double


% --- Executes during object creation, after setting all properties.
function eps_ext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eps_ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Iter_num_Callback(hObject, eventdata, handles)
% hObject    handle to Iter_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Iter_num as text
%        str2double(get(hObject,'String')) returns contents of Iter_num as a double


% --- Executes during object creation, after setting all properties.
function Iter_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Iter_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in meth_int.
function meth_int_Callback(hObject, eventdata, handles)
% hObject    handle to meth_int (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns meth_int contents as cell array
%        contents{get(hObject,'Value')} returns selected item from meth_int


% --- Executes during object creation, after setting all properties.
function meth_int_CreateFcn(hObject, eventdata, handles)
% hObject    handle to meth_int (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in meth_ext.
function meth_ext_Callback(hObject, eventdata, handles)
% hObject    handle to meth_ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns meth_ext contents as cell array
%        contents{get(hObject,'Value')} returns selected item from meth_ext


% --- Executes during object creation, after setting all properties.
function meth_ext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to meth_ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
