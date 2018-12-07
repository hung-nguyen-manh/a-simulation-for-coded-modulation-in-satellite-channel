function varargout = FEC_kodovani(varargin)
% Last Modified by GUIDE v2.5 01-Feb-2011 14:29:56
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FEC_kodovani_OpeningFcn, ...
                   'gui_OutputFcn',  @FEC_kodovani_OutputFcn, ...
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


% --- Executes just before FEC_kodovani is made visible.
function FEC_kodovani_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% Choose default command line output for FEC_kodovani
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
global FEC_ramec delka_ramce kodovy_pomer onbch onldpc onprokladani

dlouhy_ramec = {'1/4','1/3','2/5','1/2','3/5','2/3','3/4','4/5','5/6','8/9','9/10'};
kratky_ramec = {'1/4','1/3','2/5','1/2','3/5','2/3','3/4','4/5','5/6','8/9'};
dlouhy_ramecQPSK = {'1/4','1/3','2/5','1/2','3/5','2/3','3/4','4/5','5/6','8/9','9/10'};
dlouhy_ramec8PSK = {'3/5','2/3','3/4','5/6','8/9','9/10'};
dlouhy_ramec16APSK = {'2/3','3/4','4/5','5/6','8/9','9/10'};
dlouhy_ramec32APSK = {'3/4','4/5','5/6','8/9','9/10'};
kratky_ramecQPSK = {'1/4','1/3','2/5','1/2','3/5','2/3','3/4','4/5','5/6','8/9'};
kratky_ramec8PSK = {'3/5','2/3','3/4','5/6','8/9'};
kratky_ramec16APSK = {'2/3','3/4','4/5','5/6','8/9'};
kratky_ramec32APSK = {'3/4','4/5','5/6','8/9'};

set(handles.popupmenu1,'Value',delka_ramce);
set(handles.popupmenu2,'Value',kodovy_pomer);

if FEC_ramec==1
    %set(handles.popupmenu2,'Value',1);
    if delka_ramce ==1
        set(handles.popupmenu2,'String',dlouhy_ramecQPSK);
    else
        set(handles.popupmenu2,'String',kratky_ramecQPSK);
    end
end
if FEC_ramec==2
    if delka_ramce ==1
        set(handles.popupmenu2,'String',dlouhy_ramec8PSK);
    else
        set(handles.popupmenu2,'String',kratky_ramec8PSK);
    end
end
if FEC_ramec==3
    if delka_ramce ==1
        set(handles.popupmenu2,'String',dlouhy_ramec16APSK);
    else
        set(handles.popupmenu2,'String',kratky_ramec16APSK);
    end
end
if FEC_ramec==4
    if delka_ramce ==1
        set(handles.popupmenu2,'String',dlouhy_ramec32APSK);
    else
        set(handles.popupmenu2,'String',kratky_ramec32APSK);
    end
end

if onbch == 1
    set(handles.text4,'Enable','on','String','Prob�hlo');
else
end
if onldpc == 1
    set(handles.text5,'Enable','on','String','Prob�hlo');
else
end
if onprokladani == 1
    set(handles.text6,'Enable','on','String','Prob�hlo');
else
end


function varargout = FEC_kodovani_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to Zav��t okno FEC (see GCBO)
close;

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to Vyber d�lku r�mce (see GCBO)
global FEC_ramec delka_ramce dlouhy_ramecQPSK dlouhy_ramec8PSK dlouhy_ramec16APSK dlouhy_ramec32APSK

dlouhy_ramec = {'1/4','1/3','2/5','1/2','3/5','2/3','3/4','4/5','5/6','8/9','9/10'};
kratky_ramec = {'1/4','1/3','2/5','1/2','3/5','2/3','3/4','4/5','5/6','8/9'};
dlouhy_ramecQPSK = {'1/4','1/3','2/5','1/2','3/5','2/3','3/4','4/5','5/6','8/9','9/10'};
dlouhy_ramec8PSK = {'3/5','2/3','3/4','5/6','8/9','9/10'};
dlouhy_ramec16APSK = {'2/3','3/4','4/5','5/6','8/9','9/10'};
dlouhy_ramec32APSK = {'3/4','4/5','5/6','8/9','9/10'};
kratky_ramecQPSK = {'1/4','1/3','2/5','1/2','3/5','2/3','3/4','4/5','5/6','8/9'};
kratky_ramec8PSK = {'3/5','2/3','3/4','5/6','8/9'};
kratky_ramec16APSK = {'2/3','3/4','4/5','5/6','8/9'};
kratky_ramec32APSK = {'3/4','4/5','5/6','8/9'};

switch get(handles.popupmenu1,'Value')
     case 1
         if FEC_ramec==1
            set(handles.popupmenu2,'Value',1);
            set(handles.popupmenu2,'String',dlouhy_ramecQPSK);
         end
         if FEC_ramec==2
            set(handles.popupmenu2,'Value',1);
            set(handles.popupmenu2,'String',dlouhy_ramec8PSK);
         end
         if FEC_ramec==3
            set(handles.popupmenu2,'Value',1);
            set(handles.popupmenu2,'String',dlouhy_ramec16APSK);
         end
         if FEC_ramec==4
            set(handles.popupmenu2,'Value',1);
            set(handles.popupmenu2,'String',dlouhy_ramec32APSK);
         end
         
    case 2
         if FEC_ramec==1
            set(handles.popupmenu2,'Value',1);
            set(handles.popupmenu2,'String',kratky_ramecQPSK);
         end
         if FEC_ramec==2
            set(handles.popupmenu2,'Value',1);
            set(handles.popupmenu2,'String',kratky_ramec8PSK);
         end
         if FEC_ramec==3
            set(handles.popupmenu2,'Value',1);
            set(handles.popupmenu2,'String',kratky_ramec16APSK);
         end
         if FEC_ramec==4
            set(handles.popupmenu2,'Value',1);
            set(handles.popupmenu2,'String',kratky_ramec32APSK);
         end
    otherwise
end
delka_ramce=get(handles.popupmenu1,'Value');


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to Vyber k�dov� pom�r (see GCBO)
global kodovy_pomer kodovypomer2
kodovy_pomer=get(handles.popupmenu2,'Value');
kodovypomer2=get(handles.popupmenu2,'String');



% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end