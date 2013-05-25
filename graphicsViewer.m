function varargout = graphicsViewer(varargin)
% GRAPHICSVIEWER MATLAB code for graphicsViewer.fig
%      GRAPHICSVIEWER, by itself, creates a new GRAPHICSVIEWER or raises the existing
%      singleton*.
%
%      H = GRAPHICSVIEWER returns the handle to a new GRAPHICSVIEWER or the handle to
%      the existing singleton*.
%
%      GRAPHICSVIEWER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAPHICSVIEWER.M with the given input arguments.
%
%      GRAPHICSVIEWER('Property','Value',...) creates a new GRAPHICSVIEWER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before graphicsViewer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to graphicsViewer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help graphicsViewer

% Last Modified by GUIDE v2.5 26-May-2013 03:34:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @graphicsViewer_OpeningFcn, ...
                   'gui_OutputFcn',  @graphicsViewer_OutputFcn, ...
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


% --- Executes just before graphicsViewer is made visible.
function graphicsViewer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to graphicsViewer (see VARARGIN)

% Choose default command line output for graphicsViewer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set (hObject, 'Name', 'Просмотр графики');
% UIWAIT makes graphicsViewer wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set (handles.axes1, ...
    'Visible', 'off', ...
    'YDir'   , 'reverse');
axis ('image');
axis ('off');
loadGraphics (handles);

function loadGraphics (handles)
global graphicsData;
tempPath = 'Settings/tmp.png';
defaultName = 'Просмотр графики ';
if (graphicsData ~= 0)
    imshow (graphicsData);
    name = defaultName;
    if (strcmp (tempPath,graphicsData) == 0) 
        name = strcat (defaultName, '    (', graphicsData, ')');
    end
    set (handles.figure1, 'Name', name);
elseif (exist (tempPath, 'file'))
    try
        imshow (tempPath);
        set (handles.figure1, 'Name', defaultName);
        graphicsData = tempPath;
    catch
        graphicsData = 0;
    end
end

% --- Outputs from this function are returned to the command line.
function varargout = graphicsViewer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global graphicsData;
filename = uigetfile ('Graphics/*.png', 'Открыть графику');
if (filename == 0)
    return;
end
filename = strcat ('Graphics/', filename);
graphicsData = filename;
loadGraphics (handles);

% --------------------------------------------------------------------
function SaveMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to SaveMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tableList = getAllFiles ('Graphics/');
listSize = size(tableList);
listSize = listSize(2);
defaultName = strcat ('Graphics/graphic', num2str(listSize + 1), '.png');
filename = uiputfile ('Graphics/', 'Сохранить графику', defaultName);
if (filename == 0)
    return;
end
filename = strcat ('Graphics/', filename);
F = getframe(handles.axes1);
image(F.cdata);
axis ('image');
axis ('off');
try
    imwrite(F.cdata, filename);
catch
    filename = strcat (filename, '.png');
    imwrite (F.cdata, filename);
end


% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete (handles.figure1);


% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure_handle = isolate_axes(handles.axes1);
printpreview(figure_handle); % Add the correct print options here
close(figure_handle);