
let x _ f = f;;

let pipe fs = let f a x = a x in let base = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,6)-(2,13)
EMPTY
EmptyG

(2,8)-(2,13)
EMPTY
EmptyG

(2,12)-(2,13)
EMPTY
EmptyG

(4,26)-(4,27)
EMPTY
EmptyG

(4,26)-(4,29)
EMPTY
EmptyG

(4,44)-(4,45)
fun x -> x
LamG VarG

*)
