
let pipe fs = let f a x = a x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
EMPTY
EmptyG

(2,26)-(2,29)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(2,33)-(2,75)
a y
AppG (fromList [VarG])

*)