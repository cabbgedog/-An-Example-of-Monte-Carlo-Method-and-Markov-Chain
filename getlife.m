%该函数用来获取系统的寿命%
function life = getlife(num)

lifemax = 220000;

PF = num;
SO = 0;
DM = 0;
MO = 0;
DN = 0;
FB = 0;


%相邻两行对应A、B节点，第一列为时间，第二列为状态
tmp = zeros(2 * num, 2);
for i = 1:num
   [tmp(2 * i - 1, 1),tmp(2 * i, 1),tmp(2 * i - 1, 2), tmp(2 * i,2)] = getstate();
end

[TimeTable, Index] = sortrows(tmp);

for i = 1:2 * num
    life = TimeTable(i, 1);
    if(life > lifemax)
       life = lifemax;
       break;
    end
    
    state = TimeTable(i, 2);
    
 if mod(Index(i), 2)
    PF = PF - 1;
    switch state
        case 0
            PF = PF + 1;
        case 1
            SO = SO + 1;
        case 2
            DM = DM + 1;
        case 3
            MO = MO + 1;
        case 4
            DN = DN + 1;
        otherwise
            FB = FB + 1;
    end
           
 else
    first_state = tmp(Index(i) - 1, 2);
    switch first_state
        case 0
            PF = PF - 1;
        case 1
            SO = SO - 1;
        case 2
            DM = DM - 1;
        case 3
            MO = MO - 1;
        case 4
            DN = DN - 1;
        otherwise
            FB = FB - 1;
    end
        
    switch state 
        case 0 
            PF = PF + 1; 
        case 1 
            SO = SO + 1; 
        case 2 
            DM = DM + 1; 
        case 3 
            MO = MO + 1; 
        case 4 
            DN = DN + 1; 
        otherwise 
            FB = FB + 1; 
    end 
 end
    
    %检测系统是否能正常工作，若不能就退出循环
    system_state = systemstate(PF, SO, DM, MO, DN, FB);
    if(system_state == 1 || system_state == 4 )
        break;
    end
end


end
