
let pipe fs = let f a x = a x in let base a = a in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base a = a in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
EMPTY
EmptyG

(2,28)-(2,29)
EMPTY
EmptyG

*)
