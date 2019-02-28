CaseG VarG (fromList [(Nothing,VarG),(Nothing,ListG EmptyG)])
match l with
| [] -> []
| h :: m :: t -> t
