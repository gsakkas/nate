
let pipe fs = let f a x a x = a in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = a in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,31)
EMPTY
EmptyG

*)
