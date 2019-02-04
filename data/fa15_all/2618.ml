
let pipe fs =
  let f a x y = y x a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,21)
EMPTY
EmptyG

(3,16)-(3,17)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

(3,16)-(3,21)
EMPTY
EmptyG

(3,18)-(3,19)
x a
AppG (fromList [VarG])

*)
