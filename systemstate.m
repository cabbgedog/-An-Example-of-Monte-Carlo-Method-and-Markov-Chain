%由系统内各节点的状态判断系统的工作状态
function Gsys = systemstate(PF, SO, DM, MO, DN, FB)

C1 = FB >= 1;

C2 = MO >= 2;

C3 = PF + MO + DM == 0;


C4 = PF + SO +  1*((MO + DM) > 0)< 4;

C5 = FB == 0;

C6 = MO == 1 && PF + SO >= 3;

C7 = (MO == 0 && PF == 0 && DM >= 1 && SO >= 3) || (MO == 0 && PF >= 1 && PF + SO >= 4);

C8 = FB + MO == 0;

C9 = PF >= 1 && DM >= 1 && PF + SO == 3;

if(C1 + C2 + C3 + C4 > 0)
    Gsys = 1;
elseif(C5&&(C6 ||C7))
    Gsys = 2;
elseif(C8 && C9)
     p=rand();
    if(p<DM/(DM+PF))
        Gsys = 3;
    else
        Gsys = 4;
    end
end


end