
let pipe fs = let f a x = a x in let base a = a in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x w = x (a w) in let base a = a in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
EMPTY
EmptyG

(2,26)-(2,29)
fun w -> x (a w)
LamG (AppG (fromList [EmptyG]))

(2,33)-(2,75)
a w
AppG (fromList [VarG])

*)
