% %%%%%%%%%%%%%%%%%%%%%%%%% Visualization
viz_graph(shift).

% Name of graph
viz_attr(graph, shift, name, "Shift").

% Global graph attributes
viz_attr(graph, shift, nodesep, 1).
viz_attr(graph, shift, newrank, true).

% Global node attributes
viz_attr(graph_nodes, shift, shape, square).
viz_attr(graph_nodes, shift, style, filled).
viz_attr(graph_nodes, shift, fillcolor, white).
viz_attr(graph_nodes, shift, width, "1").
viz_attr(graph_nodes, shift, fontsize, 25).

% Auxiliary predicates
max(S,L,ME) :- shift(S,L,_,_), ME = #max{ E : shift(S,L,_,E) }.
top(T) :- T = #max{ E : emp(_,_,E); SE }, SE = #sum{ ME,S,L : max(S,L,ME) }.
cell(D,S,X) :- day(D), slot(S), top(T), X=0..T.

% Nodes
viz_node((D,S,X),shift):- cell(D,S,X). 
viz_attr(node,(D,S,1..E), fillcolor,"gray"):- emp(D,S,E). % comment this rule for the Extension
viz_attr(node, (D,S,X), pos, @pos(S+((D-1)*MS),X)):- cell(D,S,X), slot(MS), not slot(MS+1). % day(D), slot(S), slot(MS), not slot(MS+1). 
viz_attr(node,(D,S,X),shape,plaintext) :- cell(D,S,X), X=0.

% Labels 
label((D,S,X),S) :- cell(D,S,X), X=0.
% label((D,S,1..E),"*"):- emp(D,S,E).              % uncomment this rule for the Extension
label((D,S,1),@concat(L,":",E)) :- shift(S,L,D,E). %   comment this rule for the Extension
viz_attr(node,(D,S,X),label, L) :- label((D,S,X),L).
viz_attr(node,(D,S,X),label,"") :- cell(D,S,X), not label((D,S,X),_). 


%
% Extension: define predicate paint/5
%

%*
order((S,L),O) :- shift(S,L,_,_), O = #count{ (SS,LL) : shift(SS,LL,_,_), (SS,LL) <= (S,L) }.
paint(D,S,X,C) :- ...                            % define this for the Extension
viz_attr(node,(D,S,X), fillcolor,C):- paint(D,S,X,C). 

colororder(1,red).
colororder(2,orange).
colororder(3,yellow).
colororder(4,green).
colororder(5,blue).
colororder(6,indigo).
colororder(0,violet).
%
maxcolororder(7).
*%

