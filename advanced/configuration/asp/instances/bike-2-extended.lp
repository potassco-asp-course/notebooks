structure("ROOT").
feature("ROOT","frontWheel","Wheel",1,1).
feature("ROOT","rearWheel","Wheel",1,1).
feature("ROOT","wheelSupport","Bool",1,1).

enumeration("Wheel").
option("Wheel", "W14").
option("Wheel", "W16").
option("Wheel", "W18").
option("Wheel", "W20").

enumeration("Bool").
option("Bool", "True").
option("Bool", "False").

behavior(("ROOT",0)).
combinations(("ROOT",0),0,"wheelSupport").
combinations(("ROOT",0),1,"rearWheel").
path("wheelSupport",0,"wheelSupport").
path("rearWheel",0,"rearWheel").
allow(("ROOT",0),(0,0),"True").
allow(("ROOT",0),(1,0),"W14").
allow(("ROOT",0),(1,0),"W16").
allow(("ROOT",0),(0,1),"False").
allow(("ROOT",0),(1,1),"W18").
allow(("ROOT",0),(1,1),"W20").

behavior(("ROOT",1)).
require(("ROOT",1),"frontWheel=rearWheel").
binary("ROOT","frontWheel=rearWheel","frontWheel","=","rearWheel").
path("frontWheel",0,"frontWheel").
path("rearWheel",0,"rearWheel").
