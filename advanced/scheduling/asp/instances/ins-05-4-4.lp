job(1..4). machine(1..4).
duration(1,1,6).
duration(1,2,5).
duration(1,3,7).
duration(1,4,3).
duration(2,1,9).
duration(2,2,5).
duration(2,3,5).
duration(2,4,9).
duration(3,1,5).
duration(3,2,1).
duration(3,3,5).
duration(3,4,5).
duration(4,1,4).
duration(4,2,3).
duration(4,3,1).
duration(4,4,1).
sequence(1,1,3).
sequence(1,2,4).
sequence(1,3,1).
sequence(1,4,2).
sequence(2,1,4).
sequence(2,2,2).
sequence(2,3,3).
sequence(2,4,1).
sequence(3,1,4).
sequence(3,2,3).
sequence(3,3,2).
sequence(3,4,1).
sequence(4,1,1).
sequence(4,2,4).
sequence(4,3,3).
sequence(4,4,2).


%
% Permutation Flow Shop Problem
%
%Answer: 1
%perm(3,1) perm(1,3) perm(2,2) perm(4,4)
%Answer: 2
%perm(2,1) perm(1,3) perm(3,2) perm(4,4)


%
% Job Shop Problem
%
%Answer: 1
%perm(1,3,1) perm(3,4,1) perm(4,1,1) perm(1,1,3) perm(2,1,4) perm(4,4,3) perm(2,4,2) perm(1,4,4) perm(2,3,4) perm(3,3,2) perm(4,3,3) perm(2,2,2) perm(3,2,1) perm(4,2,3) perm(3,1,2) perm(1,2,4)
%Answer: 2
%perm(1,3,1) perm(3,4,1) perm(4,1,1) perm(1,1,3) perm(2,1,4) perm(4,4,3) perm(2,4,2) perm(1,4,4) perm(2,3,4) perm(3,3,2) perm(4,3,3) perm(2,2,2) perm(3,2,1) perm(4,2,4) perm(3,1,2) perm(1,2,3)
%Answer: 3
%perm(1,3,1) perm(3,4,1) perm(4,1,1) perm(1,1,3) perm(2,1,4) perm(4,4,3) perm(2,4,2) perm(1,4,4) perm(2,3,3) perm(3,3,2) perm(4,3,4) perm(2,2,2) perm(3,2,1) perm(4,2,3) perm(3,1,2) perm(1,2,4)
%Answer: 4
%perm(1,3,1) perm(3,4,1) perm(4,1,1) perm(1,1,3) perm(2,1,4) perm(4,4,3) perm(2,4,2) perm(1,4,4) perm(2,3,3) perm(3,3,2) perm(4,3,4) perm(2,2,2) perm(3,2,1) perm(4,2,4) perm(3,1,2) perm(1,2,3)
%Answer: 5
%perm(1,3,1) perm(3,4,1) perm(4,1,1) perm(1,1,3) perm(2,1,4) perm(4,4,4) perm(2,4,2) perm(1,4,3) perm(2,3,4) perm(3,3,2) perm(4,3,3) perm(2,2,2) perm(3,2,1) perm(4,2,3) perm(3,1,2) perm(1,2,4)
%Answer: 6
%perm(1,3,1) perm(3,4,1) perm(4,1,1) perm(1,1,3) perm(2,1,4) perm(4,4,4) perm(2,4,2) perm(1,4,3) perm(2,3,4) perm(3,3,2) perm(4,3,3) perm(2,2,2) perm(3,2,1) perm(4,2,4) perm(3,1,2) perm(1,2,3)
%Answer: 7
%perm(1,3,1) perm(3,4,1) perm(4,1,1) perm(1,1,3) perm(2,1,4) perm(4,4,4) perm(2,4,2) perm(1,4,3) perm(2,3,3) perm(3,3,2) perm(4,3,4) perm(2,2,2) perm(3,2,1) perm(4,2,3) perm(3,1,2) perm(1,2,4)
%Answer: 8
%perm(1,3,1) perm(3,4,1) perm(4,1,1) perm(1,1,3) perm(2,1,4) perm(4,4,4) perm(2,4,2) perm(1,4,3) perm(2,3,3) perm(3,3,2) perm(4,3,4) perm(2,2,2) perm(3,2,1) perm(4,2,4) perm(3,1,2) perm(1,2,3)
%Answer: 9
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,2) perm(3,4,4) perm(1,4,3) perm(2,3,3) perm(3,3,4) perm(4,3,2) perm(2,2,1) perm(3,2,3) perm(4,2,2) perm(3,1,4) perm(1,2,4)
%Answer: 10
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,2) perm(3,4,4) perm(1,4,3) perm(2,3,3) perm(3,3,4) perm(4,3,2) perm(2,2,1) perm(3,2,4) perm(4,2,2) perm(3,1,4) perm(1,2,3)
%Answer: 11
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,2) perm(3,4,4) perm(1,4,3) perm(2,3,3) perm(3,3,4) perm(4,3,2) perm(2,2,1) perm(3,2,4) perm(4,2,3) perm(3,1,4) perm(1,2,2)
%Answer: 12
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,2) perm(3,4,4) perm(1,4,3) perm(2,3,3) perm(3,3,4) perm(4,3,2) perm(2,2,1) perm(3,2,2) perm(4,2,3) perm(3,1,4) perm(1,2,4)
%Answer: 13
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,2) perm(3,4,4) perm(1,4,3) perm(2,3,3) perm(3,3,4) perm(4,3,2) perm(2,2,1) perm(3,2,2) perm(4,2,4) perm(3,1,4) perm(1,2,3)
%Answer: 14
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,2) perm(3,4,4) perm(1,4,3) perm(2,3,3) perm(3,3,4) perm(4,3,2) perm(2,2,1) perm(3,2,3) perm(4,2,4) perm(3,1,4) perm(1,2,2)
%Answer: 15
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,2) perm(3,4,4) perm(1,4,3) perm(2,3,2) perm(3,3,4) perm(4,3,3) perm(2,2,1) perm(3,2,3) perm(4,2,2) perm(3,1,4) perm(1,2,4)
%Answer: 16
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,2) perm(3,4,4) perm(1,4,3) perm(2,3,2) perm(3,3,4) perm(4,3,3) perm(2,2,1) perm(3,2,4) perm(4,2,3) perm(3,1,4) perm(1,2,2)
%Answer: 17
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,2) perm(3,4,4) perm(1,4,3) perm(2,3,2) perm(3,3,4) perm(4,3,3) perm(2,2,1) perm(3,2,3) perm(4,2,4) perm(3,1,4) perm(1,2,2)
%Answer: 18
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,2) perm(3,4,4) perm(1,4,3) perm(2,3,2) perm(3,3,3) perm(4,3,4) perm(2,2,1) perm(3,2,2) perm(4,2,3) perm(3,1,4) perm(1,2,4)
%Answer: 19
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,2) perm(3,4,4) perm(1,4,3) perm(2,3,2) perm(3,3,3) perm(4,3,4) perm(2,2,1) perm(3,2,2) perm(4,2,4) perm(3,1,4) perm(1,2,3)
%Answer: 20
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,2) perm(3,4,4) perm(1,4,3) perm(2,3,2) perm(3,3,3) perm(4,3,4) perm(2,2,1) perm(3,2,3) perm(4,2,4) perm(3,1,4) perm(1,2,2)
%Answer: 21
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,3) perm(3,4,4) perm(1,4,2) perm(2,3,3) perm(3,3,4) perm(4,3,2) perm(2,2,1) perm(3,2,3) perm(4,2,2) perm(3,1,4) perm(1,2,4)
%Answer: 22
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,3) perm(3,4,4) perm(1,4,2) perm(2,3,3) perm(3,3,4) perm(4,3,2) perm(2,2,1) perm(3,2,4) perm(4,2,2) perm(3,1,4) perm(1,2,3)
%Answer: 23
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,3) perm(3,4,4) perm(1,4,2) perm(2,3,3) perm(3,3,4) perm(4,3,2) perm(2,2,1) perm(3,2,4) perm(4,2,3) perm(3,1,4) perm(1,2,2)
%Answer: 24
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,3) perm(3,4,4) perm(1,4,2) perm(2,3,3) perm(3,3,4) perm(4,3,2) perm(2,2,1) perm(3,2,2) perm(4,2,3) perm(3,1,4) perm(1,2,4)
%Answer: 25
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,3) perm(3,4,4) perm(1,4,2) perm(2,3,3) perm(3,3,4) perm(4,3,2) perm(2,2,1) perm(3,2,2) perm(4,2,4) perm(3,1,4) perm(1,2,3)
%Answer: 26
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,3) perm(3,4,4) perm(1,4,2) perm(2,3,3) perm(3,3,4) perm(4,3,2) perm(2,2,1) perm(3,2,3) perm(4,2,4) perm(3,1,4) perm(1,2,2)
%Answer: 27
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,3) perm(3,4,4) perm(1,4,2) perm(2,3,2) perm(3,3,4) perm(4,3,3) perm(2,2,1) perm(3,2,3) perm(4,2,2) perm(3,1,4) perm(1,2,4)
%Answer: 28
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,3) perm(3,4,4) perm(1,4,2) perm(2,3,2) perm(3,3,4) perm(4,3,3) perm(2,2,1) perm(3,2,4) perm(4,2,3) perm(3,1,4) perm(1,2,2)
%Answer: 29
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,3) perm(3,4,4) perm(1,4,2) perm(2,3,2) perm(3,3,4) perm(4,3,3) perm(2,2,1) perm(3,2,3) perm(4,2,4) perm(3,1,4) perm(1,2,2)
%Answer: 30
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,3) perm(3,4,4) perm(1,4,2) perm(2,3,2) perm(3,3,3) perm(4,3,4) perm(2,2,1) perm(3,2,2) perm(4,2,3) perm(3,1,4) perm(1,2,4)
%Answer: 31
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,3) perm(3,4,4) perm(1,4,2) perm(2,3,2) perm(3,3,3) perm(4,3,4) perm(2,2,1) perm(3,2,2) perm(4,2,4) perm(3,1,4) perm(1,2,3)
%Answer: 32
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,3) perm(3,4,4) perm(1,4,2) perm(2,3,2) perm(3,3,3) perm(4,3,4) perm(2,2,1) perm(3,2,3) perm(4,2,4) perm(3,1,4) perm(1,2,2)
%Answer: 33
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,4) perm(3,4,3) perm(1,4,2) perm(2,3,2) perm(3,3,4) perm(4,3,3) perm(2,2,1) perm(3,2,3) perm(4,2,2) perm(3,1,4) perm(1,2,4)
%Answer: 34
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,4) perm(3,4,3) perm(1,4,2) perm(2,3,2) perm(3,3,4) perm(4,3,3) perm(2,2,1) perm(3,2,4) perm(4,2,3) perm(3,1,4) perm(1,2,2)
%Answer: 35
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,4) perm(3,4,3) perm(1,4,2) perm(2,3,2) perm(3,3,4) perm(4,3,3) perm(2,2,1) perm(3,2,3) perm(4,2,4) perm(3,1,4) perm(1,2,2)
%Answer: 36
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,4) perm(3,4,3) perm(1,4,2) perm(2,3,2) perm(3,3,3) perm(4,3,4) perm(2,2,1) perm(3,2,2) perm(4,2,3) perm(3,1,4) perm(1,2,4)
%Answer: 37
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,4) perm(3,4,3) perm(1,4,2) perm(2,3,2) perm(3,3,3) perm(4,3,4) perm(2,2,1) perm(3,2,2) perm(4,2,4) perm(3,1,4) perm(1,2,3)
%Answer: 38
%perm(1,3,1) perm(2,4,1) perm(4,1,1) perm(1,1,2) perm(2,1,3) perm(4,4,4) perm(3,4,3) perm(1,4,2) perm(2,3,2) perm(3,3,3) perm(4,3,4) perm(2,2,1) perm(3,2,3) perm(4,2,4) perm(3,1,4) perm(1,2,2)
