
% The earliest starting point of operation of job J on machine M is E
est(J,M,E) :- sequence(J,M,S), E = #sum{DD,MM,SS : sequence(J,MM,SS), SS<S, duration(J,MM,DD)}.

% Exclude answers that do not contain exactly one window
:- { window(I) } != 1.
    
% Select the operations of job J on machine M if it belongs to the current or previous time windows
select(J,M) :- est(J,M,E),
               Pos = #count{JJ,MM: est(JJ,MM,EE), EE<E},
               O   = #count{JJ,MM: duration(JJ,MM,DD)},
               window(I),
               Pos <= (I*O)/w.

% Exclude answers that schedule some operation that does not belong to the current or previous time windows            
:- perm(J,M,P), not select(J,M).            
            
        
% Your encoding please...            
        
    
#show perm/3.
