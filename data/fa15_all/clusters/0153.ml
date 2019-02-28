LetG NonRec (fromList [ListG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)
let base = [] in
let args = [] in
List.fold_left f base args
