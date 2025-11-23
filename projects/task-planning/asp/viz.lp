%
% Task Plan Visualization
%

% input:
%   final/1
%   task/3
%   starts/2
%   assign/2

% graph
graph(taskplan).

% name of graph
attr(graph, taskplan, name, "Task Plan").

% global graph attributes
attr(graph, taskplan, nodesep, 1).
attr(graph, taskplan, newrank, true).

% global node attributes
attr(graph_nodes, taskplan, shape, square).
attr(graph_nodes, taskplan, style, filled).
attr(graph_nodes, taskplan, fillcolor, white).
attr(graph_nodes, taskplan, width, "1").
attr(graph_nodes, taskplan, fontsize, 18).
attr(graph_nodes, taskplan, fixedsize, true).
attr(graph_nodes, taskplan, penwidth, 2).

% auxiliary atoms 
     day(D) :- final(F), D=1..F.
    task(T) :- task(T,_,_).
max_task(M) :- M = #max{ T : task(T) }.
   run(T,D) :- task(T), final(F), D=1..F.


%
% schedule
% 

% nodes
node( taskday, taskplan).
node( task(T), taskplan) :- task(T). 
node(  day(D), taskplan) :- day(D).
node(run(T,D), taskplan) :- run(T,D).

% attribute pos
attr(node,  taskday, pos, @pos(0,  M+1)) :- max_task(M). 
attr(node,   day(D), pos, @pos(D,  M+1)) :- max_task(M), day(D).
attr(node,  task(T), pos, @pos(0,M-T+1)) :- max_task(M), task(T). 
attr(node, run(T,D), pos, @pos(D,M-T+1)) :- max_task(M), run(T,D).

% attribute label
attr(node,  taskday,    label, "Task/Day").
attr(node,  taskday, fontname, "Times-Bold").
attr(node,  taskday, fontsize, 16).
attr(node,   day(D),    label,  D) :- day(D).
attr(node,  task(T),    label,  T) :- task(T).
attr(node, run(T,D),    label, "") :- run(T,D).

% attribute color
attr(node,  taskday, fillcolor, "#F6E8C3").
attr(node,  task(T), fillcolor, "#F5D08C") :- task(T).
attr(node,   day(D), fillcolor, "#DCEBFT") :- day(D).
attr(node, run(T,D), fillcolor, "#CDE7D8") :- task(T,L,_), starts(T,S), day(D), S <= D <= S+L-1.


%
% workers
%

% auxiliary
 workers_count(T,N) :- task(T), N = { assign(T,W) }.
workers_offset(M/4) :- M = #max { N,T : workers_count(T,N); 8 }.

% nodes
node(workheader, taskplan).
node(workers(T), taskplan) :- task(T).

% attribute pos
attr(node, workheader, pos, @pos(F+O,   M+1)) :- workers_offset(O), max_task(M), final(F).
attr(node, workers(T), pos, @pos(F+O, M-T+1)) :- workers_offset(O), max_task(M), final(F), task(T).

% attribute label
attr(node, workheader, label, "Workers").
attr(node, workheader, fontname, "Times-Bold").
attr(node, workers(T), (label,wlist,W), W) :- task(T), assign(T,W).
attr(node, workers(T), label, L) :- task(T),
    L = "<{% set ws = wlist|default({}) %}{% for w in ws.values()|sort %}{{w}} {% endfor %}>".

% attribute shapes
attr(node, workheader, fixedsize,     false).
attr(node, workers(T), fixedsize,     false) :- task(T).
attr(node, workheader,    height,       "1").
attr(node, workers(T),    height,       "1") :- task(T).
attr(node, workheader,     shape, rectangle).
attr(node, workers(T),     shape, rectangle) :- task(T).
attr(node, workheader,     width,         O) :- workers_offset(O).
attr(node, workers(T),     width,         O) :- task(T), workers_offset(O).

% attribute color
attr(node, workheader, fillcolor, "#F9E4DF").
attr(node, workers(T), fillcolor, "#F9E4DF") :- task(T).

% #defined avoids warnings
#defined final/1.
#defined task/3.
#defined starts/2.
#defined assign/2. 

