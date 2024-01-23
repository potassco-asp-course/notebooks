structure("ROOT").
feature("ROOT","color","Color",1,1).
feature("ROOT","wheelSupport","bool",1,1).
feature("ROOT","frontWheel","Wheel",1,1).
feature("ROOT","rearWheel","Wheel",1,1).

enumeration("Color").
option("Color", "Red").
option("Color", "Green").
option("Color", "Yellow").
option("Color", "Blue").

enumeration("bool").
option("bool", "True").
option("bool", "False").

enumeration("Wheel").
attribute("Wheel","size").
option("Wheel", "W14").
attr_value("Wheel","W14","size",14).
option("Wheel", "W16").
attr_value("Wheel","W16","size",16).
option("Wheel", "W18").
attr_value("Wheel","W18","size",18).
option("Wheel", "W20").
attr_value("Wheel","W20","size",20).

behavior(("ROOT",0)).
condition(("ROOT",0),"color=Yellow").
binary("ROOT","color=Yellow","color","=","Yellow").
path("color",0,"color").
constant("Yellow").
require(("ROOT",0),"frontWheel.size>16").
binary("ROOT","frontWheel.size>16","frontWheel.size",">","16").
path("frontWheel.size",0,"frontWheel").
path("frontWheel.size",1,"size").
number("16",16).

behavior(("ROOT",1)).
combinations(("ROOT",1),0,"wheelSupport").
combinations(("ROOT",1),1,"rearWheel").
path("wheelSupport",0,"wheelSupport").
path("rearWheel",0,"rearWheel").
allow(("ROOT",1),(0,0),"True").
allow(("ROOT",1),(1,0),"W14").
allow(("ROOT",1),(1,0),"W16").
allow(("ROOT",1),(0,1),"False").
allow(("ROOT",1),(1,1),"W18").
allow(("ROOT",1),(1,1),"W20").

behavior(("ROOT",2)).
require(("ROOT",2),"frontWheel.size=rearWheel.size").
binary("ROOT","frontWheel.size=rearWheel.size","frontWheel.size","=","rearWheel.size").
path("frontWheel.size",0,"frontWheel").
path("frontWheel.size",1,"size").
path("rearWheel.size",0,"rearWheel").
path("rearWheel.size",1,"size").
