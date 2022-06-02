Get["ReactionKinetics.wl"]
{alpha, beta} = ReactionsData[{E + S1 <-> ES1 <-> ESS1 -> ES + P1, ES + S2 <-> ESS2 <-> ES2 -> E + P2}, {S1, S2, P1, P2}][\[Alpha], \[Beta]]
