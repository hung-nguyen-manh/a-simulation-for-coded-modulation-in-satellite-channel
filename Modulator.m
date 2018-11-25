function varargout = Modulator(varargin)
% MODULATOR M-file for Modulator.fig
%      MODULATOR, by itself, creates a new MODULATOR or raises the existing
%      singleton*.
%
%      H = MODULATOR returns the handle to a new MODULATOR or the handle to
%      the existing singleton*.
%
%      MODULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MODULATOR.M with the given input arguments.
%
%      MODULATOR('Property','Value',...) creates a new MODULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Modulator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Modulator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Modulator

% Last Modified by GUIDE v2.5 19-Dec-2010 21:58:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Modulator_OpeningFcn, ...
                   'gui_OutputFcn',  @Modulator_OutputFcn, ...
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


% --- Executes just before Modulator is made visible.
function Modulator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Modulator (see VARARGIN)

% Choose default command line output for Modulator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global onmodulator
set(handles.text2,'Enable','on','String','Probìhlo');

% --- Outputs from this function are returned to the command line.
function varargout = Modulator_OutputFcn(hObject, eventdata, handles) 
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
