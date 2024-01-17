%
% Input:
%   #const n: the time steps range from 0 to n
%   edge(N1,N2): there is an (undirected) edge between nodes N1 and N2
%   robot(R,C,N): robot R is of class C and starts at node N
%   job(J,C,D): job J is of class C and its deadline is D 
%   operation(J,O,N): J's operation O takes place at node N (O >= 1)
%

#const n=18.
%
edge((X,Y),(X,Y+1)) :- X = (1;4;7), Y = 1..6. 
edge((X,Y),(X+1,Y)) :- X = 1..6, Y = (1;4;7).
%
robot(r1,c1,(1,1)). robot(r2,c1,(1,4)). robot(r3,c1,(1,7)). 
robot(r4,c1,(4,1)).                     robot(r5,c2,(4,7)). 
robot(r6,c2,(7,1)). robot(r7,c2,(7,4)). robot(r8,c2,(7,7)).
%
job(j1,c1,18).
  operation(j1,1,(1,7)).
  operation(j1,2,(7,7)).
  operation(j1,3,(7,1)).
job(j2,c1,18).
  operation(j2,1,(4,7)).
  operation(j2,2,(7,4)).
  operation(j2,3,(4,1)).
job(j3,c1,18).
  operation(j3,1,(7,7)).
  operation(j3,2,(7,1)).
  operation(j3,3,(1,1)).
job(j4,c1,18).
  operation(j4,1,(1,4)).
  operation(j4,2,(4,7)).
  operation(j4,3,(7,4)).
job(j5,c2,18).
  operation(j5,1,(7,4)).
  operation(j5,2,(4,1)).
  operation(j5,3,(1,4)).
job(j6,c2,18).
  operation(j6,1,(1,1)).
  operation(j6,2,(1,7)).
  operation(j6,3,(7,7)).
job(j7,c2,18).
  operation(j7,1,(4,1)).
  operation(j7,2,(1,4)).
  operation(j7,3,(4,7)).
job(j8,c2,18).
  operation(j8,1,(7,1)).
  operation(j8,2,(1,1)).
  operation(j8,3,(1,7)).
%
job(j9,c1,5). operation(j9,1,(4,4)). operation(j9,2,(2,4)).

