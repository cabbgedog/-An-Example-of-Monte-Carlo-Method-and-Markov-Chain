clear all;
close all;
clc;
tic;

lifemax = 220000;
S = 5e5;
lifelength = zeros(1,17);       
R = zeros(1,17);        
w=27000;

for num = 4 : 20
    LifeSum = 0;
    RSum = 0;
    timeSum=0;
    for i = 1:S
        life = getlife(num);
        LifeSum = LifeSum + life;
        if(life > w)
            RSum = RSum + 1;
        end
    end
    lifelength(1,num - 3) = LifeSum / S;
    R(1,num - 3) = RSum / S;
    disp(num);
end

toc;
[maxlife,index]=max(lifelength);
fprintf('最长首次失效时间为： \n');
disp(maxlife);
fprintf('最长首次失效时间对应节点为： \n');
disp(index+3);
disp(lifelength);
[maxR,index]=max(R);
fprintf('最大可靠性为： \n');
disp(maxR);
fprintf('最大可靠性对应节点为： \n');
disp(index+3);
disp(R);
figure;
plot(lifelength);
title('平均首次失效时间图');
xlabel('节点数');
ylabel('平均首次失效时间');
figure;
plot(R);
title('可靠性图');
xlabel('节点数');
ylabel('可靠性');