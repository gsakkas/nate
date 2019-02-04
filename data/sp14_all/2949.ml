
let pipe fs =
  let f a x y = a (y x) in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = a (x y) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,19)-(3,20)
EMPTY
EmptyG

(3,27)-(3,69)
y
VarG

*)
