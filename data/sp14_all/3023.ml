
let pipe fs = let f a x = a x in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
fun x -> x
LamG VarG

(2,26)-(2,29)
EMPTY
EmptyG

(2,42)-(2,47)
EMPTY
EmptyG

(2,46)-(2,47)
fun y -> y
LamG VarG

(2,51)-(2,75)
y
VarG

*)