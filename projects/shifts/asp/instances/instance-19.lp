day(1..100). slot(1..8).
emp(D,S,S) :- day(D), slot(S).
exceed(0).
shorten(1).
type(I*2,I*2,I,I..8) :- I=1..4.
maxshifts(4).