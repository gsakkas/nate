LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)
let f =
  fun a ->
    fun x -> a + (x * x) in
let base = 0 in
List.fold_left f base xs
let fx =
  fun a -> fun b -> a ^ b in
let base = "" in
List.fold_left fx base l
let f =
  fun a -> fun x -> a @ [0] in
let base = [] in
let args = l2 in
List.fold_left f base args
