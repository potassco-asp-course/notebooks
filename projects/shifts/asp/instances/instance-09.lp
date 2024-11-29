day(1..7). slot(1..8).
emp(D,S,2) :- day(D), slot(S), D=1..3.
emp(D,S,0) :- day(D), slot(S), D=4.
emp(D,S,2) :- day(D), slot(S), D=5..6.
emp(D,S,0) :- day(D), slot(S), D=7.
exceed(1).
shorten(1).
type(8,8,8,8).
maxshifts(1).
