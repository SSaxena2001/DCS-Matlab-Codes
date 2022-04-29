clc;
clear all;
b=[1 1 1 0 1 0 1 0];
odd= [1 1 1 1];
t=0:0.01:length(b)-0.01;
bb=[];
j=1;
for i=1:length(t)
    if t(i)<j
        bb(i)=b(j);
    else
        j=j+1;
    end
end
bb1=[] % bb is b(t)
j=2;
k=1;
for i=1:length(t)
    if t(i)<j
        bb1(i)=odd(k);
    else
        j=j+2;
        k=k+1;
    end
end
subplot(8,1,1);
stairs(t,bb);
title('Message signal 19BEC0579');
xlabel('time')
ylabel('Amplitude');
subplot(8,1,2);
stairs(t,bb1);
title('Odd Bits');
xlabel('time')
ylabel('Amplitude');
% carrier signals
c1=2*cos(2*pi*2*t);
c2=2*sin(2*pi*2*t);
subplot(8,1,4);
plot(t,c1);
title('carrier signal 1')
xlabel('time')
ylabel('Amplitude');
subplot(8,1,5);
plot(t,c2);
title('carrier signal 2');
xlabel('time')
ylabel('Amplitude');
PSK1=[]%
for i= 1:length(bb1)
    if bb1(i)==1
        PSK1(i)=c1(i);
    else
        PSK1(i)=c2(i);
    end
end
even=[1 0 0 0];
bb2=[];
j=2;
k=1;
for i=1:length(t)
    if t(i)<j
        bb2(i)=even(k);
    else
        j=j+2;
        k=k+1;
    end
end
subplot(8,1,3);
stairs(t,bb2);
title('Even Bits');
xlabel('time')
ylabel('Amplitude');
subplot(8,1,6);
plot(t,PSK1);
title('PSK 1');
xlabel('time')
ylabel('Amplitude');
PSK2=[];
for i= 1:length(bb2)
    if bb2(i)==1
        PSK2(i)=c2(i);
    else
        PSK2(i)=c1(i);
    end
end
subplot(8,1,7);
plot(t,PSK2);
title('PSK 2');
xlabel('time')
ylabel('Amplitude');
    QPSK = PSK1+PSK2;
subplot(8,1,8);
plot(t,QPSK);
title('QPSK signal')
xlabel('time')
ylabel('Amplitude');