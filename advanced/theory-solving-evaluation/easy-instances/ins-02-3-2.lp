job(1..3). machine(1..2).
duration(1,1,8).
duration(1,2,2).
duration(2,1,7).
duration(2,2,6).
duration(3,1,7).
duration(3,2,6).
sequence(1,1,2).
sequence(1,2,1).
sequence(2,1,1).
sequence(2,2,2).
sequence(3,1,2).
sequence(3,2,1).


%
% Permutation Flow Shop Problem
%
%Answer: 1
%perm(3,1) perm(1,3) perm(2,2)
%Answer: 2
%perm(2,1) perm(1,3) perm(3,2)


%
% Job Shop Problem
%
%Answer: 1
%perm(2,1,1) perm(3,2,1) perm(1,2,2) perm(3,1,2) perm(1,1,3) perm(2,2,3)
%Answer: 2
%perm(1,2,1) perm(2,1,1) perm(3,1,3) perm(1,1,2) perm(3,2,2) perm(2,2,3)
