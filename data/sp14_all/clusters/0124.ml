CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,ListG EmptyG)])
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else l
