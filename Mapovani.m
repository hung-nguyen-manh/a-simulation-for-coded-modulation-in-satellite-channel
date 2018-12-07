function varargout = Mapovani(varargin)
% MAPOVANI M-file for Mapovani.fig
%      MAPOVANI, by itself, creates a new MAPOVANI or raises the existing
%      singleton*.
%
%      H = MAPOVANI returns the handle to a new MAPOVANI or the handle to
%      the existing singleton*.
%
%      MAPOVANI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAPOVANI.M with the given input arguments.
%
%      MAPOVANI('Property','Value',...) creates a new MAPOVANI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Mapovani_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Mapovani_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Mapovani

% Last Modified by GUIDE v2.5 26-Nov-2010 13:26:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Mapovani_OpeningFcn, ...
                   'gui_OutputFcn',  @Mapovani_OutputFcn, ...
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


% --- Executes just before Mapovani is made visible.
function Mapovani_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Mapovani (see VARARGIN)

% Choose default command line output for Mapovani
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global FEC_ramec onmapping
set(handles.popupmenu1,'Value',FEC_ramec);
if onmapping == 1
    set(handles.text3,'Enable','on','String','Prob�hlo');
else
end

% UIWAIT makes Mapovani wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Mapovani_OutputFcn(hObject, eventdata, handles) 
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
close;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global FEC_ramec kodovy_pomer
FEC_ramec=get(handles.popupmenu1,'Value');
kodovy_pomer=1;
msgboxText{1} = 'Zm�nili jste konstela�n� diagram, k�dov� r�mec se mohl zm�nit';
msgbox(msgboxText,'Zm�nili jste konstela�n� diagram, k�dov� r�mec se mohl zm�nit','warn');


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

