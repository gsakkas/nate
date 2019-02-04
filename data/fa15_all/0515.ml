
let pipe fs =
  let f a x n = n a (a x) in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
EMPTY
EmptyG

(3,16)-(3,25)
EMPTY
EmptyG

(3,18)-(3,19)
EMPTY
EmptyG

(3,21)-(3,22)
EMPTY
EmptyG

(3,29)-(3,71)
a n
AppG (fromList [VarG])

(3,42)-(3,43)
0
LitG

*)
