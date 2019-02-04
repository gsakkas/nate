
let pipe fs = let f a x b = b a in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,31)
EMPTY
EmptyG

(2,30)-(2,31)
EMPTY
EmptyG

*)
