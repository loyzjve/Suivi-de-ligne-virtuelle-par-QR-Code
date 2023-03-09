clear all
close all
x2=[1.2 3.0 4.0 3.0 0 -3.0 -4.0 -3.0]
for i = 1 : 8
    if (x2(i)>0)
        x2(i)=x2(i)-0.3;
    else 
        x2(i)=x2(i)+0.3;
    end
end
x2=x2';
y2=[0.2 2.5 4.5 6.5 8.0 6.5 4.5 2.5]
y2=y2';
figure(1)
hold on
plot(x2,y2,'*')
save marqueurs2.mat