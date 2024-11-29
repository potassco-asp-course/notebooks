day(1..7). slot(1..100).
emp(D,S,(S\4)*2) :- day(D), slot(S).
exceed(0).
shorten(0).
type(1,100,1,1).
maxshifts(100).