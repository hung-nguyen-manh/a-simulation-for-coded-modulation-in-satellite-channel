function varargout = Stream_adaptation(varargin)
% STREAM_ADAPTATION M-file for Stream_adaptation.fig
%      STREAM_ADAPTATION, by itself, creates a new STREAM_ADAPTATION or raises the existing
%      singleton*.
%
%      H = STREAM_ADAPTATION returns the handle to a new STREAM_ADAPTATION or the handle to
%      the existing singleton*.
%
%      STREAM_ADAPTATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STREAM_ADAPTATION.M with the given input arguments.
%
%      STREAM_ADAPTATION('Property','Value',...) creates a new STREAM_ADAPTATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Stream_adaptation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Stream_adaptation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Stream_adaptation

% Last Modified by GUIDE v2.5 21-Apr-2011 09:24:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Stream_adaptation_OpeningFcn, ...
                   'gui_OutputFcn',  @Stream_adaptation_OutputFcn, ...
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


% --- Executes just before Stream_adaptation is made visible.
function Stream_adaptation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Stream_adaptation (see VARARGIN)

% Choose default command line output for Stream_adaptation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global onpadding onscrambling delkapadding

if onpadding == 1
    set(handles.text19,'Enable','on','String','Prob�hlo');
else
end
if onscrambling == 1
    set(handles.text20,'Enable','on','String','Prob�hlo');
else
end
set(handles.text18,'String',delkapadding);

% UIWAIT makes Stream_adaptation wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = Stream_adaptation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
    delete(hObject);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
