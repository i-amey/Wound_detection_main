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

function handles=recalc(handles)

h = waitbar(0,'Please wait...');

handles.thr1=get(handles.slider1,'Value');
handles.IM_mct=im2bw(handles.IM_mc,handles.thr1);
handles.IM_mct=medfilt2(handles.IM_mct,[5 5]);

handles.thr2=get(handles.slider2,'Value');
handles.IM_mct2=filledgegaps(handles.IM_mct,handles.thr2);
%[edgelist, labelededgeim] = edgelink(IM_mct, 10);
%seglist = lineseg(edgelist, 2);
handles.IM_mctfil=abs(imfill(handles.IM_mct2,'holes'));

handles.RGB=handles.IM_all;
handles.RGB(:,:,2)=handles.IM_all(:,:,2).*uint8(abs(handles.IM_mctfil-1));

% i=imfilter(handles.IM_mct,fspecial('disk',100));
% i(find(i>0))=1;
% i=abs(1-i);
% tt=(handles.IM_all);%.*uint8( i);
% imwrite(uint8(tt),'test.tiff');
%% plots
close(h)
axes(handles.axes1)
cla
imagesc(handles.IM_all)
axis image
axis off

axes(handles.axes2)
cla
imagesc(handles.IM_mct)
colormap(gray)
axis image
axis off

axes(handles.axes3)
cla
imagesc(handles.IM_mctfil)
colormap(gray)
axis image
axis off

axes(handles.axes4)
cla
imagesc(handles.RGB)
axis image
axis off