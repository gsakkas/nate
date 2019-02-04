
let pipe fs = let f a x = a a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,31)
EMPTY
EmptyG

(2,28)-(2,29)
EMPTY
EmptyG

(2,30)-(2,31)
EMPTY
EmptyG

(2,46)-(2,47)
fun f -> 0
LamG LitG

*)
