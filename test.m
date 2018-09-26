function [errors] = test(w)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
testImages = loadMNISTImages('t10k-images.idx3-ubyte');
testLabels = loadMNISTLabels('t10k-labels.idx1-ubyte');

v=zeros(10,1);
n=10000;
errors=0;
for i=1:n

    v(:,i)=w*testImages(:,i);
        vMax=v(1,i);
        vIndex=0;
        for j=1:10
            if v(j,i)>=vMax
               vMax=v(j,i);
               vIndex=j;
            end
        end
       
        if vIndex-1~=testLabels(i)
            errors=errors+1;
        end
end
end

