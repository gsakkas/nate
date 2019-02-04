
let pipe fs = let f a x x a = x in let base f = f in List.fold_left f base fs;;


(* fix

let f a x = x a;;

let f a = f;;

let pipe fs = let f a x x a = f in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,9)-(2,77)
fun a -> fun x -> x a
LamG (LamG EmptyG)

(2,30)-(2,31)
f
VarG

*)
