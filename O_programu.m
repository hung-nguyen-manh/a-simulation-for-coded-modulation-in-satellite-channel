function varargout = O_programu(varargin)
% O_PROGRAMU M-file for O_programu.fig
%      O_PROGRAMU, by itself, creates a new O_PROGRAMU or raises the existing
%      singleton*.
%
%      H = O_PROGRAMU returns the handle to a new O_PROGRAMU or the handle to
%      the existing singleton*.
%
%      O_PROGRAMU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in O_PROGRAMU.M with the given input arguments.
%
%      O_PROGRAMU('Property','Value',...) creates a new O_PROGRAMU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before O_programu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to O_programu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help O_programu

% Last Modified by GUIDE v2.5 03-Nov-2010 18:07:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @O_programu_OpeningFcn, ...
                   'gui_OutputFcn',  @O_programu_OutputFcn, ...
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


% --- Executes just before O_programu is made visible.
function O_programu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to O_programu (see VARARGIN)

% Choose default command line output for O_programu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes O_programu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = O_programu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
