function [ DomainsFinal ] = EdgeFind( Domains)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
domx=Domains;
i=1;j=1;
while (domx(i,3)==0)
    domx(i,3)=3;
    i=i+1;
end
i=length(domx);
while(domx(i,3)==0)
    domx(i,3)=3;
    i=i-1;
end
[~,idx]=sort(domx(:,2));
domy=domx(idx,:);

while (domy(j,3)==0 || domy(j,3)==3)
    domy(j,3)=3;
    j=j+1;
end
j=length(domy);
while(domy(j,3)==0 || domy(j,3)==3)
    domy(j,3)=3;
    j=j-1;
end

DomainsFinal=domy;

    

end

