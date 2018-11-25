function varargout = nastaveni(varargin)
% NASTAVENI MATLAB code for nastaveni.fig
%      NASTAVENI, by itself, creates a new NASTAVENI or raises the existing
%      singleton*.
%
%      H = NASTAVENI returns the handle to a new NASTAVENI or the handle to
%      the existing singleton*.
%
%      NASTAVENI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NASTAVENI.M with the given input arguments.
%
%      NASTAVENI('Property','Value',...) creates a new NASTAVENI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before nastaveni_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to nastaveni_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help nastaveni

% Last Modified by GUIDE v2.5 14-May-2011 11:00:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @nastaveni_OpeningFcn, ...
                   'gui_OutputFcn',  @nastaveni_OutputFcn, ...
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


% --- Executes just before nastaveni is made visible.
function nastaveni_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to nastaveni (see VARARGIN)

% Choose default command line output for nastaveni
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes nastaveni wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global simulacesbch shlukbitramec shlukbit X MAXglobal MINglobal prokladanion shlukon pomerUPL Nramcu


if prokladanion == 1
    set(handles.radiobutton3,'Value',1);
    set(handles.radiobutton4,'Value',0);
else
    set(handles.radiobutton3,'Value',0);
    set(handles.radiobutton4,'Value',1);
end

% nastaveni

if simulacesbch == 1
    set(handles.radiobutton1,'Value',1);
    set(handles.radiobutton2,'Value',0);
else
    set(handles.radiobutton1,'Value',0);
    set(handles.radiobutton2,'Value',1);
end

% --- Outputs from this function are returned to the command line.
function varargout = nastaveni_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global simulacesbch

set(handles.radiobutton1,'Value',1);
set(handles.radiobutton2,'Value',0);

simulacesbch = 1;

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
global simulacesbch
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',1);

simulacesbch = 0;


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
global prokladanion

prokladanion = 1;
set(handles.radiobutton3,'Value',1);
set(handles.radiobutton4,'Value',0);

% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
global prokladanion

prokladanion = 0;
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton4,'Value',1);


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
