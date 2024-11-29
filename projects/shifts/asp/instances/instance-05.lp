day(1..2). slot(1..8).
emp(D,S,4) :- day(D), slot(S), D=1.
emp(D,S,2) :- day(D), slot(S), D=2.
exceed(0).
shorten(0).
type(1,2,4,8).
type(5,6,4,6).
maxshifts(2).