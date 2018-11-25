function varargout = info(varargin)
% INFO M-file for info.fig
%      INFO, by itself, creates a new INFO or raises the existing
%      singleton*.
%
%      H = INFO returns the handle to a new INFO or the handle to
%      the existing singleton*.
%
%      INFO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INFO.M with the given input arguments.
%
%      INFO('Property','Value',...) creates a new INFO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before info_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to info_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help info

% Last Modified by GUIDE v2.5 12-Apr-2011 09:55:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @info_OpeningFcn, ...
                   'gui_OutputFcn',  @info_OutputFcn, ...
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


% --- Executes just before info is made visible.
function info_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to info (see VARARGIN)

% Choose default command line output for info
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes info wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global  NONXFECFRAME polim IQSCRAMBLEDdem FEC_ramec psk volbazob

volbazob = 1;

if FEC_ramec == 1
    polim = 2;
elseif FEC_ramec == 2
    polim = 2;
elseif FEC_ramec == 3
    polim = 2;
elseif FEC_ramec == 4
    polim = 2;
end

set(handles.radiobutton5,'Value',1);
set(handles.radiobutton6,'Value',0);
set(handles.radiobutton7,'Value',0);

axes(handles.axes2)
    plot(NONXFECFRAME(1,:),'.');
    xlim([-polim polim]); 
    ylim([-polim polim]);

axes(handles.axes3)
    plot(IQSCRAMBLEDdem(1,:),'.');
    xlim([-polim polim]); 
    ylim([-polim polim]); 

axes(handles.axes3)  
if FEC_ramec == 1
    set(handles.checkbox1,'Visible','on');
    set(handles.checkbox2,'Visible','on');
    set(handles.checkbox3,'Visible','on');
    set(handles.checkbox4,'Visible','on');
    line([-polim polim],[0 0],'Color','r','LineWidth',1);
    line([0 0],[polim -polim],'Color','r','LineWidth',1);
