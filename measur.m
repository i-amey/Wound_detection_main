%Copyright (c) 2018 Carlo Manzo & Marta Cullell-Dalmau

% Permission is hereby granted, free of charge, to any person obtaining a copy of 
% this software and associated documentation files (the "Software"), to deal in the 
% Software without restriction, including without limitation the rights to use, copy, 
% modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
% and to permit persons to whom the Software is furnished to do so, subject to the 
% following conditions:
%
% The above copyright notice and this permission notice shall be included in all 
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
% INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
% PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
% HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
% CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE 
% OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.




function handles=measur(handles)

%handles.calibr=str2double(get(handles.edit13,'String'));

rp=regionprops(bwlabel(handles.IM_mctfil),handles.IM_mctfil,'Area','Perimeter','ConvexImage','MajorAxisLength', 'MinorAxisLength');
A2=[rp.Area];
if size(A2)<=10
    
    if size(A2)>1
        rp=rp(find(A2==max(A2)));
    end
    handles.area = rp.Area;
    handles.perim = rp.Perimeter;
    handles.circul = (4*handles.area*pi)/(handles.perim^2);
    
    handles.asp_rat = rp.MajorAxisLength/rp.MinorAxisLength;
    
    rp2 = regionprops(rp.ConvexImage,'Perimeter');
    handles.rough = handles.perim/rp2.Perimeter;
    
else
    handles.area = NaN;
    handles.perim = NaN;
    handles.circul = NaN;
    handles.asp_rat = NaN;
    handles.rough = NaN;
    
end


set(handles.edit1,'String', num2str(round(100* handles.area )/100));
set(handles.edit2,'String', num2str(round(100* handles.perim )/100));
set(handles.edit3,'String', num2str(round(1000 * handles.circul )/1000));
set(handles.edit4,'String', num2str(round(1000 * handles.asp_rat )/1000));
set(handles.edit5,'String', num2str(round(1000 * handles.rough )/1000));

set(handles.edit11,'String', num2str(round(100 * handles.area./(handles.calibr^2) )/100));
set(handles.edit12,'String', num2str(round(100 * handles.perim./handles.calibr )/100));
