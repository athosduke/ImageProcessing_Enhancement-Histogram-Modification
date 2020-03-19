image=imread('truck.gif');
[M,N]=size(image);
r=image;

Histogram=zeros(256,1); 
for i=1:M
    for j=1:N
        temp=image(i,j)+1;  
        Histogram(temp)= Histogram(temp)+1;        
    end
end

histogram=zeros(256,1);
for k= 1:256
    if k==1 
         histogram(1)=Histogram(1); 
    end
    
    if k>1
        histogram(k)=Histogram(k)+histogram(k-1);                                           
    end
end

cdf=histogram/(256*256);
for i=1:M
    for j=1:N
    s(i,j)=cdf(r(i,j)+1)*255;
      if s(i,j)-floor(s(i,j))>ceil(s(i,j))-s(i,j)
        s(i,j)=ceil(s(i,j));
      else
        s(i,j)=floor(s(i,j));
      end
    end
end

imtool(s,[]);
figure(1)
bar(Histogram)
title("Image's histogram");
figure(2)
bar(histogram/(256*256))
title("Image's cdf")