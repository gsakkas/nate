
let pipe fs = let f a x x = a in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
x
VarG

*)

(* changed exprs
Var (Just (2,28)-(2,29)) "x"
*)

(* typed spans
(2,28)-(2,29)
*)

(* correct types
'a
*)

(* bad types
'a
*)
