job(1..5). machine(1..3).
duration(1,1,4).
duration(1,2,8).
duration(1,3,1).
duration(2,1,9).
duration(2,2,2).
duration(2,3,7).
duration(3,1,3).
duration(3,2,6).
duration(3,3,8).
duration(4,1,1).
duration(4,2,5).
duration(4,3,3).
duration(5,1,3).
duration(5,2,5).
duration(5,3,7).
sequence(1,1,2).
sequence(1,2,1).
sequence(1,3,3).
sequence(2,1,1).
sequence(2,2,3).
sequence(2,3,2).
sequence(3,1,1).
sequence(3,2,2).
sequence(3,3,3).
sequence(4,1,1).
sequence(4,2,3).
sequence(4,3,2).
sequence(5,1,1).
sequence(5,2,2).
sequence(5,3,3).


%
% Permutation Flow Shop Problem
%
%Answer: 1
%perm(4,1) perm(1,5) perm(2,3) perm(3,4) perm(5,2)
%Answer: 2
%perm(5,1) perm(1,5) perm(2,3) perm(3,4) perm(4,2)
%Answer: 3
%perm(5,1) perm(1,5) perm(2,3) perm(3,2) perm(4,4)
%Answer: 4
%perm(4,1) perm(1,4) perm(2,5) perm(3,3) perm(5,2)
%Answer: 5
%perm(4,1) perm(1,5) perm(2,4) perm(3,3) perm(5,2)
%Answer: 6
%perm(5,1) perm(1,5) perm(2,4) perm(3,2) perm(4,3)
%Answer: 7
%perm(5,1) perm(1,3) perm(2,4) perm(3,2) perm(4,5)
%Answer: 8
%perm(5,1) perm(1,5) perm(2,2) perm(3,4) perm(4,3)


%
% Job Shop Problem
%
%Answer: 1
%perm(5,1,1) perm(1,1,5) perm(2,1,3) perm(3,1,4) perm(4,1,2) perm(2,2,5) perm(3,2,3) perm(4,2,4) perm(5,2,1) perm(4,3,1) perm(2,3,3) perm(3,3,4) perm(5,3,2) perm(1,3,5) perm(1,2,2)
%Answer: 2
%perm(5,1,1) perm(1,1,5) perm(2,1,3) perm(3,1,4) perm(4,1,2) perm(2,2,4) perm(3,2,3) perm(4,2,5) perm(5,2,1) perm(4,3,1) perm(2,3,3) perm(3,3,4) perm(5,3,2) perm(1,3,5) perm(1,2,2)
%Answer: 3
%perm(5,1,1) perm(1,1,5) perm(2,1,3) perm(3,1,4) perm(4,1,2) perm(2,2,5) perm(3,2,3) perm(4,2,4) perm(5,2,1) perm(4,3,1) perm(2,3,3) perm(3,3,5) perm(5,3,2) perm(1,3,4) perm(1,2,2)
%Answer: 4
%perm(5,1,1) perm(1,1,5) perm(2,1,3) perm(3,1,4) perm(4,1,2) perm(2,2,4) perm(3,2,3) perm(4,2,5) perm(5,2,1) perm(4,3,1) perm(2,3,3) perm(3,3,5) perm(5,3,2) perm(1,3,4) perm(1,2,2)
