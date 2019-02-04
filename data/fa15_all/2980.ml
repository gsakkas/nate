
let stringOfList f l = let base = f in List.fold_left f base l;;


(* fix

let stringOfList f l =
  let fx a b = a ^ b in let base = "" in List.fold_left fx base l;;

*)

(* changed spans
(2,23)-(2,62)
let fx =
  fun a -> fun b -> a ^ b in
let base = "" in
List.fold_left fx base l
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(2,34)-(2,35)
""
LitG

(2,54)-(2,55)
fx
VarG

*)
