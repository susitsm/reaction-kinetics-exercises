StandardizeReactionStep[x_ -> y_] := {x -> y}
StandardizeReactionStep[x_ <-> y_] := {x -> y, y -> x}
ReactionSteps[x__] := Union[Flatten[Map[StandardizeReactionStep, x]]]
reaction = {A -> B, 2 B <-> 3 C}
{ReactionSteps[reaction], Length[ReactionSteps[reaction]]}
