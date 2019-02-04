
let pipe fs = let f a x = fs a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x y = y in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,28)
EMPTY
EmptyG

(2,26)-(2,30)
EMPTY
EmptyG

(2,29)-(2,30)
fun y -> y
LamG VarG

(2,34)-(2,76)
y
VarG

*)
