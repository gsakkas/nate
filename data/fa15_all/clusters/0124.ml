CaseG VarG (fromList [(Nothing,LitG),(Nothing,IteG EmptyG EmptyG EmptyG)])
match x with
| [] -> true
| h :: t -> if getHead x = getHead (listReverse x)
            then matchHeads (getTail (listReverse t))
            else false
