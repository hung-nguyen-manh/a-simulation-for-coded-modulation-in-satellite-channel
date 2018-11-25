function varargout = DVB_S2_main(varargin)
% Last Modified by GUIDE v2.5 26-Apr-2011 20:40:52
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DVB_S2_main_OpeningFcn, ...
                   'gui_OutputFcn',  @DVB_S2_main_OutputFcn, ...
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

% --- Executes just before DVB_S2_main is made visible.
function DVB_S2_main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
%--------------------------------------------------------------------------
global FEC_ramec kodovy_pomer delka_ramce SNRdb kodovypomer2 praveprobiha mereni simulacesbch prokladanion

% Nastaveni globalnich promennych a parametru
prokladanion = 1;
simulacesbch = 0;
FEC_ramec=1;
kodovy_pomer=1;
delka_ramce=1;
SNRdb = 10;
kodovypomer2 = {'1/4','1/3','2/5','1/2','3/5','2/3','3/4','4/5','5/6','8/9','9/10'}';
praveprobiha = 'Program';
axes(handles.axes1)
[x,y]=imread('povrch2.jpg','jpg'); %pri spusteni programu nacte na pozadi obrazek
imshow(x),colormap(y),axis off, hold on
mereni = 0;

% --- Outputs from this function are returned to the command line.
function varargout = DVB_S2_main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to Obrázek (see GCBO)
  global radio1 radio2 radio3 %nastaveni globalnich promennych
  set(handles.radiobutton1,'value',1); %nastaveni radiobutton na hodnotu 1
  set(handles.radiobutton2,'value',0);
  set(handles.pushbutton3,'enable','on');
  set(handles.pushbutton4,'enable','on');
  set(handles.pushbutton7,'enable','on');
  set(handles.pushbutton8,'enable','on');%povoleni pushbuttonu
  set(handles.text3,'string','Obrázek'); %vypis - vstupniho parametru
  set(handles.text4,'visible','on');
  set(handles.text5,'visible','on');
  set(handles.text9,'visible','on');
  set(handles.text10,'visible','on');
  set(handles.text11,'visible','on');
  set(handles.text12,'visible','on');
  set(handles.text13,'visible','on');
  set(handles.text19,'visible','on');
  set(handles.text23,'visible','on');
  set(handles.text24,'visible','on');
  set(handles.text25,'visible','on');
  set(handles.text27,'visible','on');
  set(handles.text40,'visible','on');
  set(handles.checkbox1,'enable','on');
  radio1 = 1; %nastaveni globalnich promennych
  radio2 = 0;
  radio3 = 0;

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to Náhodná data (see GCBO)

  global radio1 radio2 radio3
  set(handles.radiobutton1,'value',0);
  set(handles.radiobutton2,'value',1);
  set(handles.pushbutton3,'enable','on');
  set(handles.pushbutton4,'enable','on');
  set(handles.pushbutton7,'enable','on');
  set(handles.pushbutton8,'enable','on');
  set(handles.text3,'string','Náhodná data');
  set(handles.text4,'visible','on');
  set(handles.text5,'visible','on');
  set(handles.text9,'visible','on');
  set(handles.text10,'visible','on');
  set(handles.text11,'visible','on');
  set(handles.text12,'visible','on');
  set(handles.text13,'visible','on');
  set(handles.text19,'visible','on');
  set(handles.text23,'visible','on');
  set(handles.text24,'visible','on');
  set(handles.text25,'visible','on');
  set(handles.text27,'visible','on');
  set(handles.text40,'visible','on');
  set(handles.checkbox1,'enable','on');
  radio1 = 0;
  radio2 = 1;
  radio3 = 0;
 


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to Mode adaptation (see GCBO)

Mode_adaptation;



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to Stream adaptation (see GCBO)

