
let pipe fs =
  let f a x result = a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,24)
fun n -> x (a n)
LamG (AppG (fromList [EmptyG]))

(3,21)-(3,22)
EMPTY
EmptyG

(3,28)-(3,68)
a n
AppG (fromList [VarG])

(3,39)-(3,40)
fun f -> 0
LamG LitG

*)
