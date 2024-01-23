# Fact format of instances
The instances are generated automatically by parsing a COOM file. We describe here the ASP fact format used for the translation.

## Building up a product domain

### Structure
A COOM product can be made up of a hierarchical component structure.
The building blocks of the product can be defined by the predicate `structure/1`.

> **Note:** Every product has at least the `structure(":root")` predicate at the top of the hierarchy.

```prolog
structure(Name).
```

Parameters:
- `Name` - Name of the structure

Examples:
```prolog
structure(":root").
structure("Carrier").
```

### Features
The structures work similar to a class in object-oriented programming
in the sense that you can declare fields.
These fields are specified by the `feature/5` predicate.

```prolog
feature(ContextStructure,NameOfFeature,TypeOfFeature,MinCardinality,MaxCardinality)
```

Parameters:
- `ContextStructure` - Structure at which the feature is declared
- `NameOfFeature`    - Name of the feature
- `TypeOfFeature`    - Type of the feature
- `MinCardinality`   - Minimum cardinality of the feature
- `MaxCardinality`   - Maximum cardinality of the feature

> **Note:** A feature can be either another structure, an enumeration of attribute values (see below)
or a numeric attribute. This is specified by the field `TypeOfFeature` which either refers to another object or is `"num"`.
Numeric features are accompanied by a `range/4` predicate.

Examples:
```prolog
feature(":root","totalWeight","num",1,1).
feature(":root","rearWheel","Wheel",1,1).
feature("Carrier","bags","Bag",0,3).
feature("Frame","bags","Bag",2,2).
```

#### Range
Numeric features are accompanied by a `range/4` predicate.

```prolog
range(ContextStructure,NameOfFeature,MinValue,MaxValue).
```

Parameters:
- `ContextStructure` - Structure at which the numeric feature is declared
- `NameOfFeature`    - Name of the feature
- `MinValue`         - Minimum value of the attribute
- `MaxValue`         - Maximum value of the attribute


Examples:
```prolog
range(":root","totalWeight",#inf,#sup).
range(":root","maxWeight",1,100).
range(":root","totalVolume",0,200).
range(":root","requestedVolume",0,200).
```
> **Note:** When no range is specified in COOM the translation makes use of the
clingo built-in `#inf` and `#sup` operators.


### Enumerations
Enumerations represent features with a finite domain of predefined choices.
The predicate `enumeration/1` declares an enumeration field and
is always accompanied at least by `option/2` predicates specifying the possible choices.
Optionally, enumerations can also contain attributes such that each option comes along with a fixed set of values.
These are specified by predicates `attribute/2` and `attr_value/4`.


```prolog
enumeration(NameOfEnumeration).
```

Parameters:
- `NameOfEnumeration` - Name of the enumeration

Examples:
```prolog
enumeration("Capacity").
enumeration("Material").
```

#### Enumeration options

```prolog
option(NameOfEnumeration,NameOfOption)
```

Parameters:
- `NameOfEnumeration` - The name of the enumeration to which the option belongs
- `NameOfOption`      - Name of the option

Examples:
```prolog
option("Capacity", "B10").
option("Capacity", "B20").
option("Capacity", "B50").
option("Capacity", "B100").
```

#### Enumerations with attributes
Declares an attribute inside an enumeration.

```prolog
attribute(NameOfEnumeration,NameOfAttribute)
```

Parameters:
- `NameOfEnumeration` - Name of the enumeration to which the attribute belongs
- `NameOfAttribute`   - Name of the attribute

Examples:
```prolog
attribute("Capacity","volume").
attribute("Capacity","weight").
```

#### Attribute values
Assigns an attribute value to an enumeration option.

```prolog
attr_value(NameOfEnumeration,NameOfOption,NameOfAttribute,AttributeValue).
```

Parameters:
- `NameOfEnumeration` - Name of the enumeration to which the attribute belongs
- `NameOfOption`      - Name of the option to which the value is assigned to
- `NameOfAttribute`   - Name of the attribute for which the value is assigned
- `AttributeValue`    - Value of the attribute

