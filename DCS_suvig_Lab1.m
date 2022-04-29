clc
close all

a=2;
f=6;

%6 bits are used An extra zero to prevent array mismatch. 

m = [1 0 0 1 1 0 1 0 0 0 1 0];
t = 0:0.01:length(m);
t2=0:length(m)-1;

subplot(411);
stairs(t2,m)
title('Message Signal')

y= a*sin(2*pi*f*t);
subplot(412)
plot(t,y)
title('Carrier Signal')

for i=1:length(m)
    for j=(i-1)*100:i*100
        if m(i) == 1
            s(j+1) = y(j+1);
        else
            s(j+1) = 0;
        end
    end
end

disp(t);
disp(s);

subplot(413)
plot(t,s);
title('Modulated Signal');
xlabel('Time');
ylabel('Amplitude');

for i=1:length(m)
   for j=(i-1)*100:i*100
        if(s(j+1)==y(j+1))
            x(j+1)=1;
        else
            x(j+1)=0;
        end
    end
end

subplot(414)
plot(t, x);
title('Demodulated signal');
xlabel('Time');
ylabel('Amplitude');


