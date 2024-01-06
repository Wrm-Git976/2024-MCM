function [x,fval,status] = intprog(f,A,B,I,Aeq,Beq,lb,ub,e)
%整数规划求解函数 intprog()
% f是目标函数向量
% A,B,是不等式约束；Aeq,Beq是等数约束；
% I为整数约束
% lb，ub分别为变量下界与上界
% x是最优解，fval是最优值


if nargin < 9, e = 0.00001;
    if  nargin < 8, ub = [];
        if  nargin < 7, lb = [];
            if  nargin < 6, Beq = [];
                if  nargin < 5, Aeq = [];
                    if  nargin < 4, I = [1:length(f)];
                    end, end, end, end, end, end

%求解整数规划对应的线性规划，判断是否有解
options = optimset('display','off');
[x0,fval0,exitflag] = linprog(f,A,B,Aeq,Beq,lb,ub,[],options);
if exitflag < 0
    disp('没有合适整数解');
    x = x0;
    fval = fval0;
    status = exitflag;
    return;
else
    %分支界定求解
    bound = inf;
    [x,fval,status] = branchbound(f,A,B,I,x0,fval0,bound,Aeq,Beq,lb,ub,e);
end