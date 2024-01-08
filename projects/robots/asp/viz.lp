%
% Command: 
%   clingo robots.lp <instance> viz_show.lp -t4 -q1,1,2 --outf=2 | clingraph --viz-encoding=viz.lp --out=animate --sort=asc-int --engine=neato --prefix=viz_ --name-format model-{model_number} --dir gifs/<instance>
%

%
% Input: at/3, edge/2, robot/3, job/3, operation/3 
%

% auxiliary definitions
time(T) :- at(R,X,T).
node(X) :- edge(X,Y).
node(X) :- edge(Y,X).
robot(R) :- robot(R,L,T).

% node X is free at step T
free(X,T) :- node(X), time(T), not at(_,X,T).

% dtime: double time 
% dtime(0): shows state at time 0 and next movement
% dtime(1): shows state at time 1
% dtime(2): shows state at time 1 and next movement
% ...
dtime(0..2*T) :- time(T), not time(T+1).
% map original time to double time: 
% * 0->0, 1->1, 1->2, 2->3, 2->4, ...
 map(T,2*T  ) :- time(T).
 map(T,2*T-1) :- time(T),     time(T-1).

% graphs and their general properties
viz_graph(T) :- dtime(T).
viz_attr(graph,G,nodesep,1):- viz_graph(G).
viz_attr(graph_nodes,G,    width,   "0.5"):- viz_graph(G).
viz_attr(graph_nodes,G,fixedsize, "shape"):- viz_graph(G).
viz_attr(graph_nodes,G,    style,"filled"):- viz_graph(G).
viz_attr(graph_nodes,G, fontsize,      10):- viz_graph(G).

% viz_nodes (at double time)
viz_node((X,T),T) :- node(X), dtime(T).

% viz_edges
_edge(X,Y) :- edge(X,Y), X < Y.
%
viz_edge(((X,T),(Y,T)),T)                   :- _edge(X,Y), dtime(T).
viz_attr(edge,((X,T),(Y,T)),arrowhead,open) :- _edge(X,Y), dtime(T).
viz_attr(edge,((X,T),(Y,T)),arrowtail,open) :- _edge(X,Y), dtime(T).
%
% add arrows to represent movements
dir(X,Y,T-1) :- at(R,X,T-1), at(R,Y,T), X != Y.
%
viz_attr(edge,((X,DT),(Y,DT)),dir,forward) :- dir(X,Y,T), X < Y, DT=2*T. 
viz_attr(edge,((Y,DT),(X,DT)),dir,   back) :- dir(X,Y,T), Y < X, DT=2*T. 
viz_attr(edge,((X,DT),(Y,DT)),dir,   none) :- _edge(X,Y), time(T), DT=2*T, not dir(X,Y,T), not dir(Y,X,T).
viz_attr(edge,((X,DT),(Y,DT)),dir,   none) :- _edge(X,Y), time(T), time(T+1), DT=2*T+1. 

% label nodes with robots using their ids and their types
viz_attr(node,(X,DT),label,@concat(R," ",C)) :- at(R,X,T), map(T,DT), robot(R,C,_). 
% the other nodes have no label
viz_attr(node,(X,DT),label,"") :- free(X,T), map(T,DT).

% additional label with node numbers
viz_attr(node,(X,DT),xlabel,X) :- node(X), map(T,DT). 

% shapes
viz_attr(node,(X,DT),shape,"circle") :- node(X), map(T,DT).

% colors 
viz_attr(node,(X,DT),  fillcolor,   white) :- free(X,T), map(T,DT). 
viz_attr(node,(X,DT),colorscheme,"blues9") :- at(R,X,T), map(T,DT).
% order robots alphabetically
robot_order(R,O) :- robot(R), O = { robot(RR) : RR >= R }.
viz_attr(node,(X,DT),  fillcolor,     O+1) :- at(R,X,T), map(T,DT), robot_order(R,O).

% penwidth
viz_attr(node,(X,DT),penwidth,1) :- free(X,T), map(T,DT).
viz_attr(node,(X,DT),penwidth,2) :- at(R,X,T), map(T,DT). 

% STEP node
viz_node((time,T),T) :- dtime(T).
viz_attr(node,(time,T),fillcolor,yellow) :- dtime(T).
viz_attr(node,(time,T), penwidth,    2) :- dtime(T).
viz_attr(node,(time,T),    label,@concat("STEP: ",(T+1)/2)) :- dtime(T).
viz_attr(node,(time,T),  shape,rectangle) :- dtime(T).
viz_attr(node,(time,T),  fontsize,14) :- dtime(T).
viz_attr(node,(time,T),  width, "1") :- dtime(T).

% JOBS node
viz_node((jobs,T),T) :- dtime(T).
viz_attr(node,(jobs,T),fixedsize,false) :- dtime(T).
viz_attr(node,(jobs,T),   margin,"0.15") :- dtime(T).
viz_attr(node,(jobs,T),    shape,rectangle) :- dtime(T).
viz_attr(node,(jobs,T),fillcolor,lightgreen) :- dtime(T).
% order jobs alphabetically
job_order(J,O) :- job(J,_,_), O = { job(JJ,_,_) : JJ >= J }.
% add labels
viz_attr(node, (jobs,T), label, "<JOBS:<br/>{% for k, n in jobids.items() %}{{n}}<br/>{% endfor %}>") :- dtime(T).
viz_attr(node, (jobs,T), (label,jobids,O), @concat(J," ",C," ",D)) :- dtime(T), job(J,C,D), job_order(J,O).

% OPERATION nodes
viz_node((op(J,O,N),T),T) :- job(J,C,D), operation(J,O,N), dtime(T).
% format node
viz_attr(node,(op(J,O,N),T),    width,       "0.6") :- job(J,C,D), operation(J,O,N), dtime(T).
viz_attr(node,(op(J,O,N),T),    shape, rectangle) :- job(J,C,D), operation(J,O,N), dtime(T).
viz_attr(node,(op(J,O,N),T),fillcolor,lightgreen) :- job(J,C,D), operation(J,O,N), dtime(T).
% add label
viz_attr(node,(op(J,O,N),T),label,"{{job}} o{{operation}}") :- job(J,C,D), operation(J,O,N), dtime(T).
viz_attr(node,(op(J,O,N),T),(label,      job),J)            :- job(J,C,D), operation(J,O,N), dtime(T).
viz_attr(node,(op(J,O,N),T),(label,operation),O)            :- job(J,C,D), operation(J,O,N), dtime(T).
% connect to node
viz_edge(((N,T),(op(J,O,N),T)),T) :- job(J,C,D), operation(J,O,N), dtime(T).
% no arrows
viz_attr(edge,((N,T),(op(J,O,N),T)),arrowhead,none) :- job(J,C,D), operation(J,O,N), dtime(T).
viz_attr(edge,((N,T),(op(J,O,N),T)),arrowtail,none) :- job(J,C,D), operation(J,O,N), dtime(T).

