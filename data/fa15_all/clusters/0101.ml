CaseG VarG (fromList [(Nothing,VarG),(Nothing,IteG EmptyG EmptyG EmptyG)])
match l with
| (ki , vi) :: t -> if k = ki
                    then vi
                    else assoc (d , k , t)
| [] -> d
match l with
| [] -> d
| (k' , d') :: t -> if k = k'
                    then d'
                    else assoc (d , k , t)
