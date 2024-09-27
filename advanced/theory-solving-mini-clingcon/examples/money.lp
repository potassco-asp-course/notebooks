% letters
letter(s;e;n;d;m;o;r;y).

% letter values between 0 and 9
&sum {X} >= 0 :- letter(X).
&sum {X} <= 9 :- letter(X).

% equation must hold
&sum {             1000*s ;  100*e ;  10*n ;  1*d
     ;             1000*m ;  100*o ;  10*r ;  1*e
     ; -10000*m ; -1000*o ; -100*n ; -10*e ; -1*y } = 0.
&sum { m } > 0.

% distinct letter values
&sum { less(X,Y) } >= 0           :- letter(X), letter(Y), X < Y.
&sum { less(X,Y) } <= 1           :- letter(X), letter(Y), X < Y.
&sum { X; -Y; 10*less(X,Y) } >  0 :- letter(X), letter(Y), X < Y.
&sum { X; -Y; 10*less(X,Y) } < 10 :- letter(X), letter(Y), X < Y.

% display
#show.
