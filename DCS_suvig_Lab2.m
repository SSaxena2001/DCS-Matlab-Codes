clc
close all

a=2;
f1=6;
f2=9;

m = [1 0 1 0 0 1 1 0 0 1 0 0];
t = 0:0.01:length(m);
t2=0:length(m)-1;

subplot(511);
stairs(t2,m)
title('Message Signal')

y1= a*sin(2*pi*f1*t);
y2= a*sin(2*pi*f2*t);
subplot(512)
plot(t,y1)
title('Carrier Signal 1')

subplot(513)
plot(t,y2)
title('Carrier Signal 2')

for i=1:length(m)
    for j=(i-1)*100:i*100
        if m(i) == 1
            s(j+1) = y1(j+1);
        else
            s(j+1) = y2(j+1);
        end
    end
end

subplot(514)
plot(t,s);
title('Modulated Signal');
xlabel('Time');
ylabel('Amplitude');

for i=1:length(m)
   for j=(i-1)*100:i*100
        if(s(j+1)==y1(j+1))
            x(j+1)=1;
        else
            x(j+1)=0;
        end
    end
end
disp(x);

subplot(515)
stairs(t,x);
title('Demodulated Signal');
xlabel('Time');
ylabel('Amplitude');
