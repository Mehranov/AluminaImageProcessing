function [ nodes,distance,angles ] = NN6( xy,z )
%NN6 is a function which find the 6 nearest neighbors of a given set of
%points
%   inputs:
%   z           is a point which has the format of (x,y) as its coordinates
%   Outputs:
%   nodes       is a 1by6 matrix where (x(nodes),y(nodes)) shows the coordinates
%               of the 6 nearest neighbors with respect to the given point z
%   distance    is a 1by6 matrix which shows the euclidean distance of each neighbor with respect to
%               the given point z
%   angels      is a 1by6 matrix which returns the angle between the given
%               point z with respect to its 6 neighbors. If we lable the
%               neares neighbors in a counterclockwise movement and
%               consider the first point above the x axise and in the first
%               quarter of the coordinates(manzuram ine ke avalin noghte ee
%               ke balaye mehvare x va samte raast gharar migire) as no.1
%               then the first number in matrix angels is the angle between
%               points 1z2 and the second number is the angel between 2z3
%               and so on.

angles=0;
[nodes,distance]=knnsearch(xy,z,'k',7);
% nodes=nodes(2:end);
distance=distance(2:end);
neighbors=xy(nodes(2:end),:);
ref=[10,0];
bordar=zeros(6,2);
for i=1:6
bordar(i,:)=neighbors(i,:)-z;
end

angles(1)=acos(dot(bordar(1,:),ref)/(norm(bordar(1,:)).*norm(ref)));
if (bordar(1,2)<0)
    angles(1)=-angles(1);
end
angles(2)=acos(dot(bordar(2,:),ref)/(norm(bordar(2,:)).*norm(ref)));
if (bordar(2,2)<0)
    angles(2)=-angles(2);
end
angles(3)=acos(dot(bordar(3,:),ref)/(norm(bordar(3,:)).*norm(ref)));
if (bordar(3,2)<0)
    angles(3)=-angles(3);
end
angles(4)=acos(dot(bordar(4,:),ref)/(norm(bordar(4,:)).*norm(ref)));
if (bordar(4,2)<0)
    angles(4)=-angles(4);
end
angles(5)=acos(dot(bordar(5,:),ref)/(norm(bordar(5,:)).*norm(ref)));
if (bordar(5,2)<0)
    angles(5)=-angles(5);
end
angles(6)=acos(dot(bordar(6,:),ref)/(norm(bordar(6,:)).*norm(ref)));
if (bordar(6,2)<0)
    angles(6)=-angles(6);
end
angles=angles*180/pi;

for i=1:6
    if (angles(i)<0)
        angles(i)=360+angles(i);
    end
end
angles=sort(angles);
atemp=angles(1);

angles(1)=angles(2)-angles(1);
if (angles(1)<0)
    angles(1)=360+angles(1);
end
angles(2)=angles(3)-angles(2);
if (angles(2)<0)
    angles(2)=360+angles(2);
end
angles(3)=angles(4)-angles(3);
if (angles(3)<0)
    angles(3)=360+angles(3);
end
angles(4)=angles(5)-angles(4);
if (angles(4)<0)
    angles(4)=360+angles(4);
end
angles(5)=angles(6)-angles(5);
if (angles(5)<0)
    angles(5)=360+angles(5);
end
angles(6)=atemp-angles(6);
if (angles(6)<0)
    angles(6)=360+angles(6);
end

end

