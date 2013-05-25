function varargout = tableResult(varargin)
% TABLERESULT MATLAB code for tableResult.fig
%      TABLERESULT, by itself, creates a new TABLERESULT or raises the existing
%      singleton*.
%
%      H = TABLERESULT returns the handle to a new TABLERESULT or the handle to
%      the existing singleton*.
%
%      TABLERESULT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TABLERESULT.M with the given input arguments.
%
%      TABLERESULT('Property','Value',...) creates a new TABLERESULT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tableResult_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tableResult_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tableResult

% Last Modified by GUIDE v2.5 25-May-2013 22:23:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tableResult_OpeningFcn, ...
                   'gui_OutputFcn',  @tableResult_OutputFcn, ...
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


% --- Executes just before tableResult is made visible.
function tableResult_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tableResult (see VARARGIN)

% Choose default command line output for tableResult
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set (hObject, 'Name', 'Таблица результатов');
% UIWAIT makes tableResult wait for user response (see UIRESUME)
% uiwait(handles.figure1);
loadData (handles);

function loadData (handles)
global dataInTable;
global rows;
global columns;
set (handles.table, 'Data', dataInTable);
tableSize = size(dataInTable);
rows = tableSize (1);
columns = tableSize (2);
set (handles.edit1, 'String', num2str (rows));
set (handles.edit2, 'String', num2str (columns));
arrayEditable = true(1, columns);
set (handles.table, 'ColumnEditable', arrayEditable);

% --- Outputs from this function are returned to the command line.
function varargout = tableResult_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
delete(hObject);

% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dataInTable;
filename = uigetfile ('Tables/*mat', 'Открыть таблицу');
filename = strcat ('Tables/', filename);
load (filename);
loadData (handles);

% --------------------------------------------------------------------
function SaveMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to SaveMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dataInTable;
tableList = getAllFiles ('Tables/');
listSize = size(tableList);
listSize = listSize(2);
defaultName = strcat ('Tables/table', num2str(listSize + 1));
filename = uiputfile('Tables/*.mat','Сохранить таблицу', defaultName);
filename = strcat ('Tables/', filename);
fid = fopen (filename, 'w');
fclose (fid);
save(filename,'dataInTable');

% --------------------------------------------------------------------
function QuitMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to QuitMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rows columns dataInTable;
n = str2double (get (hObject, 'String'));
if ((n < 0) || isnan(n) || (n > floor(n)))
    errorAlert ('Ошибка при заполнении количества строк в таблице!');
else 
    d = dataInTable;
    if (rows > n)
        d = d (1:n,:);
    elseif (rows < n)
        d = cat (n - rows, d, cell (1, columns));  
    end
    dataInTable = d;
    loadData (handles);
end
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global rows columns dataInTable;
n = str2double (get (hObject, 'String'));
if ((n < 0) || isnan(n) || (n > floor(n)))
    errorAlert ('Ошибка при заполнении количества строк в таблице!');
else
    d = dataInTable;
    if (columns > n)
        d = d (:,1:n);
    elseif (columns < n)
        d = horzcat (d, cell (rows, n-columns));
    end
    dataInTable = d;
    loadData (handles);
end


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when entered data in editable cell(s) in table.
function table_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to table (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
global dataInTable;
d = get(hObject,'Data');
d{eventdata.Indices(1),eventdata.Indices(2)} = eventdata.EditData;
dataInTable = d;
loadData (handles);