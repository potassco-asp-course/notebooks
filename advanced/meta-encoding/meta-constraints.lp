
{conjunction(B)} :- literal_tuple(B).
{     hold(|L|)} :- literal_tuple(B,L).
{     hold( A )} :- atom_tuple(H,A).

% Add the constraints here...
    
#show.
#show T : output(T,B), conjunction(B).
