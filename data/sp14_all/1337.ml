
let pipe fs =
  let f a x = (a x) + x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x y = y in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,19)
EMPTY
EmptyG

(3,14)-(3,23)
EMPTY
EmptyG

(3,15)-(3,16)
EMPTY
EmptyG

(3,17)-(3,18)
EMPTY
EmptyG

(3,22)-(3,23)
fun y -> y
LamG VarG

(3,27)-(3,69)
y
VarG

*)
