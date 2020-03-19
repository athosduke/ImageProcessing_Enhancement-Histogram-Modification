image=imread('truck.gif');
[M,N] = size(image);
figure(1)
imshow(image)
title('Original image');

%pdf
Histogram=zeros(256,1); %create a column vector with 256 rows
for i=1:M
    for j=1:N
        temp=image(i,j)+1;  %a temporary value holding the pixel value
        Histogram(temp)= Histogram(temp)+1;   %count the number of pixels for each pixel value        
    end
end
%declare all variables
sum=0;
sum2=0;
tenpr=M*N*0.1;
%find L1 for 10% cdf
for i=1:M
    sum=sum+Histogram(i,1);
    if (sum>=tenpr)
        break
    end
end
L1=i-1;
%fine L2 for 90% cdf
for o=1:M
    sum2=sum2+Histogram(M-o+1,1);
    if (sum2>=tenpr)
        break       
    end
end
L2=M-o-1;
%(a)Set all pixels with gray levels below 10% in the cdf to black.
image2=image;
for i=1:M
    for j=1:N
        if (image(i,j)<L1)
            image2(i,j)=0;
        end
    end
end
figure(2)
imshow(image2)
title('3(a)')

Histogram2=zeros(256,1); %create a column vector with 256 rows
for i=1:M
    for j=1:N
        temp=image2(i,j)+1;  %a temporary value holding the pixel value
        Histogram2(temp)= Histogram2(temp)+1;   %count the number of pixels for each pixel value        
    end
end
figure(3)
bar(Histogram2)
title("3(a)histogram")                                                                            

%compute cdf
histogram2=zeros(256,1);
for k= 1:256
    if k==1 
         histogram2(1)=Histogram2(1); 
    end
    
    if k>1
        histogram2(k)=Histogram2(k)+histogram2(k-1); %add the number of pixels at each pixel value k  
                                                  % and all the number of
                                                  % pixles before it                                           
    end
end
figure(4)
bar(histogram2/(M*N))
title("3(a)Cr")

%(b)Set all pixels with gray levels above 90% in the cdf to white.
image3=image;
for i=1:M
    for j=1:N
        if (image(i,j)>L2)
            image3(i,j)=255;
        end
    end
end
figure(5)
imshow(image3)
title('3(b)')
Histogram3=zeros(256,1); %create a column vector with 256 rows
for i=1:M
    for j=1:N
        temp=image3(i,j)+1;  %a temporary value holding the pixel value
        Histogram3(temp)= Histogram3(temp)+1;   %count the number of pixels for each pixel value        
    end
end
figure(6)
bar(Histogram3)
title("3(b)histogram")                                                                            

%compute cdf
histogram3=zeros(256,1);
for k= 1:256
    if k==1 
         histogram3(1)=Histogram3(1); 
    end
    
    if k>1
        histogram3(k)=Histogram3(k)+histogram3(k-1); %add the number of pixels at each pixel value k  
                                                  % and all the number of
                                                  % pixles before it                                           
    end
end
figure(7)
bar(histogram3/(256*256))
title("3(b)Cr")

%(c)
image4=image;
for i=1:M
    for j=1:N
        if(image(i,j)>=L1)&&(image(i,j)<=L2)
            slope=255/(L2-L1);
            image4(i,j)=slope*(image(i,j)-L1);
        end
    end
end
figure(8)
imshow(image4)
title('3(c)')
Histogram4=zeros(256,1); %create a column vector with 256 rows
for i=1:M
    for j=1:N
        temp=image4(i,j)+1;  %a temporary value holding the pixel value
        Histogram4(temp)= Histogram4(temp)+1;   %count the number of pixels for each pixel value        
    end
end
figure(9)
bar(Histogram4)
title("3(c)histogram")                                                                            

%compute cdf
histogram4=zeros(256,1);
for k= 1:256
    if k==1 
         histogram4(1)=Histogram4(1); 
    end
    
    if k>1
        histogram4(k)=Histogram4(k)+histogram4(k-1); %add the number of pixels at each pixel value k  
                                                  % and all the number of
                                                  % pixles before it                                           
    end
end
figure(10)
bar(histogram4/(256*256))
title("3(c)Cr")
%combine(a)(b)(c)
image5=image;
for i=1:M
    for j=1:N
        if(image(i,j)>=L1)&&(image(i,j)<=L2)
            slope=255/(L2-L1);
            image5(i,j)=slope*(image(i,j)-L1);
        end
        if (image(i,j)>L2)
            image5(i,j)=255;
        end
        if (image(i,j)<L1)
            image5(i,j)=0;
        end
        
    end
end
figure(11)
imshow(image5)
title('3combine')
Histogram5=zeros(256,1); %create a column vector with 256 rows
for i=1:M
    for j=1:N
        temp=image5(i,j)+1;  %a temporary value holding the pixel value
        Histogram5(temp)= Histogram5(temp)+1;   %count the number of pixels for each pixel value        
    end
end
figure(12)
bar(Histogram5)
title("3combine histogram")                                                                            

%compute cdf
histogram5=zeros(256,1);
for k= 1:256
    if k==1 
         histogram5(1)=Histogram5(1); 
    end
    
    if k>1
        histogram5(k)=Histogram5(k)+histogram5(k-1); %add the number of pixels at each pixel value k  
                                                  % and all the number of
                                                  % pixles before it                                           
    end
end
figure(13)
bar(histogram5/(256*256))
title("3combineCr")