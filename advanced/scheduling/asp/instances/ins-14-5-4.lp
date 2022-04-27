job(1..5). machine(1..4).
duration(1,1,5).
duration(1,2,9).
duration(1,3,9).
duration(1,4,5).
duration(2,1,6).
duration(2,2,6).
duration(2,3,8).
duration(2,4,4).
duration(3,1,8).
duration(3,2,5).
duration(3,3,1).
duration(3,4,9).
duration(4,1,8).
duration(4,2,4).
duration(4,3,5).
duration(4,4,9).
duration(5,1,8).
duration(5,2,7).
duration(5,3,3).
duration(5,4,5).
sequence(1,1,3).
sequence(1,2,4).
sequence(1,3,2).
sequence(1,4,1).
sequence(2,1,3).
sequence(2,2,1).
sequence(2,3,4).
sequence(2,4,2).
sequence(3,1,2).
sequence(3,2,1).
sequence(3,3,4).
sequence(3,4,3).
sequence(4,1,3).
sequence(4,2,4).
sequence(4,3,2).
sequence(4,4,1).
sequence(5,1,4).
sequence(5,2,2).
sequence(5,3,1).
sequence(5,4,3).


%
% Permutation Flow Shop Problem
%
%Answer: 1
%perm(4,1) perm(1,2) perm(2,5) perm(3,4) perm(5,3)
%Answer: 2
%perm(3,1) perm(1,2) perm(2,5) perm(4,4) perm(5,3)
%Answer: 3
%perm(3,1) perm(1,2) perm(2,5) perm(4,3) perm(5,4)
%Answer: 4
%perm(4,1) perm(1,2) perm(2,5) perm(3,3) perm(5,4)
%Answer: 5
%perm(3,1) perm(1,2) perm(2,4) perm(4,3) perm(5,5)
%Answer: 6
%perm(4,1) perm(1,2) perm(2,4) perm(3,3) perm(5,5)


