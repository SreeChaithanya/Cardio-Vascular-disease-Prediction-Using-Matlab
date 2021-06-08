function [s] = pcheck(A)
%PCHECK Summary of this function goes here
%   Detailed explanation goes herei
[l,m]=size(A);
s=1;
for i=1:l
    if(A(i)<0.05)
    else
        s=0;
        return
    end
end
if(s==1)
    return
end
end

