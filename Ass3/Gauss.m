close all;
prompt = 'Enter the sigma value: ';
sigma = input(prompt);
S = rgb2gray(imread('bean.jpg'));
X=zeros(7,7);
Y=zeros(7,7);
for i=1:7
    counter=-3;
    for j=1:7
        X(i,j)=counter;
        Y(j,i)=counter;
        counter=counter+1;
    end
end
temp1=1/(2*pi*(sigma^2));
temp2=(-((X.^2)+(Y.^2))/(2*(sigma^2)));
gauss=temp1*exp(temp2);

[row, col] = size(S);
R=uint8(zeros(row+6,col+6));
row=row+6;
col=col+6;
R(4:row-3,4:col-3)=S;
T=R;
R=double(R);

for i = 1:row-6
   for j = 1:col-6 
      N = R(i:i+6, j:j+6);
      t = sum(sum(N.*gauss)); 
      T(i+3,j+3) = t;
   end
end
figure; imshow(S);
F=uint8(T(4:row-3,4:col-3)); 
figure;imshow(F, [min(F(:)), max(F(:))]);