LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)
let fx =
  fun a -> fun b -> a ^ b in
let base = "" in
List.fold_left fx base l
