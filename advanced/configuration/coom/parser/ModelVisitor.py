# Generated from Model.g4 by ANTLR 4.9
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .ModelParser import ModelParser
else:
    from ModelParser import ModelParser

# This class defines a complete generic visitor for a parse tree produced by ModelParser.


class ModelVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by ModelParser#root.
    def visitRoot(self, ctx: ModelParser.RootContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#product.
    def visitProduct(self, ctx: ModelParser.ProductContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#structure.
    def visitStructure(self, ctx: ModelParser.StructureContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#enumeration.
    def visitEnumeration(self, ctx: ModelParser.EnumerationContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#behavior.
    def visitBehavior(self, ctx: ModelParser.BehaviorContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#behavior_block.
    def visitBehavior_block(self, ctx: ModelParser.Behavior_blockContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#feature.
    def visitFeature(self, ctx: ModelParser.FeatureContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#cardinality.
    def visitCardinality(self, ctx: ModelParser.CardinalityContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#attribute.
    def visitAttribute(self, ctx: ModelParser.AttributeContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#option.
    def visitOption(self, ctx: ModelParser.OptionContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#field.
    def visitField(self, ctx: ModelParser.FieldContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#number_def.
    def visitNumber_def(self, ctx: ModelParser.Number_defContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#string_def.
    def visitString_def(self, ctx: ModelParser.String_defContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#define.
    def visitDefine(self, ctx: ModelParser.DefineContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#conditioned.
    def visitConditioned(self, ctx: ModelParser.ConditionedContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#combinations.
    def visitCombinations(self, ctx: ModelParser.CombinationsContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#explanation.
    def visitExplanation(self, ctx: ModelParser.ExplanationContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#index_quantification.
    def visitIndex_quantification(
            self, ctx: ModelParser.Index_quantificationContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#precondition.
    def visitPrecondition(self, ctx: ModelParser.PreconditionContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#assign_default.
    def visitAssign_default(self, ctx: ModelParser.Assign_defaultContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#assign_imply.
    def visitAssign_imply(self, ctx: ModelParser.Assign_implyContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#assign_new.
    def visitAssign_new(self, ctx: ModelParser.Assign_newContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#interaction.
    def visitInteraction(self, ctx: ModelParser.InteractionContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#message.
    def visitMessage(self, ctx: ModelParser.MessageContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#require.
    def visitRequire(self, ctx: ModelParser.RequireContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#prefer.
    def visitPrefer(self, ctx: ModelParser.PreferContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#combination_row.
    def visitCombination_row(self, ctx: ModelParser.Combination_rowContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#combination_item.
    def visitCombination_item(self, ctx: ModelParser.Combination_itemContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#combination_atom.
    def visitCombination_atom(self, ctx: ModelParser.Combination_atomContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#stmt_end.
    def visitStmt_end(self, ctx: ModelParser.Stmt_endContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#constant.
    def visitConstant(self, ctx: ModelParser.ConstantContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#floating.
    def visitFloating(self, ctx: ModelParser.FloatingContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#compare.
    def visitCompare(self, ctx: ModelParser.CompareContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#unit.
    def visitUnit(self, ctx: ModelParser.UnitContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#fraction.
    def visitFraction(self, ctx: ModelParser.FractionContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#path.
    def visitPath(self, ctx: ModelParser.PathContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#path_item.
    def visitPath_item(self, ctx: ModelParser.Path_itemContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#path_index.
    def visitPath_index(self, ctx: ModelParser.Path_indexContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#condition.
    def visitCondition(self, ctx: ModelParser.ConditionContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#condition_or.
    def visitCondition_or(self, ctx: ModelParser.Condition_orContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#condition_and.
    def visitCondition_and(self, ctx: ModelParser.Condition_andContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#condition_not.
    def visitCondition_not(self, ctx: ModelParser.Condition_notContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#condition_compare.
    def visitCondition_compare(self,
                               ctx: ModelParser.Condition_compareContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#condition_part.
    def visitCondition_part(self, ctx: ModelParser.Condition_partContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#formula.
    def visitFormula(self, ctx: ModelParser.FormulaContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#formula_add.
    def visitFormula_add(self, ctx: ModelParser.Formula_addContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#formula_sub.
    def visitFormula_sub(self, ctx: ModelParser.Formula_subContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#formula_mul.
    def visitFormula_mul(self, ctx: ModelParser.Formula_mulContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#formula_div.
    def visitFormula_div(self, ctx: ModelParser.Formula_divContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#formula_pow.
    def visitFormula_pow(self, ctx: ModelParser.Formula_powContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#formula_sign.
    def visitFormula_sign(self, ctx: ModelParser.Formula_signContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#formula_func.
    def visitFormula_func(self, ctx: ModelParser.Formula_funcContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#formula_atom.
    def visitFormula_atom(self, ctx: ModelParser.Formula_atomContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#name.
    def visitName(self, ctx: ModelParser.NameContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by ModelParser#date.
    def visitDate(self, ctx: ModelParser.DateContext):
        return self.visitChildren(ctx)


del ModelParser
