day(1..7). slot(1..100).
emp(D,S,(S\4)*2) :- day(D), slot(S).
exceed(0).
shorten(0).
type(1*I,10*I,1,10) :- I=1..10.
maxshifts(10).