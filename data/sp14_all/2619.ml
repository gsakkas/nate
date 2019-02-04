
let pipe fs = let f a x = a x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base = (+) 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
EMPTY
EmptyG

(2,26)-(2,29)
EMPTY
EmptyG

(2,42)-(2,47)
EMPTY
EmptyG

(2,46)-(2,47)
(+) 0
AppG (fromList [LitG])

(2,51)-(2,75)
0
LitG

*)
