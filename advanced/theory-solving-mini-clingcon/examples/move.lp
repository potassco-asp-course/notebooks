#const end=3.
#const stepsize=10.
step(0..end).

% domain knowledge
&sum { at(T) } >= 0          :- step(T).
&sum { at(T) } <= T*stepsize :- step(T).

% initial state
&sum {at(0)} = 0.

% actions
{move(T)} :- step(T); T > 0.

% effects
&sum {at(T-1); stepsize; -at(T)} = 0 :- move(T).

% frame axiom
&sum {at(T-1); -at(T)} = 0 :- not move(T); step(T); step(T-1).

% goals
&sum {at(end)} >= 20.

% display
#show move/1.
