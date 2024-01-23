from sys import argv
from typing import Optional

from antlr4 import FileStream, CommonTokenStream
from ModelLexer import ModelLexer
from ModelParser import ModelParser
from ModelVisitor import ModelVisitor


class ASPVisitor(ModelVisitor):

    def __init__(self):
        super().__init__()
        self.parent_enum: Optional[ModelParser.EnumerationContext] = None
        self.root_name: str = 'ROOT'
        self.structure_name: str = self.root_name
        self.behavior: str = self.root_name
        self.constraint_idx: int = 0
        self.row_idx: int = 0
        self.print_path: bool = True

    def visitProduct(self, ctx: ModelParser.ProductContext):
        print(f'structure("{self.root_name}").')
        super().visitProduct(ctx)

    def visitStructure(self, ctx: ModelParser.StructureContext):
        self.structure_name = ctx.name().getText()
        print(f'\nstructure("{self.structure_name}").')
        super().visitStructure(ctx)
        self.structure_name = self.root_name

    def visitEnumeration(self, ctx: ModelParser.EnumerationContext):
        self.parent_enum = ctx
        print(f'\nenumeration("{ctx.name().getText()}").')
        super().visitEnumeration(ctx)
        self.parent_enum = None

    def visitBehavior(self, ctx: ModelParser.BehaviorContext):
        # TODO: Implement support for nested behavior blocks
        if ctx.name() is not None:
            self.behavior = ctx.name().getText()
        super().visitBehavior(ctx)
        self.behavior = self.root_name

    def visitBehavior_block(self, ctx: ModelParser.Behavior_blockContext):
        # TODO: Implement support for nested behavior blocks
        super().visitBehavior_block(ctx)

    def visitDefine(self, ctx: ModelParser.DefineContext):
        # TODO: Implement define translation
        # print(ctx.getText())
        super().visitDefine(ctx)

    def visitFeature(self, ctx: ModelParser.FeatureContext):
        # TODO: Implement reference keyword and priorities
        field: ModelParser.FieldContext = ctx.field()
        feature_name = field.fieldName.getText()

        if field.number_def() is not None:
            type_name = 'num'

        elif field.string_def() is not None:
            type_name = 'text'
        elif field.type_ref is not None:
            type_name = field.type_ref.NAME()
        else:
            type_name = feature_name

        cardinality: ModelParser.CardinalityContext = ctx.cardinality()
        c_min = 1
        c_max = 1
        if cardinality is not None:
            c_min = cardinality.min.text.replace('x', '')
            c_max = c_min
            if cardinality.max is not None:
                c_max = cardinality.max.text.replace('x',
                                                     '').replace('*', '#sup')

        print(
            f'feature("{self.structure_name}","{feature_name}","{type_name}",{c_min},{c_max}).'
        )
        if type_name == 'num':
            num: ModelParser.Number_defContext = field.number_def()
            r_min = '#inf' if num.min is None else num.min.INTEGER()
            r_max = '#sup' if num.max is None else num.max.INTEGER()
            print(
                f'range("{self.structure_name}","{feature_name}",{r_min},{r_max}).'
            )

    def visitAttribute(self, ctx: ModelParser.AttributeContext):
        if self.parent_enum is None:
            raise ValueError("illegal option")
        parent_name = self.parent_enum.name().getText()
        field: ModelParser.FieldContext = ctx.field()
        field_name = field.fieldName.getText()
        print(f'attribute("{parent_name}","{field_name}").')
        super().visitAttribute(ctx)

    def visitOption(self, ctx: ModelParser.OptionContext):
        if self.parent_enum is None:
            raise ValueError("illegal option")
        parent_name = self.parent_enum.name().getText()
        option_name = ctx.name().getText()
        print(f'option("{parent_name}", "{option_name}").')

        constant: ModelParser.ConstantContext = ctx.constant()
        if constant != []:
            parent_attr: ModelParser.AttributeContext = self.parent_enum.attribute(
            )
            for a, c in zip(parent_attr, constant):
                field: ModelParser.FieldContext = a.field()
                attr_name = field.fieldName.getText()
                if c.floating() is not None:
                    option_value = c.floating().getText()
                elif c.name() is not None:
                    option_value = f'"{c.name().getText()}"'
                print(
                    f'attr_value("{parent_name}","{option_name}","{attr_name}",{option_value}).'
                )

    def visitConditioned(self, ctx: ModelParser.ConditionedContext):
        constraint_id = f'("{self.behavior}",{self.constraint_idx})'
        if ctx.interaction() is None:
            print(f'\nbehavior({constraint_id}).')
            super().visitConditioned(ctx)
            self.constraint_idx += 1

    def visitAssign_default(self, ctx: ModelParser.Assign_defaultContext):
        constraint_id = f'("{self.behavior}",{self.constraint_idx})'
        path = ctx.path().getText()
        formula = ctx.formula().getText()
        print(f'default({constraint_id},"{path}","{formula}").')
        super().visitAssign_default(ctx)

    def visitAssign_imply(self, ctx: ModelParser.Assign_implyContext):
        constraint_id = f'("{self.behavior}",{self.constraint_idx})'
        path = ctx.path().getText()
        formula = ctx.formula().getText()
        print(f'imply({constraint_id},"{path}","{formula}").')
        super().visitAssign_imply(ctx)

    def visitCombinations(self, ctx: ModelParser.CombinationsContext):
        constraint_id = f'("{self.behavior}",{self.constraint_idx})'
        for i, f in enumerate(ctx.formula()):
            print(f'combinations({constraint_id},{i},"{f.getText()}").')
        super().visitCombinations(ctx)
        self.row_idx = 0

    def visitCombination_row(self, ctx: ModelParser.Combination_rowContext):
        constraint_id = f'("{self.behavior}",{self.constraint_idx})'
        type = ctx.rowType.text
        for col_idx, item in enumerate(ctx.combination_item()):
            values = item.getText()
            # Removing brackets around the values. Is this safe?
            if ',' in values:
                values = values[1:-1]
            for v in values.split(','):
                print(
                    f'{type}({constraint_id},({col_idx},{self.row_idx}),"{v}").'
                )
        self.print_path = False
        super().visitCombination_row(ctx)
        self.print_path = True
        self.row_idx += 1

    def visitPrecondition(self, ctx: ModelParser.PreconditionContext):
        constraint_id = f'("{self.behavior}",{self.constraint_idx})'
        condition = f'"{ctx.condition().getText()}"'
        print(f'condition({constraint_id},{condition}).')
        super().visitPrecondition(ctx)

    def visitRequire(self, ctx: ModelParser.RequireContext):
        constraint_id = f'("{self.behavior}",{self.constraint_idx})'
        condition = f'"{ctx.condition().getText()}"'
        print(f'require({constraint_id},{condition}).')
        super().visitRequire(ctx)

    def visitCondition_or(self, ctx: ModelParser.Condition_orContext):
        cond_and: ModelParser.condition_andContext = ctx.condition_and()
        for i in range(len(cond_and) - 1):
            left = cond_and[i].getText()
            right = '||'.join([a.getText() for a in cond_and[i + 1:]])
            complete = left + '||' + right
            print(
                f'binary("{self.behavior}","{complete}","{left}","||","{right}").'
            )
        super().visitCondition_or(ctx)

    def visitCondition_and(self, ctx: ModelParser.Condition_andContext):
        cond_not: ModelParser.condition_notContext = ctx.condition_not()
        for i in range(len(cond_not) - 1):
            left = cond_not[i].getText()
            right = '&&'.join([a.getText() for a in cond_not[i + 1:]])
            complete = left + '&&' + right
            print(
                f'binary("{self.behavior}","{complete}","{left}","&&","{right}").'
            )
        super().visitCondition_and(ctx)

    def visitCondition_not(self, ctx: ModelParser.Condition_notContext):
        complete = ctx.getText()
        if ctx.condition_not() is not None:
            negated = ctx.condition_not().getText()
            print(f'unary("{self.behavior}","{complete}","!","{negated}").')
        elif ctx.condition() is not None:
            in_brackets = ctx.condition().getText()
            print(
                f'unary("{self.behavior}","{complete}","()","{in_brackets}").')
        super().visitCondition_not(ctx)

    def visitCondition_compare(self,
                               ctx: ModelParser.Condition_compareContext):
        formula: ModelParser.FormulaContext = ctx.formula()
        parts: ModelParser.Condition_partContext = ctx.condition_part()

        left = formula.getText()
        for i in range(len(parts)):
            # Binary atom for compare
            right = parts[i].formula().getText()
            compare = parts[i].compare().getText()
            complete = left + compare + right
            print(
                f'binary("{self.behavior}","{complete}","{left}","{compare}","{right}").'
            )
            left = right

            # For multiple comparisons rewrite as propositional formulas connected by &&
            right_prop = '&&'.join([
                f'{l.formula().getText()}{r.getText()}'
                for l, r in (zip(parts[i:], parts[i + 1:]))
            ])
            if right_prop != '':
                complete_prop = complete + '&&' + right_prop
                print(
                    f'binary("{complete_prop}","{complete}","&&","{right_prop}").'
                )
        super().visitCondition_compare(ctx)

    def visitFormula_add(self, ctx: ModelParser.Formula_addContext):
        form_sub: ModelParser.Formula_subContext = ctx.formula_sub()
        for i in range(len(form_sub) - 1):
            left = form_sub[i].getText()
            right = '+'.join([a.getText() for a in form_sub[i + 1:]])
            complete = left + '+' + right
            print(
                f'binary("{self.behavior}","{complete}","{left}","+","{right}").'
            )
        super().visitFormula_add(ctx)

    def visitFormula_sub(self, ctx: ModelParser.Formula_subContext):
        form_mul: ModelParser.Formula_mulContext = ctx.formula_mul()
        for i in range(len(form_mul) - 1):
            left = form_mul[i].getText()
            right = '-'.join([a.getText() for a in form_mul[i + 1:]])
            complete = left + '-' + right
            print(
                f'binary("{self.behavior}","{complete}","{left}","-","{right}").'
            )
        super().visitFormula_sub(ctx)

    def visitFormula_mul(self, ctx: ModelParser.Formula_mulContext):
        form_div: ModelParser.Formula_divContext = ctx.formula_div()
        for i in range(len(form_div) - 1):
            left = form_div[i].getText()
            right = '*'.join([a.getText() for a in form_div[i + 1:]])
            complete = left + '*' + right
            print(
                f'binary("{self.behavior}","{complete}","{left}","*","{right}").'
            )
        super().visitFormula_mul(ctx)

    def visitFormula_div(self, ctx: ModelParser.Formula_divContext):
        form_pow: ModelParser.Formula_powContext = ctx.formula_pow()
        for i in range(len(form_pow) - 1):
            left = form_pow[i].getText()
            right = '/'.join([a.getText() for a in form_pow[i + 1:]])
            complete = left + '/' + right
            print(
                f'binary("{self.behavior}","{complete}","{left}","/","{right}").'
            )
        super().visitFormula_div(ctx)

    def visitFormula_pow(self, ctx: ModelParser.Formula_powContext):
        form_sign: ModelParser.Formula_signContext = ctx.formula_sign()
        for i in range(len(form_sign) - 1):
            left = form_sign[i].getText()
            right = '^'.join([a.getText() for a in form_sign[i + 1:]])
            complete = left + '^' + right
            print(
                f'binary("{self.behavior}","{complete}","{left}","^","{right}").'
            )
        super().visitFormula_pow(ctx)

    def visitFormula_sign(self, ctx: ModelParser.Formula_signContext):
        complete = ctx.getText()
        if ctx.formula_sign() is not None:
            if ctx.neg is not None:
                negated = ctx.formula_sign().getText()
                print(
                    f'unary("{self.behavior}","{complete}","-","{negated}").')
            else:
                # Is this really necessary?
                positive = ctx.formula_sign().getText()
                print(
                    f'unary("{self.behavior}","{complete}","+","{positive}").')
        elif ctx.formula() is not None:
            in_brackets = ctx.formula().getText()
            print(
                f'unary("{self.behavior}","{complete}","()","{in_brackets}").')
        elif ctx.formula_func() is not None:
            func = ctx.formula_func().FUNCTION()
            for f in ctx.formula_func().formula():
                print(
                    f'function("{self.behavior}","{complete}","{func}","{f.getText()}").'
                )
        super().visitFormula_sign(ctx)

    def visitPath(self, ctx: ModelParser.PathContext):
        # Only do this for actual paths? Not formulas
        if self.print_path:
            full_path = f'{ctx.getText()}'

            if full_path[0].isupper():
                print(f'constant("{full_path}").')
            else:
                for i, p in enumerate(ctx.path_item()):
                    print(f'path("{full_path}",{i},"{p.getText()}").')

    def visitFloating(self, ctx: ModelParser.FloatingContext):
        if ctx.FLOATING() is not None:
            pass
        if ctx.INTEGER() is not None:
            print(f'number("{ctx.INTEGER()}",{ctx.INTEGER()}).')


if __name__ == "__main__":
    input_stream = FileStream(argv[1])
    lexer = ModelLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = ModelParser(stream)
    tree = parser.root()
    visitor = ASPVisitor()
    visitor.visitRoot(tree)
