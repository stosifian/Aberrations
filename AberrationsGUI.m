function varargout = AberrationsGUI(varargin)
% ABERRATIONSGUI MATLAB code for AberrationsGUI.fig
%      ABERRATIONSGUI, by itself, creates a new ABERRATIONSGUI or raises the existing
%      singleton*.
%
%      H = ABERRATIONSGUI returns the handle to a new ABERRATIONSGUI or the handle to
%      the existing singleton*.
%
%      ABERRATIONSGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ABERRATIONSGUI.M with the given input arguments.
%
%      ABERRATIONSGUI('Property','Value',...) creates a new ABERRATIONSGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AberrationsGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AberrationsGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AberrationsGUI

% Last Modified by GUIDE v2.5 03-May-2020 15:32:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AberrationsGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @AberrationsGUI_OutputFcn, ...
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






% --- Executes just before AberrationsGUI is made visible.
function AberrationsGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AberrationsGUI (see VARARGIN)
handles.img = 0;

% Choose default command line output for AberrationsGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AberrationsGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AberrationsGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in UploadImage.
function UploadImage_Callback(hObject, eventdata, handles)
% hObject    handle to UploadImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    img_path = get(handles.ImagePath,'String'); 
    
    if isempty(img_path)
      fprintf('Error: Enter Text first\n');
    end
    
    L = get(handles.GridSize,'String'); 
     if isempty(L)
       fprintf('Error: Enter Text first\n');
     end
    L = str2double(L);
     if isnan(L)
       fprintf('Error: Please enter a number\n');
     end
    
    img = imread(img_path);
    img = double(rgb2gray(img));
    img = imresize(img,[512 512]);
    %img(img > 0) = 1;
    %img = padarray(img,[N/4,N/4],0);
    
    handles.img = img;
    
    axes(handles.axes1)
    imagesc(img); colormap gray;
    img1_size = L/2*1e3;     %in units of [mm] (millimeters)
    xticklabels = -img1_size:img1_size/2:img1_size;
    xticks = linspace(1, size(img, 2), numel(xticklabels));
    yticklabels = -xticklabels;
    yticks = xticks;
    xlabel('x  [mm]')
    ylabel('y  [mm]')
    set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)
    set(gca, 'YTick', yticks, 'YTickLabel', yticklabels)
    
    guidata(hObject, handles);
    
    
    


% --- Executes on button press in GenerateAberrations.
function GenerateAberrations_Callback(hObject, eventdata, handles)
% hObject    handle to GenerateAberrations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
     %Get parameters from box entries
     L = get(handles.GridSize,'String'); 
     if isempty(L)
       fprintf('Error: Enter Text first\n');
     end
     L = str2double(L);
     if isnan(L)
         fprintf('Error: Please enter a number\n');
     end
     
     D = get(handles.ApDiameter,'String'); 
     if isempty(D)
       fprintf('Error: Enter Text first\n');
     end
     D = str2double(D);
     if isnan(D)
         fprintf('Error: Please enter a number\n');
     end
     
     wvl = get(handles.Wavelength,'String'); 
     if isempty(wvl)
       fprintf('Error: Enter Text first\n');
     end
     wvl = str2double(wvl);
     if isnan(wvl)
         fprintf('Error: Please enter a number\n');
     end
     
     Dz = get(handles.ImageDistance,'String'); 
     if isempty(Dz)
       fprintf('Error: Enter Text first\n');
     end
     Dz = str2double(Dz);
     if isnan(Dz)
         fprintf('Error: Please enter a number\n');
     end
     
     defocus = get(handles.Defocus,'String'); 
     if isempty(defocus)
       fprintf('Error: Enter Text first\n');
     end
     defocus = str2double(defocus);
     if isnan(defocus)
         fprintf('Error: Please enter a number\n');
     end
     
     ast = get(handles.Astigmatism,'String'); 
     if isempty(ast)
       fprintf('Error: Enter Text first\n');
     end
     ast = str2double(ast);
     if isnan(ast)
         fprintf('Error: Please enter a number\n');
     end
     
     coma = get(handles.Coma,'String'); 
     if isempty(coma)
       fprintf('Error: Enter Text first\n');
     end
     coma = str2double(coma);
     if isnan(coma)
         fprintf('Error: Please enter a number\n');
     end
     
     sph = get(handles.Spherical,'String'); 
     if isempty(sph)
       fprintf('Error: Enter Text first\n');
     end
     sph = str2double(sph);
     if isnan(sph)
         fprintf('Error: Please enter a number\n');
     end
     
     img = handles.img;
     [aberrated_img, u, v] = aberrate(L,D,wvl,Dz,defocus,ast,coma,sph,img);
     axes(handles.axes2)
     imagesc(aberrated_img);  colormap gray;
     img_size = max(max(u))*1e3;     %in units of [mm] (millimeters)
     xticklabels = -img_size:img_size/2:img_size;
     xticks = linspace(1, size(u, 2), numel(xticklabels));
     yticklabels = -xticklabels;
     yticks = xticks;
     xlabel('x  [mm]')
     ylabel('y  [mm]')
     set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)
     set(gca, 'YTick', yticks, 'YTickLabel', yticklabels)
     guidata(hObject, handles);
     

function GridSize_Callback(hObject, eventdata, handles)
% hObject    handle to GridSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GridSize as text
%        str2double(get(hObject,'String')) returns contents of GridSize as a double


% --- Executes during object creation, after setting all properties.
function GridSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GridSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ApDiameter_Callback(hObject, eventdata, handles)
% hObject    handle to ApDiameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ApDiameter as text
%        str2double(get(hObject,'String')) returns contents of ApDiameter as a double


% --- Executes during object creation, after setting all properties.
function ApDiameter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ApDiameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Wavelength_Callback(hObject, eventdata, handles)
% hObject    handle to Wavelength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wavelength as text
%        str2double(get(hObject,'String')) returns contents of Wavelength as a double


% --- Executes during object creation, after setting all properties.
function Wavelength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wavelength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ImageDistance_Callback(hObject, eventdata, handles)
% hObject    handle to ImageDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ImageDistance as text
%        str2double(get(hObject,'String')) returns contents of ImageDistance as a double


% --- Executes during object creation, after setting all properties.
function ImageDistance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ImageDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Defocus_Callback(hObject, eventdata, handles)
% hObject    handle to Defocus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Defocus as text
%        str2double(get(hObject,'String')) returns contents of Defocus as a double


% --- Executes during object creation, after setting all properties.
function Defocus_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Defocus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Astigmatism_Callback(hObject, eventdata, handles)
% hObject    handle to Astigmatism (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Astigmatism as text
%        str2double(get(hObject,'String')) returns contents of Astigmatism as a double


% --- Executes during object creation, after setting all properties.
function Astigmatism_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Astigmatism (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Coma_Callback(hObject, eventdata, handles)
% hObject    handle to Coma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Coma as text
%        str2double(get(hObject,'String')) returns contents of Coma as a double


% --- Executes during object creation, after setting all properties.
function Coma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Coma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Spherical_Callback(hObject, eventdata, handles)
% hObject    handle to Spherical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Spherical as text
%        str2double(get(hObject,'String')) returns contents of Spherical as a double


% --- Executes during object creation, after setting all properties.
function Spherical_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Spherical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ImagePath_Callback(hObject, eventdata, handles)
% hObject    handle to ImagePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ImagePath as text
%        str2double(get(hObject,'String')) returns contents of ImagePath as a double


% --- Executes during object creation, after setting all properties.
function ImagePath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ImagePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
