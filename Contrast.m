clc
clear all
close all
%% Image Reading 

I = imread( '...This_picture.jpg' );
imshow(I)
title('Result of reading image')

% Gray scale 
gray_img=rgb2gray(I);
figure,
imshow(gray_img);

%% Fourier Transform 
k_space=fftshift(fft2(fftshift(gray_img)));
figure,
imshow(abs(k_space),[])
title('K_space')

%% Inverse Fourier Transform

Case_1=zeros(720,777);
for r=1:720
    for c=1:777
if r>=315 && r<=405
    if c>=339 && c<=436
      Case_1(r,c)=k_space(r,c);
    end
    else
        Case_1(r,c)=0;
end
    end
  
end

low_frequency=ifftshift(ifft2(ifftshift(Case_1)));
figure,
imshow(abs(low_frequency),[])
title('Low frequency region-Contrast')

Case_2=k_space;
for r=1:720
    for c=1:777
if r>=315 && r<=405
    if c>=339 && c<=436
   Case_2(r,c)=0;
    end
else   
end
    end
  
end

high_frequency=ifftshift(ifft2(ifftshift(Case_2)));
figure,
imshow(abs(high_frequency),[])
title('High frequency region-Details')




 