%
% Job Shop Problem
%
%Answer: 1
%perm(1,4,1) perm(3,2,1) perm(5,3,1) perm(2,3,5) perm(3,3,4) perm(4,3,3) perm(2,4,4) perm(4,2,4) perm(5,2,3) perm(1,2,5) perm(2,2,2) perm(3,4,3) perm(4,4,2) perm(3,1,1) perm(1,3,2) perm(5,4,5) perm(2,1,4) perm(1,1,2) perm(4,1,3) perm(5,1,5)
%Answer: 2
%perm(1,4,1) perm(3,2,1) perm(5,3,1) perm(2,3,5) perm(3,3,4) perm(4,3,3) perm(2,4,4) perm(4,2,5) perm(5,2,3) perm(1,2,4) perm(2,2,2) perm(3,4,3) perm(4,4,2) perm(3,1,1) perm(1,3,2) perm(5,4,5) perm(2,1,4) perm(1,1,2) perm(4,1,3) perm(5,1,5)
%Answer: 3
%perm(1,4,1) perm(3,2,1) perm(5,3,1) perm(2,3,5) perm(3,3,4) perm(4,3,3) perm(2,4,3) perm(4,2,4) perm(5,2,3) perm(1,2,5) perm(2,2,2) perm(3,4,5) perm(4,4,2) perm(3,1,1) perm(1,3,2) perm(5,4,4) perm(2,1,4) perm(1,1,2) perm(4,1,3) perm(5,1,5)
%Answer: 4
%perm(1,4,1) perm(3,2,1) perm(5,3,1) perm(2,3,5) perm(3,3,4) perm(4,3,3) perm(2,4,3) perm(4,2,4) perm(5,2,3) perm(1,2,5) perm(2,2,2) perm(3,4,4) perm(4,4,2) perm(3,1,1) perm(1,3,2) perm(5,4,5) perm(2,1,4) perm(1,1,2) perm(4,1,3) perm(5,1,5)
%Answer: 5
%perm(1,4,1) perm(3,2,1) perm(5,3,1) perm(2,3,5) perm(3,3,4) perm(4,3,3) perm(2,4,3) perm(4,2,5) perm(5,2,3) perm(1,2,4) perm(2,2,2) perm(3,4,5) perm(4,4,2) perm(3,1,1) perm(1,3,2) perm(5,4,4) perm(2,1,4) perm(1,1,2) perm(4,1,3) perm(5,1,5)
%Answer: 6
%perm(1,4,1) perm(3,2,1) perm(5,3,1) perm(2,3,5) perm(3,3,4) perm(4,3,3) perm(2,4,3) perm(4,2,5) perm(5,2,3) perm(1,2,4) perm(2,2,2) perm(3,4,4) perm(4,4,2) perm(3,1,1) perm(1,3,2) perm(5,4,5) perm(2,1,4) perm(1,1,2) perm(4,1,3) perm(5,1,5)
%Answer: 7
%perm(1,4,1) perm(3,2,1) perm(5,3,1) perm(2,3,5) perm(3,3,4) perm(4,3,3) perm(2,4,4) perm(4,2,4) perm(5,2,2) perm(1,2,5) perm(2,2,3) perm(3,4,3) perm(4,4,2) perm(3,1,1) perm(1,3,2) perm(5,4,5) perm(2,1,4) perm(1,1,2) perm(4,1,3) perm(5,1,5)
%Answer: 8
%perm(1,4,1) perm(3,2,1) perm(5,3,1) perm(2,3,5) perm(3,3,4) perm(4,3,3) perm(2,4,4) perm(4,2,5) perm(5,2,2) perm(1,2,4) perm(2,2,3) perm(3,4,3) perm(4,4,2) perm(3,1,1) perm(1,3,2) perm(5,4,5) perm(2,1,4) perm(1,1,2) perm(4,1,3) perm(5,1,5)
%Answer: 9
%perm(1,4,1) perm(3,2,1) perm(5,3,1) perm(2,3,5) perm(3,3,4) perm(4,3,3) perm(2,4,4) perm(4,2,4) perm(5,2,2) perm(1,2,5) perm(2,2,3) perm(3,4,5) perm(4,4,2) perm(3,1,1) perm(1,3,2) perm(5,4,3) perm(2,1,4) perm(1,1,2) perm(4,1,3) perm(5,1,5)
%Answer: 10
%perm(1,4,1) perm(3,2,1) perm(5,3,1) perm(2,3,5) perm(3,3,4) perm(4,3,3) perm(2,4,4) perm(4,2,5) perm(5,2,2) perm(1,2,4) perm(2,2,3) perm(3,4,5) perm(4,4,2) perm(3,1,1) perm(1,3,2) perm(5,4,3) perm(2,1,4) perm(1,1,2) perm(4,1,3) perm(5,1,5)
%Answer: 11
%perm(1,4,1) perm(3,2,1) perm(2,3,5) perm(3,3,4) perm(4,3,3) perm(2,4,3) perm(4,2,5) perm(5,2,3) perm(1,2,4) perm(2,2,2) perm(3,4,4) perm(4,4,2) perm(3,1,1) perm(1,3,1) perm(5,3,2) perm(5,4,5) perm(2,1,3) perm(1,1,2) perm(4,1,4) perm(5,1,5)
%Answer: 12
%perm(1,4,1) perm(3,2,1) perm(2,3,4) perm(3,3,5) perm(4,3,3) perm(2,4,3) perm(4,2,5) perm(5,2,3) perm(1,2,4) perm(2,2,2) perm(3,4,4) perm(4,4,2) perm(3,1,1) perm(1,3,1) perm(5,3,2) perm(5,4,5) perm(2,1,3) perm(1,1,2) perm(4,1,4) perm(5,1,5)
%Answer: 13
%perm(1,4,1) perm(3,2,1) perm(2,3,4) perm(3,3,5) perm(4,3,3) perm(2,4,3) perm(4,2,5) perm(5,2,3) perm(1,2,4) perm(2,2,2) perm(3,4,5) perm(4,4,2) perm(3,1,1) perm(1,3,1) perm(5,3,2) perm(5,4,4) perm(2,1,3) perm(1,1,2) perm(4,1,4) perm(5,1,5)
%Answer: 14
%perm(1,4,1) perm(3,2,1) perm(5,3,1) perm(2,3,5) perm(3,3,4) perm(4,3,3) perm(2,4,3) perm(4,2,5) perm(5,2,3) perm(1,2,4) perm(2,2,2) perm(3,4,5) perm(4,4,2) perm(3,1,1) perm(1,3,2) perm(5,4,4) perm(2,1,3) perm(1,1,2) perm(4,1,4) perm(5,1,5)
%Answer: 15
%perm(1,4,1) perm(3,2,1) perm(5,3,1) perm(2,3,5) perm(3,3,4) perm(4,3,3) perm(2,4,3) perm(4,2,5) perm(5,2,3) perm(1,2,4) perm(2,2,2) perm(3,4,4) perm(4,4,2) perm(3,1,1) perm(1,3,2) perm(5,4,5) perm(2,1,3) perm(1,1,2) perm(4,1,4) perm(5,1,5)
%Answer: 16
%perm(1,4,1) perm(3,2,1) perm(5,3,1) perm(2,3,4) perm(3,3,5) perm(4,3,3) perm(2,4,3) perm(4,2,5) perm(5,2,3) perm(1,2,4) perm(2,2,2) perm(3,4,5) perm(4,4,2) perm(3,1,1) perm(1,3,2) perm(5,4,4) perm(2,1,3) perm(1,1,2) perm(4,1,4) perm(5,1,5)
%Answer: 17
%perm(1,4,1) perm(3,2,1) perm(5,3,1) perm(2,3,4) perm(3,3,5) perm(4,3,3) perm(2,4,3) perm(4,2,5) perm(5,2,3) perm(1,2,4) perm(2,2,2) perm(3,4,4) perm(4,4,2) perm(3,1,1) perm(1,3,2) perm(5,4,5) perm(2,1,3) perm(1,1,2) perm(4,1,4) perm(5,1,5)
