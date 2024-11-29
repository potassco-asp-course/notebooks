day(1..4). slot(1..8).
emp(D,S,4) :- day(D), slot(S), D<4.
emp(D,S,0) :- day(D), slot(S), D=4.
exceed(2).
shorten(2).
type(8,8,8,16).
maxshifts(2).
