CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])
match l with
| x :: [] -> x
| hd :: tl -> last tl
| [] -> []
