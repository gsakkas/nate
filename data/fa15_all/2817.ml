
let pipe fs = let f a x x = x a in let base f = f in List.fold_left f base fs;;


(* fix

let f a x = x a;;

let f a = f;;

let pipe fs = let f a x x = f a in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,9)-(2,77)
fun a -> fun x -> x a
LamG (LamG EmptyG)

(2,28)-(2,29)
f
VarG

*)