Stream_adaptation;


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to FEC kódování (see GCBO)
set(handles.text4,'Visible','off');
FEC_kodovani; 

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to Mapování (see GCBO)
set(handles.text5,'Visible','off');
Mapovani;

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to PL framing (see GCBO)

PL_framing;

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to Modulátor (see GCBO)

Modulator;

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to Awgn kanál (see GCBO)
set(handles.text12,'Visible','off');
Awgn_kanal;
mazani

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)



% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)



% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Zavøít (see GCBO)
close all; %zavreni vsech oken

% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to O programu (see GCBO)
O_programu;


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to Reálný datový tok (see GCBO)



% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, ~, handles)
% hObject    handle to Zmìnit obrázek (see GCBO)



% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to nastaveni do parametru v panelu nastaveni (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global delka_ramce kodovy_pomer FEC_ramec SNRdb kodovypomer dlouhy_ramecQPSK dlouhy_ramec8PSK
global dlouhy_ramec16APSK dlouhy_ramec32APSK simulacesbch delkaramceldpc celkemdat limramec delkaramcebch
global shlukbitramec shlukbit prokladanion 

% Pokud jsou provedeny zmeny v programu, zde jsou aktivovany vypisy do
% graficke casti programu
if simulacesbch == 0
    set(handles.text40,'String','bez BCH kódování');
else
    set(handles.text40,'String','s BCH kódováním');
end


if delka_ramce==1
    shlukbitramec = 64800;
    set(handles.text9,'String','64 800 bitù');
end
if delka_ramce==2
    shlukbitramec = 16200;
    set(handles.text9,'String','16 200 bitù');
end

if FEC_ramec==1
    kodovypomer = dlouhy_ramecQPSK';
    shlukbit = 2;
    if kodovy_pomer==1
        set(handles.text10,'String','1/4');
    end
    if kodovy_pomer==2
        set(handles.text10,'String','1/3');
    end
    if kodovy_pomer==3
        set(handles.text10,'String','2/5');
    end
    if kodovy_pomer==4
        set(handles.text10,'String','1/2');
    end
    if kodovy_pomer==5
        set(handles.text10,'String','3/5');
    end
    if kodovy_pomer==6
        set(handles.text10,'String','2/3');
    end
    if kodovy_pomer==7
        set(handles.text10,'String','3/4');
    end
    if kodovy_pomer==8
        set(handles.text10,'String','4/5');
    end
    if kodovy_pomer==9
        set(handles.text10,'String','5/6');
    end
    if kodovy_pomer==10
        set(handles.text10,'String','8/9');
    end
    if kodovy_pomer==11
        set(handles.text10,'String','9/10');
    end
end

if FEC_ramec==2
    shlukbit = 3;
    kodovypomer = dlouhy_ramec8PSK';
    if kodovy_pomer==1
        set(handles.text10,'String','3/5');
    end
    if kodovy_pomer==2
        set(handles.text10,'String','2/3');
    end
    if kodovy_pomer==3
        set(handles.text10,'String','3/4');
    end
    if kodovy_pomer==4
        set(handles.text10,'String','5/6');
    end
    if kodovy_pomer==5
        set(handles.text10,'String','8/9');
    end
    if kodovy_pomer==6
        set(handles.text10,'String','9/10');
    end
end
if FEC_ramec==3
    shlukbit = 4;
    kodovypomer = dlouhy_ramec16APSK';
    if kodovy_pomer==1
        set(handles.text10,'String','2/3');
    end
    if kodovy_pomer==2
        set(handles.text10,'String','3/4');
    end
    if kodovy_pomer==3
        set(handles.text10,'String','4/5');
    end
    if kodovy_pomer==4
        set(handles.text10,'String','5/6');
    end
    if kodovy_pomer==5
        set(handles.text10,'String','8/9');
    end
    if kodovy_pomer==6
        set(handles.text10,'String','9/10');
    end
end
if FEC_ramec==4
    shlukbit = 5;
    kodovypomer = dlouhy_ramec32APSK';
    if kodovy_pomer==1
        set(handles.text10,'String','3/4');
    end
    if kodovy_pomer==2
        set(handles.text10,'String','4/5');
    end
    if kodovy_pomer==3
        set(handles.text10,'String','5/6');
    end
    if kodovy_pomer==4
        set(handles.text10,'String','8/9');
    end
    if kodovy_pomer==5
        set(handles.text10,'String','9/10');
    end
end

if FEC_ramec==1
    limramec = 2;
    set(handles.text11,'String','QPSK');
end
if FEC_ramec==2
    limramec = 2;
    set(handles.text11,'String','8PSK');
end
if FEC_ramec==3
    limramec = 5;
    set(handles.text11,'String','16APSK');
end
if FEC_ramec==4
    limramec = 7;
    set(handles.text11,'String','32APSK');
end
set(handles.text13,'String',SNRdb);
set(handles.text25,'String',delkaramcebch);
set(handles.text24,'String',delkaramceldpc);

if prokladanion == 1
    set(handles.text23,'String','ano, QPSK ne');
else
    set(handles.text23,'String','ne');
end

set(handles.text27,'String',celkemdat);    





% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global NONXFECFRAME PLFRAME awgnkanal DemPLHeader radio1 mereni
global nonxfecframe noplframe noawgnkanal2 nodemplheader 
global onbbheader onscrambling onprokladani BERpostFEC BERkanal
global snrmin snrmax snrkrok 

% Tlacitko simulace
% Program zavisi na zaskrtnuti funkce krokovani
if mereni == 1 % Funkce krokovani, periodicke mereni
    set(handles.text4,'Visible','off');
    set(handles.text5,'Visible','off');
    set(handles.text12,'Visible','off');
    set(handles.pushbutton1,'Enable','off');
    set(handles.pushbutton2,'Enable','off');
    set(handles.uipanel5,'Visible','off');
    set(handles.uipanel7,'Visible','off');
    set(handles.uipanel8,'Visible','off');
    set(handles.uipanel9,'Visible','off');
    set(handles.pushbutton5,'Enable','off');
    set(handles.pushbutton7,'Enable','off');
    set(handles.pushbutton6,'Enable','off');
    set(handles.text29,'Strin','-');
    set(handles.text32,'String','-');
    set(handles.Untitled_8,'Enable','off');
    set(handles.Untitled_10,'Enable','off');
    % Osetreni proti chybam pri vlozeni
    SNRkrok=get(handles.edit1,'String');
    snrkrok = str2num(SNRkrok);
    if isempty(snrkrok)
        msgboxText{1} = ('Zádavejte pouze èísla kroku v dB');
        msgbox(msgboxText,'Chybný formát hodnoty kroku','error');
    elseif snrkrok < 0 || snrkrok > 100
        msgboxText{1} = ('Hodnota kroku musí být v rozmezí 1 až 100');
        msgbox(msgboxText,'Hodnota mimo rozmezí','warn');
    elseif snrkrok > 0 || snrkrok < 100
    end
    SNRmin=get(handles.edit2,'String');
    snrmin = str2num(SNRmin);
    if isempty(snrmin)
        msgboxText{1} = ('Zádavejte pouze èísla SNRmin v dB');
        msgbox(msgboxText,'Chybný formát hodnoty SNRmin','error');
    elseif snrmin < 0 || snrmin > 100
        msgboxText{1} = ('Hodnota SNRmin musí být v rozmezí 1 až 100');
        msgbox(msgboxText,'Hodnota mimo rozmezí','warn');
    elseif snrmin > 0 || snrmin < 100
    end
    
    SNRmax=get(handles.edit3,'String');
    snrmax = str2num(SNRmax);
    if isempty(snrmax)
        msgboxText{1} = ('Zádavejte pouze èísla SNRmax v dB');
        msgbox(msgboxText,'Chybný formát hodnoty SNRmax','error');
    elseif snrmax < 0 || snrmax > 100
        msgboxText{1} = ('Hodnota SNRmax musí být v rozmezí 1 až 100');
        msgbox(msgboxText,'Hodnota mimo rozmezí','warn');
    elseif snrmax > 0 || snrmax < 100
    end
    Simulace
else
    
Simulace

set(handles.text4,'Visible','off');
set(handles.text5,'Visible','off');
set(handles.text12,'Visible','off');
% Aktivace informace o provedeni podprogramu
if onbbheader == 1
    set(handles.pushbutton1,'Enable','on');
else
end

if onscrambling == 1
    set(handles.pushbutton2,'Enable','on');
else
end

if onprokladani == 1
    set(handles.pushbutton3,'Enable','on');
else
end
% vykresleni konstelacnich diagramu
if nonxfecframe == 1
    set(handles.uipanel5,'Visible','on');
    axes(handles.axes5)
    plot(NONXFECFRAME(1,:),'.');
    xlim([-2 2]); 
    ylim([-2 2]);  
else
end
if noplframe == 1
    set(handles.uipanel7,'Visible','on');
    axes(handles.axes6)
    plot(PLFRAME(1,:),'.');
    xlim([-2 2]); 
    ylim([-2 2]); 
    set(handles.pushbutton5,'Enable','on');
else
end
if noawgnkanal2 == 1
    set(handles.uipanel8,'Visible','on');
    set(handles.pushbutton7,'Enable','on');
    axes(handles.axes7)
    plot(awgnkanal(1,:),'.');
    xlim([-2 2]); 
    ylim([-2 2]); 
else
end
if nodemplheader == 1
    set(handles.uipanel9,'Visible','on');
    axes(handles.axes8)
    plot(DemPLHeader(1,:),'.');
    xlim([-2 2]); 
    ylim([-2 2]); 
else
end


set(handles.pushbutton6,'Enable','on');
set(handles.text29,'String',BERpostFEC);
set(handles.text32,'String',BERkanal);
%set(handles.pushbutton9,'Enable','on');
set(handles.Untitled_8,'Enable','on');
if radio1 == 1
    set(handles.Untitled_10,'Enable','on');
else
end
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
info


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
info


% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zobrazovac


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
global mereni

% Funkce krokovani

checkbox1 = get(handles.checkbox1,'Value');


if checkbox1 == 1
    set(handles.text13,'Enable','off');
    set(handles.text14,'Enable','off');
    set(handles.text36,'Enable','on');
    set(handles.text37,'Enable','on');
    set(handles.text38,'Enable','on');
    set(handles.edit1,'Enable','on');
    set(handles.edit2,'Enable','on');
    set(handles.edit3,'Enable','on');
    set(handles.pushbutton7,'Enable','off');
    mereni = 1;
    set(handles.uipanel4,'Visible','off');
elseif checkbox1 == 0
    set(handles.text13,'Enable','on');
    set(handles.text14,'Enable','on');
    set(handles.text36,'Enable','off');
    set(handles.text37,'Enable','off');
    set(handles.text38,'Enable','off');
    set(handles.edit1,'Enable','off');
    set(handles.edit2,'Enable','off');
    set(handles.edit3,'Enable','off');
    set(handles.pushbutton7,'Enable','on');
    set(handles.uipanel4,'Visible','on');
    mereni = 0;
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
global snrmin

SNRmin=get(handles.edit1,'String');
snrmin = str2num(SNRmin);
if isempty(snrmin)
    msgboxText{1} = ('Zádavejte pouze èísla');
    msgbox(msgboxText,'Chybný formát pole','error');
elseif snrmin < 0 || snrmin > 100
    msgboxText{1} = ('Hodnota SNR musí být v rozmezí 0 až 100');
    msgbox(msgboxText,'Hodnota mimo rozmezí','warn');
elseif snrmin > 0 || snrmin < 100

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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_12_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nastaveni
