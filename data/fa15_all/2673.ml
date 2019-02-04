
let pipe fs =
  let f a x y c = a (x c) in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,25)
EMPTY
EmptyG

(3,18)-(3,19)
EMPTY
EmptyG

(3,20)-(3,25)
EMPTY
EmptyG

(3,23)-(3,24)
a y
AppG (fromList [VarG])

(3,29)-(3,71)
y
VarG

*)
