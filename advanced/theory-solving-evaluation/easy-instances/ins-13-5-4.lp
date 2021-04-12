job(1..5). machine(1..4).
duration(1,1,1).
duration(1,2,7).
duration(1,3,4).
duration(1,4,3).
duration(2,1,7).
duration(2,2,7).
duration(2,3,9).
duration(2,4,7).
duration(3,1,2).
duration(3,2,3).
duration(3,3,2).
duration(3,4,7).
duration(4,1,9).
duration(4,2,5).
duration(4,3,5).
duration(4,4,4).
duration(5,1,4).
duration(5,2,1).
duration(5,3,5).
duration(5,4,4).
sequence(1,1,4).
sequence(1,2,3).
sequence(1,3,1).
sequence(1,4,2).
sequence(2,1,2).
sequence(2,2,3).
sequence(2,3,1).
sequence(2,4,4).
sequence(3,1,2).
sequence(3,2,1).
sequence(3,3,3).
sequence(3,4,4).
sequence(4,1,3).
sequence(4,2,4).
sequence(4,3,1).
sequence(4,4,2).
sequence(5,1,2).
sequence(5,2,4).
sequence(5,3,3).
sequence(5,4,1).


%
% Permutation Flow Shop Problem
%
%Answer: 1
%perm(3,1) perm(1,3) perm(2,4) perm(4,5) perm(5,2)
%Answer: 2
%perm(3,1) perm(1,2) perm(2,4) perm(4,5) perm(5,3)
%Answer: 3
%perm(1,1) perm(2,4) perm(3,3) perm(4,5) perm(5,2)
%Answer: 4
%perm(1,1) perm(2,4) perm(3,2) perm(4,5) perm(5,3)


