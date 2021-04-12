job(1..4). machine(1..4).
duration(1,1,5).
duration(1,2,5).
duration(1,3,4).
duration(1,4,2).
duration(2,1,3).
duration(2,2,8).
duration(2,3,3).
duration(2,4,8).
duration(3,1,6).
duration(3,2,6).
duration(3,3,8).
duration(3,4,1).
duration(4,1,8).
duration(4,2,5).
duration(4,3,9).
duration(4,4,3).
sequence(1,1,1).
sequence(1,2,4).
sequence(1,3,2).
sequence(1,4,3).
sequence(2,1,3).
sequence(2,2,1).
sequence(2,3,2).
sequence(2,4,4).
sequence(3,1,1).
sequence(3,2,3).
sequence(3,3,2).
sequence(3,4,4).
sequence(4,1,4).
sequence(4,2,1).
sequence(4,3,2).
sequence(4,4,3).


%
% Permutation Flow Shop Problem
%
%Answer: 1
%perm(2,1) perm(1,3) perm(3,4) perm(4,2)


%
% Job Shop Problem
%
%Answer: 1
%perm(3,1,1) perm(4,2,1) perm(1,2,4) perm(2,2,2) perm(3,2,3) perm(4,1,4) perm(1,1,3) perm(4,3,1) perm(3,3,3) perm(2,3,2) perm(1,3,4) perm(2,1,2) perm(1,4,3) perm(4,4,1) perm(2,4,2) perm(3,4,4)
%Answer: 2
%perm(3,1,1) perm(4,2,1) perm(1,2,4) perm(2,2,2) perm(3,2,3) perm(4,1,4) perm(1,1,2) perm(4,3,1) perm(3,3,3) perm(2,3,2) perm(1,3,4) perm(2,1,3) perm(1,4,3) perm(4,4,1) perm(2,4,2) perm(3,4,4)
%Answer: 3
%perm(1,1,1) perm(4,2,1) perm(1,2,4) perm(2,2,2) perm(3,2,3) perm(4,1,4) perm(3,1,2) perm(4,3,1) perm(3,3,3) perm(2,3,2) perm(1,3,4) perm(2,1,3) perm(1,4,3) perm(4,4,1) perm(2,4,2) perm(3,4,4)
%Answer: 4
%perm(3,1,1) perm(4,2,1) perm(1,2,3) perm(2,2,2) perm(3,2,4) perm(4,1,4) perm(1,1,2) perm(4,3,1) perm(2,3,2) perm(3,3,4) perm(1,3,3) perm(2,1,3) perm(1,4,2) perm(4,4,1) perm(2,4,3) perm(3,4,4)
%Answer: 5
%perm(3,1,1) perm(4,2,1) perm(1,2,3) perm(2,2,2) perm(3,2,4) perm(4,1,4) perm(1,1,2) perm(4,3,1) perm(2,3,2) perm(3,3,4) perm(1,3,3) perm(2,1,3) perm(1,4,1) perm(4,4,2) perm(2,4,3) perm(3,4,4)
%Answer: 6
%perm(1,1,1) perm(4,2,1) perm(1,2,3) perm(2,2,2) perm(3,2,4) perm(4,1,4) perm(3,1,2) perm(4,3,1) perm(2,3,2) perm(3,3,4) perm(1,3,3) perm(2,1,3) perm(1,4,2) perm(4,4,1) perm(2,4,3) perm(3,4,4)
%Answer: 7
%perm(1,1,1) perm(4,2,1) perm(1,2,3) perm(2,2,2) perm(3,2,4) perm(4,1,4) perm(3,1,2) perm(4,3,1) perm(2,3,2) perm(3,3,4) perm(1,3,3) perm(2,1,3) perm(1,4,1) perm(4,4,2) perm(2,4,3) perm(3,4,4)
%Answer: 8
%perm(3,1,1) perm(4,2,1) perm(1,2,3) perm(2,2,2) perm(3,2,4) perm(4,1,4) perm(1,1,2) perm(4,3,1) perm(2,3,3) perm(3,3,4) perm(1,3,2) perm(2,1,3) perm(1,4,2) perm(4,4,1) perm(2,4,3) perm(3,4,4)
%Answer: 9
%perm(3,1,1) perm(4,2,1) perm(1,2,3) perm(2,2,2) perm(3,2,4) perm(4,1,4) perm(1,1,2) perm(4,3,1) perm(2,3,3) perm(3,3,4) perm(1,3,2) perm(2,1,3) perm(1,4,1) perm(4,4,2) perm(2,4,3) perm(3,4,4)
%Answer: 10
%perm(1,1,1) perm(4,2,1) perm(1,2,3) perm(2,2,2) perm(3,2,4) perm(4,1,4) perm(3,1,2) perm(4,3,1) perm(2,3,3) perm(3,3,4) perm(1,3,2) perm(2,1,3) perm(1,4,2) perm(4,4,1) perm(2,4,3) perm(3,4,4)
%Answer: 11
%perm(1,1,1) perm(4,2,1) perm(1,2,3) perm(2,2,2) perm(3,2,4) perm(4,1,4) perm(3,1,2) perm(4,3,1) perm(2,3,3) perm(3,3,4) perm(1,3,2) perm(2,1,3) perm(1,4,1) perm(4,4,2) perm(2,4,3) perm(3,4,4)
%Answer: 12
%perm(1,1,1) perm(4,2,1) perm(1,2,3) perm(2,2,2) perm(3,2,4) perm(4,1,4) perm(3,1,2) perm(2,3,3) perm(1,3,1) perm(3,3,4) perm(4,3,2) perm(2,1,3) perm(1,4,2) perm(4,4,1) perm(2,4,3) perm(3,4,4)
%Answer: 13
%perm(1,1,1) perm(4,2,1) perm(1,2,3) perm(2,2,2) perm(3,2,4) perm(4,1,4) perm(3,1,2) perm(2,3,3) perm(1,3,1) perm(3,3,4) perm(4,3,2) perm(2,1,3) perm(1,4,1) perm(4,4,2) perm(2,4,3) perm(3,4,4)
