I1=imread('image2.jpg');
I2=imread('image1.jpg');
[row,coloumn]=size(I2);
coloumn=coloumn/3;
new = uint8(zeros(row, coloumn,3));
part=coloumn/6;
for i = 1:3
    for j=0:2:4
         new(:,j*part:(j+1)*part,i)=I1(:,j*part:(j+1)*part,i);
    end
    for j=1:2:5
         new(:,j*part:(j+1)*part,i)=I2(:,j*part:(j+1)*part,i);
    end
end
figure; imshow(new);