%Gamma = 5.0
image=imread('truck.gif');
img= im2double(image); 
[M,N]=size(img);
gamma=5.0;
c=1;
for i = 1:M
    for j=1:N
        output(i,j)=c*(img(i,j)^gamma); 
    end
end
figure(1)
imshow(output)
title('Image after gamma correction with gamma = 5.0')

%compute pdf
opt=im2uint8(output);
Histogram=zeros(256,1);
for i=1:M
    for j=1:N
        temp=opt(i,j)+1;  
        Histogram(temp)= Histogram(temp)+1;
    end
end
figure(2)
bar(Histogram)
title("Corrected image's pdf(head) with gamma=5.0")

%compute cdf
histogram=zeros(256,1);
for k= 1:256
    if k==1
         histogram(1)=Histogram(1);
    end
    if k>1
        histogram(k)=Histogram(k)+histogram(k-1);
    end
end
figure(3)
bar(histogram/(256*256))
title("Corrected image's cdf with gamma=5.0")

%Gamma = 0.20
gamma1=0.2;
for i = 1:M
    for j=1:N
        output1(i,j)=c*(img(i,j)^gamma1);
    end
end
figure(4)
imshow(output1)
title('Image after gamma correction with gamma = 0.20')

%compute pdf(head)
opt1=im2uint8(output1);
Histogram1=zeros(256,1);
for i=1:M
    for j=1:N
        temp=opt1(i,j)+1;  
        Histogram1(temp)= Histogram1(temp)+1;
    end
end
figure(5)
bar(Histogram1)
title("Corrected image's pdf(head) with gamma=0.20")

%compute cdf
histogram1=zeros(256,1);
for k= 1:256
    if k==1
         histogram1(1)=Histogram1(1);
    end
    if k>1
        histogram1(k)=Histogram1(k)+histogram1(k-1);
    end
end
figure(6)
bar(histogram1/(256*256))
title("Corrected image's cdf with gamma=0.20")