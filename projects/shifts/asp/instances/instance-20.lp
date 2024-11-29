day(1..31). slot(1..24).
emp(D,S,S\10) :- day(D), slot(S).
exceed(0).
shorten(0).
type(1,24,1,24).
maxshifts(5).