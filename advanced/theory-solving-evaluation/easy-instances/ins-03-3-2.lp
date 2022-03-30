job(1..3). machine(1..2).
duration(1,1,5).
duration(1,2,5).
duration(2,1,3).
duration(2,2,8).
duration(3,1,6).
duration(3,2,6).
sequence(1,1,1).
sequence(1,2,2).
sequence(2,1,2).
sequence(2,2,1).
sequence(3,1,1).
sequence(3,2,2).


%
% Permutation Flow Shop Problem
%
%Answer: 1
%perm(2,1) perm(1,3) perm(3,2)
%Answer: 2
%perm(2,1) perm(1,2) perm(3,3)


%
% Job Shop Problem
%
%Answer: 1
%perm(2,2,1) perm(3,1,1) perm(1,1,2) perm(3,2,2) perm(1,2,3) perm(2,1,3)
%Answer: 2
%perm(1,1,1) perm(2,2,1) perm(3,2,3) perm(1,2,2) perm(3,1,2) perm(2,1,3)
