structure("ROOT").
feature("ROOT","frontWheel","Wheel",1,1).
feature("ROOT","rearWheel","Wheel",1,1).

enumeration("Wheel").
option("Wheel", "W14").
option("Wheel", "W16").
option("Wheel", "W18").
option("Wheel", "W20").

behavior(("ROOT",0)).
require(("ROOT",0),"frontWheel=rearWheel").
binary("ROOT","frontWheel=rearWheel","frontWheel","=","rearWheel").
path("frontWheel",0,"frontWheel").
path("rearWheel",0,"rearWheel").
