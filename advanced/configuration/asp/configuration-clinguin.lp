%*

 This file should be an adaptation to clingo of the file configuration.lp.

 Among other things, it can add new atoms in the heads of some of the integrity constraints
 to explain the incorrect choices made by the user.

 For example, the constraint 
   :- behavior((S,C)), require((S,C),B), not holds_binary(B).
 can become
   error((S,C),B) :- behavior((S,C)), require((S,C),B), not holds_binary(B).
 and the program ui.lp can refer to those error/2 atoms.

*% 
