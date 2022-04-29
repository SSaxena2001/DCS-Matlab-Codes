%QPSK Modulation and Demodulation
clc
close all

a=2;
fc=3;

m = [0 1 1 0 1 1 0 1 1 0];
t = 0:0.01:length(m);
t2=0:length(m)-1;
t_even=0:(length(m)-2)/2;
t_odd = 0:(length(m) - 1)/2;

subplot(811);
stairs(t2,m)
title('Message Signal')


for i=1:2:length(m)
    odd((i+1)/2) = m(i);
end

subplot(812);
stairs(t_odd,odd)
title('Odd Signal')


for i=2:2:length(m)
    even(i/2) = m(i);
end


subplot(813);
stairs(t_even,even)
title('Even Signal')

y1= a*cos(2*pi*fc*t);
y2= a*sin(2*pi*fc*t);

subplot(814)
plot(t,y1)
title('Carrier Signal 1')

subplot(815)
plot(t,y2)
title('Carrier Signal 2')

for i=1:length(odd)
    for j=(i-1)*200:i*200
        if odd(i) == 1
            s_odd(j+1) = y1(j+1);
        else
            s_odd(j+1) = -y1(j+1);
        end
    end
end

subplot(816)
plot(t,s_odd);
title('Odd BPSK Signal');
xlabel('Time');
ylabel('Amplitude');

for i=1:length(even)
    for j=(i-1)*200:i*200
        if even(i) == 1
            s_even(j+1) = y2(j+1);
        else
            s_even(j+1) = -y2(j+1);
        end
    end
end

subplot(817)
plot(t,s_even);
title('Even BPSK Signal');
xlabel('Time');
ylabel('Amplitude');

 
for i=1:length(m)
    for j=(i-1)*100:i*100
       s(j+1) = s_even((j+1))+s_odd((j+1));
    end
end

t=0:0.01:length(m);
disp(t);
disp(s);
subplot(818)
plot(t,s);
title('QPSK Signal');
xlabel('Time');
ylabel('Amplitude');

% for i=1:length(m)
%    for j=(i-1)*100:i*100
%         if(s(j+1)==y1(j+1))
%             x(j+1)=1;
%         else
%             x(j+1)=0;
%         end
%     end
% end

% subplot(717)
% stairs(t,x);
% title('Demodulated Signal');
% xlabel('Time');
% ylabel('Amplitude');