Examples:
```prolog
attr_value("Capacity","B10","volume",10).
attr_value("Capacity","B10","weight",100).
attr_value("Capacity","B20","volume",20).
attr_value("Capacity","B20","weight",250).
attr_value("Capacity","B50","volume",50).
attr_value("Capacity","B50","weight",600).
attr_value("Capacity","B100","volume",100).
attr_value("Capacity","B100","weight",1200).
```

## Constraints
A predicate `behavior/1` declares a single constraint.

```prolog
behavior(ConstraintID)
```

Parameters:
- `ConstraintID`  - ID of the constraint of form `(ContextStructure,IndexOfConstraint)`, where
    - `ContextStructure`  - Structure at which the constraint is declared
    - `IndexOfConstraint` - Global index of all constraints



Examples:
```prolog
behavior((":root",0)).
behavior((":root",1)).
behavior(("Bag",7)).
```

### Require
The predicate `require/2` declares 'requires' constraints, i.e., logical statements
that need to be satisfied in a valid product configuration state.

> **Note:** Optionally requirements can have a condition. See below for further information.

> **Note:** In the COOM language it is possible to nest one or more conditions and requirements.
This is not supported in the current state of the encoding.

```prolog
require(ConstraintID,RequirementString)
```

Parameters:
- `ConstraintID`           - ID of the constraint to which the condition belongs
- `LogicalStatementString` - Logical statement of the requirement as a string

Examples:
```prolog
require((":root",0),"count(carrier.bags)+count(frame.bags)<=4").
require((":root",2),"totalWeight<=maxWeight").
require((":root",4),"totalVolume>=requestedVolume").
require((":root",6),"frontWheel.size=20").
```


### Condition
The predicate `condition/2` declares a condition which is usually followed by a 'requires' statement.

> **Note:** In the COOM language it is possible to nest one or more conditions and requirements.
This is not supported in the current state of the encoding.

```prolog
condition(ConstraintID,Condition)
```

Parameters:
- `ConstraintID`           - ID of the constraint to which the condition belongs
- `LogicalStatementString` - Logical statement of the condition as a string

Examples:
```prolog
condition((":root",6),"color=Red").
condition((":root",0),"color=Yellow").
```


### Imply
Numerical features can be calculated using the 'imply' keyword.
The predicate `imply/3` declares such a calculation.

```prolog
imply(ConstraintID,NameOfAttribute,FormulaString)
```

Parameters:
- `ConstraintID`    - ID of the constraint to which the 'imply' statement belongs
- `NameOfAttribute` - Name of attribute to which the value of the calculation is assigned
- `FormulaString`   - Formula for calculation as a string

Examples:
```prolog
imply((":root",1),"totalWeight","frontWheel.weight+rearWheel.weight").
imply((":root",3),"totalVolume","sum(carrier.bags.capacity.volume)+sum(frame.bags.capacity.volume)").
```

### Combinations
A combinations table describes valid combinations of one or more fields in the context of a structure.
Any combination that fulfills some 'allow'-line in the table is valid.
The predicate `combinations/3` declares the columns of the table by specifying a path to some attribute.

```prolog
combinations(ConstraintID,Column,Path)
```

Parameters:
- `ConstraintID` - ID of the constraint to which the combination belongs
- `Column`       - ID of current column
- `Path`         - Path to an attribute of the product

Examples:
```prolog
combinations((":root",1),0,"wheelSupport").
combinations((":root",1),1,"rearWheel").
```

> **Note:** Longer paths can be formed in COOM by concatenating paths with a dot ('.').
See below the `path/3` predicate.

#### Allow
The `allow/3` predicate specifies the entries of a combinations table.

> **Note:** The COOM language also allows for a 'forbid' statement to list invalid combinations.
However, this is not supported in the current encoding.

```prolog
allow(ConstraintID,CellID,Value)
```

Parameters:
- `ConstraintID` - ID of the constraint to which the table entry belongs
- `CellID`       - Coordinates of the table entry of format `(Column,Row)`
- `Value`        - Value of the table entry

