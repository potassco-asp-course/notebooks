% instance
            machine(1).      machine(2).
task(a). duration(a,1,3). duration(a,2,4).
task(b). duration(b,1,1). duration(b,2,6).
task(c). duration(c,1,5). duration(c,2,5).

% select a cycle
1 { cycle(T,U) : task(U), U != T } 1 :- task(T).
1 { cycle(T,U) : task(T), U != T } 1 :- task(U).

% make sure the cycle is connected
reach(M) :- M = #min { T : task(T) }.
reach(U) :- reach(T), cycle(T,U).
:- task(T), not reach(T).

% select a start
1 { start(T) : task(T) } 1.

% obtain an order
permutation(T,U) :- cycle(T,U), not start(U).

% place tasks sequentially on machines
seq((T,M),(T,M+1),D) :- task(T), duration(T,M,D), machine(M+1).
seq((T1,M),(T2,M),D) :- permutation(T1,T2), duration(T1,M,D).
%
&sum { T2; -T1 } >= D        :- seq(T1,T2,D).
&sum { (T,M) } >= 0          :- duration(T,M,D).
&sum { (T,M); -bound } <= -D :- duration(T,M,D).
&sum{ bound } = 16. % added bound of 16

% display
#show permutation/2.
