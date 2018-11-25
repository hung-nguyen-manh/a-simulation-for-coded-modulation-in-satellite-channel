function varargout = manaulprogram(varargin)
% MANAULPROGRAM M-file for manaulprogram.fig
%      MANAULPROGRAM, by itself, creates a new MANAULPROGRAM or raises the existing
%      singleton*.
%
%      H = MANAULPROGRAM returns the handle to a new MANAULPROGRAM or the handle to
%      the existing singleton*.
%
%      MANAULPROGRAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MANAULPROGRAM.M with the given input arguments.
%
%      MANAULPROGRAM('Property','Value',...) creates a new MANAULPROGRAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before manaulprogram_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to manaulprogram_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help manaulprogram

% Last Modified by GUIDE v2.5 18-Mar-2011 20:02:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @manaulprogram_OpeningFcn, ...
                   'gui_OutputFcn',  @manaulprogram_OutputFcn, ...
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


% --- Executes just before manaulprogram is made visible.
function manaulprogram_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to manaulprogram (see VARARGIN)

% Choose default command line output for manaulprogram
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes manaulprogram wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = manaulprogram_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
