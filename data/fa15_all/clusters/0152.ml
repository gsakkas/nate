LetG NonRec (fromList [ConAppG (Just EmptyG)]) (LetG NonRec (fromList [EmptyG]) EmptyG)
let seen' = h :: seen in
let rest' = t in
helper (seen' , rest')
