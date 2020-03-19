image=imread('truck.gif');
[M,N]=size(image);
figure(1)
imshow(image)
title('original image');

Histogram=zeros(256,1); 
for i=1:M
    for j=1:N
        temp=image(i,j)+1;  
        Histogram(temp)= Histogram(temp)+1;        
    end
end
figure(2)
bar(Histogram)
title("Image's pdf")                                                                            

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
title("Image's cdf")
                                        



