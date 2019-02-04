
let pipe fs =
  let f a x c y z = z (a c) in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x c = x c in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,27)
EMPTY
EmptyG

(3,16)-(3,27)
EMPTY
EmptyG

(3,20)-(3,21)
EMPTY
EmptyG

(3,22)-(3,27)
EMPTY
EmptyG

(3,23)-(3,24)
x
VarG

*)
