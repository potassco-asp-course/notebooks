% clingcon jobshop-con.lp instance.lp 0

% Your encoding for clingcon please...

% Use the variable bound to minimize the whole processing time
% &sum {  ... + ...*bound } <= .. :- ... .
&minimize { bound }.

#show.
