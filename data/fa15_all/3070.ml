
let pipe fs = let f a x a = a x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
EMPTY
EmptyG

(2,35)-(2,77)
a
VarG

*)

(* typed spans
(2,30)-(2,31)
*)

(* typed spans
'a
*)

(* typed spans
'a
*)
