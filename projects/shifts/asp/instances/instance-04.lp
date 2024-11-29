day(1). slot(1..8).
emp(D,S,3) :- day(D), slot(S), S\2==0.
emp(D,S,5) :- day(D), slot(S), S\2==1.
exceed(1).
shorten(1).
type(1,4,1,4).
type(5,8,1,4).
maxshifts(2).