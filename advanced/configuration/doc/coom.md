# COOM Product Configuration Language Quick Reference

1. [Introduction COOM DSL](#introduction)
2. [Building up a Product Domain](#domain)
    * [Create a Product (product)](#product)
    * [Define Structures (structure)](#structure)
        * [Fields](#field)
        * [The Product Component Hierarchy](#hierarchy)
    * [Define Enumeration Features (enumeration)](#enumeration)
        * [Attributes (attribute)](#attribute)
3. [Constraints, Defaults, and Calculations (behavior)](#behavior)
    * [Variant Tables (combinations)](#combinations)
        * [Allowed Combinations (allow)](#allow)
        * [Forbidden Combinations (forbid)](#forbid)
    * [Basic Constraints (require)](#require)
    * [Comparators and Logical Operators](#operators)
    * [Conditions (condition)](#condition)
    * [Defaults (default)](#default)
    * [Calculations for Numerical Features (imply)](#imply)
    * [Path Expressions](#paths)
    * [Macros & Constants (define)](#default)
    * [Dealing with Instances](#instances)
4. [UI Control](#ui)
    * [Hide Features (hide)](#hide)
    * [Set Features to Read-only State (readonly)](#readonly)

<a name="introduction"></a>

# Introduction

This is a quick reference for the COOM DSL for defining a product configuration
model. The DSL is part of the COOM software that ships along a compiler for the
DSL together with a runtime API for interactive product configuration.

<a name="domain"></a>

## Building up the Product Domain

<a name="product"></a>

### Starting a Product (product)

The product declares the root element of the product to be configured. Hence,
there should be exactly one product.

Example for a fashion advisor outfit:

    product {
        Underwear		underwear
        Clothing		clothing
        Shoes			shoes
        Jewelry			jewelry
        num.##/€		price
    }

Note: The product itself does not have a name or identifier. It is unique in a
DSL context and can be referenced by ':root'.
<a name="structure"></a>

### Components/Complex Features (structure)

The product can be made up of a hierarchical component structure. The building
blocks of the product can be defined by ''structures''. A structure works
somehow similar to a class in object-oriented programming in a way that you can
declare fields. A field is made up by its type and its name. It can optionally
be preceded by a cardinality. The COOM reasoning engine will create instances in
the right amount to fulfill the cardinality restriction (and all other
constraints).

Example for a structure 'Clothing' in the context of the fashion advisor:

    structure Clothing {
        0..1	Hat			hat		// Hat is optional
        1x		Shirt		shirt
        		Pants		pants
               	num.##/€	price
    }

The identifier of the structure (here 'Clothing') must be unique within the
overall product DSL context.

<a name="field"></a>

#### Fields

The structure ''Clothing'' declares four features in the following way:

1. Cardinality (optional): A minimum required and maximum allowed number of
   instances for this field can be specified. The cardinality is optional and if
   omitted the min and max cardinality both are 1.
2. Type: The type of the field is defined. It can either be an existing
   structure, an existing enumeration, 'num' for numerical, or 'text' for a
   string variable.
3. Name: The name of the field. It has to be unique within the local structure.

Note: For numeric fields, the number of decimal digits can be specified using
'#' and also a unit can be defined (e.g. '€', 'mm', 'Kg').

<a name="hierarchy"></a>

#### Hierarchy

Structures can be nested using other structures as field types. In this way, a
hierarchical 'component-based' product can be modeled. It is necessary that the
linked structures form a **strict** hierarchy, that means it may not have any
cycles. If it occurs by mistake, that the linked structures contain a cycle, the
DSL compiler will demand to fix this, throwing a corresponding error message.

By default all fields, that have a structure for a type, contribute to the
product hierarchy (and can destroy the product model if a cycle is build).
However, for fields that should not add new components to the product hierarchy,
the keyword 'reference' can be put before the field declaration. The effect of
the 'reference' keyword for (structure-type) field are:

1. Instances for this field will not automatically created by the COOM reasoning
   engine. The product modeler needs to take care, to what instances the fields
   will be linked to and where those come from (for instance create by the user
   in the UI).
2. The field will not be included within the cycle check of the product
   hierarchy.

<a name="enumeration"></a>

### Simple/Terminal Features (enumeration)

Enumerations represent features with a finite domain of predefined choices. The
enumeration 'Pants' is a very simple example for an enumeration in the context
of the fashion advisor:

    enumeration Pants { jeans ; shorts ; hot_pants ; suit }

At the end of the day, a field the has the type 'Pants' has to take exactly one
of the enumerated values: 'jeans',  'shorts' , 'hot_pants' , or 'suit'. The
names of these values have to be unique within the context of this enumeration (
only).

The identifier of the enumeration (here 'Pants') must be unique within the
overall product DSL context.

<a name="attribute"></a>

#### Enumerations with attributes (attribute)

    enumeration Hat {
        // attributes of a hat
        attribute Color		color
        attribute num/cm	diameter
        attribute num.##/€	price

	    // actual hats:
        baseball_cap	= ( blue   25   15.00 )
	    stovepipe_hat	= ( black  30  189.95 )
    }

An enumeration may specify attributes, that all of its values have. The values
of the attributes fixed for each enumeration value. That is, attribute value can
never be changed within the configuration process.
(If the attribute values should be able to change, it is probably a good idea to
use a structure with fields instead of an enumeration with attributes.)

The above example defines, that each hat has a particular color, a particular
diameter, and a fixed price. When the enumeration values (in this case
baseball_cap and stovepipe_hat), the attribute values are assigned in round
brackets. Similar to a field in a structure, an attribute in an enumeration is
defined by a type and a name. Also the types, that can be used, are the same as
when defining fields in structures.

<a name="behavior"></a>

## Constraints, Defaults, and Calculations (behavior)

The constraint logics of the product can be specified by defining 'behavioral
blocks'. Each block can define behaviors for one predefined structure. To do so,
a block is started by the keyword 'behavior' followed by the respective behavior
name, which is 'Clothing' in the following case:

    behavior Clothing {
        combinations	( pants	    	   	shirt       	)
        //===========================================================
        allow			( jeans	       	      -*-          	)
        allow			( shorts	          polo			)
        allow			( shorts, hot_pants	  t_shirt		)
        allow			( hot_pants	          t_shirt 		)
        allow			( suit		          polo	        )
        allow			( suit		          collar_shit   )
    }

There can be arbitrary many behavioral blocks describing the behavior of the
structure 'Clothing', which are all valid & active independently of each other.
A behavioral block does (currently) not have a name or identifier but is
anonymous.

### Constraints via combination/variant tables (combinations)

<a name="allow"></a>

#### Allowed Combinations (allow)

The above combinations table describes valid combinations of the fields 'pants'
and 'shirt' in the context of an instance of the structure 'Clothing'. Any
combination, that does comply to some 'allow'-line in the table, is a valid
combination for the product (according to this behavior). Subsequently, any
combination, that does not comply to some line in the table, is invalid. A
combinations table can have arbitrary number of columns and the order of columns
is also arbitrary.

In a cell, multiple values can be enumerated by using commas (','), resulting in
a one-of (logical OR) semantics. The star sign ('-*-') serves as a wild card,
that is any value matches.

<a name="forbid"></a>

#### Forbidden Combinations (forbid)

Opposed to the 'allow' keyword, there is also a 'forbid' keyword available, that
can be used to enumerate combinations that are forbidden:

    behavior Clothing {
        combinations	( pants	    	    shirt          )
        //===========================================================
        forbid			( suit	       	    t_shirt        )
        forbid			( shorts		 	collar_shit    )
    }

<a name="require"></a>

### Basic Constraints (require)

Within behavior blocks the keyword 'require' can be used to define constraints,
that is logical statements that need to be true to have a valid product
configuration state.

The following behavior block example applies to the root structure of the
product (as no structure is defined after the keyword 'behavior'):

    behavior {

	    // a cylinder requires business shoes
	    condition clothing.hat = stovepipe_hat
	    require shoes = business

	    // conditional default: business shoes goes best with collar shirt
	    condition shoes = business
	    require clothing.shirt = collar_shirt || clothing.shirt = polo

    }

Constraints with require can be formed with or without conditions. Further, the
constraint after the 'require' keyword can be a complex boolean expression
composed by logical operators.

<a name="operators"></a>

#### Comparators and Logical Operators

Simple feature expressions allow for the comparators equal ('=') and
not-equal ('!='). For numerical fields, also the numerical comparators lower
than ('<'), lower equal ('<='), larger than ('>') and larger equal ('>=') can be
used to build simple expressions.  
Complex logical expressions can be composed using the boolean operators AND ('
&&'), OR ('||') and NOT ('!').

<a name="default"></a>

### Defaults (default)

The use of defaults allows you to propose values to enum fields. These values
will be applied to the field if they do not contradict with constraints
according to the current state of the configuration and if the enum value has
not (yet) been set by the user.

Defaults can be specified with or without condition as the following example
shows:

    behavior {
	    default country = Germany

	    // wearing flip-flops, you should prefer some cap
	    condition shoes = flip_flops
	    default clothing.hat = baseball_cap

	    // business shoes goes best with collar shirt
	    condition shoes = business
	    default clothing.shirt = collar_shirt

    }

Note: Defaults can be seen to make propositions to the user about product
features that are most likely desirable. However, as soon as the user manually
selects a value to a feature, the default rules for that feature will not have
any effect any more
(until the user explicitly releases his/her manual choice).

<a name="imply"></a>

### Calculations for Numerical Features  (imply)

Numerical features can be calculated using the 'imply' keyword. The following
example calculates a value for the numerical feature 'price'. For the
calculation, the following operators can be used:

    behavior {
        define provision = 0.1
	    default country = Germany

	    imply price = (1 + provision) * (1 + country.tax * 0.010)
					* (clothing.price  + underwear.price + shoes.price + jewelry.price )
    }

Of course, only numerical features, attributes and constants can be used within
the formulas.

The following numerical operations are supported:

| Operation        | Syntax          | Comment  |
| ------------- |:-------------:| -----:|
| addition      | +        |  |
| subtraction     | -      |    |
| multiplication | *      |     |
| division        | /      |  be aware of downward rounding to integer   |
| power        |   ^ |  |

<a name="paths"></a>

### Paths Expressions

Constraints, defaults and calculations are defined in the context of one
particular structure but at runtime, they are applied the component hierarchy of
the product. Therefore, it is often necessary to make statements across
different instances of the hierarchy, even across different levels of the
hierarchy. For this purpose the COOM DSL provides the possibility to build path
expressions for referencing particular fields/attributes from any point of the
product component hierarchy by using dots ('.') for path concatenation.

For instance, if we want to state, that the color of the hat needs to match the
color of the shoes, we could use path expressions to write:

      behavior {
         require root.hat.color = root.shoes.color
      }

Note: 'root' always refers to the product root. Path expressions that are not
starting with ':root' are always resolved relatively to the structure, that the
current behavioral block is describing. To state that the earrings (field of
Jewelry) and wristband (also field of Jewelry) need to have the same color, we
can use relative path expressions.

      structure Jewelry {
         0..4 Earing earrings
         0..1 Wristband wristband
      }
      
      behavior Jewelry {
         require earrings.color = wristband.color
      }

<a name="condition"></a>

### Conditions (condition)

All types of behaviors may have conditions that restrict the states when the
constraint applies. In the example below, the
constraint `require shoes = business` is only applied if the preceding condition
is met:

    behavior {
         condition clothing.hat = stovepipe_hat
         require shoes = business
      }

You can add multiple conditions that all must been met, to make the succeeding
behavior apply. In the following example, the
constraint `require shoes = business` is only applied if both (!) preceding
conditions are met:

    behavior {
         condition clothing.hat = stovepipe_hat
         condition ocassion != party
         require shoes = business
      }

Each condition only applies to the single behavior, directly following the
condition(s). So each behavior requires it's own conditions. If a condition (or
multiple conditions) should apply to a set of behaviors, you need to wrap a
block statement around them, als following:

    behavior {
         condition clothing.hat = stovepipe_hat
         condition ocassion != party {
            require shoes = business
            require pants = suit
         }
      }

The behaviors inside a condition block can have additional conditions. The
condition blocks can also be nested.

    behavior {
         condition clothing.hat = stovepipe_hat {
            // stovepipe hat always requires a suit
            require pants = suit
            // and usually also business shoes, but relax at a party
            condition ocassion != party
            require shoes = business
         }
      }

<a name="macros"></a>

### Macros & Constants (define)

When working with large product hierarchies, the use of path expressions becomes
prevalent and also tedious at some point. To simplify the repeated use of (long)
path expressions, the COOM DSL allows for macros using the `define` keyword. In
the following example, a local macro variable is defined simplify the repeated
use of the long path expression referring to color of the wristband.

      behavior {
         define wbColor = root.jewelry.wristband.color

         condition ocassion = party
         require wbColor = hat.color

         condition ocassion = dinner
         require wbColor = black
      }

Note that the variables declared by the `define` keyword are only
visible/available in the scope of the current behavior block. If you define a
macro inside a condition block, it is only visible/available inside that block.

#### Constants and Formulas

The 'define' keyword can also be used to specify constants or formulas. In the 
following example the constant PI is defined for being used in calculations:

      structure Circle { num radius }

      behavior Circle {
         define PI = 3.1415
         define PI_2 = PI * 2

         imply area = radius^2 * PI
         imply circumference = radius * PI_2
      }

<a name="instances"></a>

### Dealing with Instances
Having a product hierarchy nesting different structures with different features with arbitrary cardinality ranges raises the following challenge: 
How many instances for structure features and how many values for num/enum features should the configured product have - given a particular range (e.g. 0..2 earrings)?

#### Instances Created by the COOM Solver Automatically
The COOM solver will create an amount and combination of instances/values that satisfies all existing constraints (if that is possible).
There are cases, where different amounts if instances/values could satisfy all constraints. 
For example, if it is required to have at least one earring of color red, 
then this constraint can be satisfied by a solution with one earring but also by a solution with two earrings.
In general, the solver will aim to come up with a solution that minimizes the total number of created instances/values.

#### Instances Created by the User
Of course, for features with cardinality ranges the user can specify to have a particular amount of instances/values within that range defined as a user requirement.
These instances/values are given to the solver in a similar way as other user input values and the solver will try to find a solution incorporating these instances/values.
Enabling the user to add instances/values for features with cardinality ranges dynamically on the UI is a non-trivial issue.
In particular, the UI level also needs to take care of the 'smart handling' of instance creation, 
that is, the system should not allow the user to create instances
if that will lead to an unsatisfiable state, but instead rather come up with a guided conflict resolution process.
However, user interaction and conflict resolution will not be discussed with this DSL Quick Reference.

#### Examples for Constraints over Instances

**TODO:** instances examples

<a name="ui"></a>

## UI Control

In an interactive product configuration session, the options shown in the user
interface usually need to change dynamically according to the configuration
state.  
The DSL provides some means to control the UI (if the employed UI is properly
implemented to listen to ui instructions of the runtime).

<a name="hide"></a>

### hide

Using the keyword 'hide' allows to hide certain features from the UI. The
following behavior aims to hide the field 'jewlery' if 'beach' is selected as an
occasion.

    behavior {
        condition occasion = beach
        hide jewlery
    }

<a name="readonly"></a>

### readonly

Using the keyword 'readonly' allows to make the feature unmodifiable for the
user. Note: In smart configuration, conflicting values are automatically blocked
from the users choice (without the need to use 'readonly'). In consequence, the
use of 'readonly' is usually necessary just in rare cases, for instance for
numerical calculations that should be displayed to the user.

The following example shows the use of 'readonly' for showing the calculated
weight of the configured product:

      structure Door {
         num width
         num height
         num weight
      }

      behavior Door {
         define weightFactor = 0.123
         imply weight = weightFactor * height * width + 5

         // set weight to readonly as the user should only set width and height
         readonly weight
      }