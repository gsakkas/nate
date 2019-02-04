
let pipe fs = let f a x = a + x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,31)
EMPTY
EmptyG

(2,30)-(2,31)
EMPTY
EmptyG

*)
