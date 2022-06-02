ReactionStepVariables[x_ -> y_] := Union[Variables[x], Variables[y]]
Reactants[x__] := Union[Flatten[Map[ReactionStepVariables, x]]]
reaction = {A -> B, 2 B -> 3 C}
{Reactants[reaction], Length[Reactants[reaction]]}
