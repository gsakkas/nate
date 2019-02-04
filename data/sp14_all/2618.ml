
let pipe fs = let f a x = x + a in let base = "" in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base = (+) 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,31)
EMPTY
EmptyG

(2,30)-(2,31)
EMPTY
EmptyG

(2,46)-(2,48)
(+) 0
AppG (fromList [LitG])

(2,52)-(2,76)
0
LitG

*)
