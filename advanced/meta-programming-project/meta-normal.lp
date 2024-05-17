
conjunction(B) :- literal_tuple(B),
        hold(L) : literal_tuple(B, L), L > 0;
    not hold(L) : literal_tuple(B,-L), L > 0.

body(normal(B)) :- rule(_,normal(B)), conjunction(B).
    
%
% Replace this rule:
%
% body(sum(B,G))  :- rule(_,sum(B,G)),
%     #sum { W,L :     hold(L), weighted_literal_tuple(B, L,W), L > 0 ;
%            W,L : not hold(L), weighted_literal_tuple(B,-L,W), L > 0 } >= G.

  hold(A) : atom_tuple(H,A)   :- rule(disjunction(H),B), body(B).

%
% Replace this rule:
%
% { hold(A) : atom_tuple(H,A) } :- rule(     choice(H),B), body(B).

#show.
#show T : output(T,B), conjunction(B).
