
let pipe fs =
  let f a x result n = x (a n) in let base = f 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,30)
EMPTY
EmptyG

(3,45)-(3,46)
fun f -> 0
LamG LitG

(3,45)-(3,48)
EMPTY
EmptyG

*)
