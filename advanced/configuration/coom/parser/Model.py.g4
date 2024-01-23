grammar Model;

@parser::header {}

@parser::members {
def wasNewline(self):
    for index in reversed(range(self.getCurrentToken().tokenIndex)):
        # stop on default channel
        token = self.getTokenStream().get(index)
        if token.channel == 0:
            break

        # if the token is blank and contains newline, we found it
        if len(token.text) == 0:
            continue
        if token.text.startswith("\n") or token.text.startswith("\r"):
            return True

    return False
}

// grammar rules to be parsed

root: (product | structure | enumeration | behavior)* EOF;

product: 'product' '{' (feature (stmt_end feature)*)? '}';

structure:
	'structure' name '{' (feature (stmt_end feature)*)? '}';

enumeration:
	'enumeration' name '{' (
		(attribute | option) (stmt_end (attribute | option))*
	)? '}';

behavior: 'behavior' name? behavior_block;

behavior_block:
	'{' (define stmt_end)* (message (stmt_end message)*)? (
		conditioned (stmt_end conditioned)*
	)? '}';

feature:
	ref = 'reference'? cardinality? field (
		'/' priority = INTEGER
	)?;
cardinality:
	min = (INTEGER | TIMES) (
		range = '..' (max = (INTEGER | TIMES | '*'))?
	)?;

attribute: 'attribute' field;
option: name ('=' '(' constant (','? constant)* ')')?;

field: (number_def fieldName = name)
	| (string_def fieldName = name)
	| (type_ref = name? fieldName = name);
number_def:
	'num' fraction? unit? (min = floating '-' max = floating)?;
string_def: 'string' multiLine = '/n'? maxLength = INTEGER?;

define: 'define' name '=' formula;
conditioned:
	(explanation stmt_end)? (index_quantification stmt_end)? (
		precondition stmt_end
	)*
	// block of conditioned behaviors, that additionally share the preconditions above, or a primitive behavior
	(
		behavior_block
		| assign_default
		| assign_imply
		| assign_new
		| interaction
		| require
		| prefer
		| combinations
	);

combinations:
	'combinations' '(' formula (','? formula)* ')' stmt_end (
		combination_row (stmt_end combination_row)*
	)?;

explanation: 'explanation' name;
index_quantification: ('forall' | 'exists') index_variable = NAME (
		','? index_variable = NAME
	)*;
precondition:
	'condition' condition
	| 'valid' (
		('start' start = date ('end' end = date)?)
		| ('end' end = date)
	);
assign_default: 'default' path '=' formula;
assign_imply: 'imply' path '=' formula;
assign_new: 'new' path;
interaction:
	directive = ('readwrite' | 'readonly' | 'hide') (
		'/' priority = INTEGER
	)? path;
message: (precondition stmt_end)* 'message' (
		'/' level = (
			'debug'
			| 'info'
			| 'warn'
			| 'error'
			| 'explain'
		)
	)? name;
require: 'require' condition;
prefer: 'prefer' ('/' penalty = INTEGER)? condition;
combination_row:
	rowType = ('allow' | 'forbid') '(' combination_item (
		','? combination_item
	)* ')';
combination_item:
	any = '-*-'
	| '(' combination_atom (','? combination_atom)* ')'
	| combination_atom;
combination_atom: operator = compare? formula;

stmt_end: ';' | {self.wasNewline()};

constant: floating | name;
floating:
	'-'? (FLOATING | INTEGER | '\u221e'); // == infinity symbol
//integer: '-'? INTEGER ;
compare:
	'<'
	| '<='
	| '≤'
	| '>'
	| '>='
	| '≥'
	| '='
	| '=='
	| '!='
	| '≠'
	| '⊇'
	| 'contains';

unit:
	'/' text = (
		NAME
		| FLOATING
		| INTEGER
		| TIMES
		| HASHES
		| FUNCTION
	);
fraction: sign = ('.' | '^') digits = HASHES;

// define path expressions
path: path_item ('.' path_item)*;
path_item: name ('[' path_index ('..' path_index)? ']')?;
path_index:
	index_variable = NAME
	| INTEGER
	| ('last' ('-' INTEGER)?);

// define conditions
condition: condition_or;
condition_or: condition_and ('||' condition_and)*;
condition_and: condition_not ('&&' condition_not)*;
condition_not:
	'!' condition_not
	| ('(' condition ')')
	| condition_compare;
condition_compare: formula condition_part*;
condition_part: operator = compare formula;

// define formulas
formula: formula_add;
formula_add: formula_sub (operator = '+' formula_sub)*;
formula_sub: formula_mul (operator = '-' formula_mul)*;
formula_mul: formula_div (operator = '*' formula_div)*;
formula_div: formula_pow (operator = '/' formula_pow)*;
formula_pow: formula_sign (operator = '^' formula_sign)*;
formula_sign: ('-' neg = formula_sign)
	| ('+' formula_sign)
	| ('(' formula ')')
	| formula_func
	| formula_atom;
formula_func: fun = FUNCTION '(' formula (',' formula)* ')';
formula_atom:
	atom_true = 'true'
	| atom_false = 'false'
	| atom_num = floating
	| atom_path = path;

name: NAME | FUNCTION | KEYWORD;
date: year = INTEGER '-' month = INTEGER '-' day = INTEGER;

// define lexical tokens
FUNCTION: 'count' | 'min' | 'max' | 'sum' | 'delta';
KEYWORD:
	'last'
	| 'true'
	| 'false'
	| 'condition'
	| 'valid'
	| 'start'
	| 'end'
	| 'product'
	| 'structure'
	| 'enumeration'
	| 'behavior'
	| 'default'
	| 'imply'
	| 'new'
	| 'require'
	| 'combinations'
	| 'allow'
	| 'forbid'
	| 'readwrite'
	| 'readonly'
	| 'hide'
	| 'attribute'
	| 'reference';
NAME: (ALPHA ALPHANUMERIC*) | QUOTED_SINGLE | QUOTED_DOUBLE;

fragment ALPHANUMERIC: ALPHA | DIGIT;
fragment ALPHA:
	[_a-zA-Z$\u00A2-\u00A5\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD]
		;
fragment DIGIT: [0-9];

fragment QUOTED_SINGLE: '\'' (ESC | ~['\\\u0000-\u001F])* '\'';
fragment QUOTED_DOUBLE: '"' (ESC | ~["\\\u0000-\u001F])* '"';

fragment ESC: '\\' (["\\/bfnrt] | UNICODE);
fragment UNICODE: 'u' HEX HEX HEX HEX;
fragment HEX: [0-9a-fA-F];

INTEGER: DIGIT+;
FLOATING: DIGIT+ ('.' DIGIT+)?;
TIMES: INTEGER 'x';

HASHES: '#'+;

// skip whitespaces, but get the newlines in a spearate channel

NEWLINE: [\r\n]+ -> channel(HIDDEN);
WHITESPACE: [ \t]+ -> skip;

// allow java-like comments, direct them into the comment channel

COMMENT: '//' ~[\n\r]* ( [\n\r] | EOF) -> channel(HIDDEN);
MULTILINE_COMMENT:
	'/*' (MULTILINE_COMMENT | .)*? ('*/' | EOF) -> channel(HIDDEN);
