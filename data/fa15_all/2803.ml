
let pipe fs = let f a x x = x a in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = a x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
EMPTY
EmptyG

(2,35)-(2,77)
x
VarG

*)
