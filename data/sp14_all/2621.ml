
let pipe fs = let f a x = x a in let base = 0 (+) in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base = (+) 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
EMPTY
EmptyG

(2,28)-(2,29)
EMPTY
EmptyG

(2,44)-(2,45)
EMPTY
EmptyG

(2,53)-(2,77)
0
LitG

*)
