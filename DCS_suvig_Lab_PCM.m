% Suvigya Saxena 19BEC0560

f = 10;
fs = 1500;
t1 = 0:1/fs:(2/f-1/fs);

x = 2+2*sin(2*pi*f*t1);

subplot(511);
plot(t1,x);

subplot(512);
stem(t1,x);
title('Sampled Signal');

partition = [0:0.5:4.5];
codebook = [0:0.5:5];
[i, q] = quantiz(x, partition, codebook);
subplot(513);
stairs(t1, q);
title('Quantized Signal');

y = dec2bin(q);
disp(y);
z = bin2dec(y);

[b,a] = butter(2, 0.02, 'low');
k = filter(b,a,z);

subplot(514);
plot(t1,z);
subplot(515);
plot(t1,k);