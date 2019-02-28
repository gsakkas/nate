CaseG VarG (fromList [(Nothing,ListG EmptyG)])
match l with
| [] -> []
| h :: t -> [h]
match n with
| 0 -> []
