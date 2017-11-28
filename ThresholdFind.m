function [d_ave,d_std,angles_ave,angles_std]=ThresholdFind(xy)
s=size(xy);
s=s(1);
%r=round(rand(1,s).*(s-1))+1;
r=(1:s);
n=zeros(s,7);
d=zeros(s,6);
angles=zeros(s,6);
for i=1:s
    [n(i,:),d(i,:),angles(i,:)]=NN6(xy,[xy(r(i),1),xy(r(i),2)]);
end
d_ave=mean(d);
d_std=std(d);
for cc=1:6;
    if (d_std(cc)<d_ave(cc)/10)
        d_std(cc)=d_ave(cc)/10;
    end
end

angles_ave=mean(angles);
angles_std=std(angles);


    
