day(1..2). slot(1..(4*3)).
emp(D,S,(S\4)*3) :- day(D), slot(S).
exceed(2).
shorten(2).
type(1,10,3,8).
maxshifts(6).