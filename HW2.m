clc;
clear;
%upload the database to the Matlab
images = loadMNISTImages('train-images.idx3-ubyte');
labels = loadMNISTLabels('train-labels.idx1-ubyte');
 
% We are using display_network 
%display_network(images(:,1:100)); % Show the first 100 images
%disp(labels(1:10));

%Given ?,?,n:
rate=1;eta=100;
errorsRate=0.15; n=60000;

% Initialize W ? R10×784 randomly
w=rand(10,784);
v=zeros(10,1);
% Initialize epoch = 0
epoch=1; 
errors=zeros(1,n);
d=zeros(10,n);
while(1)
    u=zeros(10,n); %update u
    for i=1:n
        v(:,i)=w*images(:,i);
        vMax=v(1,i);
        vIndex=0;
       %get the max v's index
        for j=1:10
            if v(j,i)>=vMax
               vMax=v(j,i);
               vIndex=j;
            end
        end
        
        u(vIndex,i)=1;
        d(labels(i)+1,i)=1;
        if vIndex-1~=labels(i)
            errors(1,epoch)=errors(1,epoch)+1;
        end
    end
    
%     for i=1:n
%         w=w+eta*(d(:,i)-u(:,i))*images(:,i)';
%     end
%Training ; Update w;
    w=w+eta*(d-u)*images(:,1:n)';
    rate=errors(1,epoch)/n;%current error rate

   
%    plot(X,errors(1,epoch)/n,'b');
   hold on;
   if rate <= errorsRate
       break;
   end
    epoch=epoch+1;
end

for i=1:epoch
    scatter(i-1,errors(1,i),'r');
end

%plot 
X=0:epoch-1;
plot(X,errors(1,1:epoch));
hold on
% print the percentage of misclassified test samples
testErrorsRate=test(w)/10000