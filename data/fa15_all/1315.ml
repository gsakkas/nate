
let pipe fs = let f a x x a = a in let base f = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
EMPTY
EmptyG

(2,26)-(2,31)
EMPTY
EmptyG

*)
