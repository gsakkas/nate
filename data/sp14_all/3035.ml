
let pipe fs = let f a x z = z a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x z = a z in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
EMPTY
EmptyG

(2,35)-(2,77)
z
VarG

*)
