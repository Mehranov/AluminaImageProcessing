function [im,i1]=ImagePrepare
% By running this code you can select your SEM image and it will be
% modified to be prepared to be analyzed by the rest of the code. Generally
% this code will produce the complement of the image because we need the
% pores to be white in image (or the maxima of the image) to replace them
% with pixels.
[FileName,PathName] = uigetfile({'*.png';'*.*'},'Select the SEM Image in .PNG format');
Path=strcat(PathName,FileName);
imorig=importdata(Path);
im=imcomplement(rgb2gray(imorig));
%im=imgaussfilt(im);
%here we need to enhance the contrast between pores and body of the alumina
%in order to reduce noise and reduce wrong pixels detected as pores
%all pixels shrink betwwen 0 and 2 instead of 0 and 255
%immax=max(max(im));immax=double(immax-60);
i1=double(im);
maxi=max(max(i1));
mini=min(min(i1));
i1=i1-mini;
i1=i1./(maxi-mini);
i1=i1.*255;i1=uint8(i1);














clear imorig FileName PathName Path;
end


