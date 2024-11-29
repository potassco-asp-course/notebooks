day(1..2). slot(1..(4*2)).
emp(D,S,(S\4)*2) :- day(D), slot(S).
exceed(0).
shorten(0).
type(1,(4*2),1,(4*2)).
maxshifts(6).