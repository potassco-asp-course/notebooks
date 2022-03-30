job(1..3). machine(1..2).
duration(1,1,4).
duration(1,2,1).
duration(2,1,2).
duration(2,2,5).
duration(3,1,2).
duration(3,2,8).
sequence(1,1,2).
sequence(1,2,1).
sequence(2,1,2).
sequence(2,2,1).
sequence(3,1,2).
sequence(3,2,1).


%
% Permutation Flow Shop Problem
%
%Answer: 1
%perm(2,1) perm(1,3) perm(3,2)
%Answer: 2
%perm(2,1) perm(1,2) perm(3,3)
%Answer: 3
%perm(3,1) perm(1,3) perm(2,2)
%Answer: 4
%perm(3,1) perm(1,2) perm(2,3)


%
% Job Shop Problem
%
%Answer: 1
%perm(1,2,1) perm(2,2,3) perm(3,2,2) perm(3,1,2) perm(2,1,3) perm(1,1,1)
%Answer: 2
%perm(3,2,1) perm(1,2,2) perm(2,2,3) perm(3,1,1) perm(2,1,3) perm(1,1,2)
%Answer: 3
%perm(2,2,1) perm(1,2,2) perm(3,2,3) perm(3,1,3) perm(2,1,1) perm(1,1,2)
%Answer: 4
%perm(1,2,1) perm(2,2,2) perm(3,2,3) perm(3,1,3) perm(2,1,1) perm(1,1,2)
%Answer: 5
%perm(2,2,1) perm(1,2,2) perm(3,2,3) perm(3,1,3) perm(2,1,2) perm(1,1,1)
%Answer: 6
%perm(1,2,1) perm(2,2,2) perm(3,2,3) perm(3,1,3) perm(2,1,2) perm(1,1,1)
