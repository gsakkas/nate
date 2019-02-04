
let pipe fs = let f a x x = a in let base q = q in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base a = a in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,29)
EMPTY
EmptyG

(2,28)-(2,29)
x
VarG

(2,42)-(2,47)
EMPTY
EmptyG

(2,46)-(2,47)
fun a -> a
LamG VarG

(2,51)-(2,75)
a
VarG

*)
