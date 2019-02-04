
let pipe fs =
  let f a x d x = a x in let base d = d in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base d = d in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,21)
EMPTY
EmptyG

(3,14)-(3,21)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

(3,18)-(3,19)
EMPTY
EmptyG

(3,25)-(3,67)
a
VarG

*)
