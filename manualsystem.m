function varargout = manualsystem(varargin)
% MANUALSYSTEM M-file for manualsystem.fig
%      MANUALSYSTEM, by itself, creates a new MANUALSYSTEM or raises the existing
%      singleton*.
%
%      H = MANUALSYSTEM returns the handle to a new MANUALSYSTEM or the handle to
%      the existing singleton*.
%
%      MANUALSYSTEM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MANUALSYSTEM.M with the given input arguments.
%
%      MANUALSYSTEM('Property','Value',...) creates a new MANUALSYSTEM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before manualsystem_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to manualsystem_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help manualsystem

% Last Modified by GUIDE v2.5 18-Mar-2011 20:02:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @manualsystem_OpeningFcn, ...
                   'gui_OutputFcn',  @manualsystem_OutputFcn, ...
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


% --- Executes just before manualsystem is made visible.
function manualsystem_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to manualsystem (see VARARGIN)

% Choose default command line output for manualsystem
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes manualsystem wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = manualsystem_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