%
% Job Shop Problem
%
%Answer: 1
%perm(2,3,1) perm(3,2,1) perm(5,4,1) perm(1,4,3) perm(3,4,4) perm(1,3,3) perm(3,3,4) perm(4,2,5) perm(5,2,4) perm(2,2,2) perm(4,3,2) perm(5,3,5) perm(5,1,1) perm(4,4,2) perm(3,1,3) perm(2,1,2) perm(4,1,4) perm(1,1,5) perm(2,4,5) perm(1,2,3)
%Answer: 2
%perm(2,3,1) perm(3,2,1) perm(5,4,1) perm(1,4,3) perm(3,4,4) perm(1,3,3) perm(3,3,4) perm(4,2,5) perm(5,2,4) perm(2,2,2) perm(4,3,2) perm(5,3,5) perm(5,1,2) perm(4,4,2) perm(3,1,1) perm(2,1,3) perm(4,1,4) perm(1,1,5) perm(2,4,5) perm(1,2,3)
%Answer: 3
%perm(2,3,1) perm(3,2,1) perm(5,4,1) perm(1,4,3) perm(3,4,4) perm(1,3,3) perm(3,3,4) perm(4,2,5) perm(5,2,4) perm(2,2,2) perm(4,3,2) perm(5,3,5) perm(5,1,3) perm(4,4,2) perm(3,1,1) perm(2,1,2) perm(4,1,4) perm(1,1,5) perm(2,4,5) perm(1,2,3)
%Answer: 4
%perm(2,3,1) perm(3,2,1) perm(5,4,1) perm(1,4,3) perm(3,4,4) perm(1,3,3) perm(3,3,4) perm(4,2,5) perm(5,2,4) perm(2,2,2) perm(4,3,2) perm(5,3,5) perm(5,1,3) perm(4,4,2) perm(3,1,2) perm(2,1,1) perm(4,1,4) perm(1,1,5) perm(2,4,5) perm(1,2,3)
%Answer: 5
%perm(2,3,1) perm(3,2,1) perm(5,4,1) perm(1,4,3) perm(3,4,4) perm(1,3,3) perm(3,3,4) perm(4,2,4) perm(5,2,5) perm(2,2,2) perm(4,3,2) perm(5,3,5) perm(5,1,3) perm(4,4,2) perm(3,1,1) perm(2,1,2) perm(4,1,4) perm(1,1,5) perm(2,4,5) perm(1,2,3)
%Answer: 6
%perm(2,3,1) perm(3,2,1) perm(5,4,1) perm(1,4,3) perm(3,4,4) perm(1,3,3) perm(3,3,4) perm(4,2,4) perm(5,2,5) perm(2,2,2) perm(4,3,2) perm(5,3,5) perm(5,1,1) perm(4,4,2) perm(3,1,3) perm(2,1,2) perm(4,1,4) perm(1,1,5) perm(2,4,5) perm(1,2,3)
%Answer: 7
%perm(2,3,1) perm(3,2,1) perm(5,4,1) perm(1,4,3) perm(3,4,4) perm(1,3,3) perm(3,3,4) perm(4,2,4) perm(5,2,5) perm(2,2,2) perm(4,3,2) perm(5,3,5) perm(5,1,2) perm(4,4,2) perm(3,1,1) perm(2,1,3) perm(4,1,4) perm(1,1,5) perm(2,4,5) perm(1,2,3)
%Answer: 8
%perm(2,3,1) perm(3,2,1) perm(5,4,1) perm(1,4,2) perm(3,4,4) perm(1,3,2) perm(3,3,4) perm(4,2,5) perm(5,2,4) perm(2,2,2) perm(4,3,3) perm(5,3,5) perm(5,1,1) perm(4,4,3) perm(3,1,3) perm(2,1,2) perm(4,1,4) perm(1,1,5) perm(2,4,5) perm(1,2,3)
%Answer: 9
%perm(2,3,1) perm(3,2,1) perm(5,4,1) perm(1,4,2) perm(3,4,4) perm(1,3,2) perm(3,3,4) perm(4,2,5) perm(5,2,4) perm(2,2,2) perm(4,3,3) perm(5,3,5) perm(5,1,2) perm(4,4,3) perm(3,1,1) perm(2,1,3) perm(4,1,4) perm(1,1,5) perm(2,4,5) perm(1,2,3)
%Answer: 10
%perm(2,3,1) perm(3,2,1) perm(5,4,1) perm(1,4,2) perm(3,4,4) perm(1,3,2) perm(3,3,4) perm(4,2,5) perm(5,2,4) perm(2,2,2) perm(4,3,3) perm(5,3,5) perm(5,1,3) perm(4,4,3) perm(3,1,1) perm(2,1,2) perm(4,1,4) perm(1,1,5) perm(2,4,5) perm(1,2,3)
%Answer: 11
%perm(2,3,1) perm(3,2,1) perm(5,4,1) perm(1,4,2) perm(3,4,4) perm(1,3,2) perm(3,3,4) perm(4,2,5) perm(5,2,4) perm(2,2,2) perm(4,3,3) perm(5,3,5) perm(5,1,3) perm(4,4,3) perm(3,1,2) perm(2,1,1) perm(4,1,4) perm(1,1,5) perm(2,4,5) perm(1,2,3)
%Answer: 12
%perm(1,3,1) perm(3,2,1) perm(5,4,1) perm(1,4,2) perm(3,4,4) perm(2,3,2) perm(3,3,4) perm(4,2,5) perm(5,2,4) perm(2,2,3) perm(4,3,3) perm(5,3,5) perm(5,1,1) perm(4,4,3) perm(3,1,2) perm(2,1,3) perm(4,1,4) perm(1,1,5) perm(2,4,5) perm(1,2,2)
%Answer: 13
%perm(1,3,1) perm(3,2,1) perm(5,4,1) perm(1,4,2) perm(3,4,4) perm(2,3,2) perm(3,3,4) perm(4,2,5) perm(5,2,4) perm(2,2,3) perm(4,3,3) perm(5,3,5) perm(5,1,1) perm(4,4,3) perm(3,1,2) perm(2,1,3) perm(4,1,5) perm(1,1,4) perm(2,4,5) perm(1,2,2)
%Answer: 14
%perm(1,3,1) perm(3,2,1) perm(5,4,1) perm(1,4,2) perm(3,4,4) perm(2,3,2) perm(3,3,4) perm(4,2,5) perm(5,2,4) perm(2,2,3) perm(4,3,3) perm(5,3,5) perm(5,1,1) perm(4,4,3) perm(3,1,2) perm(2,1,4) perm(4,1,5) perm(1,1,3) perm(2,4,5) perm(1,2,2)
%Answer: 15
%perm(1,3,1) perm(3,2,1) perm(5,4,1) perm(1,4,2) perm(3,4,4) perm(2,3,2) perm(3,3,4) perm(4,2,5) perm(5,2,4) perm(2,2,3) perm(4,3,3) perm(5,3,5) perm(5,1,2) perm(4,4,3) perm(3,1,1) perm(2,1,3) perm(4,1,4) perm(1,1,5) perm(2,4,5) perm(1,2,2)
%Answer: 16
%perm(1,3,1) perm(3,2,1) perm(5,4,1) perm(1,4,2) perm(3,4,4) perm(2,3,2) perm(3,3,4) perm(4,2,5) perm(5,2,4) perm(2,2,3) perm(4,3,3) perm(5,3,5) perm(5,1,2) perm(4,4,3) perm(3,1,1) perm(2,1,3) perm(4,1,5) perm(1,1,4) perm(2,4,5) perm(1,2,2)
%Answer: 17
%perm(1,3,1) perm(3,2,1) perm(1,4,1) perm(3,4,4) perm(2,3,2) perm(3,3,4) perm(4,2,5) perm(5,2,4) perm(2,2,3) perm(4,3,3) perm(5,3,5) perm(5,1,2) perm(4,4,3) perm(3,1,1) perm(2,1,3) perm(4,1,4) perm(1,1,5) perm(5,4,2) perm(2,4,5) perm(1,2,2)
%Answer: 18
%perm(1,3,1) perm(3,2,1) perm(5,4,1) perm(1,4,2) perm(3,4,4) perm(2,3,2) perm(3,3,4) perm(4,2,5) perm(5,2,4) perm(2,2,3) perm(4,3,3) perm(5,3,5) perm(5,1,2) perm(4,4,3) perm(3,1,1) perm(2,1,4) perm(4,1,5) perm(1,1,3) perm(2,4,5) perm(1,2,2)
