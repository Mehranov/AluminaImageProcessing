clear all
[im,i1]=ImagePrepare;
tic
Ne=input('input the number of eliminating neighboring pixels between 1to4');
p=FastPeakFind(im,0,[1 5 1;5 20 5;1 5 1],Ne+1,Ne);
T1=toc;
x=p(1:2:end);y=p(2:2:end);xy=[x y];
%clear p;
[d_ave,d_std,angles_ave,angles_std]=ThresholdFind(xy);
T2=toc;
[Domains]=DomFind(xy,d_ave,d_std,angles_ave,angles_std);
T3=toc;

DomF=EdgeFind(Domains);



q=input('Would you like to see the result images?(press 1 for Yes / press 2 for No)');
switch q
    case 1
        axis equal
        subplot(2,2,1)
        imshow(im)
        hold on
        subplot(2,2,4)
        gscatter(DomF(:,1),-DomF(:,2),DomF(:,3),'rgb')
        subplot(2,2,2)
        imshow(im)
        hold on
        gscatter(x,y)
    case 2
        disp('No Problem')
    otherwise
        disp('kosmaghz press 1 or 2, forsateto az dast dadi')
end
%determining the fraction of grenn to red (or green to whole) dots
Dom=DomF(:,3);
c1=Dom==1;c2=Dom==0;c3=Dom==3;
c1=sum(c1);c2=sum(c2);c3=sum(c3);
RegulGtoT=c1/(c1+c2);
UnReg=c2/(c1+c2);
RegulFalse=c1/(c1+c2+c3);

        
%clearvars -except xy Domains









