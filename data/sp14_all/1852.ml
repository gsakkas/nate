
let pipe fs = let f a x = 3 + a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
EMPTY
EmptyG

(2,26)-(2,31)
EMPTY
EmptyG

*)
