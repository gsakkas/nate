
let pipe fs =
  let f a x n x = a n in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,21)
EMPTY
EmptyG

(3,18)-(3,19)
a n
AppG (fromList [VarG])

*)
