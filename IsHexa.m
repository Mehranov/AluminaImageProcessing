function r=IsHexa( i,xy,d_ave,d_std,angles_ave,angles_std )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[~,d,angles]=NN6(xy,[xy(i,1),xy(i,2)]);
d_min=d_ave-3*(d_std);
d_max=d_ave+3*(d_std);
% a_min=angles_ave-1.5*(angles_std);
% a_max=angles_ave+1.5*(angles_std);
a_min=60-1.5*(angles_std);
a_max=60+1.5*(angles_std);

    if ( (any(d>d_max)) || (any(d<d_min)) || (any(angles>a_max)) || (any(angles<a_min)) )
        r=0;
    else
        r=1;
    end
end

