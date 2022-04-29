clc; clear all; close all;
%generating input signal;
fs = 1000;
f = 10;
t1 = 0:1/fs:(2/f-1/fs);
a = 2;
x = a*sin(2*pi*f*t1);
subplot(4,1,1);
plot(t1,x);
title('Input signal');
%Generating Amplitude Shifted Input Signal
x1 = a+a*sin(2*pi*f*t1);
subplot(4,1,2);
plot(t1,x1);
title('Amplitude Shifted Input Signal');
%Sampled Signal
subplot(4,1,3);
stem(t1,x1);
title('Sampled Signal');
partition=0:0.5:4;
codebook=0:0.5:4.5;
[i,q] = quantiz(x1,partition,codebook);
%DPCM
z=x1-q+x;
subplot(4,1,4);
stem(t1,z);
title('dpcm');
%Quantization
partition=0:0.5:5.5;
codebook=0:0.5:6;
[i,q1]=quantiz(z,partition,codebook);
index=i;
quants=q;
figure();
subplot(4,1,1);
stairs(t1,q1);
title('Quantized signal');
y=dec2bin(q1);
%generation binary encoded signal
code=de2bi(i,'left-msb');
k=1;
for I=1:length(i)
for j=1:3
coded(k)=code(I,j);
j=j+1;
k=k+1;
end
I=I+1;
end
subplot(4,1,2);
stem(coded);
axis([0 100 -2 3]);
title("binary encoded Signal");
%De-quantization
z1=bin2dec(y);
[b,a]=butter(2,0.02,'low');
k=filter(b,a,z1);
subplot(4,1,3)
plot(t1,z1)
title('De-quantized signal');
%Reconstructed Signal
subplot(4,1,4);
plot(t1,k);
title('Re-constructed signal')