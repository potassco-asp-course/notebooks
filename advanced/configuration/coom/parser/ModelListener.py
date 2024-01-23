# Generated from Model.g4 by ANTLR 4.9
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .ModelParser import ModelParser
else:
    from ModelParser import ModelParser


# This class defines a complete listener for a parse tree produced by ModelParser.
class ModelListener(ParseTreeListener):

    # Enter a parse tree produced by ModelParser#root.
    def enterRoot(self, ctx: ModelParser.RootContext):
        pass

    # Exit a parse tree produced by ModelParser#root.
    def exitRoot(self, ctx: ModelParser.RootContext):
        pass

    # Enter a parse tree produced by ModelParser#product.
    def enterProduct(self, ctx: ModelParser.ProductContext):
        pass

    # Exit a parse tree produced by ModelParser#product.
    def exitProduct(self, ctx: ModelParser.ProductContext):
        pass

    # Enter a parse tree produced by ModelParser#structure.
    def enterStructure(self, ctx: ModelParser.StructureContext):
        pass

    # Exit a parse tree produced by ModelParser#structure.
    def exitStructure(self, ctx: ModelParser.StructureContext):
        pass

    # Enter a parse tree produced by ModelParser#enumeration.
    def enterEnumeration(self, ctx: ModelParser.EnumerationContext):
        pass

    # Exit a parse tree produced by ModelParser#enumeration.
    def exitEnumeration(self, ctx: ModelParser.EnumerationContext):
        pass

    # Enter a parse tree produced by ModelParser#behavior.
    def enterBehavior(self, ctx: ModelParser.BehaviorContext):
        pass

    # Exit a parse tree produced by ModelParser#behavior.
    def exitBehavior(self, ctx: ModelParser.BehaviorContext):
        pass

    # Enter a parse tree produced by ModelParser#behavior_block.
    def enterBehavior_block(self, ctx: ModelParser.Behavior_blockContext):
        pass

    # Exit a parse tree produced by ModelParser#behavior_block.
    def exitBehavior_block(self, ctx: ModelParser.Behavior_blockContext):
        pass

    # Enter a parse tree produced by ModelParser#feature.
    def enterFeature(self, ctx: ModelParser.FeatureContext):
        pass

    # Exit a parse tree produced by ModelParser#feature.
    def exitFeature(self, ctx: ModelParser.FeatureContext):
        pass

    # Enter a parse tree produced by ModelParser#cardinality.
    def enterCardinality(self, ctx: ModelParser.CardinalityContext):
        pass

    # Exit a parse tree produced by ModelParser#cardinality.
    def exitCardinality(self, ctx: ModelParser.CardinalityContext):
        pass

    # Enter a parse tree produced by ModelParser#attribute.
    def enterAttribute(self, ctx: ModelParser.AttributeContext):
        pass

    # Exit a parse tree produced by ModelParser#attribute.
    def exitAttribute(self, ctx: ModelParser.AttributeContext):
        pass

    # Enter a parse tree produced by ModelParser#option.
    def enterOption(self, ctx: ModelParser.OptionContext):
        pass

    # Exit a parse tree produced by ModelParser#option.
    def exitOption(self, ctx: ModelParser.OptionContext):
        pass

    # Enter a parse tree produced by ModelParser#field.
    def enterField(self, ctx: ModelParser.FieldContext):
        pass

    # Exit a parse tree produced by ModelParser#field.
    def exitField(self, ctx: ModelParser.FieldContext):
        pass

    # Enter a parse tree produced by ModelParser#number_def.
    def enterNumber_def(self, ctx: ModelParser.Number_defContext):
        pass

    # Exit a parse tree produced by ModelParser#number_def.
    def exitNumber_def(self, ctx: ModelParser.Number_defContext):
        pass

    # Enter a parse tree produced by ModelParser#string_def.
    def enterString_def(self, ctx: ModelParser.String_defContext):
        pass

    # Exit a parse tree produced by ModelParser#string_def.
    def exitString_def(self, ctx: ModelParser.String_defContext):
        pass

    # Enter a parse tree produced by ModelParser#define.
    def enterDefine(self, ctx: ModelParser.DefineContext):
        pass

    # Exit a parse tree produced by ModelParser#define.
    def exitDefine(self, ctx: ModelParser.DefineContext):
        pass

    # Enter a parse tree produced by ModelParser#conditioned.
    def enterConditioned(self, ctx: ModelParser.ConditionedContext):
        pass

    # Exit a parse tree produced by ModelParser#conditioned.
    def exitConditioned(self, ctx: ModelParser.ConditionedContext):
        pass

    # Enter a parse tree produced by ModelParser#combinations.
    def enterCombinations(self, ctx: ModelParser.CombinationsContext):
        pass

    # Exit a parse tree produced by ModelParser#combinations.
    def exitCombinations(self, ctx: ModelParser.CombinationsContext):
        pass

    # Enter a parse tree produced by ModelParser#explanation.
    def enterExplanation(self, ctx: ModelParser.ExplanationContext):
        pass

    # Exit a parse tree produced by ModelParser#explanation.
    def exitExplanation(self, ctx: ModelParser.ExplanationContext):
        pass

    # Enter a parse tree produced by ModelParser#index_quantification.
    def enterIndex_quantification(
            self, ctx: ModelParser.Index_quantificationContext):
        pass

    # Exit a parse tree produced by ModelParser#index_quantification.
    def exitIndex_quantification(self,
                                 ctx: ModelParser.Index_quantificationContext):
        pass

    # Enter a parse tree produced by ModelParser#precondition.
    def enterPrecondition(self, ctx: ModelParser.PreconditionContext):
        pass

    # Exit a parse tree produced by ModelParser#precondition.
    def exitPrecondition(self, ctx: ModelParser.PreconditionContext):
        pass

    # Enter a parse tree produced by ModelParser#assign_default.
    def enterAssign_default(self, ctx: ModelParser.Assign_defaultContext):
        pass

    # Exit a parse tree produced by ModelParser#assign_default.
    def exitAssign_default(self, ctx: ModelParser.Assign_defaultContext):
        pass

    # Enter a parse tree produced by ModelParser#assign_imply.
    def enterAssign_imply(self, ctx: ModelParser.Assign_implyContext):
        pass

    # Exit a parse tree produced by ModelParser#assign_imply.
    def exitAssign_imply(self, ctx: ModelParser.Assign_implyContext):
        pass

    # Enter a parse tree produced by ModelParser#assign_new.
    def enterAssign_new(self, ctx: ModelParser.Assign_newContext):
        pass

    # Exit a parse tree produced by ModelParser#assign_new.
    def exitAssign_new(self, ctx: ModelParser.Assign_newContext):
        pass

    # Enter a parse tree produced by ModelParser#interaction.
    def enterInteraction(self, ctx: ModelParser.InteractionContext):
        pass

    # Exit a parse tree produced by ModelParser#interaction.
    def exitInteraction(self, ctx: ModelParser.InteractionContext):
        pass

    # Enter a parse tree produced by ModelParser#message.
    def enterMessage(self, ctx: ModelParser.MessageContext):
        pass

    # Exit a parse tree produced by ModelParser#message.
    def exitMessage(self, ctx: ModelParser.MessageContext):
        pass

    # Enter a parse tree produced by ModelParser#require.
    def enterRequire(self, ctx: ModelParser.RequireContext):
        pass

    # Exit a parse tree produced by ModelParser#require.
    def exitRequire(self, ctx: ModelParser.RequireContext):
        pass

    # Enter a parse tree produced by ModelParser#prefer.
    def enterPrefer(self, ctx: ModelParser.PreferContext):
        pass

    # Exit a parse tree produced by ModelParser#prefer.
    def exitPrefer(self, ctx: ModelParser.PreferContext):
        pass

    # Enter a parse tree produced by ModelParser#combination_row.
    def enterCombination_row(self, ctx: ModelParser.Combination_rowContext):
        pass

    # Exit a parse tree produced by ModelParser#combination_row.
    def exitCombination_row(self, ctx: ModelParser.Combination_rowContext):
        pass

    # Enter a parse tree produced by ModelParser#combination_item.
    def enterCombination_item(self, ctx: ModelParser.Combination_itemContext):
        pass

    # Exit a parse tree produced by ModelParser#combination_item.
    def exitCombination_item(self, ctx: ModelParser.Combination_itemContext):
        pass

    # Enter a parse tree produced by ModelParser#combination_atom.
    def enterCombination_atom(self, ctx: ModelParser.Combination_atomContext):
        pass

    # Exit a parse tree produced by ModelParser#combination_atom.
    def exitCombination_atom(self, ctx: ModelParser.Combination_atomContext):
        pass

    # Enter a parse tree produced by ModelParser#stmt_end.
    def enterStmt_end(self, ctx: ModelParser.Stmt_endContext):
        pass

    # Exit a parse tree produced by ModelParser#stmt_end.
    def exitStmt_end(self, ctx: ModelParser.Stmt_endContext):
        pass

    # Enter a parse tree produced by ModelParser#constant.
    def enterConstant(self, ctx: ModelParser.ConstantContext):
        pass

    # Exit a parse tree produced by ModelParser#constant.
    def exitConstant(self, ctx: ModelParser.ConstantContext):
        pass

    # Enter a parse tree produced by ModelParser#floating.
    def enterFloating(self, ctx: ModelParser.FloatingContext):
        pass

    # Exit a parse tree produced by ModelParser#floating.
    def exitFloating(self, ctx: ModelParser.FloatingContext):
        pass

    # Enter a parse tree produced by ModelParser#compare.
    def enterCompare(self, ctx: ModelParser.CompareContext):
        pass

    # Exit a parse tree produced by ModelParser#compare.
    def exitCompare(self, ctx: ModelParser.CompareContext):
        pass

    # Enter a parse tree produced by ModelParser#unit.
    def enterUnit(self, ctx: ModelParser.UnitContext):
        pass

    # Exit a parse tree produced by ModelParser#unit.
    def exitUnit(self, ctx: ModelParser.UnitContext):
        pass

    # Enter a parse tree produced by ModelParser#fraction.
    def enterFraction(self, ctx: ModelParser.FractionContext):
        pass

    # Exit a parse tree produced by ModelParser#fraction.
    def exitFraction(self, ctx: ModelParser.FractionContext):
        pass

    # Enter a parse tree produced by ModelParser#path.
    def enterPath(self, ctx: ModelParser.PathContext):
        pass

    # Exit a parse tree produced by ModelParser#path.
    def exitPath(self, ctx: ModelParser.PathContext):
        pass

    # Enter a parse tree produced by ModelParser#path_item.
    def enterPath_item(self, ctx: ModelParser.Path_itemContext):
        pass

    # Exit a parse tree produced by ModelParser#path_item.
    def exitPath_item(self, ctx: ModelParser.Path_itemContext):
        pass

    # Enter a parse tree produced by ModelParser#path_index.
    def enterPath_index(self, ctx: ModelParser.Path_indexContext):
        pass

    # Exit a parse tree produced by ModelParser#path_index.
    def exitPath_index(self, ctx: ModelParser.Path_indexContext):
        pass

    # Enter a parse tree produced by ModelParser#condition.
    def enterCondition(self, ctx: ModelParser.ConditionContext):
        pass

    # Exit a parse tree produced by ModelParser#condition.
    def exitCondition(self, ctx: ModelParser.ConditionContext):
        pass

    # Enter a parse tree produced by ModelParser#condition_or.
    def enterCondition_or(self, ctx: ModelParser.Condition_orContext):
        pass

    # Exit a parse tree produced by ModelParser#condition_or.
    def exitCondition_or(self, ctx: ModelParser.Condition_orContext):
        pass

    # Enter a parse tree produced by ModelParser#condition_and.
    def enterCondition_and(self, ctx: ModelParser.Condition_andContext):
        pass

    # Exit a parse tree produced by ModelParser#condition_and.
    def exitCondition_and(self, ctx: ModelParser.Condition_andContext):
        pass

    # Enter a parse tree produced by ModelParser#condition_not.
    def enterCondition_not(self, ctx: ModelParser.Condition_notContext):
        pass

    # Exit a parse tree produced by ModelParser#condition_not.
    def exitCondition_not(self, ctx: ModelParser.Condition_notContext):
        pass

    # Enter a parse tree produced by ModelParser#condition_compare.
    def enterCondition_compare(self,
                               ctx: ModelParser.Condition_compareContext):
        pass

    # Exit a parse tree produced by ModelParser#condition_compare.
    def exitCondition_compare(self, ctx: ModelParser.Condition_compareContext):
        pass

    # Enter a parse tree produced by ModelParser#condition_part.
    def enterCondition_part(self, ctx: ModelParser.Condition_partContext):
        pass

    # Exit a parse tree produced by ModelParser#condition_part.
    def exitCondition_part(self, ctx: ModelParser.Condition_partContext):
        pass

    # Enter a parse tree produced by ModelParser#formula.
    def enterFormula(self, ctx: ModelParser.FormulaContext):
        pass

    # Exit a parse tree produced by ModelParser#formula.
    def exitFormula(self, ctx: ModelParser.FormulaContext):
        pass

    # Enter a parse tree produced by ModelParser#formula_add.
    def enterFormula_add(self, ctx: ModelParser.Formula_addContext):
        pass

    # Exit a parse tree produced by ModelParser#formula_add.
    def exitFormula_add(self, ctx: ModelParser.Formula_addContext):
        pass

    # Enter a parse tree produced by ModelParser#formula_sub.
    def enterFormula_sub(self, ctx: ModelParser.Formula_subContext):
        pass

    # Exit a parse tree produced by ModelParser#formula_sub.
    def exitFormula_sub(self, ctx: ModelParser.Formula_subContext):
        pass

    # Enter a parse tree produced by ModelParser#formula_mul.
    def enterFormula_mul(self, ctx: ModelParser.Formula_mulContext):
        pass

    # Exit a parse tree produced by ModelParser#formula_mul.
    def exitFormula_mul(self, ctx: ModelParser.Formula_mulContext):
        pass

    # Enter a parse tree produced by ModelParser#formula_div.
    def enterFormula_div(self, ctx: ModelParser.Formula_divContext):
        pass

    # Exit a parse tree produced by ModelParser#formula_div.
    def exitFormula_div(self, ctx: ModelParser.Formula_divContext):
        pass

    # Enter a parse tree produced by ModelParser#formula_pow.
    def enterFormula_pow(self, ctx: ModelParser.Formula_powContext):
        pass

    # Exit a parse tree produced by ModelParser#formula_pow.
    def exitFormula_pow(self, ctx: ModelParser.Formula_powContext):
        pass

    # Enter a parse tree produced by ModelParser#formula_sign.
    def enterFormula_sign(self, ctx: ModelParser.Formula_signContext):
        pass

    # Exit a parse tree produced by ModelParser#formula_sign.
    def exitFormula_sign(self, ctx: ModelParser.Formula_signContext):
        pass

    # Enter a parse tree produced by ModelParser#formula_func.
    def enterFormula_func(self, ctx: ModelParser.Formula_funcContext):
        pass

    # Exit a parse tree produced by ModelParser#formula_func.
    def exitFormula_func(self, ctx: ModelParser.Formula_funcContext):
        pass

    # Enter a parse tree produced by ModelParser#formula_atom.
    def enterFormula_atom(self, ctx: ModelParser.Formula_atomContext):
        pass

    # Exit a parse tree produced by ModelParser#formula_atom.
    def exitFormula_atom(self, ctx: ModelParser.Formula_atomContext):
        pass

    # Enter a parse tree produced by ModelParser#name.
    def enterName(self, ctx: ModelParser.NameContext):
        pass

    # Exit a parse tree produced by ModelParser#name.
    def exitName(self, ctx: ModelParser.NameContext):
        pass

    # Enter a parse tree produced by ModelParser#date.
    def enterDate(self, ctx: ModelParser.DateContext):
        pass

    # Exit a parse tree produced by ModelParser#date.
    def exitDate(self, ctx: ModelParser.DateContext):
        pass


del ModelParser
