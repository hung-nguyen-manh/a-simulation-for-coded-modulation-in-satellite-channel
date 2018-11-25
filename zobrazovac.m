function varargout = zobrazovac(varargin)
% ZOBRAZOVAC M-file for zobrazovac.fig
%      ZOBRAZOVAC, by itself, creates a new ZOBRAZOVAC or raises the existing
%      singleton*.
%
%      H = ZOBRAZOVAC returns the handle to a new ZOBRAZOVAC or the handle to
%      the existing singleton*.
%
%      ZOBRAZOVAC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZOBRAZOVAC.M with the given input arguments.
%
%      ZOBRAZOVAC('Property','Value',...) creates a new ZOBRAZOVAC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zobrazovac_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zobrazovac_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zobrazovac

% Last Modified by GUIDE v2.5 18-Mar-2011 20:23:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zobrazovac_OpeningFcn, ...
                   'gui_OutputFcn',  @zobrazovac_OutputFcn, ...
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


% --- Executes just before zobrazovac is made visible.
function zobrazovac_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zobrazovac (see VARARGIN)
global obrazek Image_input BERkanal BERpostFEC

% Choose default command line output for zobrazovac
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


axes(handles.axes1)
imshow(obrazek)

axes(handles.axes2)
imshow(Image_input)

set(handles.text4,'String',BERkanal);
set(handles.text5,'String',BERpostFEC);


% UIWAIT makes zobrazovac wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zobrazovac_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
