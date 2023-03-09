clear all
close all
x3=[1.2 3.0 4.0 3.0 0 -3.0 -4.0 -3.0]
for i = 1 : 8
    if (x3(i)>0)
        x3(i)=x3(i)-0.3+0.1*rand(1);
    else 
        x3(i)=x3(i)+0.3+0.1*rand(1);
    end
end
x3=x3';
y3=[0.2 2.5 4.5 6.5 8.0 6.5 4.5 2.5]
for j = 1 : 8
    y3(j)=y3(j)+0.1*rand(1);
end
y3=y3';
figure(1)
hold on
plot(x3,y3,'*')
save marqueurs3.mat