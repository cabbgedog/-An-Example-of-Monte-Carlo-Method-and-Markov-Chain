%生成一个节点a、b节点故障发生的时间与其状态
%first_time,second_time对应于第一、第二次故障时间
%first_state,second_state对应于第一、第二次故障之后节点的状态
function [first_time, second_time, first_state, second_state] = getstate()
LamdaA = 4.11e4;
LamdaB = 3.44e5;
state = [0 3 1; 1 5 1; 2 3 4; 4 4 4];
%计算B的寿命与状态
p1 = rand();
Btime = -1 * LamdaB * log(1 - p1);

PB = rand();
if (PB<0.42)
   Bstate = 1;
else
   Bstate =2;
end

%计算A的寿命与状态
p2 = rand();
Atime = -1 * LamdaA * log(1 - p2);

PA = rand();
 if(PA < 0.33)
    Astate = 1;
 elseif(PA < 0.61)
    Astate = 2;
 else
    Astate = 3;
 end

    
  if(Atime <= Btime)
   first_time = Atime;
   second_time = Btime;
   first_state = state(Astate+1, 1);
   second_state = state(Astate+1, Bstate+1);
  else
   first_time = Btime;
   second_time = Atime;
   first_state = state(1, Bstate+1);
   second_state = state(Astate+1, Bstate+1);
  end
  
end

