StandardizeReactionStep[x_ -> y_] := {{x, y}}
StandardizeReactionStep[x_ <-> y_] := {{x, y}, {y, x}}
StandardizedReactionSteps[x_] := Union[Flatten[Map[StandardizeReactionStep, x], 1]]

ReactionStepVariables[{x_, y_}] := Union[Variables[x], Variables[y]]
Reactants[x_] := Union[Flatten[Map[ReactionStepVariables, StandardizedReactionSteps[x]]]]

AlphaIJ[steps_, reactants_] := (Replace[steps[[#2]][[1]], reactants[[#1]] -> 1, {0,2}] - Replace[steps[[#2]][[1]], reactants[[#1]] -> 0, {0,2}])&
BetaIJ[steps_, reactants_] := (Replace[steps[[#2]][[2]], reactants[[#1]] -> 1, {0,2}] - Replace[steps[[#2]][[2]], reactants[[#1]] -> 0, {0,2}])&

AlphaMatrix[x_] := Array[AlphaIJ[StandardizedReactionSteps[x], Reactants[x]], {Length[Reactants[x]], Length[StandardizedReactionSteps[x]]}]
BetaMatrix[x_] := Array[BetaIJ[StandardizedReactionSteps[x], Reactants[x]], {Length[Reactants[x]], Length[StandardizedReactionSteps[x]]}]

ReactionMatrices[alpha] = AlphaMatrix
ReactionMatrices[beta] = BetaMatrix
reaction = {A -> B, 2 B <-> 3 C}
AlphaMatrix[reaction]
