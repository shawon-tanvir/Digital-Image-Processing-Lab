%Assignment on Morphology
%Name:MD Tanvir Rouf Shawon
%ID:160104138

%Part A
close all;
f=[0 0 0 0 0 0 0;0 0 0 0 0 0 0;0 0 1 0 1 0 0;0 0 1 0 1 0 0;0 0 1 1 1 0 0;0 0 0 0 0 0 0;0 0 0 0 0 0 0];
figure;
subplot(1,2,1);
imshow(f);
title('Given image');

[x,y]=size(f);
p=zeros(x,y);

%A 3*3 Disc Structuring Element is needed for Part A
w=[0 1 0; 1 1 1; 0 1 0];
%Dilation
for s=2:x-1
    for t=2:y-1
        w1=[f(s-1,t)*w(2) f(s,t-1)*w(4) f(s,t)*w(5) f(s,t+1)*w(6) f(s+1,t)*w(8)];
        p(s,t)=max(w1);
    end
end
subplot(1,2,2);
imshow(p-f);
title('Output Image');


%Part B
f=[0 0 0 0 0 0 0;0 0 0 0 0 0 0;0 1 0 0 0 1 0;0 1 0 1 0 1 0;0 1 0 0 0 1 0;0 0 1 0 1 0 0;0 0 0 0 0 0 0];
figure;
subplot(1,2,1);
imshow(f);
title('Given Image');

f=padarray(f,[1 1],0,'both');
[x,y]=size(f);
p=zeros(x,y);

%A 3*3 Square Structuring Element is needed for Part A
w=[1 1 1; 1 1 1; 1 1 1];

%Dilation
for s=2:x-1
    for t=2:y-1
        w1=[f(s-1,t-1)*w(1,1) f(s-1,t)*w(1,2) f(s-1,t+1)*w(1,3) f(s,t-1)*w(2,1) f(s,t)*w(2,2) f(s,t+1)*w(2,3) f(s+1,t-1)*w(3,1) f(s+1,t)*w(3,2) f(s+1,t+1)*w(3,3)];
        p(s,t)=max(w1);
    end
end


p=padarray(p(2:x-1,2:y-1),[1 1],1,'both');
q=zeros(x,y);

%erosion
for s=2:x-1
    for t=2:y-1
        w12=[p(s-1,t-1)*w(1) p(s-1,t)*w(2) p(s-1,t+1)*w(3) p(s,t-1)*w(4) p(s,t)*w(5) p(s,t+1)*w(6) p(s+1,t-1)*w(7) p(s+1,t)*w(8) p(s+1,t+1)*w(9)];
        q(s,t)=min(w12);
    end
end

out=p-q;
out=out(2:x-1,2:y-1);
subplot(1,2,2);
imshow(out);
title('Output image');


