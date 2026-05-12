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

function handles=save_data(handles)

[FileName,PathName] = uiputfile('*.txt');
fid=fopen(fullfile(PathName,FileName), 'wt');
fprintf(fid, '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n', 'calibr','Area (pix^2)','Perim (pix)','Area (cm^2)','Perim (cm)','Circul','Aspect Ratio','Roughness');  % header
fclose(fid);
dlmwrite(fullfile(PathName,FileName),[handles.calibr, handles.area, handles.perim, handles.area./(handles.calibr^2) , handles.perim./(handles.calibr), ...
    handles.circul, handles.asp_rat, handles.rough],...
    'delimiter','\t','precision','%.5f','-append');