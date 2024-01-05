%f = [-20 -10];
%A = [5 4;2 5];
%B = [24 13];
%lb = [0 0];

%[x,fval,status] = intprog(f,A,B,[1 2],[],[],lb)

%例子2
f =  [-40 -90];
A = [9 7;7 20];
B = [56 70];
lb = [0 0];

[x,fval,status] = intprog(f,A,B,[1 2],[],[],lb)