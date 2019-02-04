
let pipe fs = let f a x = a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
EMPTY
EmptyG

(2,26)-(2,29)
EMPTY
EmptyG

(2,44)-(2,45)
fun y -> y
LamG VarG

(2,49)-(2,73)
y
VarG

*)
