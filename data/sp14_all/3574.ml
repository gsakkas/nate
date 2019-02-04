
let pipe fs =
  let f a x = a x in let base x y = x y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = a (x y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,17)
fun y -> a (x y)
LamG (AppG (fromList [EmptyG]))

(3,16)-(3,17)
x y
AppG (fromList [VarG])

(3,21)-(3,67)
y
VarG

(3,32)-(3,39)
EMPTY
EmptyG

(3,36)-(3,39)
EMPTY
EmptyG

(3,38)-(3,39)
EMPTY
EmptyG

*)