elseif FEC_ramec == 2
    if sum(psk(1,:)) == 0
        set(handles.checkbox6,'Enable','off');
    end
    if sum(psk(2,:)) == 0
        set(handles.checkbox7,'Enable','off');
    end
    if sum(psk(3,:)) == 0
        set(handles.checkbox8,'Enable','off');
    end
    if sum(psk(4,:)) == 0
        set(handles.checkbox9,'Enable','off');
    end
    if sum(psk(5,:)) == 0
        set(handles.checkbox10,'Enable','off');
    end
    if sum(psk(6,:)) == 0
        set(handles.checkbox11,'Enable','off');
    end
    if sum(psk(7,:)) == 0
        set(handles.checkbox12,'Enable','off');
    end
    if sum(psk(8,:)) == 0
        set(handles.checkbox13,'Enable','off');
    end
    set(handles.checkbox6,'Visible','on');
    set(handles.checkbox7,'Visible','on');
    set(handles.checkbox8,'Visible','on');
    set(handles.checkbox9,'Visible','on');
    set(handles.checkbox10,'Visible','on');
    set(handles.checkbox11,'Visible','on');
    set(handles.checkbox12,'Visible','on');
    set(handles.checkbox13,'Visible','on');
    line([-polim polim],[-0.824*polim/2 0.824*polim/2],'Color','r','LineWidth',1);
    line([-polim polim],[0.824*polim/2 -0.824*polim/2],'Color','r','LineWidth',1);
    line([0.8284*polim/2 -0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
    line([-0.8284*polim/2 0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
elseif FEC_ramec == 3 || FEC_ramec == 4
    set(handles.uipanel5,'Visible','off');
    set(handles.checkbox14,'Visible','off');
    
end

% --- Outputs from this function are returned to the command line.
function varargout = info_OutputFcn(hObject, eventdata, handles) 
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
  global a
  [filename,pathname] = uiputfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' },'Save Image',...
          'C:\Dokumenty\newfile.jpg') ; % ulozeni anaglyfu, definice mista a nazvu
  if filename == 0 % moznost stlaceni tlacitka storno, ci zruseni, navrat do programu
    return
  else
  end
  imwrite(a,[pathname,filename]);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;

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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global NONXFECFRAME volbazob PLFRAME

predlimedit=get(handles.edit1,'String');
predlimeditxy = str2num(predlimedit);


if isempty(predlimeditxy)
    msgboxText{1} = ('Zádavejte pouze èísla');
    msgbox(msgboxText,'Chybný formát pole','error');
elseif predlimeditxy < 0 || predlimeditxy > 20
    msgboxText{1} = ('Hodnota os musí být v rozmezí 0 až 20');
    msgbox(msgboxText,'Hodnota mimo rozmezí','warn');
elseif predlimeditxy > 0 || predlimeditxy < 20
    predlim = predlimeditxy;
end
if volbazob == 1
    axes(handles.axes2)
    plot(NONXFECFRAME(1,:),'.');
    xlim([-predlim predlim]); 
    ylim([-predlim predlim]);
elseif volbazob ==2
    axes(handles.axes2)
    plot(PLFRAME(1,:),'.');
    xlim([-predlim predlim]); 
    ylim([-predlim predlim]);
elseif volbazob == 3
    axes(handles.axes2)
    plot(NONXFECFRAME(1,:),'.');
    xlim([-predlim predlim]); 
    ylim([-predlim predlim]);
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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global awgnkanal polim FEC_ramec mrizka volbazob IQSCRAMBLEDdem PLFRAME

polimedit=get(handles.edit3,'String');
polimeditxy = str2num(polimedit);
if isempty(polimeditxy)
    msgboxText{1} = ('Zádavejte pouze èísla');
    msgbox(msgboxText,'Chybný formát pole','error');
elseif polimeditxy < 0 || polimeditxy > 20
    msgboxText{1} = ('Hodnota os musí být v rozmezí 0 až 20');
    msgbox(msgboxText,'Hodnota mimo rozmezí','warn');
elseif polimeditxy > 0 || polimeditxy > 20
    polim = polimeditxy;
end
if volbazob == 1
    axes(handles.axes3)
    plot(IQSCRAMBLEDdem(1,:),'.');
    xlim([-polim polim]); 
    ylim([-polim polim]);
elseif volbazob ==2
    axes(handles.axes3)
    plot(awgnkanal(1,:),'.');
    xlim([-polim polim]); 
    ylim([-polim polim]);
elseif volbazob == 3
    axes(handles.axes3)
    plot(PLFRAME(1,:),'.');
    xlim([-polim polim]); 
    ylim([-polim polim]);
end


if FEC_ramec == 1
    if mrizka == 1
    line([-polim polim],[0 0],'Color','r','LineWidth',1);
    line([0 0],[polim -polim],'Color','r','LineWidth',1);
    elseif mrizka == 0
    end
    set(handles.checkbox1,'Value',1);
    set(handles.checkbox2,'Value',1);
    set(handles.checkbox3,'Value',1);
    set(handles.checkbox4,'Value',1);
else FEC_ramec == 2
    if mrizka == 1
    line([-polim polim],[-0.824*polim/2 0.824*polim/2],'Color','r','LineWidth',1);
    line([-polim polim],[0.824*polim/2 -0.824*polim/2],'Color','r','LineWidth',1);
    line([0.8284*polim/2 -0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
    line([-0.8284*polim/2 0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
    elseif mrizka == 0
    end
    set(handles.checkbox6,'Value',1);
    set(handles.checkbox7,'Value',1);
    set(handles.checkbox8,'Value',1);
    set(handles.checkbox9,'Value',1);
    set(handles.checkbox10,'Value',1);
    set(handles.checkbox11,'Value',1);
    set(handles.checkbox12,'Value',1);
    set(handles.checkbox13,'Value',1);
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
global NONXFECFRAME IQSCRAMBLEDdem qpsk polim mrizka
hodnota = get(handles.checkbox1,'Value');
[~, gy]=size(NONXFECFRAME);
a2 = nonzeros(qpsk(1,:))';
[sda sdy] = size(a2);
for wer = 1:sdy
    awgnkanalzob2a(1,wer) = IQSCRAMBLEDdem(1,a2(wer));
end
if hodnota == 0
axes(handles.axes3)
plot(awgnkanalzob2a,'.','Color','white');
xlim([-polim polim])
ylim([-polim polim])
hold on
else
axes(handles.axes3)
plot(awgnkanalzob2a,'.','Color','blue');
xlim([-polim polim])
ylim([-polim polim])
hold on
end

if mrizka == 0
elseif mrizka == 1
    line([-polim polim],[0 0],'Color','r','LineWidth',1);
    line([0 0],[polim -polim],'Color','r','LineWidth',1);
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
global NONXFECFRAME IQSCRAMBLEDdem qpsk polim mrizka
hodnota = get(handles.checkbox2,'Value');
[gt gy]=size(NONXFECFRAME);
c2 = nonzeros(qpsk(3,:))';
[sda sdy] = size(c2);
for wer = 1:sdy
    awgnkanalzob2c(1,wer) = IQSCRAMBLEDdem(1,c2(wer));
end
if hodnota == 0
axes(handles.axes3)
plot(awgnkanalzob2c,'.','Color','white');
xlim([-polim polim])
ylim([-polim polim])
hold on
else
axes(handles.axes3)
plot(awgnkanalzob2c,'.','Color','blue');
xlim([-polim polim])
ylim([-polim polim])
hold on
end
if mrizka == 0
elseif mrizka == 1
    line([-polim polim],[0 0],'Color','r','LineWidth',1);
    line([0 0],[polim -polim],'Color','r','LineWidth',1);
end


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
global NONXFECFRAME IQSCRAMBLEDdem qpsk polim mrizka
hodnota = get(handles.checkbox3,'Value');
[gt gy]=size(NONXFECFRAME);
b2 = nonzeros(qpsk(2,:))';
[sda sdy] = size(b2);
for wer = 1:sdy
    awgnkanalzob2b(1,wer) = IQSCRAMBLEDdem(1,b2(wer));
end
if hodnota == 0
axes(handles.axes3)
plot(awgnkanalzob2b,'.','Color','white');
xlim([-polim polim])
ylim([-polim polim])
hold on
else
axes(handles.axes3)
plot(awgnkanalzob2b,'.','Color','blue');
xlim([-polim polim])
ylim([-polim polim])
hold on
end
if mrizka == 0
elseif mrizka == 1
    line([-polim polim],[0 0],'Color','r','LineWidth',1);
    line([0 0],[polim -polim],'Color','r','LineWidth',1);
end


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
global IQSCRAMBLEDdem qpsk polim mrizka
hodnota = get(handles.checkbox4,'Value');
d2 = nonzeros(qpsk(4,:))';
[sda sdy] = size(d2);
for wer = 1:sdy
    awgnkanalzob2d(1,wer) = IQSCRAMBLEDdem(1,d2(wer));
end
if hodnota == 0
axes(handles.axes3)
plot(awgnkanalzob2d,'.','Color','white');
xlim([-polim polim])
ylim([-polim polim])
hold on
else
axes(handles.axes3)
plot(awgnkanalzob2d,'.','Color','blue');
xlim([-polim polim])
ylim([-polim polim])
hold on
end
if mrizka == 0
elseif mrizka == 1
    line([-polim polim],[0 0],'Color','r','LineWidth',1);
    line([0 0],[polim -polim],'Color','r','LineWidth',1);
end


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA) 
global IQSCRAMBLEDdem polim qpsk FEC_ramec psk mrizka

if FEC_ramec == 1
    axes(handles.axes3)
    plot([1 0],'.','Color','white');
    xlim([-polim polim]); 
    ylim([-polim polim]); 
    line([-polim polim],[0 0],'Color','w','LineWidth',300*polim);
    check1 = get(handles.checkbox1,'Value');
    check2 = get(handles.checkbox2,'Value');
    check3 = get(handles.checkbox3,'Value');
    check4 = get(handles.checkbox4,'Value');
    kontrol = [check1 check2 check3 check4];

    for kresl = 1:4
    x = kontrol(1,kresl);
    if x ~= 0
            if kresl == 1
                x = qpsk(1,:);
            elseif kresl == 2
                x = qpsk(3,:);
            elseif kresl == 3
                x = qpsk(2,:);
            elseif kresl == 4
                x = qpsk(4,:);
            else
            end
        x2 = nonzeros(x)';
        [~, sdy] = size(x2);
        for wer = 1:sdy
            awgnkanalzob2x(1,wer) = IQSCRAMBLEDdem(1,x2(wer));
        end
        axes(handles.axes3)
        plot(awgnkanalzob2x,'.','Color','blue');
        xlim([-polim polim])
        ylim([-polim polim])
        hold on
    end
    end
    
if mrizka == 0
elseif mrizka == 1
    line([-polim polim],[0 0],'Color','r','LineWidth',1);
    line([0 0],[polim -polim],'Color','r','LineWidth',1);
end 


elseif FEC_ramec == 2
    axes(handles.axes3)
    plot([1 0],'.','Color','white');
    xlim([-polim polim]); 
    ylim([-polim polim]); 
    line([-polim polim],[0 0],'Color','w','LineWidth',300*polim);
    check6 = get(handles.checkbox6,'Value');
    check7 = get(handles.checkbox7,'Value');
    check8 = get(handles.checkbox8,'Value');
    check9 = get(handles.checkbox9,'Value');
    check10 = get(handles.checkbox10,'Value');
    check11 = get(handles.checkbox11,'Value');
    check12 = get(handles.checkbox12,'Value');
    check13 = get(handles.checkbox13,'Value');
    kontrol = [check6 check7 check8 check9 check10 check11 check12 check13];
    
    for kresl = 1:8
    x = kontrol(1,kresl);
    if x ~= 0
            if kresl == 1
                x = psk(1,:);
            elseif kresl == 2
                x = psk(2,:);
            elseif kresl == 3
                x = psk(3,:);
            elseif kresl == 4
                x = psk(4,:);
            elseif kresl == 5
                x = psk(5,:);
            elseif kresl == 6
                x = psk(6,:);
            elseif kresl == 7
                x = psk(7,:);
            elseif kresl == 8
                x = psk(8,:);
            else
            end
        x2 = nonzeros(x)';
        [~, sdy] = size(x2);
        for wer = 1:sdy
             awgnkanalzob2x(1,wer) = IQSCRAMBLEDdem(1,x2(wer));
        end
        axes(handles.axes3)
        plot(awgnkanalzob2x,'.','Color','blue');
        xlim([-polim polim])
        ylim([-polim polim])
        hold on
    end
    end
    
if mrizka == 0
elseif mrizka == 1
    line([-polim polim],[-0.824*polim/2 0.824*polim/2],'Color','r','LineWidth',1);
    line([-polim polim],[0.824*polim/2 -0.824*polim/2],'Color','r','LineWidth',1);
    line([0.8284*polim/2 -0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
    line([-0.8284*polim/2 0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);  
end
  
else
end



% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IQSCRAMBLEDdem polim FEC_ramec mrizka psk
    axes(handles.axes3)
    plot(IQSCRAMBLEDdem(1,:),'.','Color','blue');
    xlim([-polim polim]); 
    ylim([-polim polim]); 
    
if FEC_ramec == 1
    axes(handles.axes3)  
    if mrizka == 0
    elseif mrizka == 1
    line([-polim polim],[0 0],'Color','r','LineWidth',1);
    line([0 0],[polim -polim],'Color','r','LineWidth',1);
    end

    set(handles.checkbox1,'Value',1);
    set(handles.checkbox2,'Value',1);
    set(handles.checkbox3,'Value',1);
    set(handles.checkbox4,'Value',1);
elseif FEC_ramec == 2
    set(handles.checkbox6,'Value',1);
    set(handles.checkbox7,'Value',1);
    set(handles.checkbox8,'Value',1);
    set(handles.checkbox9,'Value',1);
    set(handles.checkbox10,'Value',1);
    set(handles.checkbox11,'Value',1);
    set(handles.checkbox12,'Value',1);
    set(handles.checkbox13,'Value',1);
    
    if sum(psk(1,:)) == 0
        set(handles.checkbox6,'Value',0);
    end
    if sum(psk(2,:)) == 0
        set(handles.checkbox7,'Value',0);
    end
    if sum(psk(3,:)) == 0
        set(handles.checkbox8,'Value',0);
    end
    if sum(psk(4,:)) == 0
        set(handles.checkbox9,'Value',0);
    end
    if sum(psk(5,:)) == 0
        set(handles.checkbox10,'Value',0);
    end
    if sum(psk(6,:)) == 0
        set(handles.checkbox11,'Value',0);
    end
    if sum(psk(7,:)) == 0
        set(handles.checkbox12,'Value',0);
    end
    if sum(psk(8,:)) == 0
        set(handles.checkbox13,'Value',0);
    end
    
    if mrizka == 0
    elseif mrizka == 1
    line([-polim polim],[-0.824*polim/2 0.824*polim/2],'Color','r','LineWidth',1);
    line([-polim polim],[0.824*polim/2 -0.824*polim/2],'Color','r','LineWidth',1);
    line([0.8284*polim/2 -0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
    line([-0.8284*polim/2 0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);   
    end

end
    

% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6
global IQSCRAMBLEDdem psk polim mrizka
hodnota = get(handles.checkbox6,'Value');
a82 = nonzeros(psk(1,:))';
[sda sdy] = size(a82);
for wer = 1:sdy
    awgnkanalzob2a8(1,wer) = IQSCRAMBLEDdem(1,a82(wer));
end
if hodnota == 0
axes(handles.axes3)
plot(awgnkanalzob2a8,'.','Color','white');
xlim([-polim polim])
ylim([-polim polim])
hold on
else
axes(handles.axes3)
plot(awgnkanalzob2a8,'.','Color','blue');
xlim([-polim polim])
ylim([-polim polim])
hold on
end
if mrizka == 0
elseif mrizka == 1
    line([-polim polim],[-0.824*polim/2 0.824*polim/2],'Color','r','LineWidth',1);
    line([-polim polim],[0.824*polim/2 -0.824*polim/2],'Color','r','LineWidth',1);
    line([0.8284*polim/2 -0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
    line([-0.8284*polim/2 0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
end

% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7
global IQSCRAMBLEDdem psk polim mrizka

hodnota = get(handles.checkbox7,'Value');
b82 = nonzeros(psk(2,:))';
[sda sdy] = size(b82);
for wer = 1:sdy
    awgnkanalzob2b8(1,wer) = IQSCRAMBLEDdem(1,b82(wer));
end
if hodnota == 0
axes(handles.axes3)
plot(awgnkanalzob2b8,'.','Color','white');
xlim([-polim polim])
ylim([-polim polim])
hold on
else
axes(handles.axes3)
plot(awgnkanalzob2b8,'.','Color','blue');
xlim([-polim polim])
ylim([-polim polim])
hold on
end
if mrizka == 0
elseif mrizka == 1
    line([-polim polim],[-0.824*polim/2 0.824*polim/2],'Color','r','LineWidth',1);
    line([-polim polim],[0.824*polim/2 -0.824*polim/2],'Color','r','LineWidth',1);
    line([0.8284*polim/2 -0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
    line([-0.8284*polim/2 0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
end

% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8
global IQSCRAMBLEDdem psk polim mrizka
hodnota = get(handles.checkbox8,'Value');
c82 = nonzeros(psk(3,:))';
[sda sdy] = size(c82);
for wer = 1:sdy
    awgnkanalzob2c8(1,wer) = IQSCRAMBLEDdem(1,c82(wer));
end
if hodnota == 0
axes(handles.axes3)
plot(awgnkanalzob2c8,'.','Color','white');
xlim([-polim polim])
ylim([-polim polim])
hold on
else
axes(handles.axes3)
plot(awgnkanalzob2c8,'.','Color','blue');
xlim([-polim polim])
ylim([-polim polim])
hold on
end
if mrizka == 0
elseif mrizka == 1
    line([-polim polim],[-0.824*polim/2 0.824*polim/2],'Color','r','LineWidth',1);
    line([-polim polim],[0.824*polim/2 -0.824*polim/2],'Color','r','LineWidth',1);
    line([0.8284*polim/2 -0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
    line([-0.8284*polim/2 0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
end

% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9
global IQSCRAMBLEDdem psk polim mrizka
hodnota = get(handles.checkbox9,'Value');
d82 = nonzeros(psk(4,:))';
[sda sdy] = size(d82);
for wer = 1:sdy
    awgnkanalzob2d8(1,wer) = IQSCRAMBLEDdem(1,d82(wer));
end
if hodnota == 0
axes(handles.axes3)
plot(awgnkanalzob2d8,'.','Color','white');
xlim([-polim polim])
ylim([-polim polim])
hold on
else
axes(handles.axes3)
plot(awgnkanalzob2d8,'.','Color','blue');
xlim([-polim polim])
ylim([-polim polim])
hold on
end
if mrizka == 0
elseif mrizka == 1
    line([-polim polim],[-0.824*polim/2 0.824*polim/2],'Color','r','LineWidth',1);
    line([-polim polim],[0.824*polim/2 -0.824*polim/2],'Color','r','LineWidth',1);
    line([0.8284*polim/2 -0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
    line([-0.8284*polim/2 0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
end

% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10
global IQSCRAMBLEDdem psk polim mrizka
hodnota = get(handles.checkbox10,'Value');
e82 = nonzeros(psk(5,:))';
[sda sdy] = size(e82);
for wer = 1:sdy
    awgnkanalzob2e8(1,wer) = IQSCRAMBLEDdem(1,e82(wer));
end
if hodnota == 0
axes(handles.axes3)
plot(awgnkanalzob2e8,'.','Color','white');
xlim([-polim polim])
ylim([-polim polim])
hold on
else
axes(handles.axes3)
plot(awgnkanalzob2e8,'.','Color','blue');
xlim([-polim polim])
ylim([-polim polim])
hold on
end
if mrizka == 0
elseif mrizka == 1
    line([-polim polim],[-0.824*polim/2 0.824*polim/2],'Color','r','LineWidth',1);
    line([-polim polim],[0.824*polim/2 -0.824*polim/2],'Color','r','LineWidth',1);
    line([0.8284*polim/2 -0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
    line([-0.8284*polim/2 0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
end

% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11
global IQSCRAMBLEDdem psk polim mrizka
hodnota = get(handles.checkbox11,'Value');
f82 = nonzeros(psk(6,:))';
[sda sdy] = size(f82);
for wer = 1:sdy
    awgnkanalzob2f8(1,wer) = IQSCRAMBLEDdem(1,f82(wer));
end
if hodnota == 0
axes(handles.axes3)
plot(awgnkanalzob2f8,'.','Color','white');
xlim([-polim polim])
ylim([-polim polim])
hold on
else
axes(handles.axes3)
plot(awgnkanalzob2f8,'.','Color','blue');
xlim([-polim polim])
ylim([-polim polim])
hold on
end
if mrizka == 0
elseif mrizka == 1
    line([-polim polim],[-0.824*polim/2 0.824*polim/2],'Color','r','LineWidth',1);
    line([-polim polim],[0.824*polim/2 -0.824*polim/2],'Color','r','LineWidth',1);
    line([0.8284*polim/2 -0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
    line([-0.8284*polim/2 0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
end

% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox12
global IQSCRAMBLEDdem psk polim mrizka
hodnota = get(handles.checkbox12,'Value');
g82 = nonzeros(psk(7,:))';
[sda sdy] = size(g82);
for wer = 1:sdy
    awgnkanalzob2g8(1,wer) = IQSCRAMBLEDdem(1,g82(wer));
end
if hodnota == 0
axes(handles.axes3)
plot(awgnkanalzob2g8,'.','Color','white');
xlim([-polim polim])
ylim([-polim polim])
hold on
else
axes(handles.axes3)
plot(awgnkanalzob2g8,'.','Color','blue');
xlim([-polim polim])
ylim([-polim polim])
hold on
end
if mrizka == 0
elseif mrizka == 1
    line([-polim polim],[-0.824*polim/2 0.824*polim/2],'Color','r','LineWidth',1);
    line([-polim polim],[0.824*polim/2 -0.824*polim/2],'Color','r','LineWidth',1);
    line([0.8284*polim/2 -0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
    line([-0.8284*polim/2 0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
end

% --- Executes on button press in checkbox13.
function checkbox13_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox13
global IQSCRAMBLEDdem psk polim mrizka
hodnota = get(handles.checkbox13,'Value');
h82 = nonzeros(psk(8,:))';
[sda sdy] = size(h82);
for wer = 1:sdy
    awgnkanalzob2h8(1,wer) = IQSCRAMBLEDdem(1,h82(wer));
end
if hodnota == 0
axes(handles.axes3)
plot(awgnkanalzob2h8,'.','Color','white');
xlim([-polim polim])
ylim([-polim polim])
hold on
else
axes(handles.axes3)
plot(awgnkanalzob2h8,'.','Color','blue');
xlim([-polim polim])
ylim([-polim polim])
hold on
end
if mrizka == 0
elseif mrizka == 1
    line([-polim polim],[-0.824*polim/2 0.824*polim/2],'Color','r','LineWidth',1);
    line([-polim polim],[0.824*polim/2 -0.824*polim/2],'Color','r','LineWidth',1);
    line([0.8284*polim/2 -0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
    line([-0.8284*polim/2 0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
end



% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox14.
function checkbox14_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox14
global FEC_ramec mrizka polim

mrizka = get(handles.checkbox14,'Value');
if mrizka == 0
    barva = 'w';
elseif mrizka == 1
    barva = 'r';
end
if FEC_ramec == 1
    line([-polim polim],[0 0],'Color',barva,'LineWidth',1);
    line([0 0],[polim -polim],'Color',barva,'LineWidth',1);
elseif FEC_ramec == 2
    line([-polim polim],[-0.824*polim/2 0.824*polim/2],'Color',barva,'LineWidth',1);
    line([-polim polim],[0.824*polim/2 -0.824*polim/2],'Color',barva,'LineWidth',1);
    line([0.8284*polim/2 -0.824*polim/2],[polim -polim],'Color',barva,'LineWidth',1);
    line([-0.8284*polim/2 0.824*polim/2],[polim -polim],'Color',barva,'LineWidth',1);
end


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
global  NONXFECFRAME polim IQSCRAMBLEDdem FEC_ramec psk volbazob
if FEC_ramec == 1
    polim = 2;
elseif FEC_ramec == 2
    polim = 3;
elseif FEC_ramec == 3
    polim = 5;
elseif FEC_ramec == 4
    polim = 7;
end

set(handles.radiobutton5,'Value',1);
set(handles.radiobutton6,'Value',0);
set(handles.radiobutton7,'Value',0);
set(handles.uipanel5,'Visible','off');
set(handles.checkbox14,'Visible','off');
set(handles.text1,'String','XFECFRAME pøed pøenosem');
set(handles.text2,'String','XFECFRAME po pøenosu');
volbazob = 1;

axes(handles.axes2)
    plot(NONXFECFRAME(1,:),'.');
    xlim([-polim polim]); 
    ylim([-polim polim]);

axes(handles.axes3)
    plot(IQSCRAMBLEDdem(1,:),'.');
    xlim([-polim polim]); 
    ylim([-polim polim]); 

axes(handles.axes3)  
if FEC_ramec == 1
    set(handles.checkbox1,'Visible','on');
    set(handles.checkbox2,'Visible','on');
    set(handles.checkbox3,'Visible','on');
    set(handles.checkbox4,'Visible','on');
    line([-polim polim],[0 0],'Color','r','LineWidth',1);
    line([0 0],[polim -polim],'Color','r','LineWidth',1);
    set(handles.uipanel5,'Visible','on');
    set(handles.checkbox14,'Visible','on');
    set(handles.checkbox14,'Value',1);
elseif FEC_ramec == 2
    if sum(psk(1,:)) == 0
        set(handles.checkbox6,'Enable','off');
    end
    if sum(psk(2,:)) == 0
        set(handles.checkbox7,'Enable','off');
    end
    if sum(psk(3,:)) == 0
        set(handles.checkbox8,'Enable','off');
    end
    if sum(psk(4,:)) == 0
        set(handles.checkbox9,'Enable','off');
    end
    if sum(psk(5,:)) == 0
        set(handles.checkbox10,'Enable','off');
    end
    if sum(psk(6,:)) == 0
        set(handles.checkbox11,'Enable','off');
    end
    if sum(psk(7,:)) == 0
        set(handles.checkbox12,'Enable','off');
    end
    if sum(psk(8,:)) == 0
        set(handles.checkbox13,'Enable','off');
    end
    set(handles.checkbox6,'Visible','on');
    set(handles.checkbox7,'Visible','on');
    set(handles.checkbox8,'Visible','on');
    set(handles.checkbox9,'Visible','on');
    set(handles.checkbox10,'Visible','on');
    set(handles.checkbox11,'Visible','on');
    set(handles.checkbox12,'Visible','on');
    set(handles.checkbox13,'Visible','on');
    set(handles.uipanel5,'Visible','on');
    set(handles.checkbox14,'Visible','on');
    set(handles.checkbox14,'Value',1);
    line([-polim polim],[-0.824*polim/2 0.824*polim/2],'Color','r','LineWidth',1);
    line([-polim polim],[0.824*polim/2 -0.824*polim/2],'Color','r','LineWidth',1);
    line([0.8284*polim/2 -0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
    line([-0.8284*polim/2 0.824*polim/2],[polim -polim],'Color','r','LineWidth',1);
end

% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6
global awgnkanal PLFRAME polim FEC_ramec volbazob

if FEC_ramec == 1
    polim = 2;
elseif FEC_ramec == 2
    polim = 3;
elseif FEC_ramec == 3
    polim = 5;
elseif FEC_ramec == 4
    polim = 7;
end

set(handles.radiobutton5,'Value',0);
set(handles.radiobutton6,'Value',1);
set(handles.radiobutton7,'Value',0);
set(handles.uipanel5,'Visible','off');
set(handles.checkbox14,'Visible','off');
set(handles.text1,'String','PLFRAME pøed pøenosem');
set(handles.text2,'String','PLFRAME po pøenosu');

volbazob = 2;
axes(handles.axes2)
    line([-polim polim],[0 0],'Color','w','LineWidth',300*polim);
    plot(PLFRAME(1,:),'.');
    xlim([-polim polim]); 
    ylim([-polim polim]);

axes(handles.axes3)
    line([-polim polim],[0 0],'Color','w','LineWidth',300*polim);
    plot(awgnkanal(1,:),'.');
    xlim([-polim polim]); 
    ylim([-polim polim]); 


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7
global NONXFECFRAME PLFRAME polim FEC_ramec volbazob

if FEC_ramec == 1
    polim = 2;
elseif FEC_ramec == 2
    polim = 3;
elseif FEC_ramec == 3
    polim = 5;
elseif FEC_ramec == 4
    polim = 7;
end

set(handles.radiobutton5,'Value',0);
set(handles.radiobutton6,'Value',0);
set(handles.radiobutton7,'Value',1);
set(handles.uipanel5,'Visible','off');
set(handles.checkbox14,'Visible','off');
set(handles.text1,'String','XFECFRAME pøed pøenosem');
set(handles.text2,'String','PLFRAME pøed pøenosem');
volbazob = 3;
axes(handles.axes2)
    line([-polim polim],[0 0],'Color','w','LineWidth',300*polim);
    plot(NONXFECFRAME(1,:),'.');
    xlim([-polim polim]); 
    ylim([-polim polim]);

axes(handles.axes3)
    line([-polim polim],[0 0],'Color','w','LineWidth',300*polim);
    plot(PLFRAME(1,:),'.');
    xlim([-polim polim]); 
    ylim([-polim polim]); 

