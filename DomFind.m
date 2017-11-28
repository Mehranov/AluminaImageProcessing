function [dom]=DomFind(xy,d_ave,d_std,angles_ave,angles_std)
s=size(xy);
s=s(1);
t=zeros(s,1);
dom=[xy t];
for i=1:s
    dom(i,3)=IsHexa(i,xy,d_ave,d_std,angles_ave,angles_std);
end
end