Examples:
```prolog
allow((":root",1),(0,0),"True").
allow((":root",1),(1,0),"W14").
allow((":root",1),(1,0),"W16").
allow((":root",1),(0,1),"False").
allow((":root",1),(1,1),"W18").
allow((":root",1),(1,1),"W20").
```

### Unary
TODO

### Binary
The predicate `binary/5` encodes a binary relation.
This can be a logical statement or an arithmetic formula.

> **Note:** For logical statements the possible operators are AND (`&&`), OR (`||`) and
comparison operators `=`, `!=`, `<`, `<=`, `>` and `>=`.
For arithmetic formulas addition (`+`), subtraction (`-`), multiplication (`*`), division (`/`) and exponentation (`^`) is allowed.

```prolog
binary(ContextStructure,CompleteString,LeftString,Operator,RightString)
```

Parameters:
- `ContextStructure` - Structure at which the binary relation is declared
- `CompleteString`   - Complete formula as a string
- `LeftString`       - Left side of the formula as a string
- `Operator`         - Binary Operator as a string
- `RightString`      - Right side of the formula as a string

Examples:
```prolog
binary(":root","color=Red","color","=","Red").
binary(":root","frontWheel.size=20","frontWheel.size","=","20").
binary(":root","count(carrier.bags)+count(frame.bags)<=4","count(carrier.bags)+count(frame.bags)","<=","4").
binary(":root","count(carrier.bags)+count(frame.bags)","count(carrier.bags)","+","count(frame.bags)").
binary("Bag","material=Leather","material","=","Leather").
```

### Function
The predicate `function/4` declares a function over an argument.
The possible options are currently 'count' and 'sum'.

> **Note:** The COOM language additionally allows for 'min', 'max' and 'delta'
but this is currently not implemented.

```prolog
function(ContextStructure,CompleteString,Function,Argument)
```

Parameters:
- `ContextStructure` - Structure at which the function is declared
- `CompleteString`   - Complete function with argument as a string
- `TypeOfFunction`   - Type of function as a string
- `Argument`         - Argument of the function as a string

Examples:
```prolog
function(":root","count(carrier.bags)","count","carrier.bags").
function(":root","count(frame.bags)","count","frame.bags").
function(":root","sum(carrier.bags.capacity.weight)","sum","carrier.bags.capacity.weight").
function(":root","sum(frame.bags.capacity.weight)","sum","frame.bags.capacity.weight").
```

### Path expressions
Constraints and calculations are defined in the context of one particular structure but
can refer to attributes and objects across the whole product component hierarchy.
The predicte `path/3` can be used to build path expressions for referencing particular fields/attributes from any point of the product component hierarchy.
Inside COOM path expressions are specified by concatenating paths by dots ('.').
Such a path expression is split up in ASP and encoded by using indices.

```prolog
path(CompletePathString,Index,SubPath)
```

Parameters:
- `CompletePathString` - The complete path expression as a string
- `Index`              - Index of the current (sub)path
- `SubPath`            - Current (sub)path

Examples:
```prolog
path("carrier.bags",0,"carrier").
path("carrier.bags",1,"bags").

path("totalWeight",0,"totalWeight").

path("carrier.bags.capacity.weight",0,"carrier").
path("carrier.bags.capacity.weight",1,"bags").
path("carrier.bags.capacity.weight",2,"capacity").
path("carrier.bags.capacity.weight",3,"weight").
```

### Constant
The predicate `constant/1` is used to encode paths which are constants.

> **Note:** This predicate is only for non-numeric values.
For encoding constant numbers use the `number/2` predicate. See below.

```prolog
constant(ValueString).
```

Parameters:
- `ValueString` - Value of the constant

Examples:
```prolog
constant("Yellow").
```

### Number
The predicate `number/2` is used to encode (constant) numbers.

```prolog
number(NumberString,Number)
```

Parameters:
- `NumberString` - The number as a string
- `Number`       - The number as an integer

Examples:
```prolog
number("16",16).
```
