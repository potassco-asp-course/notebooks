structure("ROOT").
feature("ROOT","color","Color",1,1).
feature("ROOT","basket","bool",1,1).
feature("ROOT","storageNeeded","bool",1,1).
feature("ROOT","saddle","Saddle",1,1).
feature("ROOT","frontWheel","Wheel",1,1).
feature("ROOT","rearWheel","Wheel",1,1).
feature("ROOT","carrier","Carrier",1,1).

enumeration("Color").
option("Color", "Silver").
option("Color", "White").
option("Color", "Black").
option("Color", "Blue").

enumeration("bool").
option("bool", "True").
option("bool", "False").

enumeration("Saddle").
option("Saddle", "Standard").
option("Saddle", "Comfort").
option("Saddle", "Vintage").

enumeration("Wheel").
attribute("Wheel","size").
option("Wheel", "W26").
attr_value("Wheel","W26","size",26).
option("Wheel", "W27").
attr_value("Wheel","W27","size",27).
option("Wheel", "W28").
attr_value("Wheel","W28","size",28).
option("Wheel", "W29").
attr_value("Wheel","W29","size",29).

structure("Carrier").
feature("Carrier","bag","Bag",1,1).

structure("Bag").
feature("Bag","capacity","Capacity",1,1).
feature("Bag","material","Material",1,1).

enumeration("Capacity").
attribute("Capacity","volume").
option("Capacity", "B10").
attr_value("Capacity","B10","volume",10).
option("Capacity", "B20").
attr_value("Capacity","B20","volume",20).
option("Capacity", "B50").
attr_value("Capacity","B50","volume",50).
option("Capacity", "B100").
attr_value("Capacity","B100","volume",100).

enumeration("Material").
option("Material", "Cotton").
option("Material", "Leather").
option("Material", "Polyester").

behavior(("ROOT",0)).
condition(("ROOT",0),"basket=True").
binary("ROOT","basket=True","basket","=","True").
path("basket",0,"basket").
constant("True").
require(("ROOT",0),"frontWheel.size<29").
binary("ROOT","frontWheel.size<29","frontWheel.size","<","29").
path("frontWheel.size",0,"frontWheel").
path("frontWheel.size",1,"size").
number("29",29).

behavior(("ROOT",1)).
condition(("ROOT",1),"storageNeeded=True").
binary("ROOT","storageNeeded=True","storageNeeded","=","True").
path("storageNeeded",0,"storageNeeded").
constant("True").
require(("ROOT",1),"carrier.bag.volume>=50").
binary("ROOT","carrier.bag.volume>=50","carrier.bag.volume",">=","50").
path("carrier.bag.volume",0,"carrier").
path("carrier.bag.volume",1,"bag").
path("carrier.bag.volume",2,"volume").
number("50",50).

behavior(("ROOT",2)).
combinations(("ROOT",2),0,"saddle").
combinations(("ROOT",2),1,"carrier.bag.material").
path("saddle",0,"saddle").
path("carrier.bag.material",0,"carrier").
path("carrier.bag.material",1,"bag").
path("carrier.bag.material",2,"material").
allow(("ROOT",2),(0,0),"Standard").
allow(("ROOT",2),(1,0),"Polyester").
allow(("ROOT",2),(0,1),"Comfort").
allow(("ROOT",2),(1,1),"Polyester").
allow(("ROOT",2),(1,1),"Cotton").
allow(("ROOT",2),(0,2),"Vintage").
allow(("ROOT",2),(1,2),"Leather").

behavior(("ROOT",3)).
require(("ROOT",3),"frontWheel.size=rearWheel.size").
binary("ROOT","frontWheel.size=rearWheel.size","frontWheel.size","=","rearWheel.size").
path("frontWheel.size",0,"frontWheel").
path("frontWheel.size",1,"size").
path("rearWheel.size",0,"rearWheel").
path("rearWheel.size",1,"size").

behavior(("Bag",4)).
condition(("Bag",4),"material=Leather").
binary("Bag","material=Leather","material","=","Leather").
path("material",0,"material").
constant("Leather").
default(("Bag",4),"capacity","B10").
path("capacity",0,"capacity").
constant("B10").
