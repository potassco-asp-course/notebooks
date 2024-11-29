day(1..40). slot(1..15).
emp(D,S,(S\4)*2) :- day(D), slot(S).
exceed(0).
shorten(2).
type(1,8,1,4).
type(9,15,1,4).
maxshifts(4).