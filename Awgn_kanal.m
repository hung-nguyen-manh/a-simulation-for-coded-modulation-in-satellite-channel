function varargout = Awgn_kanal(varargin)
% Last Modified by GUIDE v2.5 19-Dec-2010 22:00:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Awgn_kanal_OpeningFcn, ...
                   'gui_OutputFcn',  @Awgn_kanal_OutputFcn, ...
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


% --- Executes just before Awgn_kanal is made visible.
function Awgn_kanal_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for Awgn_kanal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global noawgnkanal2

if noawgnkanal2 == 1
    set(handles.text4,'Enable','on','String','Probìhlo');
else
end

% --- Outputs from this function are returned to the command line.
function varargout = Awgn_kanal_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to zavøít (see GCBO)
global SNRdb
if isempty(SNRdb)
    msgboxText{1} = ('Zádavejte pouze èísla');
    msgbox(msgboxText,'Chybný formát pole','error');
elseif SNRdb < 0 || SNRdb > 100
    msgboxText{1} = ('Hodnota SNR musí být v rozmezí 0 až 100');
    msgbox(msgboxText,'Hodnota mimo rozmezí','warn');
elseif SNRdb > 0 || SNRdb < 100
    close;
end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to SNR (see GCBO)



% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SNR (see GCBO)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to Nastav(see GCBO)
global SNRdb
SNR=get(handles.edit1,'String');
SNRdb = str2num(SNR);
if isempty(SNRdb)
    msgboxText{1} = ('Zádavejte pouze èísla');
    msgbox(msgboxText,'Chybný formát pole','error');
elseif SNRdb < 0 || SNRdb > 100
    msgboxText{1} = ('Hodnota SNR musí být v rozmezí 0 až 100');
    msgbox(msgboxText,'Hodnota mimo rozmezí','warn');
end
    
    
    
    
    
    
