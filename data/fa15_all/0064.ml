
let pipe fs = let f a x = a x in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
EMPTY
EmptyG

(2,26)-(2,29)
fun x -> fun a -> x a
LamG (LamG EmptyG)

(2,33)-(2,75)
a
VarG

*)
